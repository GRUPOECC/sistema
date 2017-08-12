<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class loc_category extends MX_Controller {

	public function __construct()
	{
		parent::__construct();
		//$this->auth->check_access('1', true);
		$this->load->model("loc_category_model");
		
	}
	
	
	function index(){
		$data['categories'] = $this->loc_category_model->get_all();
		$data['page_title'] = lang('loc') ." ". lang('categories');
		$data['body'] = 'loc_category/list';
		$this->load->view('template/main', $data);	
	}	
	
	function add(){
		$data['categories'] = $this->loc_category_model->get_all();
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			 $this->form_validation->set_message('required', lang('custom_required'));
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
				$save['parent_id'] = $this->input->post('parent_id');
                
				$this->loc_category_model->save($save);
                $this->session->set_flashdata('message', lang('loc_category_created'));
				redirect('admin/loc_category');
				
			}
			
		}		
		
		
		$data['page_title'] = lang('add') . lang('loc') . lang('category');
		$data['body'] = 'loc_category/add';
		$this->load->view('template/main', $data);	
	}	
	
	
	function edit($id=false){
		$data['id'] =$id;
		$data['category'] = $this->loc_category_model->get_category_by_id($id);
		
		$data['categories'] = $this->loc_category_model->get_all();
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			$this->form_validation->set_message('required', lang('custom_required')); 
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
				$save['parent_id'] = $this->input->post('parent_id');
                
				$this->loc_category_model->update($save,$id);
                $this->session->set_flashdata('message', lang('loc_category_updated'));
				redirect('admin/loc_category');
			}
		}		
	
		$data['page_title'] = lang('edit') . lang('loc') . lang('category');
		$data['body'] = 'loc_category/edit';
		$this->load->view('template/main', $data);	

	}	
	
	function delete($id=false){
		
		if($id){
			$this->loc_category_model->delete($id);
			 $this->session->set_flashdata('message', lang('loc_category_deleted'));
			redirect('admin/loc_category');
		}
	}	
		
	
}