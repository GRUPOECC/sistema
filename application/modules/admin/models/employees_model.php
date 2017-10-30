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
	
	function save($save)
	{
		$this->db->insert('users',$save);
        $id = $this->db->insert_id();
        
		return $id; 
	}

	function saveempresa($id,$save_empresa){

		$save_empresa['id_usuario'] = $id;
        $this->db->insert('empresa_usuario',$save_empresa);
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

	function get_empresasHijos($id){
		           $this->db->where('parent_id',$id);
			return $this->db->get('empresas')->result();
	}

	function get_empresasHijos2($id){
		           $this->db->where_in('parent_id',$id);
			return $this->db->get('empresas')->result();
	}



    function get_empresas_by_user($id){
    	    $this->db->where('id_usuario',$id);
    	    $this->db->select('E.*,E.name compania,E.id idempresa,UR.name rol,UR.id idrol,EU.id idrelacion, EU.principal ppal,EU.fecha_ingreso fecha,EU.nomina nom,EU.id_departamento iddepto,D.name depto,RD.designation cargo, RD.id idcargo');
    	    $this->db->join('empresa_usuario EU', 'EU.id_empresa = E.id', 'LEFT');
    	    $this->db->join('user_role UR', 'UR.id = EU.id_cargo', 'LEFT');
    	    $this->db->join('departments D', 'D.id = EU.id_departamento', 'LEFT');  
    	    $this->db->join('rel_department_designation RD', 'EU.id_cargo = RD.id', 'LEFT');
			return $this->db->get('empresas E')->result();
	}

	function get_empresas_all(){
    	    $this->db->select('E.*,E.name compania,E.id idempresa,UR.name rol,UR.id idrol,EU.id idrelacion, EU.principal ppal,EU.fecha_ingreso fecha,EU.nomina nom,EU.id_departamento iddepto,D.name depto,RD.designation cargo, RD.id idcargo');
    	    $this->db->join('empresa_usuario EU', 'EU.id_empresa = E.id', 'LEFT');
    	    $this->db->join('user_role UR', 'UR.id = EU.id_cargo', 'LEFT');
    	    $this->db->join('departments D', 'D.id = EU.id_departamento', 'LEFT');
    	    $this->db->join('rel_department_designation RD', 'EU.id_cargo = RD.id', 'LEFT');
			return $this->db->get('empresas E')->result();
	}

	function get_empresas_todas(){
    	    $this->db->select('E.*,E.name compania,E.id idempresa');
    	    $this->db->where("status",1);
			return $this->db->get('empresas E')->result();
	}



	function get_empresa($id){
            $this->db->where('id_usuario',$id);		
			return $this->db->get('empresa_usuario')->result();
	}

	function get_infoempresa($id){
            $this->db->where('id',$id);
			return $this->db->get('empresas')->row();
	}

	function get_empresa_id($id){
            $this->db->where('id_usuario',$id);
			return $this->db->get('empresa_usuario')->row('id_empresa');
	}


	function add_empresa($save_empresa){
		 $this->db->insert('empresa_usuario',$save_empresa);
	}

	function haTrabajado($idusuario,$idempresa){
	
		$this->db->where("created_by",$idusuario);
		$this->db->where("id_empresa",$idempresa);
		$this->db->from('tasks');
        $total = $this->db->count_all_results();
        $this->db->where("TA.user_id",$idusuario);
        $this->db->where("T.id_empresa",$idempresa);
        $this->db->from('task_assigned TA');
        $this->db->join('tasks T', 'T.id = TA.task_id', 'LEFT');
        $total = $total +  $this->db->count_all_results();       
        if ($total>0)
         return true; 
         else if ($total==0)
           return false;   
		return false; 
	
	}
	
    function delete_empresa($idusuario,$id){
    	$this->db->where("id",$id);
    	$idempresa = $this->db->get('empresa_usuario')->row('id_empresa');
      //  if (!$this->haTrabajado($idusuario,$idempresa)){    
           $this->db->where('id',$id);
		  $this->db->delete('empresa_usuario');
		  return true; 
	  //   }else {
      //     $this->session->set_flashdata('message',"Esta compañia tiene actividades involucradas! "); 
      //     return false; 
	  //  }
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
	
	function update($save,$id)
	{
			   $this->db->where('id',$id);
		       $this->db->update('users',$save);
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

	function get_cargos($id){

		       $this->db->where('department_id',$id);	
		return $this->db->get('rel_department_designation')->result();
	} 

	function get_all_cargos(){

		       //$this->db->where('department_id',$id);	
		return $this->db->get('rel_department_designation')->result();
	} 
}