<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAddCandidates.aspx.cs" Inherits="WebApplication1.Aspx.AdminAddCandidates" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/Admin.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
<style>
/* width */
::-webkit-scrollbar {
  width: 20px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px grey; 
  border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: black; 
  border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #808080; 
}
</style>
    <script>
             $(document).ready(function () {
                 Getcandidatedetails();
                });
    </script>
</head>
<body>
    <a id="btnAddRow" style="margin-top:15px;font-weight: bold; padding-left:47px ;color: #0099CC;text-decoration:underline" onclick="AddParticiptingCandidates()">Add New Row</a>
    <div class="container">
        
        <div class="jumbotron">
            <table class="table table-dark" id="tbladdcandidates">
             
 
            </table>
        </div>
    </div>
</body>
</html>
