<?php
session_start();
if(!$_SESSION['login']){
    header( "location: login.php" );
    exit(0);
}

include_once("header.php");

$page=$_GET['page'];

if($page=='report'){
    include_once("report.php");
}elseif($page=='register'){
    include_once("register.php");
}else{
    include_once("home.php");
}

include_once("footer.php");

?>