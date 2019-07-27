<?php 
class Database{
	private $con;
	public function __construct(){
		$this->con = mysqli_connect("localhost","root","","vetserveph");
	}	
	public function execute($query){
		return mysqli_query($this->con,$query);
	}
}
// $db = new Database();
// $db->execute("INSERT INTO accounts(name,username,password) values ('a','b','c')");
 ?>