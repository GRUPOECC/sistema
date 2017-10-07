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

class visitors_model extends CI_Model 
{
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	
	function save($save)
	{
		$this->db->insert('visitors',$save);
		return $this->db->insert_id(); 
	}
	
	function visitor_view_by_admin($id)
	{
		$this->db->where('id',$id);
		$this->db->set('is_view',1);
		$this->db->update('visitors');
	}
	
	function visitors_view_by_admin($ids)
	{
		$this->db->where_in('id',$ids);
		$this->db->set('is_view',1);
		$this->db->update('visitors');
	}
	
	
	function get_visitor_by_date()
	{
			  	
				$this->db->where('date_time_in >=',date('Y-m-d'));
				$this->db->order_by('date_time_in','ASC');
				$this->db->join('contacts C', 'C.id = A.contact_id', 'LEFT');
			return $this->db->get('visitors A')->result();
	}
	
	function get_all()
	{
					$this->db->select('A.*,C.name name');
					 $this->db->join('contacts C', 'C.id = A.contact_id', 'LEFT');
			return $this->db->get('visitors A')->result();
	}

	function get_all_e($id)
	{
					$this->db->select('U.name name_e');
					 $this->db->where('U.id',$id);
			return $this->db->get('users U')->row();
	}
	
	function get_visitor_by_id($id)
	{
			   $this->db->where('A.id',$id);
			   $this->db->join('contacts C', 'C.id = A.contact_id', 'LEFT');
		return $this->db->get('visitors A')->row();
	}
	
	
	function get_contacts()
	{
		return $this->db->get('contacts')->result();
	}
	

	function get_user()
	{
		return $this->db->get('users')->result();
	}
	

	function get_user_visitable()
	{
		$this->db->where('visitable',1);
		return $this->db->get('users')->result();
	}

	function update($save,$id)
	{
			   $this->db->where('id',$id);
		       $this->db->update('visitors',$save);
	}
	
	
	function delete($id)//delte client
	{
			   $this->db->where('id',$id);
		       $this->db->delete('visitors');
	}
}