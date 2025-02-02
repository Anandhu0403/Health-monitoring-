<?php
session_start();
error_reporting(0);
$roww=$_SESSION['id'];
 include("../connection.php");
 $upd="update request_tbl set status='accepted',acc_hospital='$roww'where id='$_REQUEST[id]'";
 mysqli_query($con,$upd);
 header('location:select.php')
?>