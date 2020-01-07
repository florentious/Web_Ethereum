<%@ page pageEncoding="UTF-8"%>
<%
	String conPath = request.getContextPath();
	
%>
<!DOCTYPE html>
<html lang="en">
  	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>blockchain for ethereum</title>
	    <!-- Bootstrap -->
	    <link href="<%=conPath %>/css/bootstrap.min.css" rel="stylesheet">
	    <!-- font awesome -->
	    <link rel="stylesheet" href="<%=conPath %>/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
	    <!-- Custom style -->
	    <link rel="stylesheet" href="<%=conPath %>/css/style.css" media="screen" title="no title" charset="utf-8">
		
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
	    <script src="<%=conPath %>/js/jquery-1.12.0.min.js"></script>
		<script src="<%=conPath %>/js/bootstrap.min.js"></script>
		<script src="<%=conPath %>/js/web3.js"></script>
		<script src="<%=conPath %>/js/clipboard.min.js"></script>
		<style>
		.copied {
			color: green;
			display: none;
		}
		.btn-space {
		    margin-right: 15px;
		}
		#navbar-nav  ul{
		  	margin: 5px;
        		padding: 0px 0px;
        		
		}
		</style>
  	</head>
  	<body>
  		<div class="container">
  			<div class="row">
  				<div class="col"><h1>Header</h1></div>
			</div>
  			<div class="row ">
  				<div class="col-sm-2 text-left " id="navbar-nav" >
  					<ul>
  						<li><a href="<%=conPath %>/smart/index.jsp">Smart Contract</a></li>
  					</ul>
  				</div>