<?php
session_start();
require '../database.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Add Category </title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="../css/stylesheet.css">
   <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/w3.css">
</head>
<body>

<?php 

// NavBar
include 'admin_navbar.php';
?>

<br><br>
<div class= "container">
   <div class= "row">
     <div class= "col-md-6 col-md-offset-3">
     <h2> Add Categories</h2>
     <hr>
      <form action="add_categories.php" method="POST">
        <div class="form-group">
           <!-- <label for="car_model"> Car Model : </label>-->
            <input required type="text" class="form-control" name= "category_name" placeholder= "Category Name">
         </div>
         <button  style="background-color: #138496 " type="submit" name="submit" class="btn btn-default"> Submit </button><br>
      </form>
      </div>
   </div>   
</div>



<?php
// category store into database

   if(isset($_POST['submit'])){
      $name=$_POST['category_name'];
      $adminid=$_SESSION['admin_id'];
      $sql= "INSERT INTO category (name,adminid) VALUES ('$name','$adminid')";
      if(mysqli_query($connection,$sql)){
         header("Location: view_categories.php?category_add_success= Category Successfully added." );
          exit;
      }else{
         header("Location: add_categories.php?category_add_failed= Failed to add the category" );
          exit;
      }
   }
   
   if(isset($_GET['category_add_failed'])){
      echo $_GET['category_add_failed'];
   }
?>





<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>



</body>
</html>