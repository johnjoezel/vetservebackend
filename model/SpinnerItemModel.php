<?php 
require("../database/database.php");
class SpinnerItemModel{

    public function __construct(){
		$this->db = new Database();
	}

	public function getSpecies(){
		$array = array();
        $query_string = "SELECT * FROM species";
		$result=$this->db->execute($query_string);
		return $result;
	}
}

 ?>