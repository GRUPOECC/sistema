<link href="<?php echo base_url('assets/css/chosen.css')?>" rel="stylesheet" type="text/css" />
<!-- Content Header (Page header) -->
<style>
.row{
	margin-bottom:10px;
}
</style>
<?php $admin = $this->session->userdata('admin'); ?>
<!-- Content Header (Page header) -->
<section class="content-header">
  <h3>
   <?php echo lang('select_company');?>
   </h3>
</section>

<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                            
    <!-- form start -->
			

				<h3 style="color:#FF0000"><?php echo validation_errors(); ?></h3>
				
               <form action="http://localhost/sistema/admin/tasks/add" method="post" onsubmit="return validacion()" ="" accept-charset="utf-8" enctype="multipart/form-data">
                    <div class="box-body">
                        <div class="box-body">
                        
						
						 <div class="form-group">
                        	<div class="row">
                                <div class="col-md-8">
                                    <label for="email" style="clear:both;"><?php echo lang('select_company');?></label>
                                    <select id="empresaseleccionada" name="empresaseleccionada">
                                    <option value="">--<?php echo lang('select');?> <?php echo lang('company_name');?>---</option>
                                        <?php foreach($empresas as $new) {
                                            $sel = "";
                                            echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
                                        }
                                        
                                        ?>
                                        
                                    </select>
                                </div>
                            </div>
                        </div>
						
                    </div><!-- /.box-body -->
    
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary">Comenzar</button>
                    </div>
             </form>
            </div><!-- /.box -->
        </div>
     </div>
</section>  
<script src="<?php echo base_url('assets/js/redactor.min.js')?>"></script>
 <script>

   function validacion(){

        if(document.getElementById("empresaseleccionada").value == "")
        {
            alert("Debe seleccionar una empresa");
            return false;  
        }


    return true; 
   }




  $(document).ready(function(){
    $('.redactor').redactor({
			  // formatting: ['p', 'blockquote', 'h2','img'],
            minHeight: 200,
            imageUpload: '<?php echo base_url(config_item('admin_folder').'/wysiwyg/upload_image');?>',
            fileUpload: '<?php echo base_url(config_item('admin_folder').'/wysiwyg/upload_file');?>',
            imageGetJson: '<?php echo base_url(config_item('admin_folder').'/wysiwyg/get_images');?>',
            imageUploadErrorCallback: function(json)
            {
                alert(json.error);
            },
            fileUploadErrorCallback: function(json)
            {
                alert(json.error);
            }
      });
});
  </script>