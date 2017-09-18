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
}