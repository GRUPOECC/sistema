<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class message extends MX_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model("act_model");
		$this->load->model("clients_model");
		$this->load->model("message_model");
		
		//echo '<pre>'; print_r($this->settings);die;
	}
	
	
	function index(){
	//$this->auth->check_access('1', true);
		$data['clients'] = $this->message_model->get_all_clients();
		$data['entradas'] = $this->message_model->get_inbox();
		$data['salidas'] = $this->message_model->get_outbox();
		$data['page_title'] = lang('message');
		$data['body'] = 'message/list';
		$this->load->view('template/main', $data);	
	}	
	
	


	function send($id=false){
	     if ($id!=""){
		    $this->message_model->message_is_view_by_admin($id);
		    $data['client']		 = $this->message_model->get_client_by_id($id);
		    $data['messages'] 	 = $this->message_model->get_message_by_id($id);
		    $data['id'] =$id;
	    }
        $admin = $this->session->userdata('admin');
		
        if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
            if ($id==""){
            	$ids = $_POST['usuarios'];
            	for ($i=0;$i<count($ids);$i++)    
                {  
                	//Almacenando mensaje en base de datos:
                   $save['from_id'] = $admin['id'];
				   $save['to_id'] = $ids[$i];
				   $save['title'] = $this->input->post('titulo');
				   $save['type'] = $this->input->post('tipo');
				   $save['message'] = $this->input->post('message');
				   $save['is_view_to'] = 1;				   
			       $this->message_model->save_message($save);
			       //Enviando por correo electronico: 
                   $msg= html_entity_decode($save['message'],ENT_QUOTES, 'UTF-8');
				   mail($this->message_model->get_user_email($ids[$i]),"GECC - Tienes un mensaje de: ". $admin['name'],$msg);

                }  
                 $this->session->set_flashdata('message', 'Message Sent');
				 redirect('admin/message/index/');
           
            } else {
            

			$this->load->library('form_validation');
			$this->form_validation->set_rules('message', 'lang:message', 'required');
			$this->form_validation->set_message('required', lang('custom_required'));
			 
			if ($this->form_validation->run()==true)
            {
				$save['from_id'] = $admin['id'];
				$save['to_id'] = $id;
				$save['message'] = $this->input->post('message');
				$save['is_view_to'] = 1;
				
				$this->message_model->save_message($save);
				$msg= html_entity_decode($save['message'],ENT_QUOTES, 'UTF-8');
				mail($this->message_model->get_user_email($ids[$i]),"GECC - Tienes un mensaje de: ". $admin['name'],$msg);
				
				$this->session->set_flashdata('message', 'Message Sent');
				redirect('admin/message/send/'.$id);
				
			}
			
		  }
		}		
	
		$data['page_title'] = lang('send') . lang('message');
		$data['body'] = 'message/send';
		$this->load->view('template/main', $data);	

	}	
	
	function send_message($id=false){

        $admin = $this->session->userdata('admin');
		$access = $admin['user_role'];
		//echo $id;	
		//echo $admin['id'];die;
		$data['client'] = $this->message_model->get_client_by_id($id);
		$data['messages'] = $this->message_model->get_message_by_id($id);
		$data['count'] = $this->message_model->get_message_count_by_id();
		if($id != $admin['id']){
		 redirect('admin/dashboard');
		}
		$data['id'] = $admin['id'];
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('message', 'lang:message', 'required');
			$this->form_validation->set_message('required', lang('custom_required'));
			 
			if ($this->form_validation->run()==true)
            {
				$save['from_id'] = $admin['id'];
				$save['to_id'] = 1;
				$save['message'] = $this->input->post('message');
				$save['is_view_to'] = 1;
				$this->message_model->save_message($save);
               	$this->session->set_flashdata('message', lang('message_sent'));
				redirect('admin/message/send_message/'.$id);
				
			}
		}		
	
		$this->message_model->message_is_view_by_user();
		$data['page_title'] = lang('send') . lang('message');
		$data['body'] = 'message/send_message';
		$this->load->view('template/main', $data);	

	}	
	
	function delete($id=false){
		/*
		if($id){
			$this->act_model->delete($id);
			$this->session->set_flashdata('message',lang('message_deleted'));
			redirect('admin/act');
		}
		*/

		if($id){
			$this->message_model->delete($id);
			$this->session->set_flashdata('message',lang('message_deleted'));
			 redirect('admin/message/index/');
		}
	}	
		
	
}