<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class case_category extends MX_Controller {

	public function __construct()
	{
		parent::__construct();
		//$this->auth->check_access('1', true);
		$this->load->model("case_category_model");
		$this->load->model("cases_model");
		$this->load->model("department_model");
		$this->load->model("custom_field_model");
		
	}
	
	
	function index(){
		$data['categories'] = $this->case_category_model->get_all();
		$data['departments'] = $this->cases_model->get_all_dept_categories();
		$data['page_title'] = lang('case') ." ". lang('categories');
		$data['body'] = 'case_category/list';
		$this->load->view('template/main', $data);	
	}	
	
	function add(){
		$data['categories'] = $this->case_category_model->get_all();
		$data['departments'] = $this->cases_model->get_all_dept_categories();
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			 $this->form_validation->set_message('required', lang('custom_required'));
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
				$save['parent_id'] = $this->input->post('parent_id');
				$save['title_format']		 = $this->input->post('titulo'); 
				$save['status']		 = 1;             
				$p_key = $this->case_category_model->save($save);
	
                      if (isset($_POST['namefield'])){ 
			                $save_field['name'] 		 = $this->input->post('namefield');
							$save_field['field_type']  = $this->input->post('type');
							$save_field['form']		 = "10". strval($p_key);
							$save_field['values']		 = $this->input->post('values');
							$save_field['date_format']		 = $this->input->post('formato');
							$save_field['mayusculas']		 = $this->input->post('mayusculas');
							$save_field['obligatorio']		 = $this->input->post('obligatorio');
                            if($this->input->post('maximo')!="") 
							$save_field['max']		 = $this->input->post('maximo');
						    else 
						    $save_field['max'] = 255; 
						    

							$this->custom_field_model->save($save_field);

						}
			    

                $this->session->set_flashdata('message', lang('case_category_created'));
				redirect('admin/case_category/addaditional/'.$p_key);
				
			}
			
		}		
		
		
		$data['page_title'] = lang('add') . lang('case') . lang('category');
		$data['body'] = 'case_category/add';
		$this->load->view('template/main', $data);	
	}

	function addaditional($id=false){
		$data['id'] =$id;
		$data['category'] = $this->case_category_model->get_category_by_id($id);
		$data['fields'] = $this->custom_field_model->get_allByForm((int)("10".((string)$id)));
		$data['departments'] = $this->department_model->get_all();
		$data['categories'] = $this->case_category_model->get_all();
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			$this->form_validation->set_message('required', lang('custom_required')); 
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
				$save['parent_id'] = $this->input->post('parent_id');
				$save['title_format']	= $this->input->post('titulo');
                
				$this->case_category_model->update($save,$id);

                     /*
                     if (isset($_POST['namefield'])){ 
			                $save_field['name'] 		 = $this->input->post('namefield');
							$save_field['field_type']  = $this->input->post('type');
							$save_field['form']		 = "10". strval($id);
							$save_field['values']		 = $this->input->post('values');
                            $save_field['mayusculas']		 = $this->input->post('mayusculas');
                            if($this->input->post('maximo')!="") 
							$save_field['max']		 = $this->input->post('maximo');
						    else 
						    $save_field['max'] = 255; 
							$this->custom_field_model->update($id,$save_field);
						}

                   */

                $this->session->set_flashdata('message', lang('case_category_updated'));
				redirect('admin/case_category');
			}
		}		
	
		$data['page_title'] = lang('add') . lang('case') . lang('category');
		$data['body'] = 'case_category/addfield';
		$this->load->view('template/main', $data);	

	}	

	
	
	function edit($id=false){
		$data['id'] =$id;
		$data['category'] = $this->case_category_model->get_category_by_id($id);
		$data['fields'] = $this->custom_field_model->get_allByForm((int)("10".((string)$id)));
		$data['departments'] = $this->cases_model->get_all_dept_categories();
		$data['categories'] = $this->case_category_model->get_all();
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			$this->form_validation->set_message('required', lang('custom_required')); 
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
				$save['parent_id'] = $this->input->post('parent_id');
				$save['title_format'] = $this->input->post('titulo');
				$save['status']		 = $this->input->post('status');    
                
				$this->case_category_model->update($save,$id);

                      /*
                     if (isset($_POST['namefield'])){ 
			                $save_field['name'] 		 = $this->input->post('namefield');
							$save_field['field_type']  = $this->input->post('type');
							$save_field['form']		 = "10". strval($id);
							$save_field['values']		 = $this->input->post('values');
                            $save_field['mayusculas']		 = $this->input->post('mayusculas');
                            if($this->input->post('maximo')!="") 
							$save_field['max']		 = $this->input->post('maximo');
						    else 
						    $save_field['max'] = 255; 
							$this->custom_field_model->update($id,$save_field);

						}
                        */


                $this->session->set_flashdata('message', lang('case_category_updated'));
				redirect('admin/case_category');
			}
		}		
	
		$data['page_title'] = lang('edit') . lang('case') . lang('category');
		$data['body'] = 'case_category/edit';
		$this->load->view('template/main', $data);	

	}	

	function aditionalField($id){
         echo '

                   
					<div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    
                                    <hr>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <b>'.lang('field_type').'</b>
                                </div>
                                <div class="col-md-4">
                                    <select name="type" class="form-control" id="field">
                                        <option value="1">Text Box</option>
                                        <option value="2">Dropdown List</option>
                                        <option value="3">Radio Button</option>
                                        <option value="4">Checkbox</option>
                                        <option value="5">Textarea</option>
                                        <option value="6">URL</option>
                                        <option value="7">Email</option>
                                        <option value="8">Phone</option>
                                        <option value="9">Fecha</option>
                                        <option value="10">Hora</option>

                                    </select>    
                                </div>
                                <div id="limitaciones">
                                <div class="col-md-12">
                                    <br>
                                    <div class="col-md-3">
                                        <b>'.lang('max').'</b>
                                    </div>
                                    <div class="col-md-4">         
                                        <input type="number" name="maximo" value="" class="form-control">
                                    </div>

                                </div>
                                <br>
                                <div class="col-md-12">

                                    <div class="col-md-3">
                                        <b>'.lang('upper').'</b>
                                    </div>
                                    <div class="col-md-4">         
                                        <input type="checkbox" name="mayusculas" value="1">
                                    </div>
                                
                                </div>
                                </div>

                                <div id="formato">
                                <div class="col-md-12">
                                    <br>
                                    <div class="col-md-3">
                                        <b>'.lang('format').'</b>
                                    </div>
                                    <div class="col-md-4">         
                                    <select class="form-control" name="formato">
                                        <option value="d-m-Y">DD-MM-AAAA</option>
                                        <option value="Y">AAAA</option>
                                        <option value="Y-m">AAAA-MM</option>
                                        <option value="Y-m-d">AAAA-MM-DD</option>
                                        <option value="m-Y">MM-AAAA</option>
                                    </select> 
                                    </div>
                                
                                </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <b>'.lang('field_name').'</b>
                                </div>
                                <div class="col-md-4">         
                                    <input type="text" name="namefield" value="" class="form-control">
                                </div>
                            </div>
                            <div class="row">

                                    <div class="col-md-3">
                                        <b>'.lang('custom_required').'</b>
                                    </div>
                                    <div class="col-md-4">         
                                        <input type="checkbox" name="obligatorio" value="required">
                                    </div>
                                
                             </div>
                        </div>
                        
                        
                        <div class="form-group" id="value-div">
                            <div class="row">
                                <div class="col-md-3">
                                    <b>'.lang('enter_field_values').'</b>
                                </div>
                                <div class="col-md-4">
                                      <textarea id="elementos" name="values" class="form-control"></textarea>
                                </div>
                                <div class="col-md-4">
                                        '.lang('custom_field_instruction').'
                                </div>
                             </div>
                             <div class="row">
                             <div class="col-md-12">

                                    <div class="col-md-3">
                                        <b>'.lang('sort').'</b>
                                    </div>
                                     <div class="col-md-4">         
                                        <input id="alfabetico" type="Checkbox" name="alfabetico" value="1">
                                    </div>
                                
                             </div>
                                </br>
                                </br>
                             </div>
                        </div>
                        <div style="text-align:right">

                           <button  type="submit" class="btn btn-primary">'.lang('add').'</button>
                        </div>

                    
            

               
         ';


	}

	function addField($id){
                      
			                $save_field['name'] 		 = $this->input->post('namefield');
							$save_field['field_type']  = $this->input->post('type');
							$save_field['form']		 = "10". strval($id);
							$save_field['values']		 = $this->input->post('values');
							$save_field['date_format']		 = $this->input->post('formato');
							$save_field['mayusculas']		 = $this->input->post('mayusculas');
							$save_field['obligatorio']		 = $this->input->post('obligatorio');
                            if($this->input->post('maximo')!="") 
							$save_field['max']		 = $this->input->post('maximo');
						    else 
						    $save_field['max'] = 255; 
						    

							$this->custom_field_model->save($save_field);
					$_POST = array();	
    	redirect('admin/case_category/edit/'.$id);
							
    	//header('Location:admin/case_category/edit/'.$id);
    } 

    function deleteField($id){
      $this->custom_field_model->delete($id);
      header("Location:".$_SERVER['HTTP_REFERER']);  
    }


	
	
	function delete($id=false){
		
		if($id){
			$this->case_category_model->delete($id);
			 $this->session->set_flashdata('message', lang('case_category_deleted'));
			redirect('admin/case_category');
		}
	}	
		
	
}