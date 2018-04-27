<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Editor.aspx.cs" Inherits="_BD1_Proyecto1.Editor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Editor</title>
    <link rel="stylesheet" href="css/assets/css/main.css" />
    <style type="text/css">
        #TextArea1 {
            height: 202px;
            width: 572px;
        }
    </style>
</head>
<body>
    <div>
        <H1>Editor de Consultas</H1></div>
    <form id="form1" runat="server">
        <div>
            Escriba su Consulta<br />
            <textarea id="TextArea1" name="S1" runat="server" cols="20" rows="1" ></textarea> <br />
            <input id="Submit1" type="submit" value="Enviar"  runat="server"/><br />
        </div>
    </form>
    <div>
          <p><a href="Menu.html">Menu</a>    </p>
    </div>
</body>
</html>
