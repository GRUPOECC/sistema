<link href="<?php echo base_url('assets/css/chosen.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/jquery.datetimepicker.css')?>" rel="stylesheet" type="text/css" />
  <!-- Ion Slider -->
<link href="<?php echo base_url()?>assets/css/ionslider/ion.rangeSlider.css" rel="stylesheet" type="text/css" />
<!-- ion slider Nice -->
<link href="<?php echo base_url()?>assets/css/ionslider/ion.rangeSlider.skinNice.css" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url()?>assets/css/bootstrap-slider/slider.css" rel="stylesheet" type="text/css" />
<!-- Content Header (Page header) -->
<style>
.row{
	margin-bottom:10px;
}
</style>
 <!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        <?php echo lang('case')?>
        <small><?php echo lang('add')?></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo base_url('admin')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard')?></a></li>
        <li><a href="<?php echo base_url('admin/cases')?>"><?php echo lang('case')?></a></li>
        <li class="active"><?php echo lang('add')?></li>
    </ol>
</section>
<?php 
	if(validation_errors()){
?>
<div class="alert alert-danger alert-dismissable">
                                        <i class="fa fa-ban"></i>
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-close"></i></button>
                                        <b><?php echo lang('alert')?>!</b><?php echo validation_errors(); ?>
                                    </div>

<?php  } ?>
<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title"><?php echo lang('add')?></h3>
                </div><!-- /.box-header -->
                <!-- form start -->
				<?php echo form_open_multipart('admin/cases/add/'); ?>
				    <div class="box-body">
			
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-3">
                                	<b><?php echo lang('company')?>*</b>
								</div>
								<div class="col-md-4" id="location_result">
                                    <select name="location_id[]" id="location_id" class="chzn col-md-12"  multiple="multiple">
										<option value="">--<?php echo lang('select')?> <?php echo lang('location')?>--</option>
										<?php 

                                              $unico  = "0"; 
										     if (sizeof(json_decode($empleado->empresa_id,true))==1){
					                             $unicaempresa = json_decode($empleado->empresa_id,true);
					                             $unico = $unicaempresa[0];
											 }

		                                      foreach($empresas as $new) {
													$sel = "";
												if (strpos($empleado->empresa_id,'"'.$new->id.'"') == true) {

													if (sizeof(json_decode($empleado->empresa_id,true))==1){
													   	   
													   	   if ($unico==(string)$new->id){
													   	   	$sel = 'selected="selected"'; 
			                                                echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
			                                                }
			                                             
													   }else{
                                                            if(set_select('location_id', $new->id)) $sel = "selected='selected'";
                                                       echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';

													   }
												}									
											 }

										?>
									</select>
                                </div>
                            </div>
                        </div>
						
						
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-3">
                                	<b><?php echo lang('department')?>*</b>
								</div>
								<div class="col-md-4" id="dept_category_result">
                                    <select name="departamento_id" id="departamento_id" class="chzn col-md-12" required>
										<option value="">--<?php echo lang('select')?> <?php echo lang('department')?>--</option>
										<?php foreach($dept_categories as $new) {
											$sel = "";
											if(set_select('dept_category_id', $new->id)) $sel = "selected='selected'";
											echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
										}
										
										?>
									</select>
                                </div>
                            </div>
                        </div>
					    <!--
                        -->
						
						
						
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-3">
                                	<b><?php echo lang('case')?>  <?php echo lang('category')?>*</b>
								</div>
								<div class="col-md-4">
								    <div id="casecategory_result">
                                    
									</div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                        	<div class="row">
                        	    <div class="col-md-3">
                                	
								</div>
								<div class="col-md-4" id="category_result">
								<!-- campos opcionales -->
                                    




                                </div>
                            </div>
                        </div>
													
						
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-3">
                                	<b><?php echo lang('description')?>*</b>
								</div>
								<div class="col-md-4">
                                   <textarea name="description" class="form-control redactor" required><?php echo set_value('description'); ?></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                              <div class="row">
                              <div class="col-md-3">
                                    <label for="email" style="clear:both;"><?php echo lang('priority')?>*</label>
						          </div>
                                <div class="col-md-4">
									<select name="prioridad" class="form-control chzn" required>
                                        <option value="1" <?php echo ($case->prioridad=="1")?'selected="selected"':'';?> ><?php echo lang('low')?></option>
                                        <option value="2" <?php echo ($case->prioridad=="2")?'selected="selected"':'';?>><?php echo lang('medium')?></option>
                                        <option value="3" <?php echo ($case->prioridad=="3")?'selected="selected"':'';?>><?php echo lang('high')?></option>
                                    </select>
                                </div>
                            </div>
                        </div>

                     <div class="form-group">
                              <div class="row">
                                <div class="col-md-3">
                                    <label for="progress" style="clear:both;"><?php echo lang('progress');?>*</label>
						          </div>
						         <div class="col-md-4">
					                          <input type="text" value=""  name="progress" class="slider form-control" 
											  
											   data-slider-min="0" data-slider-max="50" data-slider-step="1" data-slider-value="<?php echo set_value('description')?set_value('description'):0;?>"/
											  
											  data-slider-orientation="horizontal" data-slider-selection="before" data-slider-tooltip="show" data-slider-id="red" >
								 </div>
                                       
                                      
                                    </div>
                     </div>
						

						
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-3">
                                	<b><?php echo lang('due_date')?></b>
								</div>
								<div class="col-md-4">
                                   <input type="text" name="due_date" value="<?php echo set_value('due_date'); ?>" class= "form-control datepicker2"/>
                                </div>
                            </div>
                        </div>
						<!--
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-3">
                                	<b><?php echo lang('opposite_lawyer')?></b>
								</div>
								<div class="col-md-4">
                                   <input type="text" name="o_lawyer" value="<?php echo set_value('o_lawyer'); ?>" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        -->

                        <!--Adjuntar Archivos -->
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-6">
                                    <label for="email" style="clear:both;"><?php echo lang('upload');?></label>
                                    <input type="file" multiple="true" name="archivos[]" id="archivos[]" />
                                </div>
                            </div>
                        </div>
						
						
											
						<?php 
						if($fields){
							foreach($fields as $doc){
							$output = '';
							if($doc->field_type==1) //testbox
							{
						?>
						<div class="form-group">
                              <div class="row">
                                <div class="col-md-3">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
									</div>
								<div class="col-md-4">
							<input type="text" class="form-control" name="reply[<?php echo $doc->id ?>]" id="req_doc" />
								</div>
                            </div>
                        </div>
					 <?php 	}	
							if($doc->field_type==2) //dropdown list
							{
								$values = explode(",", $doc->values);
					?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-3">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
								</div>
								<div class="col-md-4">	
							<select name="reply[<?php echo $doc->id ?>]" class="form-control">
							<?php	
										foreach($values as $key=>$val) {
											echo '<option value="'.$val.'">'.$val.'</option>';
										}
							?>			
							</select>	
								</div>
                            </div>
                        </div>
						<?php	}	
								if($doc->field_type==3) //radio buttons
							{
								$values = explode(",", $doc->values);
					?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-3">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
								</div>
								<div class="col-md-4">
							<?php	
										foreach($values as $key=>$val) { ?>
										
										<input type="radio" name="reply[<?php echo $doc->id ?>]" value="<?php echo $val;?>" />	<?php echo $val;?> &nbsp; &nbsp; &nbsp; &nbsp;
 							<?php 			}
							?>			
								</div>
                            </div>
                        </div>
						
						<?php }
						if($doc->field_type==4) //checkbox
							{
								$values = explode(",", $doc->values);
					?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-3">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
								</div>
								<div class="col-md-4">
							<?php	
										foreach($values as $key=>$val) { ?>
										
										<input type="checkbox" name="reply[<?php echo $doc->id ?>]" value="<?php echo $val;?>" class="form-control" />	&nbsp; &nbsp; &nbsp; &nbsp;
 							<?php 			}
							?>			
								</div>
                            </div>
                        </div>
					<?php }	if($doc->field_type==5) //Textarea
						  {		?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-3">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
								</div>
								<div class="col-md-4">
										<textarea class="form-control" name="reply[<?php echo $doc->id ?>]" ></textarea		
								></div>
                            </div>
                        </div>
							
						
						
					<?php 
								}	if($doc->field_type==6) //url
						  		{?>
						<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
										<input type="url"  value=""name="reply[<?php echo $doc->id ?>]" class="form-control" >
								</div>
                            </div>
                        </div>
							
					<?php 
								}	if($doc->field_type==7) //Email
						  		{?>
						<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
										<input type="email"  value=""name="reply[<?php echo $doc->id ?>]" class="form-control" >
								</div>
                            </div>
                        </div>
									
					<?php 
								}	if($doc->field_type==8) //Phone
						  		{?>
						<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
										<input type="number"  value=""name="reply[<?php echo $doc->id ?>]" class="form-control" >
								</div>
                            </div>
                        </div>
													
						
						
					<?php 
								}	
							}
						}
					?>	

			   			
                      
						
                    </div><!-- /.box-body -->
    
                    <div class="box-footer">
                        <button  type="submit" class="btn btn-primary"><?php echo lang('save')?></button>
                    </div>
             </form>
            </div><!-- /.box -->
        </div>
     </div>
</section>  



<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
			 <div id="err">  
				<?php 
			if(validation_errors()){
		?>
		<div class="alert alert-danger alert-dismissable">
												<i class="fa fa-ban"></i>
												<button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-close"></i></button>
												<b><?php echo lang('alert')?>!</b><?php echo validation_errors(); ?>
											</div>
		
		<?php  } ?>  
			</div>
	   
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?php echo lang('add')?> <?php echo lang('new')?> <?php echo lang('client')?></h4>
      </div>
      <div class="modal-body">
			<form method="post" action="<?php echo site_url('admin/clients/add_client') ?>" id="my_form">
			         <div class="box-body">
                        <div class="form-group">
                        	<div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"><?php echo lang('name')?></label>
									<input type="text" name="name" id="name" class="form-control">
                                </div>
                            </div>
                        </div>
						
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-4">
                                    <label for="gender" style="clear:both;"><?php echo lang('gender')?></label>
									<input type="radio" name="gender" id="gender" value="Male" /> <?php echo lang('male')?>
									<input type="radio" name="gender" id="gender"value="Female" /> <?php echo lang('female')?>
                                </div>
                            </div>
                        </div>
               
			   			 <div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="dob" style="clear:both;"><?php echo lang('date_of_birth')?></label>
									<input type="text" name="dob" id="dob"  class="form-control datepicker">
									
                                </div>
                            </div>
                        </div>
						
					
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="email" style="clear:both;"><?php echo lang('email')?></label>
									<input type="text" name="email" id="email" value="" class="form-control">
                                </div>
                            </div>
                        </div>
						
						<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="username" style="clear:both;"><?php echo lang('username')?></label>
									<input type="text" name="username" id="username" class="form-control">
                                </div>
                            </div>
                        </div>
						
						<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="password" style="clear:both;"><?php echo lang('password')?></label>
									<input type="password" name="password" id="password" class="form-control">
                                </div>
                            </div>
                        </div>
						
						<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="password" style="clear:both;"><?php echo lang('confirm')?> <?php echo lang('password')?></label>
									<input type="password" name="confirm" id="confirm" class="form-control">
                                </div>
                            </div>
                        </div>
						
						 <div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo lang('phone')?></label>
									<input type="text" name="contact" id="contact" class="form-control">
                                </div>
                            </div>
                        </div>
						
						 <div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo lang('address')?></label>
									<textarea name="address"  id="address" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>
						
							
						<?php 
						if($fields_clients){
							foreach($fields_clients as $doc){
							$output = '';
							if($doc->field_type==1) //testbox
							{
						?>
						<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
							<input type="text" class="form-control" name="reply[<?php echo $doc->id ?>]" id="req_doc" />
								</div>
                            </div>
                        </div>
					 <?php 	}	
							if($doc->field_type==2) //dropdown list
							{
								$values = explode(",", $doc->values);
					?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
							<select name="reply[<?php echo $doc->id ?>]" class="form-control">
							<?php	
										foreach($values as $key=>$val) {
											echo '<option value="'.$val.'">'.$val.'</option>';
										}
							?>			
							</select>	
								</div>
                            </div>
                        </div>
						<?php	}	
								if($doc->field_type==3) //radio buttons
							{
								$values = explode(",", $doc->values);
					?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
							
							<?php	
										foreach($values as $key=>$val) { ?>
										
										<input type="radio" name="reply[<?php echo $doc->id ?>]" value="<?php echo $val;?>" />	<?php echo $val;?> &nbsp; &nbsp; &nbsp; &nbsp;
 							<?php 			}
							?>			
								</div>
                            </div>
                        </div>
						
						<?php }
						if($doc->field_type==4) //checkbox
							{
								$values = explode(",", $doc->values);
					?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
							
							<?php	
										foreach($values as $key=>$val) { ?>
										
										<input type="checkbox" name="reply[<?php echo $doc->id ?>]" value="<?php echo $val;?>" class="form-control" />	&nbsp; &nbsp; &nbsp; &nbsp;
 							<?php 			}
							?>			
								</div>
                            </div>
                        </div>
					<?php }	if($doc->field_type==5) //Textarea
						  {		?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
										<textarea class="form-control" name="reply[<?php echo $doc->id ?>]" ></textarea		
								></div>
                            </div>
                        </div>
							
						
						
					<?php 
								}	
							}
						}
					?>	



                    </div><!-- /.box-body -->
    
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary"><?php echo lang('save')?></button>
                    </div>
             </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo lang('close')?></button>  
      </div>
    </div>
  </div>
</div>

<script src="<?php echo base_url('assets/js/chosen.jquery.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/jquery.datetimepicker.js')?>" type="text/javascript"></script>
  <!-- Ion Slider -->
<script src="<?php echo base_url('assets/js/plugins/ionslider/ion.rangeSlider.min.js')?>" type="text/javascript"></script>
<!-- Bootstrap slider -->
<script src="<?php echo base_url('assets/js/plugins/bootstrap-slider/bootstrap-slider.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/redactor.min.js')?>"></script>

<script type="text/javascript">
$(function() {
	
	$('.chzn').chosen();
	
});

jQuery('.datepicker2').datetimepicker({
 lang:'en',
 i18n:{
  de:{
   months:[
    'Januar','Februar','M�rz','April',
    'Mai','Juni','Juli','August',
    'September','Oktober','November','Dezember',
   ],
   dayOfWeek:[
    "So.", "Mo", "Di", "Mi", 
    "Do", "Fr", "Sa.",
   ]
  }
 },
 timepicker:false,
 format:'d-m-Y'
});
  //$(function() {
//   $('.datepicker').datetimepicker({
//	//mask:'9999-19-39 29:59',
//	format  : 'Y-m-d'
//	
//	}
//	
//	);
//  });
</script>


<script>
$('.slider').slider();
/*
$(document).on('change', '#location_id', function(){
 //alert(12);
 	vch = $(this).val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#dept_category_result').html(ajax_load);
	  
  $.ajax({
    url: '<?php echo site_url('admin/cases/get_dept_categories') ?>',
    type:'POST',
    data:{id:vch},
    success:function(result){
      //alert(result);return false;
	  $('#dept_category_result').html(result);
	  $(".chzn").chosen();
	 }
  });
});

*/


$(document).on('change', '#departamento_id', function(){
	c_c_id 		= $('#departamento_id').val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#casecategory_result').html(ajax_load);
	  
  $.ajax({
    url: '<?php echo site_url('admin/cases/get_depts') ?>',
    type:'POST',
    data:{l_id:c_c_id},
	
	success:function(result){
      //alert(result);return false;
	  $('#casecategory_result').html(result);
	  $(".chzn").chosen();
	 }
  });
});

$(document).on('change', '#categorias', function(){
 //alert(12);
 	categoria_id = $('#categorias').val();
 	location_id = $('#location_id').val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#category_result').html(ajax_load);
	  
  $.ajax({
    url: '<?php echo site_url('admin/cases/opciones') ?>',
    type:'POST',
    data:{l_id:categoria_id,empresa:location_id},
	
	success:function(result){
      //alert(result);return false;
	  $('#category_result').html(result);
	  $(".chzn").chosen();
	     
	 }
  });
});




$( "#my_form" ).submit(function( event ) {
	name = $('#name').val();
	
	gender = $('#gender').val();
	dob = $('#dob').val();
	email = $('#email').val();
	username = $('#username').val();
	password = $('#password').val();
	conf = $('#confirm').val();
	contact = $('#contact').val();
	address = $('#address').val();
	
	$.ajax({
		url: '<?php echo site_url('admin/clients/add_client') ?>',
		type:'POST',
		data:{name:name,gender:gender,dob:dob,email:email,username:username,password:password,confirm:conf,contact:contact,address:address},
		
		success:function(result){
		// alert(result);return false;
			  if(result=="Success")
				{
					//alert("value=0");
					//$('#myModal').fadeOut(500);
					 $('#myModal').modal('hide');
					 window.close(); 
				}
				else
				{
					$('#err').html(result);
				}
		  
		  $(".chzn").chosen();
		 }
	  });
	
	event.preventDefault();
});




</script>

 <script>
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
