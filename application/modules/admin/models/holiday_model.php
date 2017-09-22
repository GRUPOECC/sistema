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
	
	function get_all()
	{
			return $this->db->get('holidays')->result();
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
}