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
					$this->db->select('A.*,C.name name, V.name badge_name');
					$this->db->where('A.is_closed',0);
				    $this->db->join('contacts C', 'C.id = A.contact_id', 'LEFT');
					$this->db->join('visitor_badges V', 'V.id = A.badge');
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
		$this->db->order_by('name','ASC');
		return $this->db->get('users')->result();
	}

	function update($save,$id)
	{
			   $this->db->where('id',$id);
		       $this->db->update('visitors',$save);
	}
	
	
	function delete($id)//delete client
	{
			   $this->db->where('id',$id);
		       $this->db->delete('visitors');
	}

	function get_badges()
	{
		$this->db->where('status',1);
		$this->db->where('is_in_use',0);
		$this->db->order_by('name','ASC');
		return $this->db->get('visitor_badges')->result();
	}
	
	function update_badge_in($save){
		$this->db->where('id',$save['badge']);
		$this->db->set('is_in_use',1);
		$this->db->update('visitor_badges');
	}

	function update_badge_out($id){
		$this->db->where('id',$id);
		$this->db->set('is_in_use',0);
		$this->db->update('visitor_badges');
	}


	function get_visitor_badge($id)
	{
		$this->db->where('id',$id);
		return $this->db->get('visitors')->result();
	}

	function set_time_out($id)
	{
		$this->db->where('id',$id);
		$this->db->set('date_time_out',date("Y-m-d H:i:s"));
		$this->db->set('is_closed',1);
		$this->db->update('visitors');
	}

	
}