<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consultas.aspx.cs" Inherits="_BD1_Proyecto1.Consultas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Consultas</title>
    <link rel="stylesheet" href="css/assets/css/main.css" />
    <style type="text/css">
        #Text1 {
            width: 471px;
        }
        #TextArea1 {
            height: 252px;
            width: 791px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Numero de Consulta&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" Height="50px" Width="123px">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
                <asp:ListItem>13</asp:ListItem>
                <asp:ListItem Value="14"></asp:ListItem>
            </asp:DropDownList>
&nbsp;<input id="Submit1" type="submit" value="Elegir" runat="server" /><br />
            <input id="Text1" readonly="readonly" type="text" runat="server" /><br />
            <br />
            <textarea id="TextArea1" name="S1" readonly="readonly" runat="server"></textarea></div>
    </form>
    <div>
          <p><a href="Menu.html">Menu</a>    </p>
    </div>
</body>
</html>
