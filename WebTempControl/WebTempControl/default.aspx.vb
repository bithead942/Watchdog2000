Public Class WebForm2
    Inherits System.Web.UI.Page
    Private Sub WebForm2_Load(sender As Object, e As EventArgs) Handles Me.Load
        GetAvgTemp()
        QueryThermostat()
    End Sub

    Private Sub btnTempUp1_Click(sender As Object, e As EventArgs) Handles btnTempUp1.Click

        If lblMode.Text = "HEAT" Then
            SqlDataSource1.InsertCommand() = "INSERT INTO Temp_Control (Row_ID, Temp_Mode, Temp_Direction, Temp_Degrees) VALUES (NEWID(),'H','+',1)"
        ElseIf lblMode.Text = "COOL" Then
            SqlDataSource1.InsertCommand() = "INSERT INTO Temp_Control (Row_ID, Temp_Mode, Temp_Direction, Temp_Degrees) VALUES (NEWID(),'C','+',1)"
        End If
        SqlDataSource1.Insert()
    End Sub

    Private Sub btnTempDown1_Click(sender As Object, e As EventArgs) Handles btnTempDown1.Click
        If lblMode.Text = "HEAT" Then
            SqlDataSource1.InsertCommand() = "INSERT INTO Temp_Control (Row_ID, Temp_Mode, Temp_Direction, Temp_Degrees) VALUES (NEWID(),'H','-',1)"
        ElseIf lblMode.Text = "COOL" Then
            SqlDataSource1.InsertCommand() = "INSERT INTO Temp_Control (Row_ID, Temp_Mode, Temp_Direction, Temp_Degrees) VALUES (NEWID(),'C','-',1)"
        End If
        SqlDataSource1.Insert()
    End Sub

    Protected Sub btnHeat_Click(sender As Object, e As EventArgs) Handles btnHeat.Click
        SqlDataSource1.InsertCommand() = "INSERT INTO Temp_Control (Row_ID, Temp_Mode, Temp_Direction, Temp_Degrees) VALUES (NEWID(),'H','-',0)"
        SqlDataSource1.Insert()
    End Sub

    Protected Sub btnCool_Click(sender As Object, e As EventArgs) Handles btnCool.Click
        SqlDataSource1.InsertCommand() = "INSERT INTO Temp_Control (Row_ID, Temp_Mode, Temp_Direction, Temp_Degrees) VALUES (NEWID(),'C','-',0)"
        SqlDataSource1.Insert()
    End Sub

    Private Sub GetAvgTemp()
        Dim dv As DataView

        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        SqlDataSource1.SelectCommand() = "SELECT SUM(Master_Bedroom + Ethan_Bedroom + Sydney_Bedroom + Play_Room + Kitchen + Living_Room + Great_Room)/7 FROM Temp_Current_State"
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        lblAvgHouseTemp.Text = CType(dv.Table.Rows(0)(0), String)

    End Sub

    Private Sub QueryThermostat()
        Dim Thermostat As HttpWebRequest
        Dim i As Integer
        Dim strRead, strTargetTemp, strMode As String

        Try
            Thermostat = WebRequest.Create("http://192.168.1.201/tstat")
            Thermostat.Timeout = 15000
            Thermostat.Method = "GET"
            Dim httpResponse As HttpWebResponse = Thermostat.GetResponse

            Dim receiveStream As Stream = httpResponse.GetResponseStream()
            Dim encode As Encoding = System.Text.Encoding.GetEncoding("utf-8")
            Dim readStream As New StreamReader(receiveStream, encode)
            Dim read(300) As [Char]
            readStream.Read(read, 0, 300)
            receiveStream.Close()
            readStream.Close()

            strRead = ""
            For i = 1 To read.Length - 1
                strRead = strRead & read(i)
            Next

            'Get Temperature Mode
            i = strRead.LastIndexOf("""tmode"":")
            If i = -1 Then
                Throw New ArgumentException("Exception Occured")
            Else
                i = i + 9
            End If
            strMode = read(i).ToString

            Select Case strMode
                Case "0"
                    lblMode.Text = "OFF"
                Case "1"
                    lblMode.Text = "HEAT"
                Case "2"
                    lblMode.Text = "COOL"
                Case "3"
                    lblMode.Text = "AUTO"
                Case Else
                    lblMode.Text = ""
                    Throw New ArgumentException("Exception Occured")
            End Select

            'Get Target Temperature
            strTargetTemp = ""
            If strRead.Contains("""t_heat"":") Then
                i = strRead.LastIndexOf("""t_heat"":")
                If i = -1 Then
                    Throw New ArgumentException("Exception Occured")
                Else
                    i = i + 10
                End If
                While (read(i) <> ",")
                    If (read(i) >= "0" And read(i) <= "9") Or read(i) = "." Then
                        strTargetTemp = strTargetTemp & read(i).ToString
                    End If
                    i = i + 1
                End While
            ElseIf strRead.Contains("""t_cool"":") Then
                i = strRead.LastIndexOf("""t_cool"":")
                If i = -1 Then
                    Throw New ArgumentException("Exception Occured")
                Else
                    i = i + 10
                End If
                While (read(i) <> ",")
                    If (read(i) >= "0" And read(i) <= "9") Or read(i) = "." Then
                        strTargetTemp = strTargetTemp & read(i).ToString
                    End If
                    i = i + 1
                End While
            Else
                Throw New ArgumentException("Exception Occured")
            End If
            lblCurrentSetTemp.Text = CInt(strTargetTemp)

            lblLastUpdated.Text = Now.ToString

        Catch ex As Exception
            lblCurrentSetTemp.Text = "00"
            lblMode.Text = "_"
        End Try

    End Sub


End Class