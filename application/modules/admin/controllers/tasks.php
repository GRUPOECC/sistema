<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class tasks extends MX_Controller {

	public function __construct()
	{
		parent::__construct();
		//$this->auth->check_access('1', true);
		$this->load->model("message_model");
		$this->load->model("tasks_model");
		$this->load->model("user_role_model");
		$this->load->model("cases_model");
		$this->load->model("employees_model");
		$this->load->model("custom_field_model");
		$this->load->library('form_validation');
	}
	
	
	function index(){
		$data['tasks'] = $this->tasks_model->get_all();
		$data['page_title'] = lang('Tasks');
		$data['body'] = 'tasks/list';
		$tareas=$data['tasks'];
		$n=0;
		foreach ($tareas as $task) {
			$array=array($this->obtener_usuarios($task->id));
			if($n==0)
			$data['assigned_users']=$array;
			else
			$data['assigned_users']=array_merge($data['assigned_users'], $array);
		$n++;
		}					
		$this->load->view('template/main2', $data);	

	}	
	
	function my_tasks(){
		$data['tasks'] = $this->tasks_model->get_my_tasks();
		$data['page_title'] = lang('my_tasks');
		$data['body'] = 'tasks/my_tasks';
		$tareas=$data['tasks'];
		$n=0;
		foreach ($tareas as $task) {
			$array=array($this->obtener_usuarios($task->id));
			if($n==0)
			$data['assigned_users']=$array;
			else
			$data['assigned_users']=array_merge($data['assigned_users'], $array);
		$n++;
		}	
		$this->load->view('template/main2', $data);	

	}	
	
	function comments($id=false){
		$data['task'] = $this->tasks_model->get($id);
		$data['messages'] = $this->tasks_model->get_commnets_by_task($id);  //messages == comments
		if(isset($_GET['my_tasks'])){
			$data['my_tasks']	= "my_tasks=".$_GET['my_tasks'];
		}else{
			$data['my_tasks']	= '';
		}
		
		$data['id'] =$id;
        $admin = $this->session->userdata('admin');
		$email = $this->tasks_model->get_users_email($id);
		
        //echo '<pre>'; print_r($email_list );die;
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('message', 'lang:comment', 'required');
			$this->form_validation->set_message('required', lang('custom_required'));
			 
			if ($this->form_validation->run()==true)
            {
				$save['comment_by'] = $admin['id'];
				$save['task_id'] = $id;
				$save['comment'] = $this->input->post('message');
				$save['date_time'] = date("Y-m-d H:i:s");
				
				$idcomentario = $this->tasks_model->save_comment($save);
               	//Guardando registros de archivos adjuntos  - Garry Bruno
               	//--------------------Manejo de Archivos-----------------------
                $filesCount = count($_FILES['archivos']['name']);
                
                $data = array();
		        if($this->input->post('message') && !empty($_FILES['archivos']['name'])){	             
		                            
                    $target_path ='assets/uploads/comentarios/'.$idcomentario;
                    $carpeta = 'assets/uploads/comentarios/'.(string)$idcomentario;
                    if (!file_exists($carpeta)) {
                    mkdir($carpeta, 0777, true);
                    } 

		            $filesCount = count($_FILES['archivos']['name']);
		            for($i = 0; $i < $filesCount; $i++){
		                $_FILES['userFile']['name'] = $_FILES['archivos']['name'][$i];
		                $_FILES['userFile']['type'] = $_FILES['archivos']['type'][$i];
		                $_FILES['userFile']['tmp_name'] = $_FILES['archivos']['tmp_name'][$i];
		                $_FILES['userFile']['error'] = $_FILES['archivos']['error'][$i];
		                $_FILES['userFile']['size'] = $_FILES['archivos']['size'][$i];
                       
		               $uploadPath = 'assets/uploads/comentarios/'.(string)$idcomentario.'/'. basename( $_FILES['userFile']['name']);
		               if(move_uploaded_file($_FILES['userFile']['tmp_name'], $uploadPath)) {                                        
                                        $savefile['name'] = $_FILES['userFile']['name'];
                                        $savefile['location'] = $uploadPath; 
                                        $savefile['id_comment'] = $idcomentario; 
                                        $this->tasks_model->savefile($savefile);       
                              }else{
                                    rmdir ($carpeta);
                              }                   
		            }             
		        }
                //--------------------Manejo de Archivos-----------------------
                
                //--------------------Envio de Correo Electronico------------------------ 
                foreach($email as $new){
					$msg= html_entity_decode($save['comment'],ENT_QUOTES, 'UTF-8');
					mail($new->email,"GECC - Tienes un comentario de: ". $admin['name'],$msg);
		               }   
		        //------------------------------------------------------------------------  


				
				$this->session->set_flashdata('message', lang('comment_success'));
				redirect('admin/tasks/comments/'.$id);
				
				if(isset($_GET['my_tasks'])){

					redirect('admin/my_tasks/comments/'.$id);
				}else{

					redirect('admin/tasks/comments/'.$id);
				}
				
			}
		}		
	
		$data['page_title'] =  lang('comments');
		$data['body'] = 'tasks/comments';
		$this->load->view('template/main', $data);	

	}	

	function commentsOnly($id=false){
       	$data['task'] = $this->tasks_model->get($id);
		$data['messages'] = $this->tasks_model->get_commnets_by_task($id);  //messages == comments

		if(isset($_GET['my_tasks'])){
			$data['my_tasks']	= "my_tasks=".$_GET['my_tasks'];
		}else{
			$data['my_tasks']	= '';
		}
		
		$data['id'] =$id;
        $admin = $this->session->userdata('admin');
		$email = $this->tasks_model->get_users_email($id);
		
		foreach($email as $new){
			$email_list[] =  $new->email;
		}

        if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('message', 'lang:comment', 'required');
			$this->form_validation->set_message('required', lang('custom_required'));
			 
			if ($this->form_validation->run()==true)
            {
				$save['comment_by'] = $admin['id'];
				$save['task_id'] = $id;
				$save['comment'] = $this->input->post('message');
				$save['date_time'] = date("Y-m-d H:i:s");
				
				$idcomentario = $this->tasks_model->save_comment($save);
               	//Guardando registros de archivos adjuntos  - Garry Bruno
               	//--------------------Manejo de Archivos-----------------------
                $filesCount = count($_FILES['archivos']['name']);
                
                $data = array();
		        if($this->input->post('message') && !empty($_FILES['archivos']['name'])){	             
		                            
                    $target_path ='assets/uploads/comentarios/'.$idcomentario;
                    $carpeta = 'assets/uploads/comentarios/'.(string)$idcomentario;
                    if (!file_exists($carpeta)) {
                    mkdir($carpeta, 0777, true);
                    } 

		            $filesCount = count($_FILES['archivos']['name']);
		            for($i = 0; $i < $filesCount; $i++){
		                $_FILES['userFile']['name'] = $_FILES['archivos']['name'][$i];
		                $_FILES['userFile']['type'] = $_FILES['archivos']['type'][$i];
		                $_FILES['userFile']['tmp_name'] = $_FILES['archivos']['tmp_name'][$i];
		                $_FILES['userFile']['error'] = $_FILES['archivos']['error'][$i];
		                $_FILES['userFile']['size'] = $_FILES['archivos']['size'][$i];
                       
		               $uploadPath = 'assets/uploads/comentarios/'.(string)$idcomentario.'/'. basename( $_FILES['userFile']['name']);
		               if(move_uploaded_file($_FILES['userFile']['tmp_name'], $uploadPath)) {                                        
                                        $savefile['name'] = $_FILES['userFile']['name'];
                                        $savefile['location'] = $uploadPath; 
                                        $savefile['id_comment'] = $idcomentario; 
                                        $this->tasks_model->savefile($savefile);       
                              }else{
                                    rmdir ($carpeta);
                              }                   
		            }
		                   
		        }
                //--------------------Manejo de Archivos-----------------------

                //--------------------Envio de Correo Electronico------------------------ 
                foreach($email as $new){
					$msg= html_entity_decode($save['comment'],ENT_QUOTES, 'UTF-8');
					mail($new->email,"GECC - Tienes un comentario de: ". $admin['name'],$msg);
		               }   
		        //------------------------------------------------------------------------  



				$this->session->set_flashdata('message', lang('comment_success'));
				redirect('admin/tasks/commentsOnly/'.$id);
				
				if(isset($_GET['my_tasks'])){
                     echo '
                       <script type="text/javascript" language="Javascript">window.open("admin/my_tasks/comments/"+'.$id.');
                       </script>
                     '; 

					//redirect('admin/my_tasks/comments/'.$id);
				}else{
                    echo '
                       <script type="text/javascript" language="Javascript">window.open("admin/tasks/comments/"+'.$id.');
                       </script>
                     '; 
					//redirect('admin/tasks/comments/'.$id);
				}
				
			}
		}

        $data['body'] = 'tasks/comments2';
		$this->load->view('template/main3', $data);	

	}
	
	
	
	
	function add($id){
		$admin = $this->session->userdata('admin');
        $empresas = $this->employees_model->get_empresas_by_user($admin['id']);
		if ((sizeof($empresas)==1)||(isset($_POST['empresaseleccionada']))||(isset($_POST['name']))){ 
		$data['fields'] = $this->custom_field_model->get_custom_fields(7);	
		$data['roles'] = $this->user_role_model->get_all();
		if(isset($_POST['empresaseleccionada']))
		$data['employees'] = $this->tasks_model->get_all_employees($_POST['empresaseleccionada'],$admin['id']);
	    if(isset($_POST['empresa'])) 
	    $data['employees'] = $this->tasks_model->get_all_employees($_POST['empresa'],$admin['id']);
	    if (!(isset($_POST['empresa']))&&!(isset($_POST['empresaseleccionada'])))
	    $data['employees'] = $this->tasks_model->get_all_employees($this->employees_model->get_empresa_id($admin['id']),$admin['id']);
	    
		$data['cases'] = $this->cases_model->get_all();
		if(isset($_POST['empresaseleccionada']))
		$data['empresa'] = $_POST['empresaseleccionada'];
	    if (!(isset($_POST['empresa']))&&!(isset($_POST['empresaseleccionada'])))
	    $data['empresa'] = $this->employees_model->get_empresa_id($admin['id']);	

		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			 //echo '<pre>'; print_r($_POST);die;
        	if(!isset($_POST['empresaseleccionada'])){

			$this->load->library('form_validation');
			$this->form_validation->set_message('required', lang('custom_required'));
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			$this->form_validation->set_rules('due_date', 'lang:due_date', '');
            $this->form_validation->set_rules('priority', 'lang:priority', 'required');
			$this->form_validation->set_rules('case_id', 'lang:case', '');
			$this->form_validation->set_rules('employee_id', 'lang:employee', 'required');
			$this->form_validation->set_rules('description', 'lang:employee', '');
			
           
			if ($this->form_validation->run()==true)
            {
			
				$save['name'] = $this->input->post('name');
				$save['priority'] = $this->input->post('priority');
				$save['due_date'] = $this->input->post('due_date');
				$save['case_id'] = $this->input->post('case_id');
				$save['progress'] = $this->input->post('progress');
				$save['description'] = $this->input->post('description');
				$save['created_by'] = $this->session->userdata('admin')['id'];
				$save['id_empresa'] = $this->input->post('empresa');
			    
				$task_id = $this->tasks_model->save($save);
                 // $url =base_url('assets/uploads/tareas/');
				$target_path ='assets/uploads/tareas/'.$task_id;
                $carpeta = 'assets/uploads/tareas/'.(string)$task_id;
                if (!file_exists($carpeta)) {
                    mkdir($carpeta, 0777, true);
                }

                
               	//Guardando registros de archivos adjuntos  - Garry Bruno
                $filesCount = count($_FILES['archivos']['name']);
                $data = array();
		        if($this->input->post('name') && !empty($_FILES['archivos']['name'])){	             
		            $filesCount = count($_FILES['archivos']['name']);
		            for($i = 0; $i < $filesCount; $i++){
		                $_FILES['userFile']['name'] = $_FILES['archivos']['name'][$i];
		                $_FILES['userFile']['type'] = $_FILES['archivos']['type'][$i];
		                $_FILES['userFile']['tmp_name'] = $_FILES['archivos']['tmp_name'][$i];
		                $_FILES['userFile']['error'] = $_FILES['archivos']['error'][$i];
		                $_FILES['userFile']['size'] = $_FILES['archivos']['size'][$i];
                       
		               $uploadPath = 'assets/uploads/tareas/'.(string)$task_id.'/'. basename( $_FILES['userFile']['name']);
		               if(move_uploaded_file($_FILES['userFile']['tmp_name'], $uploadPath)) {                                        
                                        $savefile['name'] = $_FILES['userFile']['name'];
                                        $savefile['location'] = $uploadPath; 
                                        $savefile['id_task'] = $task_id; 
                                        $this->tasks_model->savefile($savefile);       

                              }                   
		            }
		                   
		        }

				
				//echo '<pre>'; print_r($save);die;
				$save_user_tasks=array();
			    foreach($this->input->post('employee_id') as $new){
					$save_user_tasks[] = array('user_id' =>$new,'task_id' =>$task_id);
					$msg= html_entity_decode($save['description'],ENT_QUOTES, 'UTF-8');
				    mail($this->message_model->get_user_email($new),"GECC - Tienes una tarea de: ". $admin['name'],$msg);
				
				}
				
				$reply = $this->input->post('reply');
				if(!empty($reply)){
					foreach($this->input->post('reply') as $key => $val) {
						$save_fields[] = array(
							'custom_field_id'=> $key,
							'reply'=> $val,
							'table_id'=> $task_id,
							'form'=> 6,
						);	
					
					}	
					$this->custom_field_model->save_answer($save_fields);
				}
				//echo '<pre>'; print_r($save_user_tasks);die;
				$this->tasks_model->save_assigned_tasks($save_user_tasks);
				
				$this->session->set_flashdata('message', lang('tasks_saved'));
				redirect('admin/tasks');
			}

		}
			
		}		
		$data['page_title'] = lang('add') . lang('task');
		$data['body'] = 'tasks/add';
		$this->load->view('template/main', $data);
		}else{
		     $data['empresas'] = $empresas; 
             $data['page_title'] = lang('add') . lang('task');
		     $data['body'] = 'tasks/seleccionarempresa';
		     $this->load->view('template/main', $data);
			
		}	
	}	
	
	function edit($id){
        $admin = $this->session->userdata('admin');
        $empresas = $this->employees_model->get_empresas_by_user($admin['id']);
        if ((sizeof($empresas)<=1)||(isset($_POST['empresaseleccionada']))||(isset($_POST['name']))){ 
		$data['fields'] = $this->custom_field_model->get_custom_fields(7);	
		$data['roles'] = $this->user_role_model->get_all();
		if(isset($_POST['empresaseleccionada']))
		$data['employees'] = $this->tasks_model->get_all_employees($_POST['empresaseleccionada'],$admin['id']);
	    if(isset($_POST['empresa'])) 
	    $data['employees'] = $this->tasks_model->get_all_employees($_POST['empresa'],$admin['id']);
	    if (!(isset($_POST['empresa']))&&!(isset($_POST['empresaseleccionada'])))
	    $data['employees'] = $this->tasks_model->get_all_employees($this->employees_model->get_empresa_id($admin['id']),$admin['id']);
		$data['cases'] = $this->cases_model->get_all();
		if(isset($_POST['empresaseleccionada']))
		$data['empresa'] = $_POST['empresaseleccionada'];
	    if (!(isset($_POST['empresa']))&&!(isset($_POST['empresaseleccionada'])))
	    $data['empresa'] = $this->employees_model->get_empresa_id($admin['id']);	
	
	    $data['assigned_users'] = $this->tasks_model->get_assigned_user($id);
	    $data['task'] = $this->tasks_model->get($id);
		$data['files'] = $this->tasks_model->get_files($id);
		$data['id'] = $id;

		if(isset($_GET['my_tasks'])){
			$data['my_tasks']	= "my_tasks=".$_GET['my_tasks'];
		}else{
			$data['my_tasks']	= '';
		}
			
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			 //echo '<pre>'; print_r($_POST);die;
        	if(!isset($_POST['empresaseleccionada'])){
			$this->load->library('form_validation');
			$this->form_validation->set_message('required', lang('custom_required'));
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			$this->form_validation->set_rules('due_date', 'lang:due_date', '');
            $this->form_validation->set_rules('priority', 'lang:priority', 'required');
			$this->form_validation->set_rules('case_id', 'lang:case', '');
			$this->form_validation->set_rules('employee_id', 'lang:employee', 'required');
			$this->form_validation->set_rules('description', 'lang:employee', '');
			
           
			if ($this->form_validation->run()==true)
            {
			
				$save['name'] = $this->input->post('name');
				$save['priority'] = $this->input->post('priority');
				$save['due_date'] = $this->input->post('due_date');
				$save['case_id'] = $this->input->post('case_id');
				$save['progress'] = $this->input->post('progress');
				$save['description'] = $this->input->post('description');
			    
				$this->tasks_model->update($save,$id);
				//echo '<pre>'; print_r($save);die;

                // $url =base_url('assets/uploads/tareas/');
				$target_path ='assets/uploads/tareas/';
                
               	//Guardando registros de archivos adjuntos  - Garry Bruno
                $filesCount = count($_FILES['archivos']['name']);
                $data = array();
		        if($this->input->post('name') && !empty($_FILES['archivos']['name'])){	             
		            $filesCount = count($_FILES['archivos']['name']);
		            for($i = 0; $i < $filesCount; $i++){
		                $_FILES['userFile']['name'] = $_FILES['archivos']['name'][$i];
		                $_FILES['userFile']['type'] = $_FILES['archivos']['type'][$i];
		                $_FILES['userFile']['tmp_name'] = $_FILES['archivos']['tmp_name'][$i];
		                $_FILES['userFile']['error'] = $_FILES['archivos']['error'][$i];
		                $_FILES['userFile']['size'] = $_FILES['archivos']['size'][$i];
                       
		               $uploadPath = 'assets/uploads/tareas/'.(string)$id.'/'. basename( $_FILES['userFile']['name']);
		               if(move_uploaded_file($_FILES['userFile']['tmp_name'], $uploadPath)) { 
                                        $savefile['name'] = $_FILES['userFile']['name'];
                                        $savefile['location'] = $uploadPath; 
                                        $savefile['id_task'] = $id; 
                                        $this->tasks_model->savefile($savefile);       

                              }                   
		            }
		                   
		        }

				$save_user_tasks=array();
				$eids  = $this->input->post('employee_id');
			   if(!empty($eids)){
					foreach($this->input->post('employee_id') as $new){
						$save_user_tasks[] = array(
												'user_id' =>$new,
												'task_id' =>$id
												);
					
					}
				}				
				$reply  = $this->input->post('reply');
				if(!empty($reply)){
					foreach($this->input->post('reply') as $key => $val) {
						$save_fields[] = array(
							'custom_field_id'=> $key,
							'reply'=> $val,
							'table_id'=> $id,
							'form'=> 7,
						);	
					
					}	
					$this->custom_field_model->delete_answer($id,$form=1);
					$this->custom_field_model->save_answer($save_fields);
				}
				//echo '<pre>'; print_r($save_user_tasks);die;
				$this->tasks_model->delete_assigned_tasks($id);
				$this->tasks_model->save_assigned_tasks($save_user_tasks);
				
				$this->session->set_flashdata('message', lang('tasks_updated'));
				if(isset($_GET['my_tasks'])){
					redirect('admin/tasks/my_tasks');
				}else{
					redirect('admin/tasks');
				}

			}	
		}
		}	
		$data['page_title'] = lang('edit') . lang('task');
		$data['body'] = 'tasks/edit';
		$this->load->view('template/main', $data);	
	    
	    }else{
		     $data['empresas'] = $empresas; 
             $data['page_title'] = lang('add') . lang('task');
		     $data['body'] = 'tasks/editarempresa';
		     $data['idtarea'] = $id; 
		     $this->load->view('template/main', $data);		
		}	
	}	
	

    function view($id){
		$admin = $this->session->userdata('admin');

		$data['fields'] = $this->custom_field_model->get_custom_fields(7);	
		$data['roles'] = $this->user_role_model->get_all();
		$data['task'] = $this->tasks_model->get($id);
		$data['employees'] = $this->tasks_model->get_all_employeesTask($data['task'],$admin['id']);
		$data['assigned_users'] = $this->tasks_model->get_assigned_user($id);
		$data['cases'] = $this->cases_model->get_all();
		$data['files'] = $this->tasks_model->get_files($id);
		$data['page_title'] = lang('view') . lang('task');
		$data['body'] = 'tasks/view';
		$this->load->view('template/main', $data);	
	}


	function delete($id=false){
		
		if (is_int($id)){ 
		if($id){
			$this->tasks_model->delete($id);
			//$this->tasks_model->delete_assigned_tasks($id);
			$this->session->set_flashdata('message',lang('tasks_deleted'));
			if(isset($_GET['my_tasks'])){
					redirect('admin/tasks/my_tasks');
				}else{
					redirect('admin/tasks');
				}
		}
	   }else{
          $ids = explode("-",$id);
          $i=0; 
          while($i<count($ids)){
            $this->tasks_model->delete($ids[$i]);
          	$i++;
          } 
           if(isset($_GET['my_tasks'])){
					redirect('admin/tasks/my_tasks');
				}else{
					redirect('admin/tasks');
				}

	   }
	}	

	function deleteMytask($id=false){
        if (is_int($id)){ 
		if($id){
			$this->tasks_model->delete($id);
			//$this->tasks_model->delete_assigned_tasks($id);
			$this->session->set_flashdata('message',lang('tasks_deleted'));
					redirect('admin/tasks/my_tasks');
		}
	   }else{
          $ids = explode("-",$id);
          $i=0; 
          while($i<count($ids)){
            $this->tasks_model->delete($ids[$i]);
          	$i++;
          } 
			redirect('admin/tasks/my_tasks');
	   }
      

	}

	function deleteFile($id=false){
		session_start();
		$seleccionado = explode("-",$id); 
        $idarchivo = $seleccionado[1];
		$datos = explode("%",$_SESSION["Archivos"]);
        $direccion = $datos[(int)$idarchivo]; 
        unlink ($direccion); 
        $this->tasks_model->deleteFile($seleccionado[2]);
        redirect('admin/tasks/edit/'.$id);
	} 

	function obtener_usuarios($id){
		foreach ($this->tasks_model->get_usuarios_asignados($id) as $key ) {
			$usuarios->name.=",".$key->name;
			$usuarios->id=$key->id_tarea;
		}
		$usuarios->name=substr($usuarios->name, 1);
		return $usuarios;
	}
	
}