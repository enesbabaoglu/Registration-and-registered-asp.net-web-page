<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registered.aspx.cs" Inherits="registers.Registered" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        
        body {
            height: 100%;
            background-image: url('https://www.umib.net/wp-content/uploads/2019/06/desktop-background-website-3.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size :cover;
    }
    </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body style="background-color: #f5f5f5">
    <form id="form1" runat="server">
    <header class="header">
        <nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="WebForm1.aspx">Registration </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Registered.aspx">Registered <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Manage <b>Students</b></h2>
                        
                    </div>
                    <div class="">
                            <a href="WebForm1.aspx" class="btn btn-danger" data-toggle="modal"><i
                            class="material-icons">&#xE147;</i> <span>Add New Student</span></a>
                            <a href="#delete" class="btn" data-toggle="modal"><asp:TextBox ID="txtsearch" CssClass="form-control" placeholder="Search Name" runat="server" OnTextChanged="txtsearach_TextChanged"></asp:TextBox></a>
                    </div>
                </div>
            </div>
            <hr />
            <asp:GridView ID="GridView1" runat="server" EmptyDataText="No Result Found !" EmptyDataRowStyle-Font-Bold="true" EmptyDataRowStyle-ForeColor="#cc0000" PageSize="6" PagerStyle-CssClass="align-content-md-between" PagerStyle-HorizontalAlign="Right" CssClass="table table-striped table-hover" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField HeaderText="Action" ControlStyle-ForeColor="#cc0000" ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" >
<ControlStyle ForeColor="#CC0000"></ControlStyle>
                    </asp:CommandField>
                    <asp:BoundField DataField="id" HeaderText="Student ID" ControlStyle-ForeColor="#cc0000" ReadOnly="True" SortExpression="id" >
<ControlStyle ForeColor="#CC0000"></ControlStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="name" HeaderText="Name" ControlStyle-ForeColor="#cc0000" SortExpression="name" >
<ControlStyle ForeColor="#CC0000"></ControlStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="surname" HeaderText="Surname" ControlStyle-ForeColor="#cc0000" SortExpression="surname" >
<ControlStyle ForeColor="#CC0000"></ControlStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="className" ControlStyle-ForeColor="#cc0000" SortExpression="Class Name">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="className" DataValueField="className" SelectedValue='<%# Bind("className") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" SelectCommand="SELECT [className] FROM [class]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("className") %>'></asp:Label>
                        </ItemTemplate>

<ControlStyle ForeColor="#CC0000"></ControlStyle>
                    </asp:TemplateField>
                </Columns>

<EmptyDataRowStyle Font-Bold="True" ForeColor="#CC0000"></EmptyDataRowStyle>

                <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="True" ForeColor="#660066" />

<PagerStyle HorizontalAlign="Right" CssClass="align-content-md-between"></PagerStyle>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyConnection %>" DeleteCommand="DELETE FROM [Student] WHERE [id] = @id" InsertCommand="INSERT INTO [Student] ([id], [name], [surname], [className]) VALUES (@id, @name, @surname, @className)" SelectCommand="SELECT * FROM [Student]" UpdateCommand="UPDATE [Student] SET [name] = @name, [surname] = @surname, [className] = @className WHERE [id] = @id" FilterExpression="name LIKE '%{0}%'">
                <FilterParameters>
                    <asp:ControlParameter ControlID="txtsearch" Name="name" PropertyName="Text"/>
                </FilterParameters>
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="surname" Type="String" />
                    <asp:Parameter Name="className" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="surname" Type="String" />
                    <asp:Parameter Name="className" Type="String" />
                    <asp:Parameter Name="id" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    </form>
    <p>
        &nbsp;</p>
</body>

</html>

