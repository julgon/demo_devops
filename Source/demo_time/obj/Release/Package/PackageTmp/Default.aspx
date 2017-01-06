<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblInfoHora" runat="server" Text="Current Server Date and Time:"></asp:Label>
    
        <asp:TextBox ID="txtHora" ReadOnly="true" runat="server"></asp:TextBox>
    
        <br />
        <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
    
    </div>
    </form>
</body>
</html>
