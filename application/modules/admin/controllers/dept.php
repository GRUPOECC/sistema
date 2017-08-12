<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class dept extends MX_Controller {

	public function __construct()
	{
		parent::__construct();
		
		//$this->auth->check_access('1', true);
		$this->load->model("dept_model");
		$this->load->model("location_model");
		$this->load->model("dept_category_model");
		
	}
	
	
	function index(){
		$data['depts'] = $this->dept_model->get_all();
		$data['page_title'] = lang('dept');
		$data['body'] = 'dept/list';
		$this->load->view('template/main', $data);	
	}	
	
	function add(){
		$data['locations'] = $this->location_model->get_all();
		$data['dept_categories'] = $this->dept_category_model->get_all();
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			$this->form_validation->set_message('required', lang('custom_required'));
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
				$save['location_id'] = $this->input->post('location_id');
				$save['dept_category_id'] = $this->input->post('dept_category_id');
				$save['description'] = $this->input->post('description');
                
				$this->dept_model->save($save);
                $this->session->set_flashdata('message', lang('dept_created'));
				redirect('admin/dept');
				
			}
		}		
		
		
		$data['page_title'] = lang('add') . lang('dept');
		$data['body'] = 'dept/add';
		
		$this->load->view('template/main', $data);	

	}	
	
	
	function edit($id=false){
		$data['locations'] = $this->location_model->get_all();
		$data['dept_categories'] = $this->dept_category_model->get_all();
		$data['dept'] = $this->dept_model->get_dept_by_id($id);
		$data['id'] =$id;
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_message('required', lang('custom_required'));
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
				$save['location_id'] = $this->input->post('location_id');
				$save['dept_category_id'] = $this->input->post('dept_category_id');
				$save['description'] = $this->input->post('description');
				$this->dept_model->update($save,$id);
				$this->session->set_flashdata('message', lang('dept_updated'));
                redirect('admin/dept');
			}
		}		
	
		$data['page_title'] = lang('edit') . lang('dept');
		$data['body'] = 'dept/edit';
		$this->load->view('template/main', $data);	
	}	
	
	function delete($id=false){
		
		if($id){
			$this->dept_model->delete($id);
			$this->session->set_flashdata('message', lang('dept_deleted'));
			redirect('admin/dept');
		}
	}	
		
	
}