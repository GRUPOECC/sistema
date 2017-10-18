<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class holidays extends MX_Controller {

	public function __construct()
	{
		parent::__construct();
		//$this->auth->check_access('1', true);
		$this->load->model("holiday_model");
		
	}
	
	
	function index(){
	
	//$days = $this->db->query()->result();
		//echo '<pre>'; print_r($days);die;
		
		$data['holidays'] = $this->holiday_model->get_all();
		$data['v_calendario'] = $this->holiday_model->get_v_calendario();
		$data['months'] = $this->holiday_model->get_months();
		$data['page_title'] = lang('calendar');
		$data['body'] = 'holidays/list';
		$this->load->view('template/main', $data);	

	}	

function sortByOrder($a, $b) {
	if($a['DayOfMonth']>31){
	return ;
	}else{
  	  return $a['DayOfMonth'] - $b['DayOfMonth'];
	}
}

	
	function add_event(){
		//para agregar el evento necesito lo siguiente:
		// 1. Saber cuales son las empresas que el usuario puede ver
		// 2. Saber cuales son las empresas del usuario (ver tabla empresa_usuario)

		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			//$this->form_validation->set_rules('name', 'lang:name', 'required','please enter your name');
			$this->form_validation->set_message('required', lang('custom_required'));
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			$this->form_validation->set_rules('start_date', 'lang:date', 'required');
			$this->form_validation->set_message('required', '%s can not be blank');
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
				$save['start_date'] = $this->input->post('start_date');
				$save['end_date'] = $this->input->post('end_date');
				$save['description'] = $this->input->post('description'); 
				$save['type'] = $this->input->post('event_type');
				$this->holiday_model->save($save);
                $this->session->set_flashdata('message', lang('holiday saved'));
				redirect('admin/holidays');
			}
		}		
		
		
		$data['page_title'] = lang('add') . lang('holiday');
		$data['body'] = 'holidays/add';
		$data['event_types'] = $this->holiday_model->get_event_types();
		$data['empresas_visibles'] = $this->holiday_model->get_visible_companies();
		$data['mis_empresas'] = $this->holiday_model->get_companies();
		$data['sucursales'] = $this->holiday_model->get_branch_offices($data['mis_empresas']);
// $data['sucursales'] = $this->holiday_model->get_companies();
		
		$this->load->view('template/main', $data);	
	}	
	

	
	
	function delete($id=false){
		
		if($id){
			$this->holiday_model->delete($id);
			$this->session->set_flashdata('message',lang('holiday_deleted'));
			redirect('admin/holidays');
			
		}
	}


	function add_event_type(){
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			//$this->form_validation->set_rules('name', 'lang:name', 'required','please enter your name');
			$this->form_validation->set_message('required', lang('custom_required'));
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			// $this->form_validation->set_rules('start_date', 'lang:date', 'required');
			// $this->form_validation->set_message('required', '%s can not be blank');
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
				$save['company'] = $this->input->post('company');
				$save['periodic'] = $this->input->post('periodic');
				$save['status'] = $this->input->post('status');

				$this->holiday_model->save_event_type($save);
                $this->session->set_flashdata('message', lang('event_type_added'));
				redirect('admin/holidays');
			}
		}	



		
		$data['page_title'] = lang('add') . ' ' . lang('event') . ' ' . lang('type');
		$data['body'] = 'holidays/add_event_type';

		$this->load->view('template/main', $data);
		// $this->load->view('admin/holidays/fiscalevents');

	}		

	// function add_fiscal_event(){
		
	// 	$data['page_title'] = lang('add') . lang('fiscal_event');
	// 	$data['body'] = 'holidays/fiscalevent';

	// 	$this->load->view('template/main', $data);
	// 	// $this->load->view('admin/holidays/fiscalevents');

	// }	
		
	// function add_company_event(){
		
	// 	$data['page_title'] = lang('add') . lang('fiscal_event');
	// 	$data['body'] = 'holidays/companyevent';

	// 	$this->load->view('template/main', $data);
	// 	// $this->load->view('admin/holidays/fiscalevents');
	// }

	// function add_national_event(){
		
	// 	$data['page_title'] = lang('add') . lang('fiscal_event');
	// 	$data['body'] = 'holidays/nationalevent';

	// 	$this->load->view('template/main', $data);
	// 	// $this->load->view('admin/holidays/fiscalevents');
	// }
	
}
