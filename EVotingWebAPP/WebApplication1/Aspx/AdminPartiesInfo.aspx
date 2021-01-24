<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPartiesInfo.aspx.cs" Inherits="WebApplication1.Aspx.AdminPartiesInfo" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap 4 Card Deck</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="../js/Admin.js"></script>
    <style>
        body{
            width:100vw;
            height:100vh;
            display:flex;
            align-items:inherit;
            justify-content:center;
            background:url(../images/backgroundimage.jpg);
            overflow:hidden;
            
        }
        .card{
            display:grid;
            grid-template-columns:200px;
            /*grid-template-rows:105px 105p 40px;*/
            grid-template-areas:"image" "text" "stats";
            font-family:roboto;
            background-color:white;
            border-radius:18px;
            box-shadow:5px 5px 15px rgba(0,0,0,0.9);
            text-align:center;
            transition:0.5s ease;
            cursor:pointer;
            margin-top:24px;
        }
        .card-image{
            grid-area:image;
            background-image:url();
            border-top-left-radius:15px;
            border-top-right-radius:15px;
            background-size:cover;

        }
        .card-text{
            grid-area:text;
            margin:25px;

        }
        .card-stats{
            grid-area:stats;
            display:grid;
            grid-template-columns:1fr 1fr 1fr;
            grid-template-rows:1fr;
            border-bottom-left-radius:15px;
            border-bottom-right-radius:15px;
            background:#ff006e;
        }
        .card hover{
            transform:scale(1.2);
            box-shadow:5px 5px 15px rgba(0,0,0,0.6);
        }
    </style>

    <script>
        $(document).ready(function () {
            GetUserdetailsinAdminPanel();
        });
    </script>
</head>
<body>
    <!--Card area  html starts-->
    <div class="bs-example">
    <div class="container-fluid">
        <div class="row">
            <div class="card-deck" id="carddeck">
                
                
            </div>
        </div>
    </div>
</div>

           <!--Card area  html Ends-->



    <div id="cardarea1">

    </div>



    <%-- Success modal pop up  starts  */--%>

    <div class="modal" id="idSuccessmodal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="idsucessmodalbody">
        
      </div>
      
    </div>
  </div>
</div>
     <%-- Success modal pop up  ends */--%>

    <%-- voter casting  modal pop up  starts  */--%>

    <div class="modal" id="idvotercastmodal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="idvotercastmodalbody">
                        <input type="text" name=""  id="idVoterid" placeholder="Voter Id"> 
                        <input type="submit"  value="Login" id="idlogin"  onclick="GetUIAccess()">
      </div>
      
    </div>
  </div>
</div>
     <%-- voter casting modal pop up  ends */--%>
    

</body>
</html>

