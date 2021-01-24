<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserVoting.aspx.cs" Inherits="WebApplication1.Aspx.UserVoting" %>


   

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title></title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/User.js"></script>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600;700;800&display=swap');

*{
	
	padding: 0;
	box-sizing: border-box;
    margin-bottom:15px;
    margin-left:2px;

}

body{
	height: 100vh;
	font-family: "Raleway", sans-serif;
	background: url('../images/backgroundimage.jpg');
}

.container{
	
    width:1500px;
    height:2000px;
    margin:0 auto;
    margin-top:65px;
    margin-left:250px;
    padding:27px 18px;
    transition:all 0.3s linear;
}
card-text{
    margin-bottom: 132px;

}
.col-md-3{
    width:148px;
    height:310px;
    float:left;
    padding:40px;
    margin:-3px;
    margin-bottom:31px;
}
.card{
    height: 300px;
    width: 1003px;
}
.row{
	width: 155%;
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
}
.row {
   display: flex;
   flex-wrap: wrap;
}

.row > div[class*='col-'] {
  display: flex;
}
.image{
	background: #50A7FF;
	position: relative;
	flex: 1;
	max-width: 460px;
	height: 300px;
	margin: 20px;
	overflow: hidden;
}

.image img{
	opacity: 0.8;
	position: relative;
	vertical-align: top;
	transition: 0.6s;
	transition-property: opacity;
}

.image:hover img{
	opacity: 1;
}

.image .details{
	z-index: 1;
	position: absolute;
	top: 0;
	right: 0;
	color: #fff;
	width: 100%;
	height: 100%;
}

.image .details h2{
	text-align: center;
	font-size: 35px;
	text-transform: uppercase;
	font-weight: 300;
	margin-top: 70px;
	transition: 0.4s;
	transition-property: transform;
}

.image .details h2 span{
	font-weight: 900;
}

.image:hover .details h2{
	transform: translateY(-30px);
}

.image .details p{
	margin: 30px 30px 0 30px;
	font-size: 18px;
	font-weight: 600;
	text-align: center;
	opacity: 0;
	transition: 0.6s;
	transition-property: opacity, transform;
}

.image:hover .details p{
	opacity: 1;
	transform: translateY(-40px);
}

.more{
	position: absolute;
	background: rgba(255, 255, 255, 0.8);
	width: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 15px;
	bottom: -60px;
	transition: 0.6s;
	transition-property: bottom;
}
p {
    margin-top: 0;
    margin-bottom: 1rem;
    text-align: center;
}
h5 {
    margin-top: 0;
    margin-bottom: 1rem;
    text-align: center;
}

.image:hover .more{
	bottom: 0;
}

.more .read-more{
	color: #000;
	text-decoration: none;
	font-size: 20px;
	font-weight: 500;
	text-transform: uppercase;
}

.more .read-more span{
	font-weight: 900;
}

.more .icon-links i{
	color: #000;
	font-size: 20px;
}

.more .icon-links a:not(:last-child) i{
	margin-right: 20px;
}

/* Responsive CSS */

@media (max-width: 1080px){
	.image{
		flex: 100%;
		max-width: 480px;
	}
}

@media (max-width: 400px){
	.image .details p{
		font-size: 16px;
	}

	.more .read-more, .more .icon-links a i{
		font-size: 18px;
	}
}
 .container .item_wrap{
	display: flex;
	margin-bottom: 20px;
}

 .container .item_wrap .image{
	background: #fff;
	border: 1px solid #e0e0e0;
	padding: 25px;
	font-size: 14px;
	line-height: 22px;
}
                          
    </style>

    <%--<style>
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
            margin-right: 4px;
        }
        .card hover{
            transform:scale(1.2);
            box-shadow:5px 5px 15px rgba(0,0,0,0.6);
        }
        .card-deck .card {
            max-width: calc(25% - 30px);
        }
     



    </style>--%>
    
    <script>
        $(document).ready(function () {
            GetCandidateDetails();
        });
    </script>
</head>
<body>

    <!--#include file="Navbar.aspx"-->
    

    
     <div class="container" >
      <!--image row start-->
      
           <div class="row mx-auto d-flex justify-content-center col-md-12" id="carddeck">
                    <%--<div class="card-columns mx-auto d-flex justify-content-center col-12" >

                    </div>--%>
            </div>
    </div>
   
    <!--Card area  html starts-->
 <%--   <div class="bs-example">

    <div class="container-fluid">
        
       
            
                <div class="card-deck" id="carddeck">
                
                
            
                
                    </div>
            </div>
    </div>--%>


           <!--Card area  html Ends-->





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

