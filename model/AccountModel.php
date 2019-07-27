<?php 
require("../database/database.php");
class AccountModel{
	// public $id;
	public $firstname;
	public $middlename;
	public $lastname;
	public $bdate;
	public $age;
	public $contact;
	public $address;
	public $email;
	public $username;
	public $password;
	public $db;
	
	public function __construct($firstname="",$middlename="",$lastname="",$bdate="",$age="",$contact="",$address="",$email="",$username="",$password=""){
		$this->firstname = $firstname;
		$this->middlename = $middlename;
		$this->lastname = $lastname;
		$this->bdate = $bdate;
		$this->age = $age;
		$this->contact = $contact;
		$this->address = $address;
		$this->email = $email;
		$this->username = $username;
		$this->password = $password;
	//	$this->id= $id;
		$this->db = new Database();
	}
	
	
	public function AddpetOwner(){
		$query_string = "INSERT INTO pet_owner (petOwner_firstname, petOwner_mname, petOwner_lastname, petOwner_dob,petOwner_age, petOwner_contact, petOwner_address, petOwner_email, petOwner_username, petOwner_password) VALUES ('$this->firstname', '$this->middlename', '$this->lastname', '2019-07-01', $this->age,'$this->contact', '$this->address', '$this->email','$this->username','$this->password')";
		return $this->db->execute($query_string);
	}

	public function loginPetOwner($username, $password){
		$query_string = "SELECT  * FROM pet_owner WHERE petOwner_username = '$username' AND	petOwner_password = '$password'";
		$result=$this->db->execute($query_string);
		$row=mysqli_fetch_assoc($result);	
		return $row;
	}
	public function CheckUsername(){
		$query_string="SELECT * FROM ( select username from customer
		union all
		select username from provider
		union all
		select username from admin
	  )a WHERE username='$this->username'";
		$result=$this->db->execute($query_string);
		$row=mysqli_fetch_assoc($result);
		return $row;
	}
	public function CheckAccount(){
		$query_string="SELECT * FROM ( select cust_id, username, password, user_level from customer
		union all
		select pro_id, username, password, user_level from provider
		union all
		select id, username, password, user_level from admin
	  )a WHERE username='$this->username' AND password='$this->password'";
		$result=$this->db->execute($query_string);
		$row=mysqli_fetch_assoc($result);
		return $row;
	}
}

 ?>