<?php 
require("../database/database.php");
class RequestModel{
	public $id;
	public $req_concern;
	public $req_date;
	public $servicerequest;
	public $cust_id;
	
	public function __construct($req_concern="", $req_date="",$servicerequest="", $cust_id=""){
		$this->req_concern = $req_concern;
		$this->req_date = $req_date;
		$this->servicerequest = $servicerequest;
		$this->cust_id = $cust_id;

	//	$this->id= $id;
		$this->db = new Database();
	}
	
	public function AddRequest(){
   
        $query_string = "INSERT INTO request(req_concern,req_date, servicerequest, cust_id) values('$this->req_concern',
        '$this->req_date','$this->servicerequest', '$this->cust_id')";
		return $this->db->execute($query_string);
	}

	
}

 ?>