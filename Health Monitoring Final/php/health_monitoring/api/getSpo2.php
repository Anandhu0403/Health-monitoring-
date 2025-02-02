<?php

include("connection.php");

$sql = "SELECT * FROM health_data ORDER BY id DESC limit 0,1";
$result = mysqli_query($con,$sql);
$row = mysqli_fetch_array($result);

$sql2 = "SELECT MAX(spo2) as max_spo2 FROM health_data";
$result2 = mysqli_query($con,$sql2);
$row2 = mysqli_fetch_array($result2);
$max_spo2= $row2['max_spo2'];


$sql3 = "SELECT MIN(spo2) as min_spo2 FROM health_data";
$result3 = mysqli_query($con,$sql3);
$row3 = mysqli_fetch_array($result3);
$min_spo2 = $row3['min_spo2'];


$data["data"][] = array('spo2'=>$row['spo2'],'max_spo2'=>$max_spo2,'min_spo2'=>$min_spo2);


echo json_encode($data);

?>