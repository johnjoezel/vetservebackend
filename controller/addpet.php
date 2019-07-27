<?php
require("../model/PetModel.php");
if ($_SERVER['REQUEST_METHOD'] =='POST'){

    $petname = $_POST['petname'];
    $petspecies = $_POST['petspecies'];
    $petbreed = $_POST['petbreed'];
    $petgender = $_POST['petgender'];
    $petbdate = "1992-07-18";
    $petage = "4";
    


    $petModel = new PetModel($petname,$petspecies,$petbreed,$petgender,$petbdate,$petage);
    $result = $petModel->addPet();
    if($result){
        $return ['msg'] = 'Add Pet success';
        $return ['error'] = false;
    }
    echo json_encode($return);
}

?>