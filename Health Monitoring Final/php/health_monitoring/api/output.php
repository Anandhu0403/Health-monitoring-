<?php
include("connection.php");
?>
<head>
	 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>

   
    .btn {
      display: inline-block;
      padding: 10px 20px;
     margin-left: 140px;
	margin-top: 20px;
      text-decoration: none;
      color: white;
          background-color: #009973;
      border: none;
      border-radius: 5px;
      font-size: 16px;
    }

    /* Style for center alignment */
    .center {
      text-align: center;
    }
  </style>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

		

		
		<!-- Start About -->
		<section id="about-us" class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-12 wow fadeInUp">
						<div class="section-title">
							<br>
							<center><h2>Disease<span> Prediction</span></h2></center>
						</div>
					</div>
				</div>
				<div class="row fadeInUp"> 
							<?php
			   if(isset($_POST['Submit']))
			   {
				    
					$s1=$_POST['sym1'];
					$s2=$_POST['sym2'];
					$s3=$_POST['sym3'];
					$s4=$_POST['sym4'];
					
					
					$head="Symptom_1,Symptom_2,Symptom_3,Symptom_4";
					$data="$s1,$s2,$s3,$s4";
					//echo $data;
					
				$myfile="test.csv";
				$fh=fopen($myfile,'w') or die('canot open file');
				$str="$head\n$data";
				fwrite($fh,$str);
				fclose($fh);

				set_time_limit(0);
				include('connection.php');

				echo "<br>";
				$python = `python test.py`;
				//echo "<pre>".$python."</pre>";
				
				//$python1 = "C:\\ProgramData\\Anaconda3\\python.exe";
				//$file = "C:\\xampp\\htdocs\\deliver\\health-lab\\test.py";
				//$python=exec($python1 . " " . $file);
				
				echo "<div class='col-lg-12 col-md-12 well' style='background-color:#ccffe9;padding:10px'>
				      <center><h1>OUTPUT</h1><hr>
					  <pre><h5>"."It seems like you are suffered from <br> Chances of ".$python."disease.</h5></pre></center>";
					  
									
				
				   $c=trim($python);
				   $sel=mysqli_query($con,"SELECT * FROM `disease` WHERE `disease`='$c'");
				   $row=mysqli_fetch_array($sel);
				   
				   echo "<h4>Description</h4>";
				   echo $row['description'];
				   echo "<br><br>";
				   echo "<h4>Precaution</h4>";
				   echo $row['precaution'];
				   echo "</div>";
				  
					echo "<br>";
					
				?>
			

			     <div class="center">

				 <center>
  				
  				<a class="btn" style="padding: 10px;margin_left: 100px" href="result.php?id=<?php echo $python ;?>">Get Results</a><br>
				 </center>

  			
				</div>
				
				
		

				<?php
			}	   
			   
			?>
				</div>
		</section>
		<!--/ End About -->
		
		
		
		
		
		
		
		
	
	





