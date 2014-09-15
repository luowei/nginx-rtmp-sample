<?php
// www.server.com/auth.php?user=luowei&pass=luoweipassword

//check if querystrings exist or not
if (empty($_GET['user']) || empty($_GET['pass'])) {
    //no querystrings or wrong syntax
    //echo "wrong query input";
    header('HTTP/1.0 404 Not Found');
    exit(1);
} else {
    //querystring exist
    $username = $_GET['user'];
    $password = $_GET['pass'];
}

$saveduser = 'luowei';
$savedpassword = 'luoweipassword';

//check pass and user string
if (strcmp($password, $savedpassword) == 0 && strcmp($username, $saveduser) == 0) {
    echo "Password and Username OK! ";

} else {
    //echo "password or username wrong! ";
    header('HTTP/1.0 404 Not Found'); //kein stream
}

?>