<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the application is started
        Application("TotalApplications") = 0
        Application("TotalUserSessions") = 0
        'Increment by 1
        Application("TotalApplications") = Convert.ToInt32(Application("TotalApplications")) + 1
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session is started
        Application("TotalUserSessions") = Convert.ToInt32(Application("TotalUserSessions")) + 1
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Fires when the session ends
        Application("TotalUserSessions") = Convert.ToInt32(Application("TotalUserSessions")) - 1
    End Sub


</script>