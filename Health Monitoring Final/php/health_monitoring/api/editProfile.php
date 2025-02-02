<?php

include("connection.php");

if(isset($_POST['image']))
{
    $image = $_POST['image'];
    $uid = $_POST['uid'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $number = $_POST['number'];
    $bloodGroup = $_POST['bloodGroup'];
    $height = $_POST['height'];
    $weight = $_POST['weight'];
    $age = $_POST['age'];
     
    $filename = "image"."$uid.jpg";
    $path = "../user_tbl/uploads/$filename";


        $sql = "UPDATE user_tbl SET name='$name', email='$email',number='$number',blood_group='$bloodGroup', height='$height',weight='$weight',age='$age',userimage='$filename' WHERE id='$uid'";
        
        if(mysqli_query($con,$sql)){
             file_put_contents($path,base64_decode($image));
             echo "Successfully Uploaded";
        }

}else{

    $uid = $_POST['uid'];
    $name = $_POST['name'];
    $email = $_POST['email'];
    $number = $_POST['number'];
    $bloodGroup = $_POST['bloodGroup'];
    $height = $_POST['height'];
    $weight = $_POST['weight'];
    $age = $_POST['age'];

   $sql = "UPDATE user_tbl SET name='$name', email='$email',number='$number',blood_group='$bloodGroup', height='$height',weight='$weight',age='$age' WHERE id='$uid'";

   //echo $sql;
           
   if(mysqli_query($con,$sql)){
       echo "Successfully Updated";
   }else{
      echo"Failed to Update Profile";
   }
}



?>