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

class company_model extends CI_Model 
{
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	
	function save($save)
	{
		$this->db->insert('empresas',$save);
		return $this->db->insert_id();
	}
	
	
	function get_all()
	{
			return $this->db->get('empresas')->result();
	}


	function get_types()
	{
			return $this->db->get('empresa_tipo')->result();
	}
	
	function get($id)
	{
			   $this->db->where('E.id',$id);
			   $this->db->select('E.*,P.name padre, T.name type');
			   $this->db->join('empresas P', 'P.id = E.parent_id', 'LEFT');
			   $this->db->join('empresa_tipo T', 'T.id = E.tipo', 'LEFT');
		return $this->db->get('empresas E')->row();
	}
	
	function update($save,$id)
	{
			   $this->db->where('id',$id);
		       $this->db->update('empresas',$save);
	}
	
	
	function delete($id)//delte 
	{
			   $this->db->where('id',$id);
		       $this->db->delete('empresas');
	}
	

}