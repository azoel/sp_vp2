Imports MySql.Data.MySqlClient
Public Class clskoneksi
    Private result As New MySqlConnection
    Private m_server As String
    Private m_uid As String
    Private m_password As String
    Private m_database As String
    Dim conString As String = "Server=" & My.Settings.server & ";" _
                            & "UID=" & My.Settings.username & ";" _
                            & "Password=" & My.Settings.pass & ";" _
                            & "database=" & My.Settings.database
    Public kon As New MySqlConnection(conString)
    Public cmd As New MySqlCommand
    Public dr As MySqlDataReader

    Public Sub bukaDB()
        On Error GoTo Hell
        If kon.State = ConnectionState.Open Then kon.Close()

        kon.Open()
        If kon.State = ConnectionState.Open Then
            MsgBox("Terhubung ke DB")
        Else
            MsgBox("Tidak Terhubung Ke Data Base")
        End If
        Exit Sub
Hell:
        Select Case Err.Number
            Case 5
                MsgBox("Gagal Terhubung ke Database !", vbCritical, "Error")
                setting_db.ShowDialog()
            Case Else
                MsgBox(Err.Number & " : " & Err.Description)
        End Select

    End Sub
    Public Property server()
        Get
            Return m_server
        End Get
        Set(ByVal value)
            m_server = value
        End Set
    End Property

    Public Property uID()
        Get
            Return m_uid
        End Get
        Set(ByVal value)
            m_uid = value
        End Set
    End Property
    Public Property password()
        Get
            Return m_password
        End Get
        Set(ByVal value)
            m_password = value
        End Set
    End Property
    Public Property database()
        Get
            Return m_database
        End Get
        Set(ByVal value)
            m_database = value
        End Set
    End Property

    Public Sub saveSetting()
        My.Settings.server = m_server
        My.Settings.username = m_uid
        My.Settings.pass = m_password
        My.Settings.database = m_database
        My.Settings.Save()
    End Sub
    Public Sub loadSetting()
        m_server = My.Settings.server
        m_uid = My.Settings.username
        m_password = My.Settings.pass
        m_database = My.Settings.database
    End Sub

    Public Sub removesetting()
        My.Settings.server = ""
        My.Settings.username = ""
        My.Settings.pass = ""
        My.Settings.database = ""
        My.Settings.Save()
    End Sub
    Public Function getConnection()
        Dim str As String = "Server=" & My.Settings.server & ";" _
                        & "UID=" & My.Settings.username & ";" _
                        & "Password=" & My.Settings.pass & ";" _
                        & "Database=" & My.Settings.database
        Try
            result.Close()
            result = New MySqlConnection(str)
            If result.State = ConnectionState.Open Then result.Close()

            result.Open()
        Catch ex As Exception
            MsgBox("Terjedi kesalahan yaitu : " & ex.Message)
        End Try

        Return result
    End Function
    Public Function executeQuery(ByVal strQuery As String)
        Dim cmd As New MySqlCommand
        cmd.CommandText = strQuery
        cmd.Connection = getConnection()

        If cmd.ExecuteNonQuery > 0 Then
            Return "success"
        Else
            Return "failed"
        End If
    End Function

    Public Function getRecord(ByVal strQuery As String)
        Dim result As MySqlDataReader = Nothing

        Try

            cmd.CommandText = strQuery
            cmd.Connection = getConnection()
            result = cmd.ExecuteReader

        Catch ex As Exception
            MsgBox(ex.Message)
            setting_db.ShowDialog()

            End
        End Try
        Return result
    End Function
    Public Function getfow(ByVal strQuery As String)
        Dim result As MySqlDataReader = Nothing

        Try
            cmd.CommandText = strQuery
            cmd.Connection = getConnection()
            result = cmd.ExecuteScalar

        Catch ex As Exception
            setting_db.ShowDialog()
        End Try

        Return result
        cmd = Nothing
        result = Nothing

    End Function
    Public Function checkConnection()
        Dim result As String
        Dim con As New MySqlConnection
        con = getConnection()
        If con.State = ConnectionState.Open Then
            result = "Success connect to database " & My.Settings.database
        Else

            result = "Failed connect to database " & My.Settings.database
        End If
        Return result
    End Function

End Class
