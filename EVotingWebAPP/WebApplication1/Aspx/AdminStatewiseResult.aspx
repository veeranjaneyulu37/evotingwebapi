<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminStatewiseResult.aspx.cs" Inherits="WebApplication1.Aspx.AdminStatewiseResult" %>

<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/Admin.js"></script>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
    <script src="../js/chartjs.min.js"></script>
    
        <script>
        $(document).ready(function () {
            StatewiseViseResult();
        });
    </script>


    <style>
    body {
        margin: 0;
        font-family: "Poppins", sans-serif;
        font-size: 0.875rem;
        font-weight: 400;
        line-height: 1.5;
        color: #525f7f;
        text-align: left;
        background-color: #1e1e2f;
    }

    .container {
        width: 100%;
        padding-right: 15px;
        padding-left: 15px;
        margin-right: auto;
        margin-left: auto;
    }

    h1,
    h2,
    h3,
    h4,
    h5,
    h6 {
        margin-top: 0;
        margin-bottom: 0.5rem;
    }

    h1,
    h2,
    h3,
    h4,
    h5,
    h6,
    .h1,
    .h2,
    .h3,
    .h4,
    .h5,
    .h6 {
        margin-bottom: 0.5rem;
        font-family: inherit;
        font-weight: 400;
        line-height: 1.2;
        color: #32325d;
    }

    h1,
    .h1 {
        font-size: 2.0625rem;
    }

    h2,
    .h2 {
        font-size: 1.6875rem;
    }

    h3,
    .h3 {
        font-size: 1.4375rem;
    }

    h4,
    .h4 {
        font-size: 1.0625rem;
    }

    h5,
    .h5 {
        font-size: 0.8125rem;
    }

    h6,
    .h6 {
        font-size: 0.75rem;
    }

    

    @media (min-width: 576px) {
        .container {
            max-width: 550px;
        }
    }

    @media (min-width: 768px) {
        .container {
            max-width: 730px;
        }
    }

    @media (min-width: 992px) {
        .container {
            max-width: 970px;
        }
    }

    @media (min-width: 1200px) {
        .container {
            max-width: 1140px;
        }
    }

    .row{
        display: flex;
    flex-wrap: wrap;
    margin-right: -109px;
    margin-left: 141px;
    margin-top: 112px;
    }
     .col-1,
    .col-2,
    .col-3,
    .col-4,
    .col-5,
    .col-6,
    .col-7,
    .col-8,
    .col-9,
    .col-10,
    .col-11,
    .col-12,
    .col,
    .col-auto,
    .col-sm-1,
    .col-sm-2,
    .col-sm-3,
    .col-sm-4,
    .col-sm-5,
    .col-sm-6,
    .col-sm-7,
    .col-sm-8,
    .col-sm-9,
    .col-sm-10,
    .col-sm-11,
    .col-sm-12,
    .col-sm,
    .col-sm-auto,
    .col-md-1,
    .col-md-2,
    .col-md-3,
    .col-md-4,
    .col-md-5,
    .col-md-6,
    .col-md-7,
    .col-md-8,
    .col-md-9,
    .col-md-10,
    .col-md-11,
    .col-md-12,
    .col-md,
    .col-md-auto,
    .col-lg-1,
    .col-lg-2,
    .col-lg-3,
    .col-lg-4,
    .col-lg-5,
    .col-lg-4,
    .col-lg-7,
    .col-lg-8,
    .col-lg-9,
    .col-lg-10,
    .col-lg-11,
    .col-lg-12,
    .col-lg,
    .col-lg-auto,
    .col-xl-1,
    .col-xl-2,
    .col-xl-3,
    .col-xl-4,
    .col-xl-5,
    .col-xl-6,
    .col-xl-7,
    .col-xl-8,
    .col-xl-9,
    .col-xl-10,
    .col-xl-11,
    .col-xl-12,
    .col-xl,
    .col-xl-auto {
        position: relative;
        width: 100%;
        padding-right: 15px;
        padding-left: 15px;
    }

    .container-fluid {
        width: 100%;
        padding-right: 15px;
        padding-left: 15px;
        margin-right: auto;
        margin-left: auto;
    }
    
   

    .col {
        flex-basis: 0;
        flex-grow: 1;
        max-width: 100%;
    }

    .col-auto {
        flex: 0 0 auto;
        width: auto;
        max-width: 100%;
    }

    .col-1 {
        flex: 0 0 8.333333%;
        max-width: 8.333333%;
    }

    .col-2 {
        flex: 0 0 16.666667%;
        max-width: 16.666667%;
    }

    .col-3 {
        flex: 0 0 25%;
        max-width: 25%;
    }

    .col-4 {
        flex: 0 0 33.333333%;
        max-width: 33.333333%;
    }

    .col-5 {
        flex: 0 0 41.666667%;
        max-width: 41.666667%;
    }

    .col-6 {
        flex: 0 0 50%;
        max-width: 50%;
    }

    .col-7 {
        flex: 0 0 58.333333%;
        max-width: 58.333333%;
    }

    .col-8 {
        flex: 0 0 66.666667%;
        max-width: 66.666667%;
    }

    .col-9 {
        flex: 0 0 75%;
        max-width: 75%;
    }

    .col-10 {
        flex: 0 0 83.333333%;
        max-width: 83.333333%;
    }

    .col-11 {
        flex: 0 0 91.666667%;
        max-width: 91.666667%;
    }

    .col-12 {
        flex: 0 0 100%;
        max-width: 100%;
    }

    @media (min-width: 576px) {
        .col-sm {
            flex-basis: 0;
            flex-grow: 1;
            max-width: 100%;
        }

        .col-sm-auto {
            flex: 0 0 auto;
            width: auto;
            max-width: 100%;
        }

        .col-sm-1 {
            flex: 0 0 8.333333%;
            max-width: 8.333333%;
        }

        .col-sm-2 {
            flex: 0 0 16.666667%;
            max-width: 16.666667%;
        }

        .col-sm-3 {
            flex: 0 0 25%;
            max-width: 25%;
        }

        .col-sm-4 {
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
        }

        .col-sm-5 {
            flex: 0 0 41.666667%;
            max-width: 41.666667%;
        }

        .col-sm-6 {
            flex: 0 0 50%;
            max-width: 50%;
        }

        .col-sm-7 {
            flex: 0 0 58.333333%;
            max-width: 58.333333%;
        }

        .col-sm-8 {
            flex: 0 0 66.666667%;
            max-width: 66.666667%;
        }

        .col-sm-9 {
            flex: 0 0 75%;
            max-width: 75%;
        }

        .col-sm-10 {
            flex: 0 0 83.333333%;
            max-width: 83.333333%;
        }

        .col-sm-11 {
            flex: 0 0 91.666667%;
            max-width: 91.666667%;
        }

        .col-sm-12 {
            flex: 0 0 100%;
            max-width: 100%;
        }
    }

    @media (min-width: 768px) {
        .col-md {
            flex-basis: 0;
            flex-grow: 1;
            max-width: 100%;
        }

        .col-md-auto {
            flex: 0 0 auto;
            width: auto;
            max-width: 100%;
        }

        .col-md-1 {
            flex: 0 0 8.333333%;
            max-width: 8.333333%;
        }

        .col-md-2 {
            flex: 0 0 16.666667%;
            max-width: 16.666667%;
        }

        .col-md-3 {
            flex: 0 0 25%;
            max-width: 25%;
        }

        .col-md-4 {
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
        }

        .col-md-5 {
            flex: 0 0 41.666667%;
            max-width: 41.666667%;
        }

        .col-md-6 {
            flex: 0 0 50%;
            max-width: 50%;
        }

        .col-md-7 {
            flex: 0 0 58.333333%;
            max-width: 58.333333%;
        }

        .col-md-8 {
            flex: 0 0 66.666667%;
            max-width: 66.666667%;
        }

        .col-md-9 {
            flex: 0 0 75%;
            max-width: 75%;
        }

        .col-md-10 {
            flex: 0 0 83.333333%;
            max-width: 83.333333%;
        }

        .col-md-11 {
            flex: 0 0 91.666667%;
            max-width: 91.666667%;
        }

        .col-md-12 {
            flex: 0 0 100%;
            max-width: 100%;
        }
    }

    @media (min-width: 992px) {
        .col-lg {
            flex-basis: 0;
            flex-grow: 1;
            max-width: 100%;
        }

        .col-lg-auto {
            flex: 0 0 auto;
            width: auto;
            max-width: 100%;
        }

        .col-lg-1 {
            flex: 0 0 8.333333%;
            max-width: 8.333333%;
        }

        .col-lg-2 {
            flex: 0 0 16.666667%;
            max-width: 16.666667%;
        }

        .col-lg-3 {
            flex: 0 0 25%;
            max-width: 25%;
        }

        .col-lg-4 {
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
        }

        .col-lg-5 {
            flex: 0 0 41.666667%;
            max-width: 41.666667%;
        }

        .col-lg-4 {
            flex: 0 0 50%;
            max-width: 47%;
        }

        .col-lg-7 {
            flex: 0 0 58.333333%;
            max-width: 58.333333%;
        }

        .col-lg-8 {
            flex: 0 0 66.666667%;
            max-width: 66.666667%;
        }

        .col-lg-9 {
            flex: 0 0 75%;
            max-width: 75%;
        }

        .col-lg-10 {
            flex: 0 0 83.333333%;
            max-width: 83.333333%;
        }

        .col-lg-11 {
            flex: 0 0 91.666667%;
            max-width: 91.666667%;
        }

        .col-lg-12 {
            flex: 0 0 100%;
            max-width: 100%;
        }

        .order-lg-first {
            order: -1;
        }

        .order-lg-last {
            order: 13;
        }

        .order-lg-0 {
            order: 0;
        }

        .order-lg-1 {
            order: 1;
        }

        .order-lg-2 {
            order: 2;
        }

        .order-lg-3 {
            order: 3;
        }

        .order-lg-4 {
            order: 4;
        }

        .order-lg-5 {
            order: 5;
        }

        .order-lg-6 {
            order: 6;
        }

        .order-lg-7 {
            order: 7;
        }

        .order-lg-8 {
            order: 8;
        }

        .order-lg-9 {
            order: 9;
        }

        .order-lg-10 {
            order: 10;
        }

        .order-lg-11 {
            order: 11;
        }

        .order-lg-12 {
            order: 12;
        }

        .offset-lg-0 {
            margin-left: 0;
        }

        .offset-lg-1 {
            margin-left: 8.333333%;
        }

        .offset-lg-2 {
            margin-left: 16.666667%;
        }

        .offset-lg-3 {
            margin-left: 25%;
        }

        .offset-lg-4 {
            margin-left: 33.333333%;
        }

        .offset-lg-5 {
            margin-left: 41.666667%;
        }

        .offset-lg-6 {
            margin-left: 50%;
        }

        .offset-lg-7 {
            margin-left: 58.333333%;
        }

        .offset-lg-8 {
            margin-left: 66.666667%;
        }

        .offset-lg-9 {
            margin-left: 75%;
        }

        .offset-lg-10 {
            margin-left: 83.333333%;
        }

        .offset-lg-11 {
            margin-left: 91.666667%;
        }
    }

    @media (min-width: 1200px) {
        .col-xl {
            flex-basis: 0;
            flex-grow: 1;
            max-width: 100%;
        }

        .col-xl-auto {
            flex: 0 0 auto;
            width: auto;
            max-width: 100%;
        }

        .col-xl-1 {
            flex: 0 0 8.333333%;
            max-width: 8.333333%;
        }

        .col-xl-2 {
            flex: 0 0 16.666667%;
            max-width: 16.666667%;
        }

        .col-xl-3 {
            flex: 0 0 25%;
            max-width: 25%;
        }

        .col-xl-4 {
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
        }

        .col-xl-5 {
            flex: 0 0 41.666667%;
            max-width: 41.666667%;
        }

        .col-xl-6 {
            flex: 0 0 50%;
            max-width: 50%;
        }

        .col-xl-7 {
            flex: 0 0 58.333333%;
            max-width: 58.333333%;
        }

        .col-xl-8 {
            flex: 0 0 66.666667%;
            max-width: 66.666667%;
        }

        .col-xl-9 {
            flex: 0 0 75%;
            max-width: 75%;
        }

        .col-xl-10 {
            flex: 0 0 83.333333%;
            max-width: 83.333333%;
        }

        .col-xl-11 {
            flex: 0 0 91.666667%;
            max-width: 91.666667%;
        }

        .col-xl-12 {
            flex: 0 0 100%;
            max-width: 100%;
        }

        .order-xl-first {
            order: -1;
        }

        .order-xl-last {
            order: 13;
        }

        .order-xl-0 {
            order: 0;
        }

        .order-xl-1 {
            order: 1;
        }

        .order-xl-2 {
            order: 2;
        }

        .order-xl-3 {
            order: 3;
        }

        .order-xl-4 {
            order: 4;
        }

        .order-xl-5 {
            order: 5;
        }

        .order-xl-6 {
            order: 6;
        }

        .order-xl-7 {
            order: 7;
        }

        .order-xl-8 {
            order: 8;
        }

        .order-xl-9 {
            order: 9;
        }

        .order-xl-10 {
            order: 10;
        }

        .order-xl-11 {
            order: 11;
        }

        .order-xl-12 {
            order: 12;
        }

        .offset-xl-0 {
            margin-left: 0;
        }

        .offset-xl-1 {
            margin-left: 8.333333%;
        }

        .offset-xl-2 {
            margin-left: 16.666667%;
        }

        .offset-xl-3 {
            margin-left: 25%;
        }

        .offset-xl-4 {
            margin-left: 33.333333%;
        }

        .offset-xl-5 {
            margin-left: 41.666667%;
        }

        .offset-xl-6 {
            margin-left: 50%;
        }

        .offset-xl-7 {
            margin-left: 58.333333%;
        }

        .offset-xl-8 {
            margin-left: 66.666667%;
        }

        .offset-xl-9 {
            margin-left: 75%;
        }

        .offset-xl-10 {
            margin-left: 83.333333%;
        }

        .offset-xl-11 {
            margin-left: 91.666667%;
        }
    }

    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #ffffff;
        background-clip: border-box;
        border: 0.0625rem solid rgba(34, 42, 66, 0.05);
        border-radius: 0.2857rem;
    }
     a{
        width: 1100%;
    }

    .card>hr {
        margin-right: 0;
        margin-left: 0;
    }

    .card>.list-group:first-child .list-group-item:first-child {
        border-top-left-radius: 0.2857rem;
        border-top-right-radius: 0.2857rem;
    }

    .card>.list-group:last-child .list-group-item:last-child {
        border-bottom-right-radius: 0.2857rem;
        border-bottom-left-radius: 0.2857rem;
    }

    .card-body {
        flex: 1 1 auto;
        padding: 1.5rem;
    }

    .card-title {
        margin-bottom: 1.25rem;
    }

    .card-subtitle {
        margin-top: -0.625rem;
        margin-bottom: 0;
    }

    .card-text:last-child {
        margin-bottom: 0;
    }

    
   

    .card-header {
        padding: 1.25rem 1.5rem;
        margin-bottom: 0;
        background-color: #f6f9fc;
        border-bottom: 0.0625rem solid rgba(34, 42, 66, 0.05);
    }

    .card-header:first-child {
        border-radius: calc(0.2857rem - 0.0625rem) calc(0.2857rem - 0.0625rem) 0 0;
    }

   

    .card-header-tabs {
        margin-right: -0.75rem;
        margin-bottom: -1.25rem;
        margin-left: -0.75rem;
        border-bottom: 0;
    }

    .card-header-pills {
        margin-right: -0.75rem;
        margin-left: -0.75rem;
    }

    .text-primary {
        color: #e14eca !important;
    }

    a.text-primary:hover,
    a.text-primary:focus {
        color: #c221a9 !important;
    }

    @media print {

        *,
        *::before,
        *::after {
            text-shadow: none !important;
            box-shadow: none !important;
        }

        a:not(.btn) {
            text-decoration: underline;
        }

        abbr[title]::after {
            content: " ("attr(title) ")";
        }

        pre {
            white-space: pre-wrap !important;
        }

        pre,
        blockquote {
            border: 0.0625rem solid #adb5bd;
            page-break-inside: avoid;
        }

        thead {
            display: table-header-group;
        }

        tr,
        img {
            page-break-inside: avoid;
        }

        p,
        h2,
        h3 {
            orphans: 3;
            widows: 3;
        }

        h2,
        h3 {
            page-break-after: avoid;
        }

        @page {
            size: a3;
        }

        body {
            min-width: 992px !important;
        }

        .container {
            min-width: 992px !important;
        }

        .navbar {
            display: none;
        }

        .badge {
            border: 0.0625rem solid #222a42;
        }

        .table {
            border-collapse: collapse !important;
        }

        .table td,
        .table th {
            background-color: #ffffff !important;
        }

        .table-bordered th,
        .table-bordered td {
            border: 1px solid #e3e3e3 !important;
        }

        .table-dark {
            color: inherit;
        }

        .table-dark th,
        .table-dark td,
        .table-dark thead th,
        .table-dark tbody+tbody {
            border-color: #e3e3e3;
        }

        .table .thead-dark th {
            color: inherit;
            border-color: #e3e3e3;
        }
    }

    body {
        -moz-osx-font-smoothing: grayscale;
        -webkit-font-smoothing: antialiased;
    }

    .card h1,
    .card h2,
    .card h3,
    .card h4,
    .card h5,
    .card h6,
    .card p {
        color: rgba(255, 255, 255, 0.8);
    }

    .description,
    .card-description,
    .footer-big p,
    .card .footer .stats {
        color: #9A9A9A;
        font-weight: 300;
    }

    .category,
    .card-category {
        text-transform: capitalize;
        font-weight: 400;
        color: rgba(255, 255, 255, 0.6);
        font-size: 0.75rem;
    }

    .card-category {
        font-size: 0.75rem;
    }


    @media screen and (max-width: 768px) {
        .main-panel .content {
            padding-left: 15px;
            padding-right: 15px;
        }
    }


    .bd-docs .card.card-body,
    .bd-docs .card .card-body {
        color: rgba(255, 255, 255, 0.8);
    }

    @media screen and (max-width: 576px) {
        .page-header .container h6.category-absolute {
            width: 90%;
        }

        @media (min-width: 991px) {
            .rtl.sidebar-mini .main-panel .content {
                padding-right: 130px;
                padding-left: 50px;
            }

            .rtl.sidebar-mini footer {
                padding-right: 130px;
                padding-left: 50px;
            }

            .rtl .navbar-minimize button {
                margin-right: -5px;
            }
        }

        @media screen and (max-width: 991px) {
            .rtl .sidebar {
                margin-right: 0;
            }

            .rtl .main-panel .content {
                padding-right: 50px;
            }

            .rtl #bodyClick {
                right: 260px;
                left: auto;
            }

            .rtl .footer {
                padding-right: 15px;
            }
        }

        @media screen and (max-width: 768px) {
            .rtl .main-panel .content {
                padding-left: 15px;
                padding-right: 15px;
            }
        }

        @-webkit-keyframes shake {

            from,
            to {
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

            10%,
            30%,
            50%,
            70%,
            90% {
                -webkit-transform: translate3d(-10px, 0, 0);
                transform: translate3d(-10px, 0, 0);
            }

            20%,
            40%,
            60%,
            80% {
                -webkit-transform: translate3d(10px, 0, 0);
                transform: translate3d(10px, 0, 0);
            }
        }

        @keyframes shake {

            from,
            to {
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

            10%,
            30%,
            50%,
            70%,
            90% {
                -webkit-transform: translate3d(-10px, 0, 0);
                transform: translate3d(-10px, 0, 0);
            }

            20%,
            40%,
            60%,
            80% {
                -webkit-transform: translate3d(10px, 0, 0);
                transform: translate3d(10px, 0, 0);
            }
        }

        .shake {
            -webkit-animation-name: shake;
            animation-name: shake;
        }

        @-webkit-keyframes fadeInDown {
            from {
                opacity: 0;
                -webkit-transform: translate3d(0, -100%, 0);
                transform: translate3d(0, -100%, 0);
            }

            to {
                opacity: 1;
                -webkit-transform: none;
                transform: none;
            }
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                -webkit-transform: translate3d(0, -100%, 0);
                transform: translate3d(0, -100%, 0);
            }

            to {
                opacity: 1;
                -webkit-transform: none;
                transform: none;
            }
        }
    }

   
   
    .card {
        background: #27293d;
        border: 0;
        position: relative;
        width: 100%;
        margin-bottom: -86px;
        box-shadow: 0 1px 20px 0px rgba(0, 0, 0, 0.1);
    }

    .card label {
        color: rgba(255, 255, 255, 0.6);
    }

    .card .card-title {
        margin-bottom: .75rem;
    }

    .card .card-body {
        padding: 15px;
    }

    

    .card .card-body .card-title {
        color: #ffffff;
        text-transform: inherit;
        font-weight: 300;
        margin-bottom: .75rem;
    }

    .card .card-body .card-description,
    .card .card-body .card-category {
        color: rgba(255, 255, 255, 0.6);
    }

    .card .card-header {
        padding: 15px 15px 0;
        border: 0;
        color: rgba(255, 255, 255, 0.8);
    }

    .card .card-header:not([data-background-color]) {
        background-color: transparent;
    }

    .card .card-header .card-title {
        color: #ffffff;
        font-weight: 100;
    }

    .card .card-header .card-category {
        color: #9A9A9A;
        margin-bottom: 5px;
        font-weight: 300;
    }

    
    .card.card-white {
        background: #ffffff;
    }

    .card.card-white .card-title {
        color: #222a42;
    }

    .card.card-white .card-category,
    .card.card-white .stats {
        color: #808080;
    }

    

    .card label {
        font-size: 0.75rem;
        margin-bottom: 5px;
    }

    

    .card-body {
        padding: 1.25rem;
    }

    @media (max-width: 767.98px) {
        .card.card-chart .card-header .btn-group-toggle .tim-icons {
            font-size: .875rem;
            top: -1px;
        }
    }

    .card-chart {
        overflow: hidden;
    }

    .card-chart .card-header .card-title i {
        font-size: 16px;
        margin-right: 5px;
        margin-bottom: 3px;
    }

    .card-chart .card-header .card-category {
        margin-bottom: 5px;
    }

    .card-chart .card-body {
        padding-left: 5px;
        padding-right: 5px;
    }

    
    .card-chart .card-progress {
        margin-top: 30px;
        padding: 0 10px;
    }

    .card-chart .chart-area {
        height: 220px;
        width: 100%;
    }

    

   

    .card-chart.card-chart-pie .chart-area {
        padding: 10px 0 25px;
        height: auto;
    }

    .card-chart.card-chart-pie .card-title {
        margin-bottom: 10px;
    }

    .card-chart.card-chart-pie .card-title i {
        font-size: 1rem;
    }

    
    

    
</style>

</head>
<body>
<!--#include file="Navbar.aspx"-->
    
<div class="container">

    <div class="row" id="generatecards">
        
        

    </div>

   

</div>

    </body>
</html>
