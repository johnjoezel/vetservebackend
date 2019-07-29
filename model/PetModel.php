<?php 
require("../database/database.php");
class PetModel{
	public $petowner_id;
	public $petname;
	public $petspecies;
	public $petbreed;
	public $petgender;
	public $petbdate;
	public $petcolor;
	public $db;
	
	public function __construct($petname="",$petspecies="",$petbreed="",$petgender="",$petbdate="",$petcolor="", $petowner_id = ""){
		$this->petowner_id = $petowner_id;
		$this->petname = $petname;
		$this->petspecies = $petspecies;
		$this->petbreed = $petbreed;
		$this->petgender = $petgender;
		$this->petbdate = $petbdate;
		$this->petcolor = $petcolor;
	//	$this->id= $id;
		$this->db = new Database();
	}
	
	public function addPet(){
		$query_string = "INSERT INTO pet (pet_name, breed_name, pet_gender, pet_DOB, pet_color, petOwner_id, petSpecies_id) VALUES ('$this->petname','$this->petbreed', '$this->petgender', '$this->petbdate', '$this->petcolor', $this->petowner_id, 1)";
		return $this->db->execute($query_string);
	}

	public function getListofPets($petowner_id){
		$query_string = "SELECT  * FROM pet WHERE petOwner_id = '$petowner_id'";
		$result=$this->db->execute($query_string);
		return $result;
	}

}