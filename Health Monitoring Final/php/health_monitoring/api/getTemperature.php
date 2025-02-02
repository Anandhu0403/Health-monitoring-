<?php

include("connection.php");

$sql = "SELECT * FROM health_data ORDER BY id DESC limit 0,1";
$result = mysqli_query($con,$sql);
$row = mysqli_fetch_array($result);

$sql2 = "SELECT MAX(temperature) as max_temperature FROM health_data";
$result2 = mysqli_query($con,$sql2);
$row2 = mysqli_fetch_array($result2);
$max_temperature = $row2['max_temperature'];


$sql3 = "SELECT MIN(temperature) as min_temperature FROM health_data";
$result3 = mysqli_query($con,$sql3);
$row3 = mysqli_fetch_array($result3);
$min_temperature = $row3['min_temperature'];

$data["data"][] = array('temperature'=>$row['temperature'],'max_temperature'=>$max_temperature,'min_temperature'=>$min_temperature);


echo json_encode($data);

?>