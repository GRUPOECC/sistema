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

class employees_model extends CI_Model 
{
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	
	function save($save,$save_empresa)
	{
		$this->db->insert('users',$save);
        $id = $this->db->insert_id();
        $save_empresa['id_usuario'] = $id;
        $this->db->insert('empresa_usuario',$save_empresa);
		return $id; 
	}

	function save_bank_details($save)
	{
		$this->db->insert('bank_details',$save);
	}	
	
	function get_bank_details($id)
	{
					$this->db->where('B.user_id',$id);
					$this->db->select('B.*,U.name');
					$this->db->join('users U', 'U.id = B.user_id', 'LEFT');
			return $this->db->get('bank_details B')->result();
	}
	
	function get_bank_detail($id)
	{
			 		$this->db->where('B.id',$id);
					$this->db->select('B.*,U.name');
					$this->db->join('users U', 'U.id = B.user_id', 'LEFT');
			return $this->db->get('bank_details B')->row();
	}
	
	function get_empresas(){
			return $this->db->get('empresas')->result();
	}

    function get_empresas_by_user($id){
    	    $this->db->where('id_usuario',$id);
    	    $this->db->select('E.*,E.name compania,UR.name rol,EU.id idrelacion,D.name depto');
    	    $this->db->join('empresa_usuario EU', 'EU.id_empresa = E.id', 'LEFT');
    	    $this->db->join('user_role UR', 'UR.id = EU.id_cargo', 'LEFT');
    	    $this->db->join('departments D', 'D.id = EU.id_departamento', 'LEFT');
			return $this->db->get('empresas E')->result();
	}


	function get_empresa($id){
            $this->db->where('id_usuario',$id);
			return $this->db->get('empresa_usuario')->result();
	}

	function add_empresa($save_empresa){
		 $this->db->insert('empresa_usuario',$save_empresa);
	}
	
    function delete_empresa($id){
           $this->db->where('id',$id);
		   $this->db->delete('empresa_usuario');
    }

    function update_empresa($id,$save){
           $this->db->where('id',$id);
           $this->db->update('empresa_usuario',$save);
    }

	function get_all_documents($id){
	
				 $this->db->where('user_id',$id);	
		return $this->db->get('rel_document_files')->result();
	}
	
	function get_all()
	{
					$this->db->where('user_role !=',1);
					$this->db->where('user_role !=',2);
					$this->db->select('U.*,UR.name role');
					$this->db->join('user_role UR', 'UR.id = U.user_role', 'LEFT');
			return $this->db->get('users U')->result();
	}
	
	function get($id)
	{
			   $this->db->where('U.id',$id);
				$this->db->select('U.*,UR.name role');
					$this->db->join('user_role UR', 'UR.id = U.user_role', 'LEFT');
			return $this->db->get('users U')->row();
	}
	
	function get_employee_id()
	{
				$this->db->select_max('employee_id');
			return $this->db->get('users U')->row();
	}
	
	function update($save,$save_empresa,$id)
	{
			   $this->db->where('id',$id);
		       $this->db->update('users',$save);
		       $save_empresa['id_usuario'] = $id;
		       $this->db->where('id_usuario',$id);
               $this->db->update('empresa_usuario',$save_empresa);
	}
	
	
	function delete($id)//delte user_role
	{
			   $this->db->where('id',$id);
		       $this->db->delete('users');
	}
	
	function delete_bank_details($id)//delte 
	{
			   $this->db->where('id',$id);
		       $this->db->delete('bank_details');
	}
}