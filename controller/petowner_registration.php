<?php
require("../model/AccountModel.php");
if ($_SERVER['REQUEST_METHOD'] =='POST'){

    $firstname = $_POST['firstname'];
    $middlename = $_POST['middlename'];
    $lastname = $_POST['lastname'];
    $address = "";
    $bdate = "1992-07-18";
    $age = 123;
    $contact = $_POST['contact'];
    $email = $_POST['email'];
    $username = $_POST['username'];
    $password = $_POST['password']; 


    $accModel = new AccountModel($firstname,$middlename,$lastname,$bdate,$age,$contact,$address,$email,$username,$password);
    $result = $accModel->AddpetOwner();


    if($result){
        $image= $_POST['image'];
        $upload_path="../uploads/$username.jpg";
        file_put_contents($upload_path, base64_decode($image));
        $return ['msg'] = 'Registration success';
        $return ['error'] = false;
    }
    echo json_encode($return);

    
}

?>