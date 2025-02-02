<?php

include("connection.php");

$sql = "SELECT * FROM health_data ORDER BY id DESC limit 0,1";
$result = mysqli_query($con,$sql);
$row = mysqli_fetch_array($result);

$sql2 = "SELECT MAX(heartrate) as max_heartrate FROM health_data";
$result2 = mysqli_query($con,$sql2);
$row2 = mysqli_fetch_array($result2);
$max_heartrate = $row2['max_heartrate'];


$sql3 = "SELECT MIN(heartrate) as min_heartrate FROM health_data";
$result3 = mysqli_query($con,$sql3);
$row3 = mysqli_fetch_array($result3);
$min_heartrate = $row3['min_heartrate'];

//echo $row['heartrate']."maxx".$max_heartrate."min".$min_heartrate;

/*$data["data"]['heartrate'] = $row['heartrate'];
$data["data"]['max_heartrate'] = $max_heartrate;
$data["data"]['min_heartrate'] = $min_heartrate;*/

$data["data"][] = array('heartrate'=>$row['heartrate'],'max_heartrate'=>$max_heartrate,'min_heartrate'=>$min_heartrate);


echo json_encode($data);

?>