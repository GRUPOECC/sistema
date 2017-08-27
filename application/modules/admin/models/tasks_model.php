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

class tasks_model extends CI_Model 
{
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	
	function save($save)
	{
		$this->db->insert('tasks',$save);
		return $this->db->insert_id();
	}
	
	function save_assigned_tasks($save)
	{
		$this->db->insert_batch('task_assigned',$save);
		
	}
	
	function get_all()
	{
					$this->db->order_by('T.due_date','DESC');
					$this->db->select('T.*,U.name name,UR.name role');
					$this->db->join('users U', 'U.id = T.created_by', 'LEFT');
					$this->db->join('user_role UR', 'UR.id = U.user_role', 'LEFT');
			return $this->db->get('tasks T')->result();
	}
	
	function get_due_tasks()
	{
					$this->db->where('T.due_date > ',date("Y-m-d"));
					$this->db->where('T.progress != 100 ');
					$this->db->order_by('T.due_date','DESC');
					$this->db->select('T.*,U.name name,UR.name role');
					$this->db->join('users U', 'U.id = T.created_by', 'LEFT');
					$this->db->join('user_role UR', 'UR.id = U.user_role', 'LEFT');
			return $this->db->get('tasks T')->result();
	}
	
	function get_my_due_tasks()
	{
					$this->db->where('T.due_date > ',date("Y-m-d"));
					$this->db->where('T.progress != 100 ');
					$this->db->order_by('T.due_date','DESC');
					$this->db->where('TA.user_id',$this->session->userdata('admin')['id']);
					$this->db->select('T.*,U.name name,UR.name role');
					$this->db->join('task_assigned TA', 'TA.task_id = T.id', 'LEFT');
					$this->db->join('users U', 'U.id = T.created_by', 'LEFT');
					$this->db->join('user_role UR', 'UR.id = U.user_role', 'LEFT');
			return $this->db->get('tasks T')->result();
	}
	
	function get_my_tasks()
	{
					$this->db->order_by('T.due_date','DESC');
					$this->db->where('TA.user_id',$this->session->userdata('admin')['id']);
					$this->db->select('T.*,U.name name,UR.name role');
					$this->db->join('task_assigned TA', 'TA.task_id = T.id', 'LEFT');
					$this->db->join('users U', 'U.id = T.created_by', 'LEFT');
					$this->db->join('user_role UR', 'UR.id = U.user_role', 'LEFT');
			return $this->db->get('tasks T')->result();
	}

	function get_my_tasks_info()
	{ 
		// SELECT ta.`user_id` assigned_to, t.`name` name, t.`due_date` due_date, t.description FROM `tasks` t 
		// JOIN `v_calendario` v ON 
		// 	t.`id` = v.`id` AND v.`TASK`='TASK'COLLATE utf8mb4_unicode_ci
		// JOIN `task_assigned` ta ON
		// 	ta.`task_id` = t.`id` AND ta.`user_id`=11

		$this->db->select('T.id id, T.name name, T.due_date due_date, T.description');
		$this->db->join('v_calendario V','T.id = V.id AND V.TASK=\'TASK\'');
		$this->db->join('task_assigned TA','TA.task_id = T.id AND TA.user_id='.$this->session->userdata('admin')['id']);
		return $this->db->get('tasks T')->result();
	}
	
	
	function get_all_employees(){
			 $this->db->where('user_role !=2');
		return $this->db->get('users')->result();
	}
	
	function get_assigned_user($task_id){
			 $this->db->where('task_id',$task_id);
		return $this->db->get('task_assigned')->result();
	}
	
	function get($id)
	{
                   $this->db->select('T.*,U.name name,UR.name role');
				   $this->db->join('users U', 'U.id = T.created_by', 'LEFT');
				   $this->db->join('user_role UR', 'UR.id = U.user_role', 'LEFT');
				   $this->db->where('T.id',$id);
			return $this->db->get('tasks T')->row();
	}
	
	function update($save,$id)
	{
			   $this->db->where('id',$id);
		       $this->db->update('tasks',$save);
	}
	
	function save_comment($save)
	{
		$this->db->insert('task_comments',$save);

	}
	
	function get_commnets_by_task($id)
	{
		$admin = $this->session->userdata('admin');
				$this->db->where('M.task_id',$id);
				$this->db->order_by('M.date_time',"DESC");
				$this->db->select('M.*,U.name from_user,U.image');
			   $this->db->join('users U', 'U.id = M.comment_by', 'LEFT');
		return $this->db->get('task_comments M')->result();
	}
	
	function get_users_email($task_id){
	 			$admin = $this->session->userdata('admin');
				
				$this->db->where('TA.task_id',$task_id);
				$this->db->where('TA.user_id !=',$admin['id']);
				$this->db->select('U.email');	
				 $this->db->join('users U', 'U.id = TA.user_id', 'LEFT');
		return $this->db->get('task_assigned TA')->result();
	}
	
	
	function delete($id)//delete user_role
	{
			   $this->db->where('id',$id);
		       $this->db->delete('tasks');
	}
	
	function delete_assigned_tasks($id)//delte user_role
	{
			   $this->db->where('task_id',$id);
		       $this->db->delete('task_assigned');
	}
	function get_usuarios_asignados($id){
		$this->db->where('v.id_tarea',$id);
		$this->db->select('v.name, v.id_tarea');
		return $this->db->get('v_tareas_asignadas v')->result();
	}
}