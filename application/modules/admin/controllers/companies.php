<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class companies extends MX_Controller {

	public function __construct()
	{
		parent::__construct();
		//$this->auth->check_access('1', true);
		$this->load->model("company_model");
		
	}
	
	
	function index(){
		$data['companies'] = $this->company_model->get_all();
		$data['page_title'] = lang('companies');
		$data['body'] = 'companies/list';
		$this->load->view('template/main', $data);	

	}	
	
	function add(){
		$data['companies'] = $this->company_model->get_all();
		$data['types'] = $this->company_model->get_types(); 
	
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			//$this->form_validation->set_rules('name', 'lang:name', 'required','please enter your name');
			$this->form_validation->set_message('required', lang('custom_required'));
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			$this->form_validation->set_rules('codigo', 'lang:code', 'required');
			$this->form_validation->set_rules('rif', 'lang:rif', 'required');
			$this->form_validation->set_rules('razon', 'lang:razon', 'required');
			$this->form_validation->set_rules('padre', 'lang:name', '');
			$this->form_validation->set_rules('direccion', 'lang:address', 'required');
            $this->form_validation->set_rules('telefono', 'lang:phone', 'required');
            $this->form_validation->set_rules('extension', 'lang:extension', '');
            $this->form_validation->set_rules('tipo', 'lang:type', 'required');
            $this->form_validation->set_rules('status', 'lang:status', '');
			//$this->form_validation->set_message('required', '%s no puede estar vacio');
			$this->session->set_flashdata('required','%s no puede estar vacio');
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
				$save['rif'] = $this->input->post('rif');
				$save['parent_id'] = $this->input->post('padre');
				$save['cod_interno'] = $this->input->post('codigo');
				$save['razon_social'] = $this->input->post('razon');
				$save['direccion'] = $this->input->post('direccion');
				$save['telefono'] = $this->input->post('telefono');
				$save['extension'] = $this->input->post('extension');
				$save['tipo'] = $this->input->post('tipo');
				$save['status'] = $this->input->post('status');

                
				$d_id =	$this->company_model->save($save);

                $this->session->set_flashdata('message', lang('company saved'));
				redirect('admin/companies');
			}
		}		
		
		
		$data['page_title'] = lang('add') . lang('company');
		$data['body'] = 'companies/add';
		
		
		$this->load->view('template/main', $data);	
	}	
	
	
	function edit($id=false){
		$data['companies'] = $this->company_model->get_all();
		$data['types'] = $this->company_model->get_types(); 
		$data['company'] = $this->company_model->get($id);
		$data['id'] =$id;
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_message('required', lang('custom_required'));
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			$this->form_validation->set_rules('codigo', 'lang:code', 'required');
			$this->form_validation->set_rules('rif', 'lang:rif', 'required');
			$this->form_validation->set_rules('razon', 'lang:razon', 'required');
			$this->form_validation->set_rules('padre', 'lang:name', '');
			$this->form_validation->set_rules('direccion', 'lang:address', 'required');
            $this->form_validation->set_rules('telefono', 'lang:phone', 'required');
            $this->form_validation->set_rules('extension', 'lang:extension', '');
            $this->form_validation->set_rules('tipo', 'lang:type', 'required');
            $this->form_validation->set_rules('status', 'lang:status', '');
			//$this->form_validation->set_message('required', '%s no puede estar vacio');
			$this->session->set_flashdata('required','%s no puede estar vacio');
			
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
				$save['rif'] = $this->input->post('rif');
				$save['parent_id'] = $this->input->post('padre');
				$save['cod_interno'] = $this->input->post('codigo');
				$save['razon_social'] = $this->input->post('razon');
				$save['direccion'] = $this->input->post('direccion');
				$save['telefono'] = $this->input->post('telefono');
				$save['extension'] = $this->input->post('extension');
				$save['tipo'] = $this->input->post('tipo');
				$save['status'] = $this->input->post('status');
				
				$this->company_model->update($save,$id);
				
               	$this->session->set_flashdata('message', lang('company_updated'));
				redirect('admin/companies');
			}
		}		
	
		$data['page_title'] = lang('edit') . lang('company');
		$data['body'] = 'companies/edit';
		$this->load->view('template/main', $data);	

	}

	function view($id=false){
        $data['company'] = $this->company_model->get($id);
        $data['page_title'] = lang('view') . lang('company');
		$data['body'] = 'companies/view';
		$this->load->view('template/main', $data);	

	} 	
	
	function delete($id=false){
		
		if($id){
			$this->company_model->delete($id);
			$this->session->set_flashdata('message',lang('company_deleted'));
			redirect('admin/companies');
			
		}
		
	function _custom_required($str, $func) {
     	   switch($func) {
            case 'name':
                $this->form_validation->set_message('custom_required', 'Enter your name');
                return (trim($str) == '') ? FALSE : TRUE;
                break;
            case 'second':
                $this->form_validation->set_message('custom_required', 'The variables are required');
                return (trim($str) == '') ? FALSE : TRUE;
                break;
        }
    }
	}	
		
	
}

class MY_Form_validation {
    public function custom_required($str) {
        if ( ! is_array($str)) {
            return (trim($str) == '') ? FALSE : TRUE;
        } else {
            return ( ! empty($str));
        }
    }
}
	
class MY_Form_validation1 extends CI_Form_validation {

    public function __construct()
    {
        parent::__construct();
    }
    function required_select($input)
    {
        $this->set_message('required_select','select %s');
        return FALSE;
    }

	
}