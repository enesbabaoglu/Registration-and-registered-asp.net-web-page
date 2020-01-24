<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="registers.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"/>
    <link href="style.css" rel="stylesheet"/>
</head>
<body class="text-center">
    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-item nav-link active" href="WebForm1.aspx">Registration <span class="sr-only">(current)</span></a>
                    <a class="nav-item nav-link" href="Registered.aspx">Registered</a>
                </div>
            </div>
        </nav>
    </header>
    <form id="form1" runat="server" class="form-signin">

        <img class="mb-4" src="https://image.flaticon.com/icons/png/512/942/942748.png" alt="" width="150" height="150">
        <h1 class="h3 mb-3 font-weight-normal" style="color:whitesmoke">Registration Page</h1>
        <hr />
        <label for="name" class="sr-only">Name</label>
        <asp:TextBox ID="txtname" CssClass="form-control" placeholder="Name" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" id="reqName" controltovalidate="txtname" errormessage="Please enter your name!" ForeColor="red"></asp:RequiredFieldValidator>
        
        <label for="surname" class="sr-only">Surname</label>
        <asp:TextBox ID="txtsurname" CssClass="form-control" placeholder="Surname" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="txtsurname" errormessage="Please enter your surname!" ForeColor="red"></asp:RequiredFieldValidator>
        
        <label for="studentId" class="sr-only">Student ID</label>
        <asp:TextBox ID="txtstudent" CssClass="form-control" placeholder="Student ID" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtstudent" errormessage="Please enter your id!" ForeColor="red"></asp:RequiredFieldValidator>
        
        <asp:DropDownList ID="Selectclass" runat="server" AutoPostBack="true"  CssClass="custom-select custom-select-lg mb-3" ></asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Selectclass" ErrorMessage="Please Select a Class" ForeColor="Red" InitialValue="Please select"></asp:RequiredFieldValidator>
        
        <asp:Button ID="Button1" 5 runat="server" OnClick="Button1_Click" CssClass="btn btn-lg btn-primary btn-block" Text="Submit" />
        
       </form>


</body>
</html>
