<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Memento admin_model model
 *
 * This class handles admin_model management related functionality
 *
 * @package		Admin
 * @subpackage	admin_model
 * @author		propertyjar
 * @link		#
 */

class holiday_model extends CI_Model 
{
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	
	function save($save)
	{
		$save['type'] = ($save['type'] == '0') ? NULL : $save['type'];
		$this->db->insert('holidays',$save);
	}

	function save_event_type($save)
	{
		$this->db->insert('event_type',$save);
	}
	
	//GET ALL THE EVENTS
	//modified to get the correspondig type of event, instead of the id in the type column.
	function get_all()
	{
		// Query:
		 // SELECT 
		 // h.`name` as `name`, h.`description`, h.`start_date`, h.`end_date` , 
		 // e.`periodic` as `type_periodic`, e.`repeat` as `event_repeat` , h.`type` , h.`status`, h.`company` 
		 // from `holidays` h, `event_type` e 
		 // WHERE
		 // e.`id` = h.`type`;

		$this->db->select(
			'h.name as name, 
			 h.description, 
			 h.start_date, 
			 h.end_date , 
			 e.periodic as type_periodic, 
			 e.repeat as event_repeat , 
			 h.type , 
			 h.status, 
			 h.company');
		$this->db->join('event_type e','e.id = h.type');

			//return an array so that the cloning can be made by pushing an element into the array
			return $this->db->get('holidays h')->result_array();
	}
	
	function get_holidays_by_month($m)
	{
					$this->db->where('MONTH(start_date)',date($m));
					$this->db->select('start_date as Date,DAY(start_date) as DayOfMonth,name,id');
			return $this->db->get('holidays')->result_array();
	}
	function get_default_holidays()
	{
					$this->db->where('working_day',0);
			return $this->db->get('days')->result();
	}
	
	function get_months()
	{
			return $this->db->get('months')->result();
	}
	
	function get($id)
	{
			   $this->db->where('id',$id);
		return $this->db->get('holidays')->row();
	}
	
	function update($save,$id)
	{
			   $this->db->where('id',$id);
		       $this->db->update('holidays',$save);
	}
	
	
	function delete($id)//delte 
	{
			   $this->db->where('id',$id);
		       $this->db->delete('holidays');
	}

	function get_event_types(){
		return $this->db->get('event_type')->result();
	}

	function get_company_info($id){
		$this->db->select('id, name');
		$this->db->where('id',$id);
		return $this->db->get('empresas')->row();
	}

	function get_visible_companies(){
		$result = array();//empty result array

		$this->db->where('id',$this->session->userdata('admin')['id']);
		$this->db->select('empresa_id');
		$json = $this->db->get('users')->row(); //here we have the json objecto

		if (isset($json)) {
		$companies_id = json_decode($json->empresa_id);//we decode it
		foreach ($companies_id as $company_id): //we iterate over it
			//we get the company information
			$company = $this->get_company_info($company_id);
			array_push($result, $company); //we add the company to the result array
		endforeach;
		
		return $result; //we return the array
		// $company = $this->get_company_info("0");
		// 	return $company;
		}

		return NULL;
	}

	function get_companies(){
		// SELECT `e`.`id` as `id`, `e`.`name` as `name` 
		// from `empresas` as `e` 
		// JOIN `empresa_usuario` as `eu` ON `e`.`id` = `eu`.`id_empresa` 
		// JOIN `users` as `u` ON `u`.`id` = `eu`.`id_usuario` 
		// WHERE `u`.`id` = <id usuario>;

		$this->db->where('u.id',  $this->session->userdata('admin')['id'] );
		$this->db->select('e.id as id, e.name as name' );
		$this->db->join('empresa_usuario as eu', 'e.id = eu.id_empresa');
		$this->db->join('users as u', 'u.id = eu.id_usuario');
		return $this->db->get('empresas as e ')->result();
	}

	//GETS ALL THE BRANCHES OF ALL THE COMPANIES
	function get_branch_offices($companies){
		$result = array();//empty result array
		if (isset($companies)) {
			foreach ($companies as $company) {
				$result[$company->id] = $this->get_branches($company->id);
			}
		}
		return $result;
	}

	//GETS ALL THE BRANCHES OF ONE COMPANY
	function get_branches($company) {
				//tengo el id de las compania
				//tengo que seleccionar las tuplas cuyo id de padre sea $company
					if(isset($company))
					{
					$this->db->select('id, name');
					$this->db->where('parent_id',$company);
					return $this->db->get('empresas')->result();}
	}

	//GETS ALL THE EVENTS OF THE 'v_calendar' VIEW
	function get_v_calendario(){
		return $this->db->get('v_calendario')->result();
	}





	//receives: the array that wants to be replicated 
	//returns: the replicated events (all but the received event)
		// -- Additional info
		// -- Events with repeat frequency of NULL will be replicated within the next 30 years (replicated 30 times)
		// -- PERMITTED VALUES FOR COLUMN 'periodic' in table 'event_type'ARE:
		// -- N : NON PERIODIC (DEFAULT)
		// -- W: WEEKLY
		// -- M: MONTHLY
		// -- A: ANUAL
		// $event attributes: name
		// 				      description
		// 				      start_date
		// 				      end_date
		// 				      type_periodic
		// 				      type
		// 				      status
		// 				      company
		//					  event_repeat

	function replicate($event){
			$nullRepeat = 1;//number of replications when the repeat frequency is NULL
			$replications = array();//all the replications of the event
			//every event MUST have its start_date
			//but does it have an end_date?
			$end_date_flag = false;//assume it does not
			if (!isset($event['end_date'])) {
				//Yes! it does
				$end_date_flag = true; //change the flag value
				//then the end_date must also be considered when replicating
			}

			//we avoid null values here
			$repeat;
			if (!isset($event['event_repeat'])) {
				$event['event_repeat']=$nullRepeat;
				$repeat = $nullRepeat;
			}else{
				$repeat = intval($event['event_repeat']);
			}

			//save the event type
			$type = $event['type_periodic'];

			// verify the event type
			switch ($type) {
				case 'N'://do not replicate
					//therefore do nothing...
					break;
				case 'W'://replicate each week
					for ($i=0; $i < $repeat; $i++) { 
						//change the start_date
	// ver: https://stackoverflow.com/questions/38738910/php-subtract-1-month-from-date-formated-with-date-m-y
						// if($end_date_flag)
						// {
						// 	//change the end_date

						// }
						//push to the $replications array
						array_push($replications, $event);
					}
					break;
				case 'M'://replicate each month
					for ($i=0; $i < $repeat; $i++) { 
						//change the start_date

						//push to the $replications array
						array_push($replications, $event);
					}
					break;	
				case 'A'://replicate each year
					for ($i=0; $i < $repeat; $i++) { 
						//change the start_date

						//push to the $replications array
						array_push($replications, $event);
					}
					break;												
				default:
					
					break;
			}	

			unset($end_date_flag);
			unset($_REPEAT);
			unset($type);


			// //return the replicated events
			return $replications;
		// $event['name'] = $event['name'] . "huehue";
		// return $new_event;
	}
//https://stackoverflow.com/questions/1532618/is-there-a-function-to-make-a-copy-of-a-php-array-to-another





	//GET ALL THE EVENTS REPLICATED OVER TIME
	function get_all_replicated(){
		//first we get all the events
		$all_events = $this->get_all();

		// 			$inject = [
		// 		"name" => "Pepito Perez"
		// 	];

		// array_push($all_events, $inject);
		$replicated = array();

		//we iterate over the array
		foreach ($all_events as $event) {
			//here we replicate the event N times depending on the event type
			//and then we merge the replicated events with the current ones.
			$replicated = array_merge($replicated,$this->replicate($event));
		}

		//return the array as an ArrayObject
		return json_decode(json_encode($replicated,JSON_FORCE_OBJECT));

	}

}