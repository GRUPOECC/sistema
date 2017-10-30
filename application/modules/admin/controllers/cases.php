<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class cases extends MX_Controller {

	public function __construct()
	{
		parent::__construct();
		
		//$this->auth->check_access('1', true);
		
		$this->load->model("cases_model");
		$this->load->model("tax_model");
		$this->load->model("employees_model");
		$this->load->model("department_model");
		$this->load->model("location_model");
		$this->load->model("case_stage_model");
		$this->load->model("case_category_model");
		$this->load->model("custom_field_model");
		
	}
	
	
	function index(){
		
		$data['cases'] = $this->cases_model->get_all();
		$data['depts'] = $this->cases_model->get_all_depts();
		$data['depts_cats'] = $this->cases_model->get_all_depts_cats();
		$data['clients'] = $this->cases_model->get_all_clients();
		$data['locations'] = $this->location_model->get_all();
		$data['stages'] = $this->case_stage_model->get_all();
		$data['page_title'] = lang('case');
		$data['body'] = 'case/list';
		$this->load->view('template/main2', $data);	
	}
	
    function publications($id=false){
       	$data['case'] = $this->cases_model->get_case_by_id($id);
		$data['messages'] = $this->cases_model->get_commnets_by_case($id);  //messages == comments
		$data['id'] =$id;
        $admin = $this->session->userdata('admin');
		//$email = $this->cases_model->get_users_email($id);
		
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
				$save['created_by'] = $admin['id'];
				$save['case_id'] = $id;
				$save['mensaje'] = $this->input->post('message');
				$save['date_time'] = date("Y-m-d H:i:s");
				
				$idcomentario = $this->cases_model->save_publication($save);
               	//Guardando registros de archivos adjuntos  - Garry Bruno
               	//--------------------Manejo de Archivos-----------------------
                $filesCount = count($_FILES['archivos']['name']);
                
                $data = array();
		        if($this->input->post('message') && !empty($_FILES['archivos']['name'])){	             
		                            
                    $target_path ='assets/uploads/tickets/'.$id.'/'.(string)$idcomentario;
                    $carpeta = 'assets/uploads/tickets/'.$id.'/'.(string)$idcomentario;
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
                       
		               $uploadPath = 'assets/uploads/tickets/'.$id.'/'.(string)$idcomentario.'/'. basename( $_FILES['userFile']['name']);
		               if(move_uploaded_file($_FILES['userFile']['tmp_name'], $uploadPath)) {                                        
                                        $savefile['name'] = $_FILES['userFile']['name'];
                                        $savefile['location'] = $uploadPath; 
                                        $savefile['id_publicacion'] = $idcomentario; 
                                        $this->cases_model->savefile($savefile);       
                              }else{
                                    rmdir ($carpeta);
                              }                   
		            }
		                   
		        }
                //--------------------Manejo de Archivos-----------------------

                //--------------------Envio de Correo Electronico------------------------ 
               /* foreach($email as $new){
					$msg= html_entity_decode($save['mensaje'],ENT_QUOTES, 'UTF-8');
					mail($new->email,"GECC - Tienes una publicacion de: ". $admin['name'],$msg);
		               }   
		        */
		        //------------------------------------------------------------------------  



				$this->session->set_flashdata('message', lang('comment_success'));
				redirect('admin/cases/publications/'.$id);
				
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
		

        $data['body'] = 'case/publications';
		$this->load->view('template/main3', $data);	

	}
	
	function get_case_by_client(){
		$cases = $this->cases_model->get_cases_by_client_id($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                        <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('client').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				   		if(isset($cases)):
                     echo '   
						<tbody>
                            ';
							 $i=1;foreach ($cases as $new){
							 
							 echo '
                                <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
									
								'; if($new->is_starred==0){ 
								echo '
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
								echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>
								';
									}
									
								echo'	</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									
                                    <td width="47%">
										<a class="btn btn-default"  href="'.site_url('admin/cases/view_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										<a class="btn btn-info"  href="'.site_url('admin/cases/fees/'.$new->id).'"><i class="fa fa-inr"></i> '.lang('fees').'</a>	
                                      	<a class="btn btn-success"  href="'.site_url('admin/cases/dates/'.$new->id).'"><i class="fa fa-calendar"></i> '.lang('hearing_date').'</a>							
                                        <a class="btn btn-primary"  href="'.site_url('admin/cases/edit/'.$new->id) .'"><i class="fa fa-edit"></i> '.lang('edit').'</a>
										<a class="btn btn-warning"  href="'.site_url('admin/cases/archived/'.$new->id).'"><i class="fa fa-close"></i> '.lang('archived').'</a>
                                    </td>
                                </tr>
							';	
                              $i++;}
					echo '		  
                        </tbody>';
                        endif;
                    
				echo '</table>';
					
		
	}
	
	function get_case_by_client_starred(){
		$cases = $this->cases_model->get_cases_by_client_id_starred($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                        <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('client').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				   		if(isset($cases)):
                     echo '   
						<tbody>
                            ';
							 $i=1;foreach ($cases as $new){
							 
							 echo '
                                <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
									
								'; if($new->is_starred==0){ 
								echo '
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
								echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>
								';
									}
									
								echo'	</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									
                                    <td width="47%">
										<a class="btn btn-default"  href="'.site_url('admin/cases/view_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										<a class="btn btn-info"  href="'.site_url('admin/cases/fees/'.$new->id).'"><i class="fa fa-inr"></i> '.lang('fees').'</a>	
                                      	<a class="btn btn-success"  href="'.site_url('admin/cases/dates/'.$new->id).'"><i class="fa fa-calendar"></i> '.lang('hearing_date').'</a>							
                                        <a class="btn btn-primary"  href="'.site_url('admin/cases/edit/'.$new->id) .'"><i class="fa fa-edit"></i> '.lang('edit').'</a>
										<a class="btn btn-warning"  href="'.site_url('admin/cases/archived/'.$new->id).'"><i class="fa fa-close"></i> '.lang('archived').'</a>
                                    </td>
                                </tr>
							';	
                              $i++;}
					echo '		  
                        </tbody>';
                        endif;
                    
				echo '</table>';
					
		
	}	
	
	
	
	function get_case_by_dept(){
		$cases = $this->cases_model->get_cases_by_dept_id($_POST['id']);
	
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                         <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('client').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                   ';
				   		if(isset($cases)):
                     echo '   
						<tbody>
                            ';
							 $i=1;foreach ($cases as $new){
							 
							 echo '
                                <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
									
								'; if($new->is_starred==0){ 
								echo '
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
								echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>
								';
									}
									
								echo'	</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									
                                    <td width="47%">
										<a class="btn btn-default"  href="'.site_url('admin/cases/view_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										<a class="btn btn-info"  href="'.site_url('admin/cases/fees/'.$new->id).'"><i class="fa fa-inr"></i> '.lang('fees').'</a>	
                                      	<a class="btn btn-success"  href="'.site_url('admin/cases/dates/'.$new->id).'"><i class="fa fa-calendar"></i> '.lang('hearing_date').'</a>							
                                        <a class="btn btn-primary"  href="'.site_url('admin/cases/edit/'.$new->id) .'"><i class="fa fa-edit"></i> '.lang('edit').'</a>
										<a class="btn btn-warning"  href="'.site_url('admin/cases/archived/'.$new->id).'"><i class="fa fa-close"></i> '.lang('archived').'</a>
                                    </td>
                                </tr>
							';	
                              $i++;}
					echo '		  
                        </tbody>';
                        endif;
                    
				echo '</table>';
					
		
	}

	function get_case_by_dept_starred(){
		$cases = $this->cases_model->get_cases_by_dept_id_starred($_POST['id']);
	
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                         <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('client').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				   		if(isset($cases)):
                     echo '   
						<tbody>
                            ';
							 $i=1;foreach ($cases as $new){
							 
							 echo '
                                <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
									
								'; if($new->is_starred==0){ 
								echo '
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
								echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>
								';
									}
									
								echo'	</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									
                                    <td width="47%">
										<a class="btn btn-default"  href="'.site_url('admin/cases/view_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										<a class="btn btn-info"  href="'.site_url('admin/cases/fees/'.$new->id).'"><i class="fa fa-inr"></i> '.lang('fees').'</a>	
                                      	<a class="btn btn-success"  href="'.site_url('admin/cases/dates/'.$new->id).'"><i class="fa fa-calendar"></i> '.lang('hearing_date').'</a>							
                                        <a class="btn btn-primary"  href="'.site_url('admin/cases/edit/'.$new->id) .'"><i class="fa fa-edit"></i> '.lang('edit').'</a>
										<a class="btn btn-warning"  href="'.site_url('admin/cases/archived/'.$new->id).'"><i class="fa fa-close"></i> '.lang('archived').'</a>
                                    </td>
                                </tr>
							';	
                              $i++;}
					echo '		  
                        </tbody>';
                        endif;
                    
				echo '</table>';
					
		
	}

	

	function get_case_by_location(){
		$cases = $this->cases_model->get_cases_by_location_id($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                         <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('client').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				   		if(isset($cases)):
                     echo '   
						<tbody>
                            ';
							 $i=1;foreach ($cases as $new){
							 
							 echo '
                                <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
									
								'; if($new->is_starred==0){ 
								echo '
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
								echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>
								';
									}
									
								echo'	</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									
                                    <td width="47%">
										<a class="btn btn-default"  href="'.site_url('admin/cases/view_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										<a class="btn btn-info"  href="'.site_url('admin/cases/fees/'.$new->id).'"><i class="fa fa-inr"></i> '.lang('fees').'</a>	
                                      	<a class="btn btn-success"  href="'.site_url('admin/cases/dates/'.$new->id).'"><i class="fa fa-calendar"></i> '.lang('hearing_date').'</a>							
                                        <a class="btn btn-primary"  href="'.site_url('admin/cases/edit/'.$new->id) .'"><i class="fa fa-edit"></i> '.lang('edit').'</a>
										<a class="btn btn-warning"  href="'.site_url('admin/cases/archived/'.$new->id).'"><i class="fa fa-close"></i> '.lang('archived').'</a>
                                    </td>
                                </tr>
							';	
                              $i++;}
					echo '		  
                        </tbody>';
                        endif;
                    
				echo '</table>';
					
		
	}

	function get_case_by_location_starred(){
		$cases = $this->cases_model->get_cases_by_location_id_starred($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                         <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('client').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				   		if(isset($cases)):
                     echo '   
						<tbody>
                            ';
							 $i=1;foreach ($cases as $new){
							 
							 echo '
                                <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
									
								'; if($new->is_starred==0){ 
								echo '
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
								echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>
								';
									}
									
								echo'	</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									
                                    <td width="47%">
										<a class="btn btn-default"  href="'.site_url('admin/cases/view_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										<a class="btn btn-info"  href="'.site_url('admin/cases/fees/'.$new->id).'"><i class="fa fa-inr"></i> '.lang('fees').'</a>	
                                      	<a class="btn btn-success"  href="'.site_url('admin/cases/dates/'.$new->id).'"><i class="fa fa-calendar"></i> '.lang('hearing_date').'</a>							
                                        <a class="btn btn-primary"  href="'.site_url('admin/cases/edit/'.$new->id) .'"><i class="fa fa-edit"></i> '.lang('edit').'</a>
										<a class="btn btn-warning"  href="'.site_url('admin/cases/archived/'.$new->id).'"><i class="fa fa-close"></i> '.lang('archived').'</a>
                                    </td>
                                </tr>
							';	
                              $i++;}
					echo '		  
                        </tbody>';
                        endif;
                    
				echo '</table>';
					
		
	}


	function get_case_by_case_stage_id(){
		$cases = $this->cases_model->get_cases_by_case_stage_id($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                         <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('client').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				   		if(isset($cases)):
                     echo '   
						<tbody>
                            ';
							 $i=1;foreach ($cases as $new){
							 
							 echo '
                                <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
									
								'; if($new->is_starred==0){ 
								echo '
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
								echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>
								';
									}
									
								echo'	</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									
                                    <td width="47%">
										<a class="btn btn-default"  href="'.site_url('admin/cases/view_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										<a class="btn btn-info"  href="'.site_url('admin/cases/fees/'.$new->id).'"><i class="fa fa-inr"></i> '.lang('fees').'</a>	
                                      	<a class="btn btn-success"  href="'.site_url('admin/cases/dates/'.$new->id).'"><i class="fa fa-calendar"></i> '.lang('hearing_date').'</a>							
                                        <a class="btn btn-primary"  href="'.site_url('admin/cases/edit/'.$new->id) .'"><i class="fa fa-edit"></i> '.lang('edit').'</a>
										<a class="btn btn-warning"  href="'.site_url('admin/cases/archived/'.$new->id).'"><i class="fa fa-close"></i> '.lang('archived').'</a>
                                    </td>
                                </tr>
							';	
                              $i++;}
					echo '		  
                        </tbody>';
                        endif;
                    
				echo '</table>';
					
		
	}

	function get_case_by_case_stage_id_starred(){
		$cases = $this->cases_model->get_cases_by_case_stage_id_starred($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                         <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('client').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				   		if(isset($cases)):
                     echo '   
						<tbody>
                            ';
							 $i=1;foreach ($cases as $new){
							 
							 echo '
                                <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
									
								'; if($new->is_starred==0){ 
								echo '
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
								echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>
								';
									}
									
								echo'	</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									
                                    <td width="47%">
										<a class="btn btn-default"  href="'.site_url('admin/cases/view_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										<a class="btn btn-info"  href="'.site_url('admin/cases/fees/'.$new->id).'"><i class="fa fa-inr"></i> '.lang('fees').'</a>	
                                      	<a class="btn btn-success"  href="'.site_url('admin/cases/dates/'.$new->id).'"><i class="fa fa-calendar"></i> '.lang('hearing_date').'</a>							
                                        <a class="btn btn-primary"  href="'.site_url('admin/cases/edit/'.$new->id) .'"><i class="fa fa-edit"></i> '.lang('edit').'</a>
										<a class="btn btn-warning"  href="'.site_url('admin/cases/archived/'.$new->id).'"><i class="fa fa-close"></i> '.lang('archived').'</a>
                                    </td>
                                </tr>
							';	
                              $i++;}
					echo '		  
                        </tbody>';
                        endif;
                    
				echo '</table>';
					
		
	}


	function get_case_by_case_filing_date(){
		$cases = $this->cases_model->get_cases_by_filing_date($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                         <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('client').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				   		if(isset($cases)):
                    	 echo '   
						<tbody>
                            ';
							 $i=1;foreach ($cases as $new){
							 
							 echo '
                                <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
									
								'; if($new->is_starred==0){ 
								echo '
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
								echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>
								';
									}
									
								echo'	</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									
                                    <td width="47%">
										<a class="btn btn-default"  href="'.site_url('admin/cases/view_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										<a class="btn btn-info"  href="'.site_url('admin/cases/fees/'.$new->id).'"><i class="fa fa-inr"></i> '.lang('fees').'</a>	
                                      	<a class="btn btn-success"  href="'.site_url('admin/cases/dates/'.$new->id).'"><i class="fa fa-calendar"></i> '.lang('hearing_date').'</a>							
                                        <a class="btn btn-primary"  href="'.site_url('admin/cases/edit/'.$new->id) .'"><i class="fa fa-edit"></i> '.lang('edit').'</a>
										<a class="btn btn-warning"  href="'.site_url('admin/cases/archived/'.$new->id).'"><i class="fa fa-close"></i> '.lang('archived').'</a>
                                    </td>
                                </tr>
							';	
                              $i++;}
						echo '		  
                        </tbody>';
                        endif;
                    
				echo '</table>';
					
		
	}

	function get_case_by_case_filing_date_starred(){
		$cases = $this->cases_model->get_cases_by_filing_date_starred($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                         <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('client').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                   ';
				   		if(isset($cases)):
                    	 echo '   
						<tbody>
                            ';
							 $i=1;foreach ($cases as $new){
							 
							 echo '
                                <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
									
								'; if($new->is_starred==0){ 
								echo '
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
								echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>
								';
									}
									
								echo'	</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									
                                   <td width="47%">
										<a class="btn btn-default"  href="'.site_url('admin/cases/view_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										<a class="btn btn-info"  href="'.site_url('admin/cases/fees/'.$new->id).'"><i class="fa fa-inr"></i> '.lang('fees').'</a>	
                                      	<a class="btn btn-success"  href="'.site_url('admin/cases/dates/'.$new->id).'"><i class="fa fa-calendar"></i> '.lang('hearing_date').'</a>							
                                        <a class="btn btn-primary"  href="'.site_url('admin/cases/edit/'.$new->id) .'"><i class="fa fa-edit"></i> '.lang('edit').'</a>
										<a class="btn btn-warning"  href="'.site_url('admin/cases/archived/'.$new->id).'"><i class="fa fa-close"></i> '.lang('archived').'</a>
                                    </td>
                                </tr>
							';	
                              $i++;}
						echo '		  
                        </tbody>';
                        endif;
                    
				echo '</table>';
					
		
	}


	function get_case_by_case_hearing_date(){
		$cases = $this->cases_model->get_cases_by_hearing_date($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                         <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('client').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				   		if(isset($cases)):
                     echo '   
						<tbody>
                            ';
							 $i=1;foreach ($cases as $new){
							 
							 echo '
                                <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
									
								'; if($new->is_starred==0){ 
								echo '
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
								echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>
								';
									}
									
								echo'	</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									
                                    <td width="47%">
										<a class="btn btn-default"  href="'.site_url('admin/cases/view_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										<a class="btn btn-info"  href="'.site_url('admin/cases/fees/'.$new->id).'"><i class="fa fa-inr"></i> '.lang('fees').'</a>	
                                      	<a class="btn btn-success"  href="'.site_url('admin/cases/dates/'.$new->id).'"><i class="fa fa-calendar"></i> '.lang('hearing_date').'</a>							
                                        <a class="btn btn-primary"  href="'.site_url('admin/cases/edit/'.$new->id) .'"><i class="fa fa-edit"></i> '.lang('edit').'</a>
										<a class="btn btn-warning"  href="'.site_url('admin/cases/archived/'.$new->id).'"><i class="fa fa-close"></i> '.lang('archived').'</a>
                                    </td>
                                </tr>
							';	
                              $i++;}
					echo '		  
                        </tbody>';
                        endif;
                    
				echo '</table>';
					
		
	}

	function get_case_by_case_hearing_date_starred(){
		$cases = $this->cases_model->get_cases_by_hearing_date_starred($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                         <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('client').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				   		if(isset($cases)):
                     echo '   
						<tbody>
                            ';
							 $i=1;foreach ($cases as $new){
							 
							 echo '
                                <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
									
								'; if($new->is_starred==0){ 
								echo '
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
								echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>
								';
									}
									
								echo'	</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									
                                    <td width="47%">
										<a class="btn btn-default"  href="'.site_url('admin/cases/view_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										<a class="btn btn-info"  href="'.site_url('admin/cases/fees/'.$new->id).'"><i class="fa fa-inr"></i> '.lang('fees').'</a>	
                                      	<a class="btn btn-success"  href="'.site_url('admin/cases/dates/'.$new->id).'"><i class="fa fa-calendar"></i> '.lang('hearing_date').'</a>							
                                        <a class="btn btn-primary"  href="'.site_url('admin/cases/edit/'.$new->id) .'"><i class="fa fa-edit"></i> '.lang('edit').'</a>
										<a class="btn btn-warning"  href="'.site_url('admin/cases/archived/'.$new->id).'"><i class="fa fa-close"></i> '.lang('archived').'</a>
                                    </td>
                                </tr>
							';	
                              $i++;}
					echo '		  
                        </tbody>';
                        endif;
                    
				echo '</table>';
					
		
	}


	
	function view_all(){
		$data['cases'] = $this->cases_model->get_case_by_date();
		$ids='';
		foreach($data['cases'] as $ind => $key){
		
			$ids[]=$key->case_id;
		}
		
		$this->cases_model->cases_view_by_admin($ids);
		$data['page_title'] =  lang('view_all') . lang('cases');
		$data['body'] = 'case/view_all';
		$this->load->view('template/main', $data);	

	}	
	
	function get_dept_categories()
	{
		//$data['case_categories'] 	= $this->cases_model->get_all_case_categories();
		$result = $this->cases_model->get_all_depts();

		echo '
		<select name="departamento_id" id="departamento_id" class="chzn col-md-12" >
										<option value="">--Seleccione un Departamento--</option>
									';
									foreach($result as $new) {
											$sel = "";
											if(set_select('dept_id', $new->id)) $sel = "selected='selected'";
											echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
										}
										
		echo'</select>';						
	}
	
	function get_depts()
	{
		$result = $this->case_category_model->get_all_bydepartment($_POST['l_id']);
		echo '
		<select id="categorias" name="case_category_id" class="chzn col-md-12" >
										<option value="">--Seleccionar Categoria--</option>
									';
									foreach($result as $new) {
											$sel = "";
											if(set_select('dept_id', $new->id)) $sel = "selected='selected'";
											echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
										}
										
		echo'</select>';						
	}


	function opciones(){
        if(isset($_POST['l_id'])){

        	 //$_POST['empresa']
            if (!$this->cases_model->existeElTicket($_POST['l_id'],0)){
                       $fields_clients = $this->custom_field_model->get_custom_fields((int)("10".$_POST['l_id']));	



                      // Cargando Campos dinamicos: 
            	      //--------------------------------------------------------------------------------------------------
						if($fields_clients){
							foreach($fields_clients as $doc){
							$output = '';
							if($doc->field_type==1) //testbox
							{
						
									if ($doc->mayusculas != 1){
										echo '
										<div class="form-group">
				                              <div class="row">
				                                <div class="col-md-12">
				                                    <label for="contact" style="clear:both;">'.$doc->name.'</label>
											<input type="text" maxlength="'.$doc->max.'" class="form-control" name="reply['.$doc->id.']" id="req_doc" />
											</div>
				                            </div>
				                        </div>';
			                        }else {
	                                   echo '
											<div class="form-group">
					                              <div class="row">
					                                <div class="col-md-12">
					                                    <label for="contact" style="clear:both;">'.$doc->name.'</label>
												<input type="text" style="text-transform:uppercase;" onkeyup="javascript:this.value=this.value.toUpperCase();" maxlength="'.$doc->max.'" class="form-control" name="reply['.$doc->id.']" id="req_doc" />
												</div>
					                            </div>
					                        </div>';

			                        }


					     	}	
							if($doc->field_type==2) //dropdown list
							{
								$values = explode(",", $doc->values);
					
		                        echo '
							    <div class="form-group">
		                              <div class="row">
		                                <div class="col-md-12">
		                                    <label for="contact" style="clear:both;">'.$doc->name.'</label>
									<select name="reply['. $doc->id .']" class="form-control">';
										
												foreach($values as $key=>$val) {
													echo '<option value="'.$val.'">'.$val.'</option>';
												}
									
									echo '			
									</select>	
										</div>
		                            </div>
		                        </div>
		                        ';
							}	
						  if($doc->field_type==3) //radio buttons
							{
								$values = explode(",", $doc->values);
				
		                         echo '
							    <div class="form-group">
		                              <div class="row">
		                                <div class="col-md-12">
		                                    <label for="contact" style="clear:both;">'. $doc->name .'?></label>';
												foreach($values as $key=>$val) {
												echo ' 
												<input type="radio" name="reply['. $doc->id .']" value="'. $val .'" />'. $val .' &nbsp; &nbsp; &nbsp; &nbsp;
													';
		 										}
												echo '
										</div>
		                            </div>
		                        </div>
								 ';
						  }
						if($doc->field_type==4) //checkbox
							{
								$values = explode(",", $doc->values);
								echo '
						<div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="contact" style="clear:both;">'. $doc->name .'</label>';					
										foreach($values as $key=>$val) { 
										echo '
										<input type="checkbox" name="reply[ '. $doc->id .']" value="'. $val .'" class="form-control" />	&nbsp; &nbsp; &nbsp; &nbsp;
										';
 							 			}
							echo '		
								</div>
                            </div>
                        </div>
                        ';

					  }	if($doc->field_type==5) //Textarea
						  {		
                             echo '
						  	<div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="contact" style="clear:both;">'. $doc->name .'</label>
										<textarea class="form-control" name="reply['. $doc->id .' ]" ></textarea		
								></div>
                            </div>
                        </div>
                        ';
							
						}

						if($doc->field_type==9) //Fecha
						  {		
                             echo '
						  	<div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="contact" style="clear:both;">'. $doc->name .'</label>
										<input type="text" class="form-control datepicker" name="reply['.$doc->id.']" id="req_doc" />
							    </div>
                            </div>
                        </div>
                         <script>
                           jQuery(".datepicker").datetimepicker({
							 lang:"en",
							 i18n:{
							  de:{
							   months:[
							    "Januar","Februar","März","April",
							    "Mai","Juni","Juli","August",
							    "September","Oktober","November","Dezember",
							   ],
							   dayOfWeek:[
							    "So.", "Mo", "Di", "Mi", 
							    "Do", "Fr", "Sa.",
							   ]
							  }
							 },
							 timepicker:false,
							 format:"'.$doc->date_format.'"
							});
                         </script>


                        ';
							
						}

						if($doc->field_type==10) //Hora
						  {		
                             echo '
						  	<div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="contact" style="clear:both;">'. $doc->name .'</label>
										<select name="reply['. $doc->id .']" class="form-control">';		
												echo '	
												  <option value="12:00 am">12:00 am</option>
												  <option value="1:00 am">1:00 am</option>
												  <option value="2:00 am">2:00 am</option>
												  <option value="3:00 am">3:00 am</option>
												  <option value="4:00 am">4:00 am</option>
												  <option value="5:00 am">5:00 am</option>
												  <option value="6:00 am">6:00 am</option>
												  <option value="7:00 am">7:00 am</option>
												  <option value="8:00 am">8:00 am</option>
												  <option value="9:00 am">9:00 am</option>
												  <option value="10:00 am">10:00 am</option>
												  <option value="11:00 am">11:00 am</option>	
												  <option value="12:00 pm">12:00 pm</option>
												  <option value="1:00 pm">1:00 pm</option>
												  <option value="2:00 pm">2:00 pm</option>
												  <option value="3:00 pm">3:00 pm</option>
												  <option value="4:00 pm">4:00 pm</option>
												  <option value="5:00 pm">5:00 pm</option>
												  <option value="6:00 pm">6:00 pm</option>
												  <option value="7:00 pm">7:00 pm</option>
												  <option value="8:00 pm">8:00 pm</option>
												  <option value="9:00 pm">9:00 pm</option>
												  <option value="10:00 pm">10:00 pm</option>
												  <option value="11:00 pm">11:00 pm</option>	
								     	</select>	
							    </div>
                            </div>
                        </div>
                        ';
							
						}



							}
						}
					//--------------------------------------------------------------------------------------------------------



         } else{
              echo '
                 <script> alert("Este ticket ya existe");</script>
             '; 

         }



        } 
	}

	function opciones2(){
        if(isset($_POST['l_id'])){
            if (!$this->cases_model->existeElTicket2((int)$_POST['ll'],$_POST['l_id'],0)){
                       $fields_clients = $this->custom_field_model->get_custom_fields((int)("10".$_POST['l_id']));	



                      // Cargando Campos dinamicos: 
            	      //--------------------------------------------------------------------------------------------------
						if($fields_clients){
							foreach($fields_clients as $doc){
							$output = '';
							if($doc->field_type==1) //testbox
							{

								if ($doc->mayusculas != 1){
										echo '
										<div class="form-group">
				                              <div class="row">
				                                <div class="col-md-12">
				                                    <label for="contact" style="clear:both;">'.$doc->name.'</label>
											<input type="text" maxlength="'.$doc->max.'" class="form-control" name="reply['.$doc->id.']" id="req_doc" value="'.$this->custom_field_model->get_custom_field((int)$_POST['ll'],(int)("10".$_POST['l_id'])).'" />
											</div>
				                            </div>
				                        </div>';
			                        }else {
						
								echo '
								<div class="form-group">
		                              <div class="row">
		                                <div class="col-md-12">
		                                    <label for="contact" style="clear:both;">'.$doc->name.'</label>
									<input type="text" class="form-control" name="reply['.$doc->id.']" id="req_doc" value="'.$this->custom_field_model->get_custom_field((int)$_POST['ll'],(int)("10".$_POST['l_id'])).'" />
										</div>
		                            </div>
		                        </div>';
		                       }

					     	}	
							if($doc->field_type==2) //dropdown list
							{
								$values = explode(",", $doc->values);
					
		                        echo '
							    <div class="form-group">
		                              <div class="row">
		                                <div class="col-md-12">
		                                    <label for="contact" style="clear:both;">'.$doc->name.'</label>
									<select name="reply['. $doc->id .']" class="form-control">';
										
												foreach($values as $key=>$val) {
													echo '<option value="'.$val.'">'.$val.'</option>';
												}
									
									echo '			
									</select>	
										</div>
		                            </div>
		                        </div>
		                        ';
							}	
						  if($doc->field_type==3) //radio buttons
							{
								$values = explode(",", $doc->values);
				
		                         echo '
							    <div class="form-group">
		                              <div class="row">
		                                <div class="col-md-12">
		                                    <label for="contact" style="clear:both;">'. $doc->name .'?></label>';
												foreach($values as $key=>$val) {
												echo ' 
												<input type="radio" name="reply['. $doc->id .']" value="'. $val .'" />'. $val .' &nbsp; &nbsp; &nbsp; &nbsp;
													';
		 										}
												echo '
										</div>
		                            </div>
		                        </div>
								 ';
						  }
						if($doc->field_type==4) //checkbox
							{
								$values = explode(",", $doc->values);
								echo '
						<div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="contact" style="clear:both;">'. $doc->name .'</label>';					
										foreach($values as $key=>$val) { 
										echo '
										<input type="checkbox" name="reply[ '. $doc->id .']" value="'. $val .'" class="form-control" />	&nbsp; &nbsp; &nbsp; &nbsp;
										';
 							 			}
							echo '		
								</div>
                            </div>
                        </div>
                        ';

					  }	if($doc->field_type==5) //Textarea
						  {		
                             echo '
						  	<div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="contact" style="clear:both;">'. $doc->name .'</label>
										<textarea class="form-control" name="reply['. $doc->id .' ]" ></textarea		
								></div>
                            </div>
                        </div>
                        ';
							
								}
                       if($doc->field_type==9) //Fecha
						  {		
                             echo '
						  	<div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="contact" style="clear:both;">'. $doc->name .'</label>
										<input type="text" class="form-control datepicker" name="reply['.$doc->id.']" id="req_doc" value="'.$this->custom_field_model->get_custom_field((int)$_POST['ll'],(int)("10".$_POST['l_id'])).'" />
							    </div>
                            </div>
                        </div>

                        <script>
                           jQuery(".datepicker").datetimepicker({
							 lang:"en",
							 i18n:{
							  de:{
							   months:[
							    "Januar","Februar","März","April",
							    "Mai","Juni","Juli","August",
							    "September","Oktober","November","Dezember",
							   ],
							   dayOfWeek:[
							    "So.", "Mo", "Di", "Mi", 
							    "Do", "Fr", "Sa.",
							   ]
							  }
							 },
							 timepicker:false,
							 format:"'.$doc->date_format.'"
							});
                         </script>

                        ';
							
						}

						if($doc->field_type==10) //Hora
						  {		
                             echo '
						  	<div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="contact" style="clear:both;">'. $doc->name .'</label>
										<select name="reply['. $doc->id .']" class="form-control">';		
												echo '	
												  <option value="12:00 am">12:00 am</option>
												  <option value="1:00 am">1:00 am</option>
												  <option value="2:00 am">2:00 am</option>
												  <option value="3:00 am">3:00 am</option>
												  <option value="4:00 am">4:00 am</option>
												  <option value="5:00 am">5:00 am</option>
												  <option value="6:00 am">6:00 am</option>
												  <option value="7:00 am">7:00 am</option>
												  <option value="8:00 am">8:00 am</option>
												  <option value="9:00 am">9:00 am</option>
												  <option value="10:00 am">10:00 am</option>
												  <option value="11:00 am">11:00 am</option>	
												  <option value="12:00 pm">12:00 pm</option>
												  <option value="1:00 pm">1:00 pm</option>
												  <option value="2:00 pm">2:00 pm</option>
												  <option value="3:00 pm">3:00 pm</option>
												  <option value="4:00 pm">4:00 pm</option>
												  <option value="5:00 pm">5:00 pm</option>
												  <option value="6:00 pm">6:00 pm</option>
												  <option value="7:00 pm">7:00 pm</option>
												  <option value="8:00 pm">8:00 pm</option>
												  <option value="9:00 pm">9:00 pm</option>
												  <option value="10:00 pm">10:00 pm</option>
												  <option value="11:00 pm">11:00 pm</option>	
								     	</select>	
							    </div>
                            </div>
                        </div>
                        ';
							
						}


							}
						}
					//--------------------------------------------------------------------------------------------------------



         }else{
             echo '
                 <script> alert("Este ticket ya existe");</script>
            '; 

         }



        } 
	}
	
	function get_depts_cats()
	{
		$depts = $this->cases_model->get_all_depts_cats();
		$result = $this->cases_model->get_dept_by_location_c_category($_POST['l_id'],$_POST['c_id']);
		echo '
		<select name="dept_cat_id" id="dept_cat_id" class="chzn col-md-12" >
										<option value="">--Select Dept Category--</option>
									';
									foreach($result as $new) {
											$sel = "";
											if(set_select('dept_cat_id', $new->id)) $sel = "selected='selected'";
											echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
										}
										
		echo'</select>';						
	}
	
	function starred_cases(){
		$data['cases'] = $this->cases_model->get_all_starred();
		$data['depts'] = $this->cases_model->get_all_depts();
		$data['clients'] = $this->cases_model->get_all_clients();
		$data['locations'] = $this->location_model->get_all();
		$data['stages'] = $this->case_stage_model->get_all();
		$data['page_title'] = lang('case');
		$data['body'] = 'case/starred_list';
		$this->load->view('template/main', $data);	

	}	
	
	
	
	function archived_cases(){
		$data['cases'] = $this->cases_model->get_all_archived();
		$data['depts'] = $this->cases_model->get_all_depts();
		$data['clients'] = $this->cases_model->get_all_clients();
		$data['locations'] = $this->location_model->get_all();
		$data['stages'] = $this->case_stage_model->get_all();
		$data['page_title'] = lang('archived_cases');
		$data['body'] = 'case/archive_list';
		$this->load->view('template/main', $data);	
	}	
	
	function get_archive_case_by_client(){
		$cases = $this->cases_model->get_archive_cases_by_client_id($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                        <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('clients').'</th>
								<th>'.lang('case').' '.lang('stage').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				    if(isset($cases)):
				echo '	
                        <tbody>
                            '. $i=1;foreach ($cases as $new){
                  echo '              <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
							';		
									if($new->is_starred==0){ 
						echo '			
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
							echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>';
								}
							echo '
									</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									<td>'.$new->stage.'</td>
									
                                    <td width="20%">
									 	 <a class="btn btn-primary"  href="'.site_url('admin/cases/view_archived_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										 <a class="btn btn-danger" style="margin-left:20px;" href="'.site_url('admin/cases/restore/'.$new->id).'" onclick="return areyousure()"><i class="fa fa-check"></i> '.lang('restore').'</a>
                                    </td>
                                </tr>';
								 $i++;}
                       echo ' </tbody>';
                         endif;
                   echo ' </table>
					';
	}	
	
	
	function get_archive_case_by_dept(){
		$cases = $this->cases_model->get_archive_cases_by_dept_id($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                         <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('clients').'</th>
								<th>'.lang('case').' '.lang('stage').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				    if(isset($cases)):
				echo '	
                        <tbody>
                            '. $i=1;foreach ($cases as $new){
                  echo '              <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
							';		
									if($new->is_starred==0){ 
						echo '			
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
							echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>';
								}
							echo '
									</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									<td>'.$new->stage.'</td>
									
                                     <td width="20%">
									 	 <a class="btn btn-primary"  href="'.site_url('admin/cases/view_archived_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										 <a class="btn btn-danger" style="margin-left:20px;" href="'.site_url('admin/cases/restore/'.$new->id).'" onclick="return areyousure()"><i class="fa fa-check"></i> '.lang('restore').'</a>
                                    </td>
                                </tr>';
								 $i++;}
                       echo ' </tbody>';
                         endif;
                   echo ' </table>
					';
	}	
	
	
	function get_archive_case_by_location(){
		$cases = $this->cases_model->get_archive_cases_by_location_id($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                         <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('clients').'</th>
								<th>'.lang('case').' '.lang('stage').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				    if(isset($cases)):
				echo '	
                        <tbody>
                            '. $i=1;foreach ($cases as $new){
                echo '              <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
							';		
									if($new->is_starred==0){ 
				echo '			
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
				echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>';
								}
				echo '
									</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									<td>'.$new->stage.'</td>
									
                                    <td width="20%">
									 	 <a class="btn btn-primary"  href="'.site_url('admin/cases/view_archived_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										 <a class="btn btn-danger" style="margin-left:20px;" href="'.site_url('admin/cases/restore/'.$new->id).'" onclick="return areyousure()"><i class="fa fa-check"></i> '.lang('restore').'</a>
                                    </td>
                                </tr>';
								 $i++;}
                echo ' </tbody>';
                         endif;
                echo ' </table>
					';
	}	
	
	
	function get_archive_case_by_case_stage_id(){
		$cases = $this->cases_model->get_archive_cases_by_case_stage_id($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                         <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('clients').'</th>
								<th>'.lang('case').' '.lang('stage').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				    if(isset($cases)):
				echo '	
                        <tbody>
                            '. $i=1;foreach ($cases as $new){
                echo '              <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
							';		
									if($new->is_starred==0){ 
				echo '			
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
				echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>';
								}
				echo '
									</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									<td>'.$new->stage.'</td>
									
                                     <td width="20%">
									 	 <a class="btn btn-primary"  href="'.site_url('admin/cases/view_archived_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										 <a class="btn btn-danger" style="margin-left:20px;" href="'.site_url('admin/cases/restore/'.$new->id).'" onclick="return areyousure()"><i class="fa fa-check"></i> '.lang('restore').'</a>
                                    </td>
                                </tr>';
								 $i++;}
                echo ' </tbody>';
                         endif;
                echo ' </table>
					';
	}	
	
	
	function get_archive_case_by_case_filing_date(){
		$cases = $this->cases_model->get_archive_cases_by_filing_date($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                        <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('clients').'</th>
								<th>'.lang('case').' '.lang('stage').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                   ';
				    if(isset($cases)):
				echo '	
                        <tbody>
                            '. $i=1;foreach ($cases as $new){
                echo '              <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
							';		
									if($new->is_starred==0){ 
				echo '			
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
				echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>';
								}
				echo '
									</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									<td>'.$new->stage.'</td>
									
                                     <td width="20%">
									 	 <a class="btn btn-primary"  href="'.site_url('admin/cases/view_archived_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										 <a class="btn btn-danger" style="margin-left:20px;" href="'.site_url('admin/cases/restore/'.$new->id).'" onclick="return areyousure()"><i class="fa fa-check"></i> '.lang('restore').'</a>
                                    </td>
                                </tr>';
								 $i++;}
                echo ' </tbody>';
                         endif;
                echo ' </table>
					';
	}	
	
	
	function get_archive_case_by_case_hearing_date(){
			$cases = $this->cases_model->get_archive_cases_by_hearing_date($_POST['id']);
		echo '
		<table id="example1" class="table table-bordered table-striped table-mailbox">
                        <thead>
                            <tr>
                                <th width="5%">'.lang('serial_number').'</th>
								<th width="8%">'.lang('star').'</th>
								<th>'.lang('case').' '.lang('title').'</th>
								<th>'.lang('case').' '.lang('number').'</th>
								<th>'.lang('clients').'</th>
								<th>'.lang('case').' '.lang('stage').'</th>
								<th width="20%">'.lang('action').'</th>
                            </tr>
                        </thead>
                        
                   ';
				    if(isset($cases)):
				echo '	
                        <tbody>
                            '. $i=1;foreach ($cases as $new){
                echo '              <tr class="gc_row">
                                    <td>'.$i.'</td>
									
									<td class="small-col">
							';		
									if($new->is_starred==0){ 
				echo '			
									<a href="" at="90" class="Privat"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star-o"></i></a>
								';
									}else{
				echo '
									<a href="" at="90" class="Public"><span style="display:none">'.$new->id.'</span>
									<i class="fa fa-star"></i></a>';
								}
				echo '
									</td>
                                    <td>'.$new->title.'</td>
								    <td>'.$new->case_no.'</td>
									<td>'.$new->client.'</td>
									<td>'.$new->stage.'</td>
									
                                     <td width="20%">
									 	 <a class="btn btn-primary"  href="'.site_url('admin/cases/view_archived_case/'.$new->id).'"><i class="fa fa-eye"></i> '.lang('view').'</a>
										 <a class="btn btn-danger" style="margin-left:20px;" href="'.site_url('admin/cases/restore/'.$new->id).'" onclick="return areyousure()"><i class="fa fa-check"></i> '.lang('restore').'</a>
                                    </td>
                                </tr>';
								 $i++;}
                echo ' </tbody>';
                         endif;
                echo ' </table>
					';
	}
	
	
	
	function restore($id)
	{
		$this->cases_model->restore_case($id);
		$this->session->set_flashdata('message', lang('case_has_been_restored'));
		redirect('admin/cases');
	}
	
	
	
	function archived($id=false){
	
		$data['clients']		 	= $this->cases_model->get_all_clients();
		$data['id']					=$id;
		$data['case']				= $this->cases_model->get_case_by_id($id);
		
		
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('notes', 'lang:notes', 'required');
			$this->form_validation->set_rules('close_date', 'lang:date', 'trim|required');
			 
			if ($this->form_validation->run()==true)
            {
				$save['notes'] = $this->input->post('notes');
				$save['close_date'] = $this->input->post('close_date');
				$save['case_id'] = $id;
				$this->cases_model->save_archived($save);
				$this->cases_model->set_is_archived($id);
              	$this->session->set_flashdata('message', lang('case_is_archived'));
				redirect('admin/cases/archived_cases');
			}
		}		
	
		$data['page_title'] = lang('archive') . lang('case');
		$data['body'] = 'case/archive';
		$this->load->view('template/main', $data);	
	}
	

	function view_archived_case($id=false){
		$data['clients']		 	= $this->cases_model->get_all_clients();
		$data['stages'] 			= $this->case_stage_model->get_all();
		$data['acts']			 	= $this->cases_model->get_all_acts();
		$data['depts']			 	= $this->cases_model->get_all_depts();
		$data['locations']		 	= $this->cases_model->get_all_locations();
		$data['case_categories'] 	= $this->cases_model->get_all_case_categories();
		$data['dept_categories']	= $this->cases_model->get_all_dept_categories();
		$data['id'] 				= $id;
		$data['payment_modes']		= $this->cases_model->get_all_payment_modes();
		$data['fees_all']			= $this->cases_model->get_fees_all($id);
		$data['case']				= $this->cases_model->get_archive_case_by_id($id);
		$data['cases']		 		= $this->cases_model->get_all_extended_case_by_id($id);
		$data['cases']		 		= $this->cases_model->get_all_extended_case_by_id($id);
		$data['page_title'] 		= lang('view') . lang('archived_case');
		$data['body'] 				= 'case/view_archived';
	
		$this->load->view('template/main', $data);	
	}
	
	function view_case($id=false){
		$data['fields'] = $this->custom_field_model->get_custom_fields(2);	
		$data['clients']		 	= $this->cases_model->get_all_clients();
		$data['stages']				= $this->case_stage_model->get_all();
		$data['acts']			 	= $this->cases_model->get_all_acts();
		$data['depts']			 	= $this->cases_model->get_all_depts();
		$data['departamentos']		= $this->department_model->get_all();
		$data['locations']		 	= $this->cases_model->get_all_locations();
		$data['empresas'] 		    = $this->location_model->get_empresas();
		$data['empleados'] 		    = $this->employees_model->get_all();
		$data['case_categories'] 	= $this->cases_model->get_all_case_categories();
		$data['dept_categories']	= $this->cases_model->get_all_dept_categories();
		$data['id'] 				= $id;
		$data['payment_modes']		= $this->cases_model->get_all_payment_modes();
		$data['fees_all']			= $this->cases_model->get_fees_all($id);
		$data['case']				= $this->cases_model->get_archive_case_by_id($id);
		$data['cases']		 		= $this->cases_model->get_all_extended_case_by_id($id);
		$data['cases']		 		= $this->cases_model->get_all_extended_case_by_id($id);
		$data['files'] 				= $this->cases_model->get_files($id);
		
		$this->cases_model->case_view_by_admin($id);
		
		$data['page_title']			= lang('view') . lang('case');
		$data['body'] 				= 'case/view_case';
		$this->load->view('template/main', $data);	
	}
	
	function add(){
		$data['fields_clients'] = $this->custom_field_model->get_custom_fields(1);
		$data['fields']			 = $this->custom_field_model->get_custom_fields(2);
		$data['clients']		 = $this->cases_model->get_all_clients();
		$data['employees']		 = $this->cases_model->get_all_employees();
        $admin2 = $this->session->userdata('admin');
		$id = $admin2['id'];
		$data['empleado']		 = $this->employees_model->get($id);
		$data['empresas'] 		    = $this->employees_model->get_empresas_todas($id);
		$data['stages'] 		 = $this->case_stage_model->get_all();
		$data['acts'] 			 = $this->cases_model->get_all_acts();
		$data['depts']			 = $this->cases_model->get_all_depts();
		$data['locations'] 		 = $this->cases_model->get_all_locations();	
		$data['case_categories'] = $this->cases_model->get_all_case_categories();
		$data['dept_categories']= $this->cases_model->get_all_dept_categories();
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_message('required', lang('custom_required'));
			//$this->form_validation->set_rules('title', 'lang:title', 'required');
			//$this->form_validation->set_rules('client_id', 'Client', 'required');
			//$this->form_validation->set_rules('empleados_id', 'Empleados', 'required');
			$this->form_validation->set_rules('departamento_id', 'Departamentos', 'required');
			$this->form_validation->set_rules('location_id', 'Empresa', 'required');
			//$this->form_validation->set_rules('employee_id', 'User', '');
			//$this->form_validation->set_rules('case_no', 'Case No', 'trim|required|is_unique[cases.case_no]');
			$this->form_validation->set_rules('location_id', 'Location', 'required');
			$this->form_validation->set_rules('prioridad', 'prioridad', 'required');
			$this->form_validation->set_rules('case_stage_id', 'Case Stage', '');
			$this->form_validation->set_rules('dept_id', 'Dept', '');
			$this->form_validation->set_rules('dept_category_id', 'dept_category Category', '');
			$this->form_validation->set_rules('case_category_id', 'Case Category', 'required');
			$this->form_validation->set_rules('act_id', 'Act', '');
			//$this->form_validation->set_rules('start_date', 'Filing Date', 'required');
			$this->form_validation->set_rules('description', 'Description', '');
			$this->form_validation->set_rules('fees', 'Fees', '');
			$this->form_validation->set_rules('o_lawyer', 'Opposite Lawyer', '');
			$this->form_validation->set_rules('hearing_date', 'Description', '');
			 
			if ($this->form_validation->run()==true)
            {
            	$admin = $this->session->userdata('admin');
            	$save['created_by'] = $admin['id'];
            	$save['title'] ='Ticket para notificar '.$this->cases_model->get_all_case_categories_id($this->input->post('case_category_id'));
				$titulogenerado = $save['title'];
			   
				$save['case_no'] = $this->department_model->get_alias($this->input->post('departamento_id')) .'-000'. (string)(((int)$this->cases_model->getLastId())+1);
				//$save['client_id'] = $this->input->post('client_id');
				$save['client_id'] = $this->input->post('employee_id');
				//$save['location_id'] = $this->input->post('location_id');
				//$save['empresa_id'] = json_encode($this->input->post('location_id'));
				$save['departamento_id'] = $this->input->post('departamento_id');
				$save['status'] = 1; 
				//$save['usuarios_id'] = json_encode($this->input->post('empleados_id'));
				//$save['dept_id'] = $this->input->post('dept_id');
				//$save['dept_category_id'] = $this->input->post('dept_category_id');
				$save['case_stage_id'] = $this->input->post('case_stage_id');
				$save['case_category_id'] = $this->input->post('case_category_id');
				$save['act_id'] = json_encode($this->input->post('act_id'));
				$save['progress'] = $this->input->post('progress');
				$save['prioridad'] = $this->input->post('prioridad');
				$save['description'] = $this->input->post('description');
				$save['start_date'] = date('d-m-Y H:i:s');
				$save['due_date'] = $this->input->post('due_date');

                 foreach($this->input->post('location_id') as $val) {


                    $p_key = $this->cases_model->save($val,$save);
                    $reply = $this->input->post('reply');
						if(!empty($reply)){
							$save_fields = array();
							$numero=1; 
							foreach($this->input->post('reply') as $key => $val2) {
                              	//------Area para la creacion del Titulo------------------------
								//-------------------------------------------------------------------------
								//Obteniendo categoria:
								$categoria = $this->case_category_model->get_category_by_id($this->input->post('case_category_id'));
								$compania = $this->employees_model->get_infoempresa($val);
							
								if($categoria->title_format!=""){
				                  $contenedor = str_replace("empresa.name",$compania->name,$categoria->title_format);
				                  $contenedor = str_replace("empresa.code",$compania->cod_interno,$contenedor);
				                  $contenedor = str_replace("campo.".(string)$numero,$val2,$contenedor);
				                  $contenedor = str_replace("fecha.now",date('d-m-Y'),$contenedor);
				                  $contenedor = str_replace("fecha.end",$this->input->post('due_date'),$contenedor);
				                  $contenedor = str_replace("category.name",$categoria->name,$contenedor);
				                  $titulogenerado = $contenedor;
								 }else{
                                     $titulogenerado = $titulogenerado. " - ". $val2;
								 }
							 	//------------------------------------------------------------------------- 
								$save_fields = array(
									'custom_field_id'=> $key,
									'reply'=> $val2,
									'table_id'=> $p_key,
									'form'=> ((int)("10".$this->input->post('case_category_id')))
								);	
								$this->custom_field_model->save_answer($save_fields);
								$numero = $numero + 1;
							}	
						}

                          //Generado titulo dinamico: 
						   $savetitle = array();
						   $savetitle['title'] = $titulogenerado; 
						   $this->cases_model->update($val,$savetitle,$p_key);

						  // $url =base_url('assets/uploads/tareas/');
						$target_path ='assets/uploads/tickets/'.$p_key;
		                $carpeta = 'assets/uploads/tickets/'.(string)$p_key;
		                if (!file_exists($carpeta)) {
		                    mkdir($carpeta, 0777, true);
		                }

		                
		               	//Guardando registros de archivos adjuntos  - Garry Bruno
		                $filesCount = count($_FILES['archivos']['name']);
		                $data = array();
				        if($this->input->post('departamento_id') && !empty($_FILES['archivos']['name'])){	             
				            $filesCount = count($_FILES['archivos']['name']);
				            for($i = 0; $i < $filesCount; $i++){
				                $_FILES['userFile']['name'] = $_FILES['archivos']['name'][$i];
				                $_FILES['userFile']['type'] = $_FILES['archivos']['type'][$i];
				                $_FILES['userFile']['tmp_name'] = $_FILES['archivos']['tmp_name'][$i];
				                $_FILES['userFile']['error'] = $_FILES['archivos']['error'][$i];
				                $_FILES['userFile']['size'] = $_FILES['archivos']['size'][$i];
		                       
				               $uploadPath = 'assets/uploads/tickets/'.(string)$p_key.'/'. basename( $_FILES['userFile']['name']);
				               if(move_uploaded_file($_FILES['userFile']['tmp_name'], $uploadPath)) {                                        
		                                        $savefile['name'] = $_FILES['userFile']['name'];
		                                        $savefile['location'] = $uploadPath; 
		                                        $savefile['id_ticket'] = $p_key; 
		                                        $this->cases_model->savefile($savefile);       

		                              }                   
				            }
				                   
				        }
                 	

                 }

                $this->session->set_flashdata('message', lang('case_created'));
				redirect('admin/cases');
				
			}
		}		
		
		
		$data['page_title'] = lang('add') . lang('case');
		$data['body'] = 'case/add';
		
		
		$this->load->view('template/main', $data);	

	}	
	
	

	function edit($id=false){
	
		$data['clients']		 	= $this->cases_model->get_all_clients();
		$data['employees']		 	= $this->cases_model->get_all_employees();
		$data['stages'] 			= $this->case_stage_model->get_all();
		$data['acts']			 	= $this->cases_model->get_all_acts();
		$data['depts']			 	= $this->cases_model->get_all_depts();
		$data['locations']		 	= $this->cases_model->get_all_locations();
        $admin2 = $this->session->userdata('admin');
		$id2 = $admin2['id'];
		$data['empleado']		 = $this->employees_model->get($id2);
		$data['empresas'] 		    = $this->employees_model->get_empresas_todas($id);
		$data['empleados'] 		    = $this->employees_model->get_all();
		$data['departamentos']		= $this->department_model->get_all();
		$data['case_categories'] 	= $this->cases_model->get_all_case_categories();
		$data['dept_categories']	= $this->cases_model->get_all_dept_categories();
		$data['id']					=	$id;
		$data['case'] 				= $this->cases_model->get_case_by_id($id);
		$data['fields'] 			= $this->custom_field_model->get_custom_fields(2);
		$data['files'] = $this->cases_model->get_files($id);	
		$admin2 = $this->session->userdata('admin');
	    $data['iduser'] = $admin2['id'];
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('client_id', 'lang:client', '');
			//$this->form_validation->set_rules('case_no', 'lang:case_number', 'trim|required');
			$this->form_validation->set_rules('location_id', 'lang:location', 'required');
			$this->form_validation->set_rules('dept_id', 'lang:dept', '');
			$this->form_validation->set_rules('dept_category_id', 'lang:dept_category', '');
			$this->form_validation->set_rules('case_category_id', 'lang:case_category', 'required');
			$this->form_validation->set_rules('act_id', 'lang:act', '');
			//$this->form_validation->set_rules('start_date', 'lang:filing_date', 'required');
			 $this->form_validation->set_message('required', lang('custom_required'));
			if ($this->form_validation->run()==true)
            {
            	$admin = $this->session->userdata('admin');
            	$save['created_by'] = $admin['id'];
			    //$save['title'] ='Ticket para notificar '.$this->cases_model->get_all_case_categories_id($this->input->post('case_category_id'));
				$save['case_no'] = $data['case']->case_no;
				$save['client_id'] = $this->input->post('client_id');
				//$save['location_id'] = $this->input->post('location_id');
				//$save['empresa_id']  = json_encode($this->input->post('location_id'));
				$save['departamento_id'] = $this->input->post('departamento_id');
				//$save['usuarios_id'] = json_encode($this->input->post('empleados_id'));
				//$save['dept_id'] = $this->input->post('dept_id');
				//$save['dept_category_id'] = $this->input->post('dept_category_id');
				$save['case_stage_id'] = $this->input->post('case_stage_id');
				$save['case_category_id'] = $this->input->post('case_category_id');
				$save['act_id'] = json_encode($this->input->post('act_id'));
				$save['description'] = $this->input->post('description');
				$save['prioridad'] = $this->input->post('prioridad');
				$save['start_date'] = date('Y-m-d H:i:s');
				$save['progress'] = $this->input->post('progress');
				$save['due_date'] = $this->input->post('due_date');
                //$titulogenerado = $save['title']; 
				//$save['o_lawyer'] = $this->input->post('o_lawyer');
				//$save['fees'] = $this->input->post('fees');
	
				
                foreach($this->input->post('location_id') as $val) {


                    $this->cases_model->update($val,$save,$id);
                    $reply = $this->input->post('reply');
						if(!empty($reply)){
							$save_fields = array();
							$this->custom_field_model->delete_answer($id,(int)("10".$this->input->post('case_category_id')));
							foreach($this->input->post('reply') as $key => $val2) {
                                //------Area para la creacion del Titulo------------------------
								//-------------------------------------------------------------------------
								//Obteniendo categoria:
								/*
								$categoria = $this->case_category_model->get_category_by_id($this->input->post('case_category_id'));
								$compania = $this->employees_model->get_infoempresa($val);
							    
								if($categoria->title_format!=""){
				                  $contenedor = str_replace("empresa.name",$compania->name,$categoria->title_format);
				                  $contenedor = str_replace("empresa.code",$compania->cod_interno,$contenedor);
				                  $contenedor = str_replace("campo.".(string)$numero,$val2,$contenedor);
				                  $contenedor = str_replace("fecha.now",date('d-m-Y'),$contenedor);
				                  $contenedor = str_replace("fecha.end",$this->input->post('due_date'),$contenedor);
				                  $contenedor = str_replace("category.name",$categoria->name,$contenedor);
				                  $titulogenerado = $contenedor;
								 }else{
                                     $titulogenerado = $titulogenerado. " - ". $val2;
								 }
								*/
							 	//------------------------------------------------------------------------- 
								$save_fields = array(
									'custom_field_id'=> $key,
									'reply'=> $val2,
									'table_id'=> $id,
									'form'=> ((int)("10".$this->input->post('case_category_id')))
								);
								
						    $this->custom_field_model->save_answer($save_fields);
							}	
						}
                           //Generado titulo dinamico: 
						   //$savetitle = array();
						   //$savetitle['title'] = $titulogenerado; 
						   //$this->cases_model->update($val,$savetitle,$id);
                            

						  // $url =base_url('assets/uploads/tareas/');
						$target_path ='assets/uploads/tickets/'.$id;
		                $carpeta = 'assets/uploads/tickets/'.(string)$id;
		                if (!file_exists($carpeta)) {
		                    mkdir($carpeta, 0777, true);
		                }

		                
		               	//Guardando registros de archivos adjuntos  - Garry Bruno
		                $filesCount = count($_FILES['archivos']['name']);
		                $data = array();
				        if($this->input->post('departamento_id') && !empty($_FILES['archivos']['name'])){	             
				            $filesCount = count($_FILES['archivos']['name']);
				            for($i = 0; $i < $filesCount; $i++){
				                $_FILES['userFile']['name'] = $_FILES['archivos']['name'][$i];
				                $_FILES['userFile']['type'] = $_FILES['archivos']['type'][$i];
				                $_FILES['userFile']['tmp_name'] = $_FILES['archivos']['tmp_name'][$i];
				                $_FILES['userFile']['error'] = $_FILES['archivos']['error'][$i];
				                $_FILES['userFile']['size'] = $_FILES['archivos']['size'][$i];
		                       
				               $uploadPath = 'assets/uploads/tickets/'.(string)$id.'/'. basename( $_FILES['userFile']['name']);
				               if(move_uploaded_file($_FILES['userFile']['tmp_name'], $uploadPath)) {                                        
		                                        $savefile['name'] = $_FILES['userFile']['name'];
		                                        $savefile['location'] = $uploadPath; 
		                                        $savefile['id_ticket'] = $id; 
		                                        $this->cases_model->savefile($savefile);       

		                              }                   
				            }
				                   
				        }
                 	

                 }



              	$this->session->set_flashdata('message',  lang('case_created'));
				redirect('admin/cases');
			}
		}		
	
		$data['page_title'] = lang('edit') . lang('dept');
		$data['body'] = 'case/edit';
		$this->load->view('template/main', $data);	

	}



	function notes($id=false){
		$data['id']					=	$id;
		$data['case'] 				= $this->cases_model->get_case_by_id($id);
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('notes', 'lang:notes', 'required');
			 $this->form_validation->set_message('required', lang('custom_required'));
			if ($this->form_validation->run()==true)
            {
				$save['notes'] = $this->input->post('notes');
				
				$this->cases_model->update($save,$id);
              	$this->session->set_flashdata('message',  lang('notes_saved'));
				redirect('admin/cases/notes/'.$id);
			}
		}		
	
		$data['page_title'] =  lang('notes');
		$data['body'] = 'case/notes';
		$this->load->view('template/main', $data);	

	}
	
	
	
	function dates($id=false){
	
		$data['cases']		 	= $this->cases_model->get_all_extended_case_by_id($id);
		$data['id'] =$id;
		$data['case']				= $this->cases_model->get_case_by_id($id);
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('date', 'lang:date', 'required');
			$this->form_validation->set_message('required', lang('custom_required'));
			 
			if ($this->form_validation->run()==true)
            {
			
				if($_FILES['img'] ['name'] !='')
					{ 
						
					
						$config['upload_path'] = './assets/uploads/files/';
						$config['allowed_types'] = 'gif|jpg|png|pdf|doc';
						$config['max_size']	= '10000';
						$config['max_width']  = '10000';
						$config['max_height']  = '6000';
				
						$this->load->library('upload', $config);
				
						if ( !$img = $this->upload->do_upload('img'))
							{
								
							}
							else
							{
								$img_data = array('upload_data' => $this->upload->data());
							}
						$save['document'] = $img_data['upload_data']['file_name'];
					}
					
				$save['case_id'] = $id;	
				$save['next_date'] = $this->input->post('date');
				$save['last_date'] = $this->input->post('date2');
				$save['note'] = $this->input->post('notes');
				$this->cases_model->save_extended_case($save);
              	$this->session->set_flashdata('message', 'Extended Date Saved');
				redirect('admin/cases/dates/'.$id);
				
			}
		}		
	
		
		$data['body'] = 'case/extended_dates';
		$this->load->view('template/main', $data);	

	}
	
	
	function dates_detail($id=false){
	
		$data['cases']		 	= $this->cases_model->get_extended_case_by_id($id);
		$data['id'] 			= $id;
		$data['case']			= $this->cases_model->get_case_by_id($id);
		$data['body'] 			= 'case/extended_dates_detail';
		$this->load->view('template/main', $data);	

	}	
	
	function fees($id){
		$data['tax']			= $this->tax_model->get_all();
		$data['payment_modes']			= $this->cases_model->get_all_payment_modes();
		$data['receipts']			= $this->cases_model->get_receipts($id);
		$data['case']					= $this->cases_model->get_case_by_id($id);
		$data['fees_all']				= $this->cases_model->get_fees_all($id);
		$data['id'] 					= $id;
		$invoice			= $this->cases_model->get_invoice_number();
		
		//echo '<pre>'; print_r($data['receipts']);die;

		if(empty($invoice->invoice)){
			$data['invoice_no'] = $this->settings->invoice_no;
		}else{
			$data['invoice_no'] = $invoice->invoice+1;
		}
		
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('amount', 'lang:amount', 'required');
			$this->form_validation->set_rules('payment_mode_id', 'lang:payment_mode', 'required');
			$this->form_validation->set_rules('date', 'lang:date', 'required');
			$this->form_validation->set_rules('invoice_no', 'lang:invoice', 'required');
			if ($this->form_validation->run()==true)
            {
			
				$save['amount'] = $this->input->post('amount');
				$save['total'] = $this->input->post('total');
				$save['payment_mode_id'] = $this->input->post('payment_mode_id');
				$save['case_id'] = $id;
				$save['date'] = $this->input->post('date');
				$save['invoice'] =  $data['invoice_no'];
				
				$fees_id = $this->cases_model->save_fees($save);
				$save_tax=array();
				$taxes = $this->input->post('tax_id');
				if(!empty($taxes)){
				$i=1;
					foreach($taxes as $new){
						$save_tax[$i]['tax_id'] = $new;
						$save_tax[$i]['fees_id'] = $fees_id;
					$i++;
					}
				$this->cases_model->save_taxes($save_tax);
				}
				
				
				
              	$this->session->set_flashdata('message', lang('fees_updated'));
				redirect('admin/cases/fees/'.$id);
			}
		}
		$data['body'] = 'case/fees';
		$this->load->view('template/main', $data);
	}
	
	function view_receipt($id){
		$data['receipt']			= $this->cases_model->get_receipt($id);
		//echo '<pre>'; print_r($data['receipt']);die;
		$data['payment_modes']			= $this->cases_model->get_all_payment_modes();
		$data['setting']     = $this->settings;
		$data['body'] = 'case/view_receipt';
		$this->load->view('template/main', $data);
	}
	
	function print_receipt($id){
		$data['receipt']			= $this->cases_model->get_receipt($id);
		//echo '<pre>'; print_r($data['receipt']);die;
		$data['payment_modes']			= $this->cases_model->get_all_payment_modes();
		$data['setting']     = $this->settings;
		//$data['body'] = '';
		$this->load->view('case/print_receipt', $data);
	}
	
	function pdf($id=false){
		$this->load->helper('dompdf_helper');
		$this->load->helper('download');
		$data['receipt']			= $this->cases_model->get_receipt($id);
		$data['payment_modes']			= $this->cases_model->get_all_payment_modes();
		$data['setting']     = $this->settings;
		$data['page_title'] = lang('receipt');
		//$data['body'] = 'invoice/pdf';
		$html = $this->load->view('case/pdf_receipt', $data,true);		
		pdf_create($html, 'Receipt_'.$data['receipt']->id);
		

	}	
	
	
	
	public function mail($id=false)
	{ 
		$data['receipt']			= $this->cases_model->get_receipt($id);
		$data['payment_modes']			= $this->cases_model->get_all_payment_modes();
		$data['setting']     = $this->settings;
		$data['page_title'] = lang('receipt');
		
		///echo $data['receipt']->u_email;die;
		if(!empty($data['setting']->image)){ 
 			$img = '<img src="'.site_url('assets/uploads/images/'.$data['setting']->image).'"  height="70" width="80"  style="padding-left:30px;" />';
 		}
		$html = $this->load->view('case/pdf_receipt', $data,true);			
		$message = $html;
		$msg 				 = html_entity_decode($message,ENT_QUOTES, 'UTF-8');
		$params['recipient'] = $data['receipt']->u_email;;
		$params['subject'] 	 = "Receipt";
		$params['message']   = $msg;
		modules::run('admin/fomailer/send_email',$params);
	
		$this->session->set_flashdata('message', lang('receipt_send'));
		redirect('admin/cases/fees/'.$data['receipt']->case_id);
			
	/*
		$this->load->library('email');
		$this->load->helper('string');    
		/*$config = array(
				'protocol' => "smtp",
				'smtp_host' => "ssl://smtp.gmail.com",
				'smtp_port' => "465",
				'smtp_user' => "",
				'smtp_pass' => "",
				'charset' => "utf-8",
				'mailtype' => "html",
				'newline' => "\r\n"
			);
		$config['mailtype'] = 'html';
		$config['charset'] = 'utf-8';
		

        $this->load->library('email', $config);
			
		$this->email->initialize($config);
		
													
			
			//echo '<pre>';print_r($message);exit;
			$this->email->from($data['setting']->email,'Invoice');
			
			$email = $data['details']->email;
			$this->email->to($email);
			$this->email->subject('Invoice');
			$this->email->message(html_entity_decode($message,ENT_QUOTES, 'UTF-8'));
			$sent = $this->email->send();
			*/
			//echo 'Mail Sent to '.$email;exit;
	}

	
	function receipt($id){
		$data['tax']			= $this->tax_model->get_all();
		$data['payment_modes']			= $this->cases_model->get_all_payment_modes();
		$data['case']					= $this->cases_model->get_case_by_id($id);
		$data['fees_all']				= $this->cases_model->get_fees_all($id);
		$data['id'] 					= $id;
		$invoice			= $this->cases_model->get_invoice_number();
		
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('r_amount', 'lang:amount', '');
			if ($this->form_validation->run()==true)
            {
			//echo '<pre>'; print_r($_POST);die;
			
				$save['amount'] = $this->input->post('r_amount');
				$save['date'] = $this->input->post('r_date');
				$save['fees_id'] = $this->input->post('fees_id');
				$save['case_id'] = $this->input->post('case_id');
				
				$this->cases_model->save_receipt($save);
				
				
				
				
              	$this->session->set_flashdata('message', lang('receipt_created'));
				redirect('admin/cases/fees/'.$id);
			}
		}
		$data['body'] = 'case/fees';
		$this->load->view('template/main', $data);
	}
	
	function delete($id=false){
		
		if($id){
			$this->cases_model->delete($id);
			redirect('admin/cases');
			$this->session->set_flashdata('message',  lang('case_deleted'));
		}
	}
	
	function delete_archive_case($id=false){
		
		if($id){
			$this->cases_model->delete($id);
			redirect('admin/cases/archived_cases');
			$this->session->set_flashdata('message',  lang('case_deleted'));
		}
	}	
	
	function delete_fees($id=false){
		
		if($id){
			$this->cases_model->delete_fees($id);
			$this->session->set_flashdata('message', lang('fees_deleted'));
			redirect('admin/cases');
			
		}
	}	
	
	function delete_deceipt($id=false,$c_id){
		//$rc = $this->cases_model->get_receipt($id);
		if($id){
			$this->cases_model->delete_receipt($id);
			$this->session->set_flashdata('message', lang('receipt_deleted'));
			redirect('admin/cases/fees/'.$c_id);
			
		}
	}	
	
	
		
	function delete_history($id=false){
		
		if($id){
			$this->cases_model->delete_history($id);
			$this->session->set_flashdata('message', lang('history_deleted'));
			redirect('admin/cases');
		}
	}	

	function deleteFile($id=false){
		session_start();
		$seleccionado = explode("-",$id); 
        $idarchivo = $seleccionado[1];
		$datos = explode("%",$_SESSION["Archivos"]);
        $direccion = $datos[(int)$idarchivo]; 
        unlink ($direccion); 
        $this->cases_model->deleteFile($seleccionado[2]);
        redirect('admin/cases/edit/'.$id);
	} 

		
	function set_starred()
	{
		 $this->cases_model->set_is_starred($_POST['id']);
	}	
	
	function update_set_starred()
	{
		 $this->cases_model->update_set_is_starred($_POST['id']);
	}	
	
		
	
}