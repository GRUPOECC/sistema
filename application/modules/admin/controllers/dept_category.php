<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class dept_category extends MX_Controller {

	public function __construct()
	{
		parent::__construct();
		//$this->auth->check_access('1', true);
		$this->load->model("dept_category_model");
	}
	
	
	function index(){
		$data['categories'] = $this->dept_category_model->get_all();
		$data['page_title'] = lang('dept') ." ". lang('categories');
		$data['body'] = 'dept_category/list';
		$this->load->view('template/main', $data);	
	}	
	
	function add(){
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			$this->form_validation->set_message('required', lang('custom_required'));
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
    			$this->dept_category_model->save($save);
                $this->session->set_flashdata('message', lang('dept_category_created'));
				redirect('admin/dept_category');
				
			}
			
			
		}		
		
		
		$data['page_title'] = lang('add') . lang('dept') . lang('category');
		$data['body'] = 'dept_category/add';
		
		$this->load->view('template/main', $data);	
	}	
	
	
	function edit($id=false){
		
		$data['category'] = $this->dept_category_model->get_category_by_id($id);
		$data['id'] =$id;
		$data['categories'] = $this->dept_category_model->get_all();
	
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			$this->form_validation->set_message('required', lang('custom_required'));
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
				$this->dept_category_model->update($save,$id);
                $this->session->set_flashdata('message', lang('dept_category_updated'));
				redirect('admin/dept_category');
				
			}
		}		
	
		$data['page_title'] = lang('edit') . lang('dept') . lang('category'); 
		$data['body'] = 'dept_category/edit';
		$this->load->view('template/main', $data);	

	}	
	
	function delete($id=false){
		
		if($id){
			$this->dept_category_model->delete($id);
			$this->session->set_flashdata('message',lang('dept_category_deleted'));
			redirect('admin/dept_category');
		}
	}	
		
	
}