<?php
require "../model/AccountModel.php";
$return = array();
$username = "";
$password = "";
if($_SERVER['REQUEST_METHOD'] == "POST"){
    if(isset($_POST['username']) &&
        isset($_POST['password'])){
            $username = $_POST['username'];
            $password = $_POST['password'];
            $model = new AccountModel();
            $result = $model->loginPetOwner($username, $password);
                if(count($result) > 0){
                $_session['username'] = $result['petOwner_id'];
                $return ['msg'] = 'Login success';
                $return ['error'] = false;
            }
            else{
                $return ['msg'] = 'Login failed';
                $return ['error'] = true;
            }   
    }
    else{
            $return ['msg'] = 'Something went wrong';
            $return ['error'] = true;
    }
}
else{
    $return ['msg'] = 'Invalid Request';
    $return ['error'] = true;
}
    echo json_encode($return);
?>