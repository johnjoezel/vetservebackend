<?php
require("../model/PetModel.php");
if ($_SERVER['REQUEST_METHOD'] =='POST'){
    $petowner = $_POST['petowner_username'];
    $petname = $_POST['petname'];
    $petspecies = $_POST['petspecies'];
    $petbreed = $_POST['petbreed'];
    $petgender = $_POST['petgender'];
    $petbdate = "1992-07-18";
    $petcolor = $_POST['petcolor'];;
    $con = mysqli_connect("localhost","root","","vetserveph");
    $query_string = "SELECT petOwner_id FROM pet_owner WHERE petOwner_username = '$petowner'";
    $result1=mysqli_query($con,$query_string);
    $row = mysqli_fetch_assoc($result1);
    $petowner_id =2;
    $petModel = new PetModel($petname,$petspecies,$petbreed,$petgender,$petbdate,$petcolor, $petowner_id);
    $result = $petModel->addPet();
    if($result){
        $return ['msg'] = 'Add Pet success';
        $return ['error'] = false;
    }
    echo json_encode($return);
}
?>