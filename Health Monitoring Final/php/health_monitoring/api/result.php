<?php
include("connection.php");
?>
<head>
	 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style>

   
    .btn {
      display: inline-block;
      padding: 100px;
      margin: 10px;
      text-decoration: none;
      color: white;
      width: 300px;
      background-color: #7BDAA1;
      border: none;
      border-radius: 5px;
      border-radius: 30px;
      font-size: 50px;
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
							<center><h2>Results<span> </span></h2></center>
						</div>
					</div>
				</div>
				<div class="row fadeInUp"> 
							
			     <center>
  				

  				<a   class="btn" style="padding: 50px;font-size: 20px" href="foodRecommendation.php?disease=<?php echo $_REQUEST['id'] ;?>">Food Recommendations</a> 
  				
  				<a class="btn"  style="padding: 50px;font-size: 20px" href="exerciseRecommendation.php?disease=<?php echo $_REQUEST['id'] ;?>">Remedial Assistance </a>


                 </center>
				
				
				</div>
		</section>
		<!--/ End About -->
		
		
		
		
		
		
		
		
	
	






		