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

class parrillas_model extends CI_Model 
{
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	
	function save($save)
	{
		$this->db->insert('pub_parrillas',$save);
		return $this->db->insert_id(); 
	}
	
	function parrilla_view_by_admin($id)
	{
		$this->db->where('id',$id);
		$this->db->set('is_view',1);
		$this->db->update('pub_parrillas');
	}
	
	function parrillas_view_by_admin($ids)
	{
		$this->db->where_in('id',$ids);
		$this->db->set('is_view',1);
		$this->db->update('pub_parrillas');
	}
	
	
	function get_parrilla_by_date()
	{
			  	
				$this->db->where('date_time_in >=',date('Y-m-d'));
				$this->db->order_by('date_time_in','ASC');
				$this->db->join('contacts C', 'C.id = A.contact_id', 'LEFT');
			return $this->db->get('pub_parrillas A')->result();
	}
	
	/*function get_all()
	{
					$this->db->select('A.*,C.name name, V.name badge_name');
					$this->db->where('A.is_closed',0);
				    $this->db->join('contacts C', 'C.id = A.contact_id', 'LEFT');
					$this->db->join('pub_parrillas_clientes V', 'V.id = A.badge');
					return $this->db->get('pub_parrillas A')->result();
	}
    */


	function get_all()
	{
				
					return $this->db->get('pub_parrillas A')->result();
	}

	function get_all_e($id)
	{
					$this->db->select('U.name name_e');
					 $this->db->where('U.id',$id);
			return $this->db->get('users U')->row();
	}
	
	function get_parrilla_by_id($id)
	{
			   $this->db->where('A.id',$id);
			   $this->db->join('contacts C', 'C.id = A.contact_id', 'LEFT');
		return $this->db->get('pub_parrillas A')->row();
	}
	
	
	function get_contacts()
	{
		return $this->db->get('contacts')->result();
	}
	

	function get_user()
	{
		$this->db->where('user_role',2);
		$this->db->order_by('name','ASC');
		return $this->db->get('users')->result();
	}
	

	function get_user_visitable()
	{
		$this->db->where('visitable',1);
		$this->db->order_by('name','ASC');
		return $this->db->get('users')->result();
	}

	function get_pilares()
	{
		$this->db->order_by('name','ASC');
		return $this->db->get('pub_pilares')->result();
	}

	function get_pilares_cliente($id)
	{
		$this->db->where('cliente_id',$id);
		$this->db->order_by('name','ASC');
		return $this->db->get('pub_pilares_cliente')->result();
	}


	function get_medios()
	{
		$this->db->order_by('name','ASC');
		return $this->db->get('pub_medios')->result();
	}

	function get_campanas()
	{
		$this->db->order_by('name','ASC');
		return $this->db->get('pub_campanas')->result();
	}

	function get_agentes()
	{
		$this->db->order_by('name','ASC');
		return $this->db->get('v_pub_agentes')->result();
	}



	function update($save,$id)
	{
			   $this->db->where('id',$id);
		       $this->db->update('pub_parrillas',$save);
	}
	
	
	function delete($id)//delete client
	{
			   $this->db->where('id',$id);
		       $this->db->delete('pub_parrillas');
	}

	function get_badges()
	{
		$this->db->where('status',1);
		$this->db->where('is_in_use',0);
		$this->db->order_by('name','ASC');
		return $this->db->get('pub_parrillas_clientes')->result();
	}
	
	function update_badge_in($save){
		$this->db->where('id',$save['badge']);
		$this->db->set('is_in_use',1);
		$this->db->update('pub_parrillas_clientes');
	}

	function update_badge_out($id){
		$this->db->where('id',$id);
		$this->db->set('is_in_use',0);
		$this->db->update('pub_parrillas_clientes');
	}


	function get_parrilla_badge($id)
	{
		$this->db->where('id',$id);
		return $this->db->get('pub_parrillas')->result();
	}

	function set_time_out($id)
	{
		$this->db->where('id',$id);
		$this->db->set('date_time_out',date("Y-m-d H:i:s"));
		$this->db->set('is_closed',1);
		$this->db->update('pub_parrillas');
	}

	
}