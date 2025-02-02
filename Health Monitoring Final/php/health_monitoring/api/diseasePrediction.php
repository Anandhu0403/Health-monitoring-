<?php
include("connection.php");
?>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<br>
<center><b><h2 style="color: #009973;">Disease Prediction</h2></b></center>
<br>

<div class="col-md-6 col-sm-6 col-xs-12 wow fadeInUp">
<div class="about-main">
							<form method="POST" action='output.php'>
								<label>Symptom 1</label>
								<select name='sym1' class="form-control">
									<option>--select--</option>
									<?php
									$sel=mysqli_query($con,"SELECT * FROM `symptoms`");
									while($row=mysqli_fetch_array($sel))
									{
									?>
									<option value='<?php echo $row['Symptom_1'];?>'><?php echo $row['Symptom_1'];?></option>
									<?php
									}
									?>
								</select>
								<br>
								<label>Symptom 2</label>
								<select name='sym2' class="form-control">
									<option>--select--</option>
									<?php
									$sel=mysqli_query($con,"SELECT * FROM `symptoms`");
									while($row=mysqli_fetch_array($sel))
									{
									?>
									<option value='<?php echo $row['Symptom_2'];?>'><?php echo $row['Symptom_2'];?></option>
									<?php
									}
									?>
								</select>
							
						</div>
					</div>
					<!--/ End About Main -->
					<!-- About Slide -->
					<div class="col-md-6 col-sm-6 col-xs-12 wow fadeInUp">
						<div class="about-video">
							<label>Symptom 3</label>
							<select name='sym3' class="form-control">
								<option>--select--</option>
								<?php
								$sel=mysqli_query($con,"SELECT * FROM `symptoms`");
								while($row=mysqli_fetch_array($sel))
								{
								?>
								<option value='<?php echo $row['Symptom_3'];?>'><?php echo $row['Symptom_3'];?></option>
								<?php
								}
								?>
							</select>
							<br>
							<label>Symptom 4</label>
							<select name='sym4' class="form-control">
								<option>--select--</option>
								<?php
								$sel=mysqli_query($con,"SELECT * FROM `symptoms`");
								while($row=mysqli_fetch_array($sel))
								{
								?>
								<option value='<?php echo $row['Symptom_4'];?>'><?php echo $row['Symptom_4'];?></option>
								<?php
								}
								?>
							</select>
								
						</div>
					</div>
					<!--/ End About Slide -->
				</div>
				<br><br>
				
				<center><input type="submit" class="btn btn-primary" name="Submit" value="Get Results" style="margin-top: 30px;background-color: #009973;width: 150px;color: white;padding: ;"></center>
								
							</form>	
			</div>