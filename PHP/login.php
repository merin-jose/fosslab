



<?php

include("config.php");
session_start();

if($_SERVER["REQUEST_METHOD"] == "POST") {
    
 // getting username and password from html_form
    
    $myusername = mysqli_real_escape_string($db, $_POST['username']);
    $mypassword = mysqli_real_escape_string($db, $_POST['password']);
    $sql = "SELECT id FROM admin WHERE username = '$myusername' and  passcode = '$mypassword'";
    $result = mysqli_query($db, $sql);
    $row = mysqli_fetch_array($result, MYSQL_ASSOC);
    $active = $row['active'];
    $count = mysql_num_rows($result);
    
// if result matched output must be 1 row
    if($count == 1) {
        session_register("myusername");
        $_SESSION['login_user'] = $myusername;
        header("location: welcome.php");
    }
    else {
        $error = "Your Login Name or Password is invalid";
    }
}
?>

<html>
    <head>
        <title>Login Page</title>

     </head>
   
   <body>              
               <form action = "" method = "post">
                  <label>UserName  :</label><input type = "text" name = "username" class = "box"/><br /><br />
                  <label>Password  :</label><input type = "password" name = "password" class = "box" /><br/><br />
                  <input type = "submit" value = " Submit "/><br />
               </form>
               
             
</body>
</html>
