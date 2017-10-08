<link href="<?php echo base_url('assets/css/jquery.datetimepicker.css')?>" rel="stylesheet" type="text/css" />
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
        <?php echo lang('employee')?>
        <small><?php echo lang('edit')?></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard')?></a></li>
        <li><a href="<?php echo site_url('admin/employees')?>"><?php echo lang('employees')?></a></li>
        <li class="active"><?php echo lang('edit')?></li>
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
                                        <b><?php echo lang('alert')?>!</b><?php echo validation_errors(); ?>
                                    </div>

<?php  } ?>
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                   <!-- <h3 class="box-title"><?php echo lang('edit')?></h3>  -->
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
				<h3 style="color:#FF0000"><?php echo validation_errors(); ?></h3>
				<form method="post" enctype="multipart/form-data">
                    <div class="box-body" style="height: 620px;">

                    
                        <div id="datos-generales">
                      <div>
                      (*) Campo Obligatorio 
                      </br>
                      </br>
                     </div>
                           <div id="panel1" class="col-md-4">
                                                    <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="name" style="clear:both;"><?php echo lang('employee_id')?></label>
                                    <input type="text" name="employee_id" value="<?php echo $employee->employee_id?>" class="form-control" disabled="disabled">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="name" style="clear:both;"><?php echo lang('name')?> (*)</label>
                                    <input type="text" name="name" value="<?php echo $employee->name?>" class="form-control">
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="gender" style="clear:both;"><?php echo lang('gender')?> (*)</label>
                                    <input type="radio"  name="gender" <?php echo $chk = ($employee->gender=="Male") ? 'checked="checked"': ''; ?>value="Male" /> <?php echo lang('male')?>
                                    <input type="radio" name="gender" <?php echo $chk = ($employee->gender=="Female") ? 'checked="checked"': ''; ?> value="Female" /> <?php echo lang('female')?>
                                </div>
                            </div>
                        </div>
               
                         <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="dob" style="clear:both;"><?php echo lang('date_of_birth')?></label>
                                    <input type="text" name="dob" id="datepicker" value="<?php echo $employee->dob?>"class="form-control datepicker">
                                    
                                </div>
                            </div>
                        </div>

                         <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="contact" style="clear:both;"><?php echo lang('phone')?> (*)</label>
                                    <input type="text" name="contact" value="<?php echo $employee->contact?>" class="form-control">
                                </div>
                            </div>
                        </div>

                         <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="contact" style="clear:both;"><?php echo lang('extension')?></label>
                                    <input type="text" name="extension" value="<?php echo $employee->extension?>" class="form-control">
                                </div>
                            </div>
                        </div>
                        
                         <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="contact" style="clear:both;"><?php echo lang('address')?></label>
                                    <textarea name="address"  class="form-control"><?php echo $employee->address?></textarea>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="name" style="clear:both;"><?php echo lang('status')?></label>
                                    <input type="radio" name="status" value="1" <?php echo ($employee->status==1)?'checked="checked"':'';?>  /> <?php echo lang('active')?>
                                    <input type="radio" name="status" value="0"  <?php echo ($employee->status==0)?'checked="checked"':'';?>  /> <?php echo lang('inactive')?>
                                </div>
                            </div>
                        </div>

                           </div>
                           <div id="panel2" class="col-md-4">
                                 <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label for="name" style="clear:both;"><?php echo lang('profile')?> <?php echo lang('picture')?></label>
                                            <input type="file" name="img" value="" class="form-control">
                                        </div>
                                         <div class="col-md-3">
                                         <?php 
                                         if(!empty($employee->image)){
                                         ?>
                                         <img src="<?php echo base_url('assets/uploads/images/'.$employee->image);?>" height="70" width="70" />
                                         <?php 
                                            }
                                        ?>  
                                         </div>
                                    </div>
                                </div>
                           </div>
                        </div>

                        <div id="datos-acceso">
                           <div class="col-md-4">
                                <div class="form-group">
                                      <div class="row">
                                        <div class="col-md-12">
                                            <label for="email" style="clear:both;"><?php echo lang('email')?> (*)</label>
                                            <input type="text" name="email" value="<?php echo $employee->email?>" class="form-control">
                                        </div>
                                    </div>
                                </div>

                                
                                <div class="form-group">
                                      <div class="row">
                                        <div class="col-md-12">
                                            <label for="username" style="clear:both;"><?php echo lang('username')?> (*)</label>
                                            <input type="text" name="username" value="<?php echo $employee->username?>" class="form-control">
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
                                            <?php 
                                               /*
                                               foreach($empresas as $new) {
                                                $sel ='';
                                                if(strpos((string)$employee->empresa_id,'"'.(string)$new->id.'"')==true) 
                                                    $sel = 'selected ="selected"';

                                                echo '<option data-padre="'.$new->parent_id.'" value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
                                               }
                                                  */
                                               $listaempresas2 = $empresas;
                                               $listaempresas3 = $empresas; 
                                               
                                                foreach($empresas as $new) {
                                                     $sel='';
                                                  if(strpos((string)$employee->empresa_id,'"'.(string)$new->id.'"')==true) 
                                                           $sel = 'selected ="selected"';
                                               if (($new->id == 0)){
                                                echo '<option class="padre"  value="'.$new->id.'" '.$sel.'> - '.$new->name.'</option>';
                                                    foreach($listaempresas2 as $new2) {
                                                            $sel='';
                                                        if(strpos((string)$employee->empresa_id,'"'.(string)$new2->id.'"')==true)
                                                           $sel = 'selected ="selected"';
                                                          if ($new2->parent_id == $new->id){
                                                              echo '<option class="hijo"  value="'.$new2->id.'" '.$sel.'> &nbsp&nbsp&nbsp&nbsp&nbsp '.$new2->name.'</option>';
                                                              foreach($listaempresas3 as $new3) {
                                                                  $sel='';
                                                       if(strpos((string)$employee->empresa_id,'"'.(string)$new3->id.'"')==true) 
                                                                   $sel = 'selected ="selected"';
                                                                    if ($new3->parent_id == $new2->id){
                                                                  echo '<option class="nieto"  value="'.$new3->id.'" '.$sel.'> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp '.$new3->name.'</option>';
                                                                  }
                                                              }
                                                        }
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
                                <div class="col-md-12">
                                    <label for="email" style="clear:both;"><?php echo lang('user_role');?></label>
                                    <select name="role_id" class="form-control chzn">
                                        <option value="">--<?php echo lang('select');?> <?php echo lang('user_role');?>---</option>
                                        <?php foreach($roles as $new) {
                                            $sel = "";
                                            if($new->id==$employee->user_role) $sel='selected="selected"';
                                           // foreach($empresa as $elemento) {
                                            //    if ($elemento->id_cargo==$new->id)
                                            //     $sel='selected="selected"';
                                           // }
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
                           <iframe src="<?php echo site_url('admin/employees/editcompanyuser/'.$employee->id); ?>" style="border:none;" height="500" width="100%"></iframe>
                        </div>

                        <div id="datos-bancarios">
                           <iframe src="<?php echo site_url('admin/employees/editbankuser/'.$employee->id); ?>" style="border:none;" height="500" width="100%"></iframe>
                        </div>
	
						<?php 
					$CI = get_instance();
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
							<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$employee->id."' AND form = '".$doc->form."' ")->row();?>		
							<input type="text" class="form-control" name="reply[<?php echo $doc->id ?>]" value="<?php echo @$result->reply; ?>"/>
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
								<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$employee->id."' AND form = '".$doc->form."' ")->row();?>	
							<select name="reply[<?php echo $doc->id ?>]" class="form-control">
							<?php	
										foreach($values as $key=>$val) {
											$sel='';
											if($val==$result->reply) $sel = "selected='selected'";
											echo '<option  value="'.$val.'" '.$sel.'>'.$val.'</option>';
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
							<?php 
							$x="";
							$result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$employee->id."' AND form = '".$doc->form."' ")->row();
							if(!empty($result->reply)){
								if($result->reply==$val){
									$x= 'checked="checked"';
								}else{
									$x='';
								}
							}
							?>			
						
						<input type="radio" name="reply[<?php echo $doc->id ?>]" value="<?php echo $val;?>" <?php echo $x;?> />	<?php echo $val;?> &nbsp; &nbsp; &nbsp; &nbsp;
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
							<?php 
							$x="";
							$result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$employee->id."' AND form = '".$doc->form."' ")->row();
							if(!empty($result->reply)){
								if($result->reply==$val){
									$x= 'checked="checked"';
								}else{
									$x='';
								}
							}
							?>	
										
										<input type="checkbox" name="reply[<?php echo $doc->id ?>]"  <?php echo $x;?> value="<?php echo $val;?>" class="form-control" />	&nbsp; &nbsp; &nbsp; &nbsp;
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
									<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$employee->id."' AND form = '".$doc->form."'")->row();?>	
										<textarea class="form-control" name="reply[<?php echo $doc->id ?>]" ><?php echo @$result->reply;?></textarea>
								</div>
                            </div>
                        </div>
							
					<?php }	if($doc->field_type==6) //url
						  {		?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
									<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$employee->id."' AND form = '".$doc->form."'")->row();?>	
										<input type="url" value="<?php echo @$result->reply;?>" class="form-control" name="reply[<?php echo $doc->id ?>]"  />
								</div>
                            </div>
                        </div>
					
						<?php }	if($doc->field_type==7) //email
						  {		?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
									<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$employee->id."' AND form = '".$doc->form."'")->row();?>	
										<input type="email" value="<?php echo @$result->reply;?>" name="reply[<?php echo $doc->id ?>]"  class="form-control" />
								</div>
                            </div>
                        </div>
							
							
					<?php }	if($doc->field_type==8) //Phone
						  {		?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
									<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$employee->id."' AND form = '".$doc->form."'")->row();?>	
									<input type="number" value="<?php echo @$result->reply;?>" class="form-control" name="reply[<?php echo $doc->id ?>]" />
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
                        <button type="submit" class="btn btn-primary"><?php echo lang('update')?></button>
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