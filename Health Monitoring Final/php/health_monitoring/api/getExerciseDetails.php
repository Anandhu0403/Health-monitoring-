<?php

 include("connection.php");

 $exerciseId = $_REQUEST['eid'];

$sql = "SELECT * FROM exercise_tbl WHERE id ='$exerciseId'";
$result = mysqli_query($con,$sql);

if(mysqli_num_rows($result) > 0){

	while($row = mysqli_fetch_assoc($result))
		$data["data"][] = $row;
	echo json_encode($data);
}
else{
	echo "failed";
}

?>