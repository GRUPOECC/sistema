<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class visitors extends MX_Controller {

	public function __construct()
	{
		parent::__construct();
		//$this->auth->check_access('1', true);
		$this->load->model("visitors_model");
		$this->load->model("custom_field_model");
		
	}
	
	
	function index(){
		$data['visitors'] = $this->visitors_model->get_all();
		$data['page_title'] =  lang('visitors');
		$data['body'] = 'visitors/list';
		$this->load->view('template/main', $data);	
	}	
	
	function view_all(){
		$data['visitors'] = $this->visitors_model->get_visitor_by_date();
		$ids='';
		foreach($data['visitors'] as $ind => $key){
		
			$ids[]=$key->id;
		}
		$this->visitors_model->visitors_view_by_admin($ids);
		$data['page_title'] = lang('view_all') . lang('visitors');
		$data['body'] = 'visitors/view_all';
		$this->load->view('template/main', $data);	
	}	
	
	function add(){
		$data['contact_fields'] = $this->custom_field_model->get_custom_fields(4);	
		$data['fields'] = $this->custom_field_model->get_custom_fields(5);	
		$data['contacts'] = $this->visitors_model->get_contacts();
		$data['visitors_badges'] = $this ->visitors_model->get_badges();
		$data['users'] = $this->visitors_model->get_user_visitable();
		if ($this->input->post('ok'))
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('badge_id', 'lang:badge', 'required');
			$this->form_validation->set_rules('contact_id', 'lang:Visitor', 'required');
			$this->form_validation->set_rules('user_id', 'lang:who_visit', 'required');
			$this->form_validation->set_rules('date_time_in', 'lang:date', 'required');
			$this->form_validation->set_message('required', lang('custom_required'));
			 
			if ($this->form_validation->run()==true)
            {
				$save['badge'] = $this->input->post('badge_id');
				$save['contact_id'] = $this->input->post('contact_id');
				$save['user_id'] = $this->input->post('user_id');
				$save['date_time_in'] = $this->input->post('date_time_in');
				$save['notes'] = $this->input->post('notes');
                $save['motive'] = $this->input->post('motive');
				$p_key = $this->visitors_model->save($save);
				$this->visitors_model->update_badge_in($save);
				$reply = $this->input->post('reply');
				if(!empty($reply)){
					foreach($this->input->post('reply') as $key => $val) {
					$save_fields[] = array(
						'custom_field_id'=> $key,
						'reply'=> $val,
						'table_id'=> $p_key,
						'form'=> 5,
					);	
				
					}	
					$this->custom_field_model->save_answer($save_fields);
				}	
               	$this->session->set_flashdata('message', lang('visitor_created'));
				redirect('admin/visitors');
				
				
			}
		}		
		
		
		$data['page_title'] = lang('add') . lang('Visitor');
		$data['body'] = 'visitors/add';
		
		$this->load->view('template/main', $data);	
	}	
	
	
	function edit($id=false){
		$data['fields'] = $this->custom_field_model->get_custom_fields(5);	
		$data['contacts'] = $this->visitors_model->get_contacts();
		$data['visitor'] = $this->visitors_model->get_visitor_by_id($id);
		$data['id'] =$id;
		
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {
			$this->load->library('form_validation');
			$this->form_validation->set_rules('badge', 'name:badge', 'required');
			 $this->form_validation->set_message('required', lang('custom_required'));
			 
			if ($this->form_validation->run()==true)
            {
				$save['badge'] = $this->input->post('badge');
				$save['contact_id'] = $this->input->post('contact_id');
				$save['user_id'] = $this->input->post('user_id');
				$save['date_time_in'] = $this->input->post('date_time_in');
				$save['notes'] = $this->input->post('notes');
                
				$this->visitors_model->update($save,$id);
				
				$reply = $this->input->post('reply');
					if(!empty($reply)){
					foreach($this->input->post('reply') as $key => $val) {
						$save_fields[] = array(
							'custom_field_id'=> $key,
							'reply'=> $val,
							'table_id'=> $id,
							'form'=> 5,
						);	
					
					}	
					$this->custom_field_model->delete_answer($id,$form=5);
					$this->custom_field_model->save_answer($save_fields);
					}	
               	$this->session->set_flashdata('message',lang('visitor_updated'));
				redirect('admin/visitors');
				
				
			}
			
		}			
	
		$data['page_title'] = lang('edit') . lang('visitor');
		$data['body'] = 'visitors/edit';
		$this->load->view('template/main', $data);	

	}
	
	function view_visitor($id=false){
		$data['fields'] = $this->custom_field_model->get_custom_fields(5);	
		$data['contacts'] = $this->visitors_model->get_contacts();
		$data['visitor'] = $data['clients'] = $this->visitors_model->get_visitor_by_id($id);
		$data['id'] =$id;
		$this->visitors_model->visitor_view_by_admin($id);
		$data['page_title'] = lang('view') . lang('visitor');
		$data['body'] = 'visitors/view';
		$this->load->view('template/main', $data);	

	}	
	
	function delete($id=false){
		
		if($id){
			$this->visitors_model->delete($id);
			$this->session->set_flashdata('message',lang('visitor_deleted'));
			redirect('admin/visitors');
		}
	}	

	function close ($id=false){
		if($id){
			$this->visitors_model->set_time_out($id);
			$badge=$this->visitors_model->get_visitor_badge($id);
			$this->visitors_model->update_badge_out($badge[0]->badge);
			redirect('admin/visitors');
		}

	}
	
}