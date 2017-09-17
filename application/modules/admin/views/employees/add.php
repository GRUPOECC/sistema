<link href="<?php echo base_url('assets/css/jquery.datetimepicker.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/chosen.css')?>" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<?php echo base_url('assets/css/select2.min.css')?>" />
<!-- Content Header (Page header) -->
<style>
.row{
	margin-bottom:10px;
}
</style>
 <!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        <?php echo lang('employees')?>
        <small><?php echo lang('add')?></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i><?php echo lang('dashboard')?></a></li>
        <li><a href="<?php echo site_url('admin/employees')?>"><?php echo lang('employees')?></a></li>
        <li class="active"><?php echo lang('add')?></li>
    </ol>
</section>

<section class="content">
    <div class="row">
	<?php 
	if(validation_errors()){
?>
<div class="alert alert-danger alert-dismissable">
                                        <i class="fa fa-ban"></i>
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-close"></i></button>
                                        <b><?php echo lang('alert');?>!</b><?php echo validation_errors(); ?>
</div>

<?php  } ?>
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                  <!--  <h3 class="box-title"><?php echo lang('add')?></h3>-->

                     <ul class="nav nav-tabs">
                        <li id="tab1" class="active"><a onclick="changeTab(1)" href="javascript:void(0) "><?php echo lang('general_data')?></a></li>
                        <li id="tab2" class=""><a onclick="changeTab(2)" href="javascript:void(0)"><?php echo lang('access_data')?></a></li>
                        <li id="tab3" class=""><a onclick="changeTab(3)" href="javascript:void(0)"><?php echo lang('companies')?></a></li>
                        <li id="tab4" class=""><a onclick="changeTab(4)" href="javascript:void(0)"><?php echo lang('bank_details')?></a></li>
                        <!--
                        <li id="tab5" class=""><a onclick="changeTab(5)" href="javascript:void(0)"><?php echo lang('documents')?></a></li>
                        -->
                      </ul>
                </div><!-- /.box-header -->
                <!-- form start -->
				
				<?php echo form_open_multipart('admin/employees/add/'); ?>
                    <div class="box-body" style="height: 620px;">


                     <div id="datos-generales">
                  

                    <div id="panel1" class="col-md-4">
                        <div class="form-group">
                        	<div class="row">
                                <div class="col-md-12">
                                    <label for="name" style="clear:both;"><?php echo lang('employee_id')?></label>
									<input type="text" name="employee_id" value="<?php echo $e_id?>" class="form-control" disabled="disabled">
                                </div>
                            </div>
                        </div>
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-12">
                                    <label for="name" style="clear:both;"><?php echo lang('name')?></label>
									<input type="text" name="name" value="<?php echo set_value('name')?>" class="form-control">
                                </div>
                            </div>
                        </div>
						
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-12">
                                    <label for="gender" style="clear:both;"><?php echo lang('gender')?></label>
									<input type="radio" name="gender" value="Male" /> <?php echo lang('male')?>
									<input type="radio" name="gender" value="Female" /> <?php echo lang('female')?>
                                </div>
                            </div>
                        </div>
               
			   			 <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="dob" style="clear:both;"><?php echo lang('date_of_birth');?></label>
									<input type="text" name="dob" value="<?php echo set_value('dob')?>" class="form-control datepicker">
									
                                </div>
                            </div>
                        </div>

                       
						 <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="contact" style="clear:both;"><?php echo lang('phone')?></label>
									<input type="text" name="contact" value="<?php echo set_value('contact')?>" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="contact" style="clear:both;"><?php echo lang('extension')?></label>
                                    <input type="text" name="extension" value="<?php echo set_value('contact')?>" class="form-control">
                                </div>
                            </div>
                        </div>
						
						 <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="contact" style="clear:both;"><?php echo lang('address')?></label>
									<textarea name="address"  class="form-control"><?php echo set_value('address')?></textarea>
                                </div>
                            </div>
                        </div>
						
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-12">
                                    <label for="name" style="clear:both;"><?php echo lang('status')?></label>
									<input type="radio" name="status" value="1" /> <?php echo lang('active')?>
									<input type="radio" name="status" value="0" /> <?php echo lang('inactive')?>
                                </div>
                            </div>
                        </div>
                        </div>

                        <div id="panel2" class="col-md-4">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="name" style="clear:both;"><?php echo lang('profile')?> <?php echo lang('picture')?></label>
                                    <input type="file" name="img" value="<?php echo set_value('img')?>" class="form-control">
                                </div>
                            </div>
                        </div>


                        <!--

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="name" style="clear:both;"><?php echo lang('joining_date')?></label>
                                    <input type="text" name="joining_date" value="<?php echo set_value('joining_date')?>" class="form-control datepicker">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="name" style="clear:both;"><?php echo lang('joining_salary')?></label>
                                    <input type="text" name="joining_salary" value="<?php echo set_value('joining_salary')?>" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="designation_id" style="clear:both;"><?php echo lang('designation');?></label>
                                    <select name="designation_id" class="form-control chzn" id="degi">
                                        <option value="">--<?php echo lang('select');?> <?php echo lang('designation');?>---</option>
                                        
                                    </select>
                                </div>
                            </div>
                        </div>
                        -->

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

                    </div>

                    <div id="datos-acceso">
                      <div class="col-md-4">
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="email" style="clear:both;"><?php echo lang('email')?></label>
                                    <input type="text" name="email" value="<?php echo set_value('email')?>" class="form-control">
                                </div>
                            </div>
                        </div>

                        
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="username" style="clear:both;"><?php echo lang('username')?></label>
                                    <input type="text" name="username" value="<?php echo set_value('username')?>" class="form-control">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="password" style="clear:both;"><?php echo lang('password')?></label>
                                    <input type="password" name="password" value="" class="form-control">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="password" style="clear:both;"><?php echo lang('confirm')?> <?php echo lang('password')?></label>
                                    <input type="password" name="confirm" value="" class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">

                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="empresa_id" style="clear:both;"><?php echo lang('seecompany');?></label>
                                    <select name="empresa_id[]" class="form-control chzn" multiple="multiple" >
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

                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="email" style="clear:both;"><?php echo lang('user_role');?></label>
                                    <select name="role_id" class="form-control chzn">
                                        <option value="">--<?php echo lang('select');?> <?php echo lang('user_role');?>---</option>
                                        <?php foreach($roles as $new) {
                                            $sel = "";
                                            echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
                                        }
                                        
                                        ?>
                                    </select>
                                </div>
                            </div>
                        </div>


                        
                    </div>

                    </div>
                    <div id="datos-empresas">
                    <!--
                    <div class="col-md-4" >
                            <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="empresa_id" style="clear:both;"><?php echo lang('company_name');?></label>
                                    <select name="empresa_select" class="form-control chzn" id="empresa_select">
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
                        
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="email" style="clear:both;"><?php echo lang('user_role');?></label>
                                    <select name="role_id" class="form-control chzn">
                                        <option value="">--<?php echo lang('select');?> <?php echo lang('user_role');?>---</option>
                                        <?php foreach($roles as $new) {
                                            $sel = "";
                                            echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
                                        }
                                        
                                        ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                         <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="department_id" style="clear:both;"><?php echo lang('departments');?></label>
                                    <select name="department_id" class="form-control chzn" id="department_id">
                                        <option value="">--<?php echo lang('select');?> <?php echo lang('department');?>---</option>
                                        <?php foreach($departments as $new) {
                                            $sel = "";
                                            echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
                                        }
                                        
                                        ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        -->

                        <iframe src="<?php echo site_url('admin/employees/addcompanyuser/'); ?>" style="border:none;" height="500" width="100%"></iframe>
                        
                    

                    </div>

                    <div id="datos-bancarios">
                        <iframe src="<?php echo site_url('admin/employees/addbankuser/'); ?>" style="border:none;" height="500" width="100%"></iframe>

                    </div>


                    </div><!-- /.box-body -->
    
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary"><?php echo lang('save')?></button>
                    </div>
             <?php form_close()?>
            </div><!-- /.box -->
        </div>
     </div>
</section>  
<script src="<?php echo base_url('assets/js/select2.min.js')?>""></script>
<script src="<?php echo base_url('assets/js/jquery.datetimepicker.js')?>" type="text/javascript"></script>
<script type="text/javascript">
   
   function changeTab(tab){
            if(tab==1){
         document.getElementById("tab1").classList.add('active');
         document.getElementById("tab2").classList.remove('active');
         document.getElementById("tab3").classList.remove('active');
         document.getElementById("tab4").classList.remove('active');
         //document.getElementById("tab5").classList.remove('active');

         document.getElementById("datos-acceso").style.display = "none";
         document.getElementById("datos-generales").style.display = "";
         document.getElementById("datos-empresas").style.display = "none";
         document.getElementById("datos-bancarios").style.display = "none";

      }
            if(tab==2){
         document.getElementById("tab1").classList.remove('active');
         document.getElementById("tab2").classList.add('active');
         document.getElementById("tab3").classList.remove('active');
         document.getElementById("tab4").classList.remove('active');
         //document.getElementById("tab5").classList.remove('active');

         document.getElementById("datos-acceso").style.display = "";
         document.getElementById("datos-generales").style.display = "none";
         document.getElementById("datos-empresas").style.display = "none";
         document.getElementById("datos-bancarios").style.display = "none";
      }
            if(tab==3){
         document.getElementById("tab1").classList.remove('active');
         document.getElementById("tab2").classList.remove('active');
         document.getElementById("tab3").classList.add('active');
         document.getElementById("tab4").classList.remove('active');
         //document.getElementById("tab5").classList.remove('active');

         document.getElementById("datos-acceso").style.display = "none";
         document.getElementById("datos-generales").style.display = "none";
         document.getElementById("datos-empresas").style.display = "";
         document.getElementById("datos-bancarios").style.display = "none";
      }
            if(tab==4){
         document.getElementById("tab1").classList.remove('active');
         document.getElementById("tab2").classList.remove('active');
         document.getElementById("tab3").classList.remove('active');
         document.getElementById("tab4").classList.add('active');
         //document.getElementById("tab5").classList.remove('active');
          document.getElementById("datos-acceso").style.display = "none";
         document.getElementById("datos-generales").style.display = "none";
         document.getElementById("datos-empresas").style.display = "none";
         document.getElementById("datos-bancarios").style.display = "";
      }
            if(tab==5){
         document.getElementById("tab1").classList.remove('active');
         document.getElementById("tab2").classList.remove('active');
         document.getElementById("tab3").classList.remove('active');
         //document.getElementById("tab4").classList.remove('active');
         //document.getElementById("tab5").classList.add('active');
      }


   }
    


 $(document).ready(function(){
      document.getElementById("datos-acceso").style.display = "none";
      document.getElementById("datos-empresas").style.display = "none";
      document.getElementById("datos-bancarios").style.display = "none";

   });

   //Select2
  $(".chzn").select2({
        maximumSelectionLength: 100000,
    placeholder: "Seleccione"
    })

$(document).on('change', '#department_id', function(){
 //alert(12);
 	department_id = $('#department_id').val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#degi').html(ajax_load);
	  
  $.ajax({
    url: '<?php echo site_url('admin/employees/get_degi') ?>',
    type:'POST',
    data:{id:department_id},
	
	success:function(result){
      //alert(result);return false;
	  $('#degi').html(result);
	  
	 }
  });
});


 jQuery('.datepicker').datetimepicker({
 lang:'en',
 i18n:{
  de:{
   months:[
    'Januar','Februar','März','April',
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
 format:'Y-m-d'
});




</script>