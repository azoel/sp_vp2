Imports MySql.Data.MySqlClient
Public Class setting_db
    Private Sub setting_db_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        txtServer.Text = My.Settings.server
        txtUser.Text = My.Settings.username
        txtKatakunci.Text = My.Settings.pass
        txtDatabase.Text = My.Settings.database
    End Sub

    Private Sub btnKoneksi_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnKoneksi.Click
        On Error GoTo errHandle
        Dim conString2 As String = "Server=" & txtServer.Text & ";UID=" & _
        txtUser.Text & ";pwd=" & _
        txtKatakunci.Text & ";Database=" & txtDatabase.Text()
        Dim kon2 As New MySqlConnection(conString2)

        Me.Cursor = Cursors.WaitCursor
        Me.btnKoneksi.Enabled = False

        If kon2.State = ConnectionState.Open Then kon2.Close()
        kon2.Open()

        If kon2.State = ConnectionState.Open Then

            MsgBox("Sukses terkoneksi ke server " & vbNewLine _
            & "Server ; " & txtServer.Text & vbNewLine _
            & "Username : " & txtUser.Text & vbNewLine _
            & "Pass : ********" & vbNewLine _
            & "Database : " & txtDatabase.Text, vbInformation + vbOKOnly, "Informasi")
        End If

        Me.Cursor = Cursors.Default
        Me.btnKoneksi.Enabled = True
        Exit Sub
errHandle:
        Select Case Err.Number

            Case 5
                MsgBox("Database tidak terhubung ", vbCritical + vbOKOnly, "Pesen")
            Case Else
                MsgBox(Err.Number & " : " & Err.Description)
        End Select
        Me.btnKoneksi.Enabled = True
        Me.Cursor = Cursors.Default

    End Sub

    Private Sub btnSimpan_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSimpan.Click
        On Error Resume Next
        Me.Cursor = Cursors.WaitCursor
        If MsgBox("Yakin akan menyimpan setting ?", vbYesNo + vbQuestion, "Konfirwasi") = vbYes Then
        My.Settings.server = txtServer.Text
        My.Settings.username = txtUser.Text
        My.Settings.pass = txtKatakunci.Text
        My.Settings.database = txtDatabase.Text
        My.Settings.Save()
        MsgBox("Aplikasi akan otomatis ditutup, silahkan buka kembali aplikasi !", vbInformation + vbOKOnly, "Pesan")
        Me.Cursor = Cursors.Default
        End
        End If
        Me.Cursor = Cursors.Default
    End Sub

    Private Sub btnKeluar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnKeluar.Click
        Me.Close()
    End Sub
End Class