<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class parrillas extends MX_Controller {

	public function __construct()
	{
		parent::__construct();
		//$this->auth->check_access('1', true);
		$this->load->model("parrillas_model");
		$this->load->model("custom_field_model");
		
	}
	
	
	function index(){
		$data['parrillas'] = $this->parrillas_model->get_all();
		$data['page_title'] =  lang('parrillas');
		$data['body'] = 'parrillas/list';
		$this->load->view('/template/main', $data);	
	}	
	
	function view_all(){
		$data['parrillas'] = $this->parrillas_model->get_parrilla_by_date();
		$ids='';
		foreach($data['parrillas'] as $ind => $key){
		
			$ids[]=$key->id;
		}
		$this->parrillas_model->parrillas_view_by_admin($ids);
		$data['page_title'] = lang('view_all') . lang('parrillas');
		$data['body'] = 'parrillas/view_all';
		$this->load->view('template/main', $data);	
	}	
	
	function add(){
		$data['contact_fields'] = $this->custom_field_model->get_custom_fields(4);	
		$data['fields'] = $this->custom_field_model->get_custom_fields(5);	
		$data['medios'] = $this->parrillas_model->get_medios();
		$data['campanas'] = $this ->parrillas_model->get_campanas();
		$data['pilares'] = $this ->parrillas_model->get_pilares();
		//$data['pilares'] = $this ->parrillas_model->get_pilares_cliente();
		$data['clientes'] = $this->parrillas_model->get_user();
		$data['agentes'] = $this->parrillas_model->get_agentes();
		if ($this->input->post('ok'))
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('cliente_id', 'lang:Cliente', 'required');
			$this->form_validation->set_rules('pilar_id', 'lang:Pilar', 'required');
			$this->form_validation->set_rules('medio_id', 'lang:Medio', 'required');
			$this->form_validation->set_rules('campana_id', 'lang:Campana', 'required');
			$this->form_validation->set_rules('copy', 'lang:Copy', 'required');
			$this->form_validation->set_rules('fecha_pub', 'lang:Fecha_pub', 'required');
			$this->form_validation->set_rules('etiquetas', 'lang:Etiquetas', 'required');
			$this->form_validation->set_message('required', lang('custom_required'));
			 
			if ($this->form_validation->run()==true)
            {
				$save['cliente_id'] = $this->input->post('cliente_id');
				$save['pilar_id'] = $this->input->post('pilar_id');
				$save['medio_id'] = $this->input->post('medio_id');
				$save['campana_id'] = $this->input->post('campana_id');
				$save['copy'] = $this->input->post('copy');
				$save['fecha_pub'] = $this->input->post('fecha_pub');
				$save['etiquetas'] = $this->input->post('etiquetas');
				$save['agente'] = $this->input->post('agente');
				$p_key = $this->parrillas_model->save($save);
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
               	$this->session->set_flashdata('message', lang('parrilla_created'));
				redirect('publi/parrillas');
				
				
			}
		}		
		
		
		$data['page_title'] = lang('add') . lang('Visitor');
		$data['body'] = 'parrillas/add';
		
		$this->load->view('template/main', $data);	
	}	
	
	
	function edit($id=false){
		$data['fields'] = $this->custom_field_model->get_custom_fields(5);	
		$data['contacts'] = $this->parrillas_model->get_contacts();
		$data['parrilla'] = $this->parrillas_model->get_parrilla_by_id($id);
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
                
				$this->parrillas_model->update($save,$id);
				
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
               	$this->session->set_flashdata('message',lang('parrilla_updated'));
				redirect('publi/parrillas');
				
				
			}
			
		}			
	
		$data['page_title'] = lang('edit') . lang('parrilla');
		$data['body'] = 'parrillas/edit';
		$this->load->view('template/main', $data);	

	}
	
	function view_parrilla($id=false){
		$data['fields'] = $this->custom_field_model->get_custom_fields(5);	
		$data['contacts'] = $this->parrillas_model->get_contacts();
		$data['parrilla'] = $data['clients'] = $this->parrillas_model->get_parrilla_by_id($id);
		$data['id'] =$id;
		$this->parrillas_model->parrilla_view_by_admin($id);
		$data['page_title'] = lang('view') . lang('parrilla');
		$data['body'] = 'parrillas/view';
		$this->load->view('template/main', $data);	

	}	
	
	function delete($id=false){
		
		if($id){
			$this->parrillas_model->delete($id);
			$this->session->set_flashdata('message',lang('parrilla_deleted'));
			redirect('publi/parrillas');
		}
	}	

	function close ($id=false){
		if($id){
			$this->parrillas_model->set_time_out($id);
			$badge=$this->parrillas_model->get_parrilla_badge($id);
			$this->parrillas_model->update_badge_out($badge[0]->badge);
			redirect('publi/parrillas');
		}

	}
	
}