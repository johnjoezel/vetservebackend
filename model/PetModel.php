<?php 
require("../database/database.php");
class PetModel{
	// public $id;
	public $petname;
	public $petspecies;
	public $petbreed;
	public $petgender;
	public $petbdate;
	public $petage;
	public $db;
	
	public function __construct($petname="",$petspecies="",$petbreed="",$petgender="",$petbdate="",$petage=""){
		$this->petname = $petname;
		$this->petspecies = $petspecies;
		$this->petbreed = $petbreed;
		$this->petgender = $petgender;
		$this->petbdate = $petbdate;
		$this->petage = $petage;
	//	$this->id= $id;
		$this->db = new Database();
	}
	
	
	public function addPet(){
		$query_string = "INSERT INTO pet (pet_name, breed_name, pet_age, pet_gender,pet_DOB, petOwner_id, petSpecies_id) VALUES ('$this->petname','$this->petbreed', '$this->petage', '$this->petgender', '$this->petbdate', 1, 1)";
		return $this->db->execute($query_string);
    }
}