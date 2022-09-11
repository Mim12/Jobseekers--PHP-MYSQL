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
    <title> User Search </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/stylesheet.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    
</head>
<body>

<?php
    include 'user_navbar.php';
?>
<?php

    if(isset($_GET['categoryid']) && isset($_GET['categorysearch']) ) {
        $categoryid=$_GET['categoryid'];

        $categorysearchsql="SELECT * From jobpost where categoryid='$categoryid' ";
        $categorysearchsqlresult=mysqli_query($connection,$categorysearchsql);

        $categorynamesql="SELECT name from category where id='$categoryid' ";
        $categorynamesqlresult=mysqli_query($connection,$categorynamesql);
        $name_row=mysqli_fetch_assoc($categorynamesqlresult);

        echo "<div class=search>";
        echo "<h4>Search result: ". $name_row['name'] . "</h4> ";
        echo "<hr>";
        echo "<div class=result>";
        while($job_row=mysqli_fetch_assoc($categorysearchsqlresult)){

            $expire = $job_row['deadline']; //time

            $tday = new DateTime("now", new DateTimeZone('ASIA/DHAKA'));
            $today =$tday->format('Y-m-d H:i:s');
            $today_time = strtotime($today);
            $expire_time = strtotime($expire);
            
            $deadline=date('d-m-Y H:i:s', strtotime($expire));
            if($expire_time>$today_time && $job_row['status']=='approved'){
                  
              $jobid=$job_row['id'];
              echo "<h5>".$job_row['title']."</h5>";
              echo "<p>Company: ".$job_row['companyname']."</p>";
              echo "<p>Job Type: ".$job_row['type']."</p>";
              echo "<p>Requirement: ".$job_row['requirement']."</p>";
              echo "<p>Education: ".$job_row['education']."</p>";
              echo "<p>Experience: ".$job_row['experience']."</p>";
              echo "<p>Experience: ".$job_row['location']."</p>";
              echo "<p>Salary: ".$job_row['salary']."k</p>";
              echo "<p>Deadline: ".$deadline."</p>";
              echo "<a class ='btn btn-info' href='user_cvupload.php?jobid=".$job_row['id']."&apply=apply '>Apply</a> <br><br>";
              
            }
        }
        echo "</div>";
        echo "</div>";
        
    }

    if(isset($_GET['parttime'])){
        $jobtype= $_GET['parttime'];
        
        $jobtypesql="SELECT * From jobpost where type='$jobtype' ";
        $jobtypesqlresult=mysqli_query($connection,$jobtypesql);

        echo "<div class=search>";
        echo "<h4>Search result: ". $jobtype . "</h4> ";
        echo "<hr>";
        echo "<div class=result>";
        while($type_row=mysqli_fetch_assoc($jobtypesqlresult)){
            $expire = $type_row['deadline']; //time
            $tday = new DateTime("now", new DateTimeZone('ASIA/DHAKA'));
            $today =$tday->format('Y-m-d H:i:s');
            $today_time = strtotime($today);
            $expire_time = strtotime($expire);
            $deadline=date('d-m-Y H:i:s', strtotime($expire));
            if($expire_time>$today_time && $type_row['status']=='approved'){
            
            echo "<h5>".$type_row['title']."</h5>";
            echo "<p>Company: ".$type_row['companyname']."</p>";
            echo "<p>Job Type: ".$type_row['type']."</p>";
            echo "<p>Requirement: ".$type_row['requirement']."</p>";
            echo "<p>Education: ".$type_row['education']."</p>";
            echo "<p>Experience: ".$type_row['experience']."</p>";
            echo "<p>Experience: ".$type_row['location']."</p>";
            echo "<p>Salary: ".$type_row['salary']."k</p>";
            echo "<p>Deadline: ".$deadline."</p>";
            echo "<a class ='btn btn-info' href='user_cvupload.php?jobid=".$type_row['id']."&apply=apply '>Apply</a> <br><br>";
            
            }
        }
        echo "</div>";
        echo "</div>";
    }

    if(isset($_GET['workformhome'])){
        $jobtype= $_GET['workformhome'];
        
        $jobtypesql="SELECT * From jobpost where type='$jobtype' ";
        $jobtypesqlresult=mysqli_query($connection,$jobtypesql);

        echo "<div class=search>";
        echo "<h4>Search result: ". $jobtype . "</h4> ";
        echo "<hr>";
        echo "<div class=result>";
        while($type_row=mysqli_fetch_assoc($jobtypesqlresult)){
            $expire = $type_row['deadline']; //time
            $tday = new DateTime("now", new DateTimeZone('ASIA/DHAKA'));
            $today =$tday->format('Y-m-d H:i:s');
            $today_time = strtotime($today);
            $expire_time = strtotime($expire);
            $deadline=date('d-m-Y H:i:s', strtotime($expire));
            if($expire_time>$today_time && $type_row['status']=='approved'){
            
            echo "<h5>".$type_row['title']."</h5>";
            echo "<p>Company: ".$type_row['companyname']."</p>";
            echo "<p>Job Type: ".$type_row['type']."</p>";
            echo "<p>Requirement: ".$type_row['requirement']."</p>";
            echo "<p>Education: ".$type_row['education']."</p>";
            echo "<p>Experience: ".$type_row['experience']."</p>";
            echo "<p>Experience: ".$type_row['location']."</p>";
            echo "<p>Salary: ".$type_row['salary']."k</p>";
            echo "<p>Deadline: ".$deadline."</p>";
            echo "<a class ='btn btn-info' href='user_cvupload.php?jobid=".$type_row['id']."&apply=apply '>Apply</a> <br><br>";
            
            }
        }
        echo "</div>";
        echo "</div>";
    }

    if(isset($_POST['search']) && isset($_POST['keyword']) && strlen($_POST['keyword'])>0 && strlen($_POST['location'])==0){
        $keyword=$_POST['keyword'];
        $keywordsql="SELECT * FROM jobpost WHERE title LIKE '%".$keyword."%'  ";
        $keywordsqlresult=mysqli_query($connection,$keywordsql);
        
  
        echo "<div class=search>";
          echo "<h4>Search result: ". $keyword . "</h4> ";
          echo "<hr>";
          echo "<div class=result>";
          while($keyword_row=mysqli_fetch_assoc($keywordsqlresult)){
              $expire = $keyword_row['deadline']; //time
              $tday = new DateTime("now", new DateTimeZone('ASIA/DHAKA'));
              $today =$tday->format('Y-m-d H:i:s');
              $today_time = strtotime($today);
              $expire_time = strtotime($expire);
              $deadline=date('d-m-Y H:i:s', strtotime($expire));
              
              if($expire_time>$today_time && $keyword_row['status']=='approved'){
              
                echo "<h5>".$keyword_row['title']."</h5>";
                echo "<p>Company: ".$keyword_row['companyname']."</p>";
                echo "<p>Job Type: ".$keyword_row['type']."</p>";
                echo "<p>Requirement: ".$keyword_row['requirement']."</p>";
                echo "<p>Education: ".$keyword_row['education']."</p>";
                echo "<p>Experience: ".$keyword_row['experience']."</p>";
                echo "<p>Experience: ".$keyword_row['location']."</p>";
                echo "<p>Salary: ".$keyword_row['salary']."k</p>";
                echo "<p>Deadline: ".$deadline."</p>";
                echo "<a class ='btn btn-info' href='user_cvupload.php?jobid=".$keyword_row['id']."&apply=apply '>Apply</a> <br><br>";
              
              }
          }
          echo "</div>";
          echo "</div>";    
        }
  
        if(isset($_POST['search']) && isset($_POST['location']) && strlen($_POST['location'])>0 && strlen($_POST['keyword'])==0){
          $location=$_POST['location'];
          //echo $location;
          $locationsql="SELECT * FROM jobpost WHERE location='$location' ";
          $locationsqlresult=mysqli_query($connection,$locationsql);
          
    
          echo "<div class=search>";
            echo "<h4>Search result: ". $location . "</h4> ";
            echo "<hr>";
            echo "<div class=result>";
            while($location_row=mysqli_fetch_assoc($locationsqlresult)){
                $expire = $location_row['deadline']; //time
                $tday = new DateTime("now", new DateTimeZone('ASIA/DHAKA'));
                $today =$tday->format('Y-m-d H:i:s');
                $today_time = strtotime($today);
                $expire_time = strtotime($expire);
                $deadline=date('d-m-Y H:i:s', strtotime($expire));
                if($expire_time>$today_time && $location_row['status']=='approved'){
                
                  echo "<h5>".$location_row['title']."</h5>";
                  echo "<p>Company: ".$location_row['companyname']."</p>";
                  echo "<p>Job Type: ".$location_row['type']."</p>";
                  echo "<p>Requirement: ".$location_row['requirement']."</p>";
                  echo "<p>Education: ".$location_row['education']."</p>";
                  echo "<p>Experience: ".$location_row['experience']."</p>";
                  echo "<p>Experience: ".$location_row['location']."</p>";
                  echo "<p>Salary: ".$location_row['salary']."k</p>";
                  echo "<p>Deadline: ".$deadline."</p>";
                  echo "<a class ='btn btn-info' href='user_cvupload.php?jobid=".$location_row['id']."&apply=apply '>Apply</a> <br><br>";
                
                }
            }
            echo "</div>";
            echo "</div>";
          
          }
  
          if(isset($_POST['search']) && isset($_POST['keyword']) && isset($_POST['location']) && strlen($_POST['location'])>0 && strlen($_POST['keyword'])>0){
            $keyword=$_POST['keyword'];
            $location=$_POST['location'];
           
            $searchsql="SELECT * FROM jobpost WHERE title LIKE '%".$keyword."%' AND location='$location' ";
            $searchsqlresult=mysqli_query($connection,$searchsql);
            
  
            echo "<div class=search>";
              echo "<h4>Search result: keyword: ".$keyword." Location: ". $location . "</h4> ";
              echo "<hr>";
              echo "<div class=result>";
              while($search_row=mysqli_fetch_assoc($searchsqlresult)){
                  $expire = $search_row['deadline']; //time
                  $tday = new DateTime("now", new DateTimeZone('ASIA/DHAKA'));
                  $today =$tday->format('Y-m-d H:i:s');
                  $today_time = strtotime($today);
                  $expire_time = strtotime($expire);
                  $deadline=date('d-m-Y H:i:s', strtotime($expire));
                  if($expire_time>$today_time && $search_row['status']=='approved'){
                  
                    echo "<h5>".$search_row['title']."</h5>";
                    echo "<p>Company: ".$search_row['companyname']."</p>";
                    echo "<p>Job Type: ".$search_row['type']."</p>";
                    echo "<p>Requirement: ".$search_row['requirement']."</p>";
                    echo "<p>Education: ".$search_row['education']."</p>";
                    echo "<p>Experience: ".$search_row['experience']."</p>";
                    echo "<p>Experience: ".$search_row['location']."</p>";
                    echo "<p>Salary: ".$search_row['salary']."k</p>";
                    echo "<p>Deadline: ".$deadline."</p>";
                    echo "<a class ='btn btn-info' href='user_cvupload.php?jobid=".$search_row['id']."&apply=apply '>Apply</a> <br><br>";
                  
                  }
              }
              echo "</div>";
              echo "</div>";    
  
         }

         if(isset($_GET['deadline']) && $_GET['deadline']=='next24hours' ){
        
        
          $tomorrow = date("Y-m-d", strtotime('tomorrow'));
  
          $jobtypesql="SELECT * From jobpost where deadline > (NOW()) AND deadline<= (NOW() + INTERVAL 1 DAY)";
          $jobtypesqlresult=mysqli_query($connection,$jobtypesql);
  
          echo "<div class=search>";
          echo "<h4>Search result: Deadline next 24 Hours</h4> ";
          echo "<hr>";
          echo "<div class=result>";
          while($type_row=mysqli_fetch_assoc($jobtypesqlresult)){
             
              $expire = $type_row['deadline']; //time
              $tday = new DateTime("now", new DateTimeZone('ASIA/DHAKA'));
              $today =$tday->format('Y-m-d H:i:s');
              $today_time = strtotime($today);
              $expire_time = strtotime($expire);
              $deadline=date('d-m-Y H:i:s', strtotime($expire));
              
              if($expire_time>$today_time && $type_row['status']=='approved'){
              
                echo "<h5>".$type_row['title']."</h5>";
                echo "<p>Company: ".$type_row['companyname']."</p>";
                echo "<p>Job Type: ".$type_row['type']."</p>";
                echo "<p>Requirement: ".$type_row['requirement']."</p>";
                echo "<p>Education: ".$type_row['education']."</p>";
                echo "<p>Experience: ".$type_row['experience']."</p>";
                echo "<p>Salary: ".$type_row['salary']."k</p>";
                echo "<p>Location: ".$type_row['location']."</p>";
                echo "<p>Deadline: ".$deadline."</p>";
                echo "<a class ='btn btn-info' href='user_cvupload.php?jobid=".$type_row['id']."&apply=apply '>Apply</a> <br><br>";
                  
              }else{
                echo $connection->error;
              }
          }
          echo "</div>";
          echo "</div>";
        }
  
        
        if(isset($_POST['search']) && isset($_POST['keyword']) && isset($_POST['location']) && strlen($_POST['location'])==0 && strlen($_POST['keyword'])==0){
          echo "<div class=search>";
          echo "<h4>Search result: Please enter any keyword or Location</h4> ";
          echo "<hr>";
          echo "<div class=result>";
          echo "<h5>Nothing to show</h5>";
          echo "</div>";
          echo "</div>"; 
        }
    
   
?>