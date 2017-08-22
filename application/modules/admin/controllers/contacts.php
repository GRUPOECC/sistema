<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
require_once APPPATH. '/third_party/PHPExcel/IOFactory.php';
 
class contacts extends MX_Controller {

	public function __construct()
	{
		parent::__construct();
		//$this->auth->check_access('1', true);
		$this->load->model("contact_model");
		$this->load->model("custom_field_model");
		$this->load->library('excel');
	}
	
	
	function index(){
		if (($this->input->server('REQUEST_METHOD') === 'POST')&&($this->input->post('category'))){     
            $categoria = json_encode($this->input->post('category'));
            $contactos = $this->input->post('contact_check'); 
            $cantidad = count($contactos); 
            $estado = false; 
            for ($i=0; $i<$cantidad; $i++) {  
             $cont_id = $contactos[$i]; 
             $estado = $this->contact_model->saveCategoryGroup($cont_id,$categoria);       
            } 
             if ($estado) 
               redirect('admin/contacts');
               else 
               	echo '
                  <script>
                   alert("Debe seleccionar un contacto");
                   location.href = "contacts";
                  </script>
               '; 
            
		}else{

			 if (isset($_POST['submit2'])){
                 echo '
                  <script>
                   alert("Debe seleccionar un contacto");                               
                  </script>
               '; 
                $data['contacts'] = $this->contact_model->get_all();
		        $data['contact_categories'] = $this->contact_model->get_all_contact_categories();	
		        $data['page_title'] = lang('contacts');
		        $data['body'] = 'contacts/list';
		        $this->load->view('template/main2', $data);	
             }else{
                $data['contacts'] = $this->contact_model->get_all();
		        $data['contact_categories'] = $this->contact_model->get_all_contact_categories();	
		        $data['page_title'] = lang('contacts');
		        $data['body'] = 'contacts/list';
		        $this->load->view('template/main2', $data);	

             }
		  
	    }

	}	
	
	function export(){
		$data['contacts'] = $this->contact_model->get_all();
		$this->load->view('contacts/export', $data);	
	}	
	
	
	function add(){
		$data['fields'] = $this->custom_field_model->get_custom_fields(4);
		$data['contact_categories'] = $this->contact_model->get_all_contact_categories();	
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_message('required', lang('custom_required'));
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			$this->form_validation->set_rules('email', 'lang:email', '');
			$this->form_validation->set_rules('phone1', 'lang:phone', '');
			$this->form_validation->set_rules('phone2', 'lang:phone', '');
			$this->form_validation->set_rules('phone3', 'lang:phone', '');
			$this->form_validation->set_rules('phone4', 'lang:phone', '');
			$this->form_validation->set_rules('category', 'lang:category', 'required');
			$this->form_validation->set_rules('company', 'lang:contact_company', '');
			$this->form_validation->set_rules('department', 'lang:department', '');
			$this->form_validation->set_rules('address', 'lang:address', '');
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
				$save['contact'] = $this->input->post('phone1');
				$save['email'] = $this->input->post('email');
				$save['address'] = $this->input->post('address');
				$save['phone1'] = $this->input->post('phone1');
				$save['phone2'] = $this->input->post('phone2');
				$save['phone3'] = $this->input->post('phone3');
				$save['phone4'] = $this->input->post('phone4');
				$save['category'] = json_encode($this->input->post('category'));
				$categoria = json_encode($this->input->post('category'));
				$save['company'] = $this->input->post('company');
				$save['department'] = $this->input->post('department');
            	$p_key = $this->contact_model->save($save,$categoria);
				$reply = $this->input->post('reply');
				if(!empty($reply)){
					foreach($this->input->post('reply') as $key => $val) {
						$save_fields[] = array(
							'custom_field_id'=> $key,
							'reply'=> $val,
							'table_id'=> $p_key,
							'form'=> 4,
						);	
					
					}	
					$this->custom_field_model->save_answer($save_fields);
				}	
            	$this->session->set_flashdata('message',lang('contact_created'));   
				redirect('admin/contacts');
				
			}
		}	
		$data['page_title'] = lang('add') . lang('contact');
		$data['body'] = 'contacts/add';

		
		$this->load->view('template/main', $data);	

	}	
	
	
	function edit($id=false){
		$data['fields'] = $this->custom_field_model->get_custom_fields(4);
		$data['contact_categories'] = $this->contact_model->get_all_contact_categories();	
		$data['contact'] = $data['clients'] = $this->contact_model->get_contact_by_id($id);
		$data['id'] =$id;
		if ($this->input->server('REQUEST_METHOD') === 'POST')
        {	
			$this->load->library('form_validation');
			$this->form_validation->set_rules('name', 'lang:name', 'required');
			$this->form_validation->set_rules('category', 'lang:category', 'required');
			$this->form_validation->set_message('required', lang('custom_required'));
			 
			if ($this->form_validation->run()==true)
            {
				$save['name'] = $this->input->post('name');
				$save['contact'] = $this->input->post('phone1');
				$save['email'] = $this->input->post('email');
				$save['address'] = $this->input->post('address');
				$save['phone1'] = $this->input->post('phone1');
				$save['phone2'] = $this->input->post('phone2');
				$save['phone3'] = $this->input->post('phone3');
				$save['phone4'] = $this->input->post('phone4');
				$save['category'] = json_encode($this->input->post('category'));
				$categoria = json_encode($this->input->post('category'));
				$save['company'] = $this->input->post('company');
				$save['department'] = $this->input->post('department');


				$reply = $this->input->post('reply');
				if(!empty($reply)){
					foreach($this->input->post('reply') as $key => $val) {
						$save_fields[] = array(
							'custom_field_id'=> $key,
							'reply'=> $val,
							'table_id'=> $id,
							'form'=> 4,
						);	
					
					}	
					$this->custom_field_model->delete_answer($id,$form=4);
					$this->custom_field_model->save_answer($save_fields);
				}
				$this->contact_model->update($save,$id,$categoria);
                $this->session->set_flashdata('message', lang('contact_updated'));
				redirect('admin/contacts');
			}
		}		
	
		$data['page_title'] = lang('edit') . lang('contact') ;
		$data['body'] = 'contacts/edit';
		$this->load->view('template/main', $data);	

	}
	
	function view($id=false){
		$data['fields'] = $this->custom_field_model->get_custom_fields(4);
		$data['contact'] = $data['clients'] = $this->contact_model->get_contact_by_id($id);
		$data['id'] =$id;
		
		$data['page_title'] = lang('view') . lang('contact') ;
		//$data['body'] = 'contacts/vista';
		$this->load->view('contacts/vista',$data);	

	}	


	function import()
	{
		
		if ($this->input->server('REQUEST_METHOD') === 'POST')
			$config['upload_path'] = './assets/uploads/files/';
			$config['file_name'] = 'myfile';
			$config['allowed_types'] = 'xlsx|xml|xls';
			$config['overwrite'] = TRUE;
			$this->load->library('upload', $config);
	
			if ( ! $this->upload->do_upload('file'))
			{
				$error = array('error' => $this->upload->display_errors());
				$this->session->set_flashdata('error', lang('please_select_correct_file_format'));
				redirect(base_url("admin/contacts/"));
			}
			else
			{
				$data = array('upload_data' => $this->upload->data());
				
			}
			
		
		$inputFileName = 'assets/uploads/files/'.$data['upload_data']['file_name']; // 
		
		$inputFileType = PHPExcel_IOFactory::identify($inputFileName);
		$objReader = PHPExcel_IOFactory::createReader($inputFileType);
		
		/**  Define how many rows we want to read for each "chunk"  **/
		$chunkSize = 1000000;
		/**  Create a new Instance of our Read Filter  **/
		$chunkFilter = new chunkReadFilter();
		
		/**  Tell the Reader that we want to use the Read Filter that we've Instantiated  **/
		$objReader->setReadFilter($chunkFilter);
		
			$chunkFilter->setRows(0,$chunkSize);
			/**  Load only the rows that match our filter from $inputFileName to a PHPExcel Object  **/
			$objPHPExcel = $objReader->load($inputFileName);
			$sheetData = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
			$save = array();
			foreach($sheetData as $ind => $values) {
				$save[$ind] = '';
				
				foreach($values as $in=>$val){
					if($in=='A')
						$save[$ind]['name'] = $val;
					if($in=='B')
						$save[$ind]['contact'] = $val;
					if($in=='C')
						$save[$ind]['email'] = $val;
					if($in=='D')
						$save[$ind]['address'] = $val;
					if($in=='E')
						$save[$ind]['phone1'] = $val;
					if($in=='F')
						$save[$ind]['phone2'] = $val;
					if($in=='G')
						$save[$ind]['phone3'] = $val;
					if($in=='H')
						$save[$ind]['phone4'] = $val;
					if($in=='I')
						$save[$ind]['category'] = $val;
					if($in=='J')
						$save[$ind]['company'] = $val;
					if($in=='K')
						$save[$ind]['department'] = $val;

				}	
			}
			
			$this->contact_model->import_data($save);
			
			$this->session->set_flashdata('message', lang('data_imported'));
			//import code end
			redirect(site_url("admin/contacts/"));

	}	
	
	
	
	
	function delete($id=false){
		
      if (is_int($id)) { 

		if($id){
			$this->contact_model->delete($id);
			$this->session->set_flashdata('message',lang('contact_deleted'));
			redirect('admin/contacts');
		}

	  }else{
          $ids = explode("-",$id);
          $i=0; 
          while($i<count($ids)){
            $this->contact_model->delete($ids[$i]);
          	$i++;
          } 
           redirect('admin/contacts');     	 
	  }
	}	

}




class chunkReadFilter implements PHPExcel_Reader_IReadFilter
{
    private $_startRow = 0;

    private $_endRow = 0;

    /**  Set the list of rows that we want to read  */
    public function setRows($startRow, $chunkSize) {
        $this->_startRow    = $startRow;
        $this->_endRow        = $startRow + $chunkSize;
    }

    public function readCell($column, $row, $worksheetName = '') {
        //  Only read the heading row, and the rows that are configured in $this->_startRow and $this->_endRow
        if (($row == 1) || ($row >= $this->_startRow && $row < $this->_endRow)) {
            return true;
        }
        return false;
    }
}