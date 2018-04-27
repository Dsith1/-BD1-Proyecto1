<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="_BD1_Proyecto1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link rel="stylesheet" href="css/assets/css/main.css" />
   
</head>
<body>
    <div>
            Bienvenido</div>
    <form id="form1" runat="server">
        <div>
        Usuario&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="Text1" type="text" runat="server"/><br />
        Nombre&nbsp;&nbsp;&nbsp;
        <input id="Password1" type="password" runat="server" /><br />
        <input id="Submit1" type="submit" value="Enviar" runat="server"/></div>
        
    </form>
    <hr />
        <div>
            <asp:HyperLink ID="HyperLink1" NavigateUrl="N_Usuario.aspx" runat="server">Crear Usuario</asp:HyperLink>
        </div>
    
</body>
</html>
