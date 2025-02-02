<?php
include("tables.php");
include("../header_inner.php");
session_start();
error_reporting(0);

$del_id=0;
$i=0;
?>


		<link rel="stylesheet" type="text/css" href="datatables.min.css">
 
		<script type="text/javascript" src="datatables.min.js"></script>
		<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#example').DataTable();
			} );
		</script>

<style>
.hiddentd
{
display:inline-block;
    width:180px;
    white-space: nowrap;
    overflow:hidden !important;
   
}
</style>


<div class="">
<?php

	echo "<div class='col-sm-2' style='float:right;margin-bottom:10px;'><form action='form.php' method='post'><input type='submit' name='view' value='Add New' class='form-control btn-danger'></form></div>";
	
?>
<div class="clearfix"></div>
<table id="example" class="table table-striped table-bordered dataTable no-footer" cellspacing="0"  role="grid" aria-describedby="example_info" >

       
        
            
          <?php
	
		  include("../connection.php");
	
	
	$roww=$_SESSION['id'];
	
	
	
	
	
if(isset($_REQUEST['del_id']))
{
$del_id=$_REQUEST['del_id'];
mysqli_query($con,"delete from $table where id='$del_id'");
//if($del_id!="")
}
	?>
    <script>


function rem()
{
if(confirm('Are you sure you want to delete this record?')){
return true;
}
else
{
return false;
}
}


function rem2()
{
if(confirm('Are you sure you want to deactive this record?')){
return true;
}
else
{
return false;
}
}
</script>
    
	
	<?php


	
	
	

	
	
		  $result2 = mysqli_query($con,"SHOW FIELDS FROM $table ");

 echo "<thead><tr>";

while ($row2 = mysqli_fetch_array($result2))
 {

  $name=$row2['Field'];

  echo "<th>".
  str_replace('_', ' ', $name)
  ."</th>";
 $i++;
 }
 echo "
<th>Accept</th>
 </tr></thead>";
   
  // $i=0;
   echo "<tbody>";
   
            
            
         
 	//$result = mysqli_query($con,"SELECT * FROM $table where hospital_name='$_SESSION[id]' or acc_hospital='$_SESSION[id]'");

 	$result = mysqli_query($con,"SELECT * FROM $table");
	

		while($row = mysqli_fetch_array($result))
		{
		$id=$row['0'];
		echo "<tr>";
		for($k=0;$k<$i;$k++)
		{
	
			
			if($k==30)
			{
			  $sql2 = "select *  from customer where id='$_SESSION[userid]' ";
    $result2 = mysqli_query($con, $sql2) or die("Error in Selecting " . mysqli_error($connection));
$row2 =mysqli_fetch_array($result2);
		
		

			echo "<td >  $row2[contact_person]</td>";
				
			}
			
				
			elseif($k==3)
			{
				$sql2 = "select *  from hospital_tbl where id='$row[$k]'";
				//echo $sql2;
    $result2 = mysqli_query($con, $sql2);
$rows =mysqli_fetch_array($result2);
		
		//echo $roww;
				

			echo "<td class='' > $rows[name] </td>";
				
			}
			
			
				elseif($k==5)
		{
				$sql2 = "select *  from hospital_tbl where id='$row[$k]'";
				//echo $sql2;
    $result2 = mysqli_query($con, $sql2);
$rows =mysqli_fetch_array($result2);
		
		//echo $roww;
				

			echo "<td class='hiddentd' > $rows[name] </td>";
				
			}
			
			else
			{
			echo "<td >$row[$k]</td>";
			}
		
		
		}


		     if ($row[status] == 'Requested' && $row[acc_hospital] ==''){

		     	echo "
			
			<td><a href='accept.php?id=$id' style='color:red;font-weight: bold;'>Accept</a></td>
		
			</tr>";

		    		}
		    		else
		    		{
		    				echo "
			
				<td>$row[status] </td>
		
			</tr>";
		    		}
		
		
		}
		 
		
		
        
        ?>
        </tbody>
    </table>
			
		



<script type="text/javascript">
	// For demo to fit into DataTables site builder...
	$('#example')
		.removeClass( 'display' )
		.addClass('table table-striped table-bordered');
</script>

<div class="clearfix"></div>
	
    </div> 
    <?php
	
//	include("../footer_inner.php");
	?>