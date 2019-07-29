<?php
require("../model/PetModel.php");
$data = array();
if ($_SERVER['REQUEST_METHOD'] =='POST'){
    $petowner = $_POST['petowner_username'];
    $con = mysqli_connect("localhost","root","","vetserveph");
    $query_string = "SELECT petOwner_id FROM pet_owner WHERE petOwner_username = '$petowner'";
    $result1=mysqli_query($con,$query_string);
    $row = mysqli_fetch_assoc($result1);
    $petowner_id =2;
    $petModel = new PetModel();
    $result = $petModel->getListofPets($petowner_id);
    while($row = mysqli_fetch_assoc($result)){
        $data[]['pet'] = $row;
    }
    if(count($data) > 0){

        echo json_encode($data);
    }
}
?>