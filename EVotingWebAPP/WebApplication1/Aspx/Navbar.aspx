﻿<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Navbar.aspx.cs" Inherits="WebApplication1.Aspx.Navbar" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"/>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
     
    <style>
        body{
  margin: 0;
  padding: 0;
  font-family: "Roboto", sans-serif;
}

header{
  z-index: 1;
  position: fixed;
  background: #2f323a;
  padding: 20px;
  width: calc(100% - 0%);
  top: 0;
  height: 15px;
  opacity:0.4;
  
}

.left_area h3{
  color: #fff;
  margin: 0;
  text-transform: uppercase;
  font-size: 22px;
  font-weight: 900;
}

.left_area span{
  color: #19B3D3;
}

.logout_btn{
  padding: 5px;
  background: #19B3D3;
  text-decoration: none;
  float: right;
  margin-top: -30px;
  margin-right: 40px;
  border-radius: 2px;
  font-size: 15px;
  font-weight: 600;
  color: #fff;
  transition: 0.5s;
  transition-property: background;
}

.logout_btn:hover{
  background: #0B87A6;
}

.sidebar{
  z-index: 1;
  top: 0;
  background: #2f323a;
  
  margin-top: 70px;
  padding-top: 30px;
  position: fixed;
  left: 0;
  width: 250px;
  height: calc(100% - 9%);
  transition: 0.5s;
  transition-property: left;
  overflow-y: auto;
  opacity:0.4;
}

.profile_info{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.sidebar .profile_info .profile_image{
  width: 100px;
  height: 100px;
  border-radius: 100px;
  margin-bottom: 10px;
}

.sidebar .profile_info h4{
  color: #ccc;
  margin-top: 0;
  margin-bottom: 20px;
}

.sidebar a{
  color: #fff;
  display: block;
  width: 100%;
  line-height: 60px;
  text-decoration: none;
  padding-left: 40px;
  box-sizing: border-box;
  transition: 0.5s;
  transition-property: background;
}

.sidebar a:hover{
  background: #19B3D3;
}

.sidebar i{
  padding-right: 10px;
}
#vo{
     color: #FF3C33;
  margin: 0;
  text-transform: uppercase;
  font-size: 22px;
  font-weight: 900;
}
#ti{
     color: #ffffff;
  margin: 0;
  text-transform: uppercase;
  font-size: 22px;
  font-weight: 900;
}
#ng{
     color: #2FDF21;
  margin: 0;
  text-transform: uppercase;
  font-size: 22px;
  font-weight: 900;
}
label #sidebar_btn{
  z-index: 1;
  color: #fff;
  position: fixed;
  cursor: pointer;
  left: 300px;
  font-size: 20px;
  margin: 5px 0;
  transition: 0.5s;
  transition-property: color;
}

label #sidebar_btn:hover{
  color: #19B3D3;
}

#check:checked ~ .sidebar{
  left: -185px;
}

#check:checked ~ .sidebar a span{
  display: none;
}

#check:checked ~ .sidebar a{
  font-size: 20px;
  margin-left: 165px;
  width: 100%;
}

.content{
  width: (100% - 250px);
  margin-top: 60px;
  padding: 20px;
  margin-left: 250px;
  background:linear-gradient(90deg,rgba(223,112,41,1)3%,rgba(230,202,174,1)34%,rgba(228,228,228,1)41%,rgba(231,237,229,1)72%,rgba(59,251,0,1)100%,rgba(0,212,255,1)100%);
  background-position: center;
  background-size: cover;
  height: 100vh;
  transition: 0.5s;
}

#check:checked ~ .content{
  margin-left: 60px;
}

#check:checked ~ .sidebar .profile_info{
  display: none;
}

#check{
  display: none;
}

.mobile_nav{
  display: none;
}

.content .card p{
  background: #fff;
  padding: 15px;
  margin-bottom: 10px;
  font-size: 14px;
  opacity: 0.8;
}

/* Responsive CSS */

@media screen and (max-width: 780px){
  .sidebar{
    display: none;
  }

  #sidebar_btn{
    display: none;
  }

  .content{
    margin-left: 0;
    margin-top: 0;
    padding: 10px 20px;
    transition: 0s;
  }

  #check:checked ~ .content{
    margin-left: 0;
  }

  .mobile_nav{
    display: block;
    width: calc(100% - 0%);
  }
  
  .nav_bar{
      
    background: linear-gradient(90deg,rgba(223,112,41,1)3%,rgba(230,202,174,1)34%,rgba(228,228,228,1)41%,rgba(231,237,229,1)72%,rgba(59,251,0,1)100%,rgba(0,212,255,1)100%);
    width: (100% - 0px);
    margin-top: 70px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
  }

  .nav_bar .mobile_profile_image{
    width: 50px;
    height: 50px;
    border-radius: 50%;
  }

  .nav_bar .nav_btn{
    color: #fff;
    font-size: 22px;
    cursor: pointer;
    transition: 0.5s;
    transition-property: color;
  }

  .nav_bar .nav_btn:hover{
    color: #19B3D3;
  }

  .mobile_nav_items{
    background: #2F323A;
    display: none;
  }

  .mobile_nav_items a{
    color: #fff;
    display: block;
    text-align: center;
    letter-spacing: 1px;
    line-height: 60px;
    text-decoration: none;
    box-sizing: border-box;
    transition: 0.5s;
    transition-property: background;
  }

  .mobile_nav_items a:hover{
    background: #19B3D3;
  }

  .mobile_nav_items i{
    padding-right: 10px;
  }

  .active{
    display: block;
  }
}
    </style>
</head>
<body>

    

    <input type="checkbox" id="check"/>
    <!--header area start-->
    <header>
      <label for="check">
        <i class="fas fa-bars" id="sidebar_btn"></i>
      </label>
      <div class="left_area">
        <h3>E-<span id="vo">Vo</span><span id="ti">ti</span><span id="ng">ng</span></h3>
      </div>
      <div class="right_area">
        <a href="Login.aspx" class="logout_btn">Logout</a>
      </div>
    </header>
    <!--header area end-->
    <!--mobile navigation bar start-->
    <div class="mobile_nav">
      <div class="nav_bar">
        <img src="1.png" class="mobile_profile_image" alt="">
        <i class="fa fa-bars nav_btn"></i>
      </div>
      <div class="mobile_nav_items">
        <a href="#" id="idadmindashboard"><i class="fas fa-desktop"></i><span> Admin Dashboard</span></a>
        <a href="#" id="iduserdashboard"><i class="fas fa-desktop"></i><span> User Dashboard</span></a>
        <a href="#"><i class="fas fa-chart-bar"></i><span>Result</span></a>
        <a href="#"><i class="fas fa-table"></i><span>Candidates</span></a>
        <a href="#"><i class="fas fa-th"></i><span>Login form</span></a>
        
      </div>
    </div>
    <!--mobile navigation bar end-->
    <!--sidebar start-->
    <div class="sidebar">
      <div class="profile_info">
        <img src="1.png" class="profile_image" alt="">
        <h4>Jessica</h4>
      </div>
      <a href="#" id="idadmindashboard1"><i class="fas fa-desktop"></i><span> Admin Dashboard</span></a>
        <a href="#" id="iduserdashboard1"><i class="fas fa-desktop"></i><span> User Dashboard</span></a>
        <a href="#" id="iduserresultview"><i class="fas fa-chart-bar"></i><span>Result</span></a>
        <a href="#" id="idadminresultviewstate"><i class="fas fa-chart-line"></i><span>State-wise-Result</span></a>
        <a href="#" id="idadminresultviewconstituency"><i class="fas fa-chart-bar"></i><span>Constituencywise-Result</span></a>
        <a href="#" id="idcandiadtestable"><i class="fas fa-table"></i><span>Candidates List</span></a>
        <a href="#" id="idloginform"><i class="fas fa-sign-in-alt"></i><span>Login Form</span></a>
        
    </div>
    <!--sidebar end-->

<script type="text/javascript">
    $(document).ready(function(){
      $('.nav_btn').click(function(){
        $('.mobile_nav_items').toggleClass('active');
      });
    });
    </script>
</body>
</html>
