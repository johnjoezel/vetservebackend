<?php
require("../model/SpinnerItemModel.php");
$data = array();
if($_SERVER['REQUEST_METHOD'] == "POST"){
    $model = new SpinnerItemModel();
    $result = $model->getSpecies();
    while($row = mysqli_fetch_assoc($result)){
        $data [] = $row;
    }
}
 echo json_encode($data);
?>  