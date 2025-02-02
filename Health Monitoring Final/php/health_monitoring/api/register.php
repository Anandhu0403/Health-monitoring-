<?php

include("connection.php");

$name = $_POST['name'];
$number = $_POST['number'];
$email = $_POST['email'];
$address = $_POST['address'];
$age = $_POST['age'];
$gender = $_POST['gender'];
$bloodGroup = $_POST['bloodGroup'];
$height = $_POST['height'];
$weight = $_POST['weight'];
$username = $_POST['username'];
$password = $_POST['password'];
$imageFile = $_POST['image'];

$sql ="INSERT INTO user_tbl (name,number,email,address,age,gender,blood_group,height,weight,username,password) VALUES ('$name','$number','$email','$address','$age','$gender','$bloodGroup','$height','$weight','$username','$password')";

if(mysqli_query($con,$sql)){
	
	$id = mysqli_insert_id($con);
	$fileName = "image".$id.".jpg";
	file_put_contents("../user_tbl/uploads/".$fileName, base64_decode($imageFile));

	$sql = "UPDATE user_tbl SET userimage = '$fileName' WHERE id = '$id'";
	mysqli_query($con,$sql);
	echo "success";
}
else{
	
	echo"failed";
}


?>