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

class cases_model extends CI_Model 
{
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	
	function  set_is_starred($id)
	{
		$this->db->where('id',$id);
		$this->db->set('is_starred',1);
		$this->db->update('cases');
	}

	function save_client_alert()
	{
	    $admin = $this->session->userdata('admin');
		$this->db->where('id', $admin['id']);
		$this->db->set('client_case_alert',$_POST['days']);
		$this->db->update('users');
	}

    function savefile($save){
        $this->db->insert('files',$save);
        $id = $this->db->insert_id();  
		return $id;

	} 

	function save_publication($save)
	{
		$this->db->insert('case_publications',$save);
        $id = $this->db->insert_id();  
		return $id;
	}

	function get_commnets_by_case($id)
	{
		$admin = $this->session->userdata('admin');
				$this->db->where('M.case_id',$id);
				$this->db->order_by('M.date_time',"DESC");
				$this->db->select('M.*,U.name from_user,U.image');
			   $this->db->join('users U', 'U.id = M.created_by', 'LEFT');
		return $this->db->get('case_publications M')->result();
	}

	function get_users_email($case_id){
	 			$admin = $this->session->userdata('admin');
				
				$this->db->where('C.id',$case_id);
				$this->db->select('U.email');	
			    $this->db->join('users U', " CAST(U.id AS CHAR) LIKE CONCAT('%',C.usuarios_id, '%')", 'LEFT');
		return $this->db->get('cases C')->result();
	}

	function get_files($id){
             $this->db->where('id_ticket',$id);
			return $this->db->get('files')->result();
	}

	function  case_view_by_admin($id)
	{
		$this->db->where('case_id',$id);
		$this->db->set('is_view',1);
		$this->db->update('extended_case');
	}
	
	
	function  cases_view_by_admin($ids)
	{
		$this->db->where_in('case_id',$ids);
		$this->db->set('is_view',1);
		$this->db->update('extended_case');
	}

		function getPublicationsFiles($id){
             $this->db->where('id_publicacion',$id);
			return $this->db->get('files')->result();
	}
	
	
	function  case_view_by_client($id)
	{
		$this->db->where('case_id',$id);
		$this->db->set('is_view_client',1);
		$this->db->update('extended_case');
	}
	
	
	function restore_case($id)
	{
		$this->db->where('id',$id);
		$this->db->set('is_archived',0);
		$this->db->update('cases');	
	
	}
	
	function  set_is_archived($id)
	{
		$this->db->where('id',$id);
		$this->db->set('is_archived',1);
		$this->db->update('cases');
	}
	
	
	function get_case_by_date()
	{
			  	$this->db->where('C.is_archived',0);
				$this->db->where('EC.next_date >=',date('Y-m-d'));
				$this->db->order_by('EC.next_date','ASC');
				$this->db->join('extended_case EC', 'EC.case_id = C.id', 'LEFT');
				$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
		return $this->db->get('cases C')->result();
	}
	
	function  update_set_is_starred($id)
	{
		$this->db->where('id',$id);
		$this->db->set('is_starred',0);
		$this->db->update('cases');
	}
	function save_extended_case($save)
	{
		$this->db->insert('extended_case',$save);
	}
	
	function get_all_extended_case_by_id($id)
	{
		$this->db->where('case_id',$id);
		$this->db->order_by('next_date','DESC');
		return $this->db->get('extended_case')->result();
	}
	
	function get_extended_case_by_id($id)
	{
		$this->db->where('id',$id);
		return $this->db->get('extended_case')->row();
	}
	
	function save($save)
	{
		$this->db->insert('cases',$save);
		return $this->db->insert_id(); 
	}
	
	function get_all()
	{
			$this->db->where('C.is_archived',0);
			$this->db->select('C.*,U.name client');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_cases_by_client_id($id)
	{
			$this->db->where('C.client_id',$id);
			$this->db->where('C.is_archived',0);
			$this->db->select('C.*,U.name client');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_cases_by_client_id_starred($id)
	{
			$this->db->where('C.client_id',$id);
			$this->db->where('C.is_archived',0);
			$this->db->where('C.is_starred',1);
			$this->db->select('C.*,U.name client');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_cases_by_dept_id($id)
	{
			$this->db->where('C.dept_id',$id);
			$this->db->where('C.is_archived',0);
			$this->db->select('C.*,U.name client');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_cases_by_dept_id_starred($id)
	{
			$this->db->where('C.dept_id',$id);
			$this->db->where('C.is_archived',0);
			$this->db->where('C.is_starred',1);
			$this->db->select('C.*,U.name client');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_cases_by_location_id($id)
	{
			$this->db->where('C.location_id',$id);
			$this->db->where('C.is_archived',0);
			$this->db->select('C.*,U.name client');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_invoice_number()
	{
			$this->db->select_max('invoice');
			return $this->db->get('fees')->row();
	}
	
	function get_cases_by_location_id_starred($id)
	{
			$this->db->where('C.location_id',$id);
			$this->db->where('C.is_archived',0);
			$this->db->where('C.is_starred',1);
			$this->db->select('C.*,U.name client');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	
	function get_cases_by_case_stage_id($id)
	{
			$this->db->where('C.case_stage_id',$id);
			$this->db->where('C.is_archived',0);
			$this->db->select('C.*,U.name client');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_cases_by_case_stage_id_starred($id)
	{
			$this->db->where('C.case_stage_id',$id);
			$this->db->where('C.is_archived',0);
			$this->db->where('C.is_starred',1);
			$this->db->select('C.*,U.name client');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_cases_by_filing_date($id)
	{
			$this->db->where('C.start_date',$id);
			$this->db->where('C.is_archived',0);
			$this->db->select('C.*,U.name client');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_cases_by_filing_date_starred($id)
	{
			$this->db->where('C.start_date',$id);
			$this->db->where('C.is_archived',0);
			$this->db->where('C.is_starred',1);
			$this->db->select('C.*,U.name client');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_cases_by_hearing_date($date)
	{
			$this->db->where('C.hearing_date',$date);
			$this->db->or_where('EC.next_date',$date);
			$this->db->where('C.is_archived',0);
			$this->db->select('C.*,U.name client');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			$this->db->join('extended_case EC', 'C.id = EC.case_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_cases_by_hearing_date_starred($date)
	{
			$this->db->where('C.hearing_date',$date);
			$this->db->where('is_starred',1);
			$this->db->or_where('EC.next_date',$date);
			$this->db->where('C.is_archived',0);
			$this->db->select('C.*,U.name client');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			$this->db->join('extended_case EC', 'C.id = EC.case_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	
	function get_all_starred()
	{
			$this->db->where('is_starred',1);
			$this->db->where('is_archived',0);
			$this->db->select('C.*,U.name client');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			
			return $this->db->get('cases C')->result();
	}
	
	
	
	function get_all_archived()
	{
			$this->db->where('C.is_archived',1);
			$this->db->select('C.*,U.name client,CS.name stage');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			$this->db->join('case_stages CS', 'CS.id = C.case_stage_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_archive_cases_by_client_id($id)
	{
			$this->db->where('C.is_archived',1);
			$this->db->where('C.client_id',$id);
			$this->db->select('C.*,U.name client,CS.name stage');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			$this->db->join('case_stages CS', 'CS.id = C.case_stage_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_archive_cases_by_dept_id($id)
	{
			$this->db->where('C.is_archived',1);
			$this->db->where('C.dept_id',$id);
			$this->db->select('C.*,U.name client,CS.name stage');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			$this->db->join('case_stages CS', 'CS.id = C.case_stage_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_archive_cases_by_location_id($id)
	{
			$this->db->where('C.is_archived',1);
			$this->db->where('C.location_id',$id);
			$this->db->select('C.*,U.name client,CS.name stage');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			$this->db->join('case_stages CS', 'CS.id = C.case_stage_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	
	function get_archive_cases_by_case_stage_id($id)
	{
			$this->db->where('C.is_archived',1);
			$this->db->where('C.case_stage_id',$id);
			$this->db->select('C.*,U.name client,CS.name stage');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			$this->db->join('case_stages CS', 'CS.id = C.case_stage_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	
	
	function get_archive_cases_by_filing_date($date)
	{
			$this->db->where('C.is_archived',1);
			$this->db->where('C.start_date',$date);
			$this->db->select('C.*,U.name client,CS.name stage');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			$this->db->join('case_stages CS', 'CS.id = C.case_stage_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
	
	function get_archive_cases_by_hearing_date($date)
	{
			$this->db->where('C.is_archived',1);
			$this->db->where('C.hearing_date',$date);
			$this->db->or_where('EC.next_date',$date);
			$this->db->select('C.*,U.name client,CS.name stage');
			$this->db->join('users U', 'U.id = C.client_id', 'LEFT');
			$this->db->join('case_stages CS', 'CS.id = C.case_stage_id', 'LEFT');
			$this->db->join('extended_case EC', 'C.id = EC.case_id', 'LEFT');
			return $this->db->get('cases C')->result();
	}
		
	function get_case_by_id($id)
	{
			   $this->db->where('id',$id);
		return $this->db->get('cases')->row();
	}
	
	
	function get_archive_case_by_id($id)
	{
			   $this->db->where('C.id',$id);
			   $this->db->select('C.*,AC.notes close_note,AC.close_date,U.name creador');
			   $this->db->join('archived_cases AC', 'AC.case_id = C.id', 'LEFT');
			   $this->db->join('users U', 'U.id = C.created_by', 'LEFT');	
		return $this->db->get('cases C')->row();
	}
	
	
	
	
	function update($save,$id)
	{
			   $this->db->where('id',$id);
		       $this->db->update('cases',$save);
	}
	

	function save_fees($save)
	{
		       $this->db->insert('fees',$save);
			   return $this->db->insert_id();
	}
	
	function save_taxes($save)
	{
		       $this->db->insert_batch('rel_fees_tax',$save);
			   
	}
	
	function save_archived($save)
	{
		       $this->db->insert('archived_cases',$save);
	}
	
	function save_receipt($save)
	{
		       $this->db->insert('receipt',$save);
	}
	
	function get_receipt($id)
	{
					 $this->db->where('R.id',$id);	
					 $this->db->select('R.*,U.name as user,C.title,F.payment_mode_id,C.id case_id,C.fees,U.id as user_id,U.email as u_email');
		 			 $this->db->join('fees F', 'F.id = R.fees_id', 'LEFT');
					 $this->db->join('cases C', 'C.id = F.case_id', 'LEFT');
					  $this->db->join('users U', 'U.id = C.client_id', 'LEFT');
		      return $this->db->get('receipt R')->row();
	}
	
	function get_receipts($id){
		 $this->db->where('F.case_id',$id);
		 $this->db->select('R.*,');
		 $this->db->join('fees F', 'F.id = R.fees_id', 'LEFT');
		 $this->db->join('cases C', 'C.id = F.case_id', 'LEFT');
		return $this->db->get('receipt R')->result();
	}
	
	function get_fees_all($id)
	{
		 $this->db->where('case_id',$id);
		$this->db->select('F.*,(select sum(amount) from fees where case_id = '.$id.')as bal,PM.name mode');
		$this->db->join('payment_modes PM', 'PM.id = F.payment_mode_id', 'LEFT');
		return $this->db->get('fees F')->result();
	}
		
	function delete($id)//delte client
	{
			   $this->db->where('id',$id);
		       $this->db->delete('cases');
	}
	
	function delete_receipt($id)//delte receipt
	{
			   $this->db->where('id',$id);
		       $this->db->delete('receipt');
	}
	
	function delete_history($id)//delte client
	{
	
			   $this->db->where('id',$id);
		       $this->db->delete('extended_case');
	}
	
	
	function delete_fees($id)//delte client
	{
			   $this->db->where('id',$id);
		       $this->db->delete('fees');
	}
	
	function get_all_clients()
	{
				   $this->db->where('user_role',2);
			return $this->db->get('users')->result();
	}

	function get_all_employees()
	{
				   $this->db->where('user_role',3);
			return $this->db->get('users')->result();
	}

	function get_employees($empresa,$departamentos)
	{
		           //Especifico lo que obtendre
		           $this->db->select('U.id idusuario,U.name name');
		           //Especifico empresa
		           //---------------------------------------------------------------------------------------
				   $this->db->where('EU.id_empresa',$empresa);
                   //Especifico departamentos
                   //---------------------------------------------------------------------------------------         
                   $condiciones = '';
		           for ($i=0;$i<count($departamentos);$i++)   
                   {
                   	 if ($i==0) 
                     $condiciones = $condiciones .'(EU.id_departamento = ' . $departamentos[$i] . ' OR '; 
                     if ($i==(count($departamentos)-1)) 
                     $condiciones = $condiciones .' EU.id_departamento = ' . $departamentos[$i] . ')';
                     else 
                     $condiciones = $condiciones .' EU.id_departamento = ' . $departamentos[$i] . ' OR ';	
                   } 
                   $this->db->where($condiciones,null,false);   
                   //---------------------------------------------------------------------------------------
				   $this->db->join('empresa_usuario EU', 'EU.id_usuario = U.id', 'LEFT');
				   //---------------------------------------------------------------------------------------
			return $this->db->get('users U')->result();
	}
	
	function get_all_depts()
	{
			return $this->db->get('departments')->result();
	}

	
	function get_all_depts_cats()
	{
			return $this->db->get('dept_categories')->result();
	}
	
	function get_all_locations()
	{				
				   $this->db->order_by('cod_interno','ASC');	
//			return $this->db->get('locations')->result();
			return $this->db->get('empresas')->result();

	}

	
	
	function get_all_acts()
	{
			return $this->db->get('acts')->result();
	}
	
	function get_acts_by_ids($ids)
	{				
					$this->db->where_in('id',$ids);
			return $this->db->get('acts')->result();
	}
	
	
	function get_all_case_categories()
	{
			return $this->db->get('case_categories')->result();
	}
	
	function get_all_payment_modes()
	{
			return $this->db->get('payment_modes')->result();
	}
	
	function get_case_catogries_by_ids($ids)
	{				
					$this->db->where_in('id',$ids);
			return $this->db->get('case_categories')->result();
	}
	
	function get_dept_catogries_by_location($id)
	{				
					$this->db->where('location_id',$id);
					$this->db->join('dept_categories CG', 'CG.id = C.dept_category_id', 'LEFT');
					$this->db->select('CG.id,CG.name');
			return $this->db->get('depts C')->result();
	}
	
	
	function get_dept_by_location_c_category($l_id,$c_id)
	{				
					$this->db->where('location_id',$l_id);
					$this->db->where('dept_category_id',$c_id);
			return  $this->db->get('depts C')->result();
	}
	
	
	function get_all_dept_categories()
	{
			return $this->db->get('dept_categories')->result();
	}
}