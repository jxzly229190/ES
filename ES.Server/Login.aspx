<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ES.WebServer.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
    <div aria-orientation="horizontal">
        <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1Authenticate">
        </asp:Login>
    </div>
    </form>
</body>
</html>
