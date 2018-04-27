<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="N_Usuario.aspx.cs" Inherits="_BD1_Proyecto1.N_Usuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Nuevo Usuario</title>
    <link rel="stylesheet" href="css/assets/css/main.css" />
</head>
<body>
     <div>
            Crear Usuario</div>
    <form id="form1" runat="server">
        <div>
            Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="Text1" type="text" runat="server"/><br />
            Contraseña&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input id="Password1" type="password"  runat="server"/><br />
            Repita Contraseña&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input id="Password2" type="password" runat="server" /><br />
            <br />
            <input id="Button1" type="submit" value="Crear Usuario" runat="server" /></div>
    </form>
</body>
</html>
