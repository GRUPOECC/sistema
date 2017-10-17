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
        <small><?php echo lang('edit')?></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i><?php echo lang('dashboard')?></a></li>
        <li><a href="<?php echo site_url('admin/cases')?>"><?php echo lang('case')?></a></li>
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
                    <h3 class="box-title"><?php echo lang('edit')?></h3>
                </div><!-- /.box-header -->
                <!-- form start -->
				
				<?php echo form_open_multipart('admin/cases/edit/'.$id); ?>
                    <div class="box-body">
                        <div class="box-body">
  
						<div class="form-group">
                              <div class="row">
                                <div class="col-md-3">   
                                    <label for="empresa_id" style="clear:both;"><?php echo lang('company');?></label>
                                </div>    
                                <div class="col-md-4"> 
                                     <input id="llave" name ="llave"  type="hidden" name="opcion" value="<?php echo $case->id;?>">  
                                    <select name="location_id[]" id="location_id" class="form-control chzn" multiple="multiple">
                                        <option value="">--<?php echo lang('select');?> <?php echo lang('company_name');?>---</option>
                                        <?php 

                                       /*

                                        foreach($empresas as $new) {
                                              if (sizeof($empresas)==1){
                                               $sel = 'selected="selected"';  
                                              echo '<option value="'.$empresas[0]->id.'" '.$sel.'>'.$empresas[0]->name.'</option>';

                                           }else{


                                            $sel = "";
                                            if ($case->empresa_id==$new->id)
                                                     $sel='selected="selected"';
                                            echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
                                            }
                                        }


                                       */



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
                                                          $sel = "";
                                                            if ($case->empresa_id==$new->id)
                                                                     $sel='selected="selected"';
                                                            echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
                                                            }

                                                       }
                                                }                                   
                                             //}



                                        ?>
                                    </select>

                                </div>
                            </div>
                        </div>
				
						<div class="form-group">
                              <div class="row">
                                <div class="col-md-3">   
                                    <label for="empresa_id" style="clear:both;"><?php echo lang('department');?></label>
                                </div>    
                                <div class="col-md-4" id="dept_category_result">   
                                    <select name="departamento_id" id="departamento_id" class="form-control chzn">
                                        <option value="0">--<?php echo lang('select');?> <?php echo lang('departament');?>---</option>
                                        <?php foreach($departamentos as $new) {
                                              
                                            $sel = "";
                                         if ($case->departamento_id==$new->id)
                                                     $sel='selected="selected"';

                                            echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
                                        }
                                        ?>
                                    </select>

                                </div>
                            </div>
                        </div>
                         <!--
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-3">   
                                    <label for="empresa_id" style="clear:both;"><?php echo lang('employees');?></label>
                                </div>    
                                <div class="col-md-4" id="dept_result">   
                                    <select name="empleados_id[]" id="empleados_id[]" class="form-control chzn" multiple="multiple">
                                        <option value="">--<?php echo lang('select');?> <?php echo lang('departament');?>---</option>
                                        <?php foreach($empleados as $new) {
                                              
                                            $sel = "";
                                         if (strpos((string)$case->usuarios_id,(string)$new->id)==true)
                                                     $sel='selected="selected"';
                                            echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
                                        }
                                        ?>
                                    </select>

                                </div>
                            </div>
                        </div>
                        -->
						<!--
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-3">
                                	<b><?php echo lang('court')?> <?php echo lang('category')?></b>
								</div>
								<div class="col-md-4" id="court_category_result">
                                    <select name="court_category_id"  id="court_category_id" class="chzn col-md-12" >
										<option value="">--<?php echo lang('select')?> <?php echo lang('court')?> <?php echo lang('category')?>--</option>
										<?php foreach($court_categories as $new) {
											$sel = "";
											if($new->id==$case->court_category_id) $sel = "selected='selected'";
											echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
										}
										
										?>
									</select>
                                </div>
                            </div>
                        </div>
					    -->
					    <!--
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-3">
                                	<b><?php echo lang('court')?></b>
								</div>
								<div class="col-md-4" id="court_result">
                                    <select name="court_id" id="court_id"  class="chzn col-md-12" >
										<option value="">--<?php echo lang('select')?> <?php echo lang('court')?>--</option>
										<?php foreach($courts as $new) {
											$sel = "";
											if($new->id==$case->court_id) $sel = "selected='selected'";
											echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
										}
										
										?>
									</select>
                                </div>
                            </div>
                        </div>
						-->
						
					
						
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-3">
                                	<b><?php echo lang('case')?> <?php echo lang('category')?></b>
								</div>
								<div class="col-md-4">
                <div id="casecategory_result">
                                    <select id="categorias" name="case_category_id" class="chzn col-md-12" >
										<?php foreach($case_categories as $new) {
											$sel = ''; 

                                            if ($new->id == $case->case_category_id)
                                              $sel = 'selected';

											echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
										}
										
										?>
									</select>
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

						<!--
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-3">
                                	<b><?php echo lang('case')?> <?php echo lang('stages')?></b>
								</div>
								<div class="col-md-4">
                                    <select name="case_stage_id" class="chzn col-md-12">
										<option value="">--<?php echo lang('select')?> <?php echo lang('case')?> <?php echo lang('stages')?>--</option>
										<?php foreach($stages as $new) {
											$sel = "";
											if($new->id==$case->case_stage_id) $sel = "selected='selected'";
											echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
										}
										
										?>
									</select>
                                </div>
                            </div>
                        </div>
                        -->
						<!--
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-3">
                                	<b><?php echo lang('act')?></b>
								</div>
								<div class="col-md-4">
                                    <select name="act_id[]" class="chzn col-md-12" multiple="multiple" >
										<?php 
										
										foreach($acts as $new) {
											$sel = (in_array($new->id,json_decode($case->act_id)))?'selected': '';
											echo '<option value="'.$new->id.'" '.$sel.'>'.$new->title.'</option>';
										}
										
										?>
										
									</select>
                                </div>
                            </div>
                        </div>
						-->
						
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-3">
                                	<b><?php echo lang('description')?></b>
								</div>
								<div class="col-md-4">
                                   <textarea name="description" class="form-control redactor"><?php echo $case->description;?></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                              <div class="row">
                              <div class="col-md-3">
                                    <label for="email" style="clear:both;"><?php echo lang('priority')?></label>
                                  </div>
                                <div class="col-md-4">
                                    <select name="prioridad" class="form-control chzn">
                                        <option value="">--<?php echo lang('select');?> <?php echo lang('priority');?>---</option>
                                        <option value="1" <?php echo ($case->prioridad=="1")?'selected="selected"':'';?> >Low</option>
                                        <option value="2" <?php echo ($case->prioridad=="2")?'selected="selected"':'';?>>Medium</option>
                                        <option value="3" <?php echo ($case->prioridad=="3")?'selected="selected"':'';?>>High</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                     <div class="form-group">
                              <div class="row">
                                <div class="col-md-3">
                                    <label for="progress" style="clear:both;"><?php echo lang('progress');?></label>
						        </div>    
						            <div class="col-md-4">
                                             <?php if($case->created_by==$iduser){?>
                                             
					                          <input type="text" value=""  name="progress" class="slider form-control"  
											   data-slider-min="0" data-slider-max="50" data-slider-step="1" data-slider-value="<?php echo $case->progress?>"/										 
	 										  data-slider-orientation="horizontal" data-slider-selection="before" data-slider-tooltip="show" data-slider-id="red">

                                            <?php }else {?>

                                              <input type="text" value=""  name="progress" class="slider form-control"      
                                               data-slider-min="50" data-slider-max="100" data-slider-step="1" data-slider-value="<?php echo $case->progress?>"/
                                              data-slider-orientation="horizontal" data-slider-selection="before" data-slider-tooltip="show" data-slider-id="red">

                                            <?php }?>


                                        </div>
                                      
                                    </div>
                     </div>
						
	
						
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-3">
                                	<b><?php echo lang('due_date')?></b>
								</div>
								<div class="col-md-4">
                                   <input type="text" name="due_date" value="<?php echo $case->due_date;?>" class="form-control datepicker"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-2">
                                    <label for="email" style="clear:both;"><?php echo lang('files');?></label>
                                </div>
                                <div class="col-md-7">

                                                    <?php 
                                                        session_start();
                                                        $icono = "assets/img/icono-adjunto.png";
                                                        $_SESSION["Archivos"] = "";
                                                        $i=0;
                                                        foreach($files as $doc){
                                                          echo '<p><IMG SRC="'.base_url($icono).'" WIDTH=40 HEIGHT=40 ALT=""><a href="'.base_url($doc->location).'">'.$doc->name.'</a> - <a href="'.site_url('admin/cases/deleteFile/'.$case->id).'-'.$i.'-'.$doc->id.'">'.lang('delete').'</a></p>';
                                                          $_SESSION["Archivos"] = $_SESSION["Archivos"].$doc->location."%";
                                                          $i=$i+1;
                                                        }
                                                    ?>
                                    </div>
                            </div>
                        </div>
                        <!--Adjuntar Archivos -->
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-6">
                                    <label for="email" style="clear:both;"><?php echo lang('upload');?></label>
                                    <input type="file" multiple="true" name="archivos[]" id="archivos[]" />
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
                                   <input type="text" name="o_lawyer" value="<?php echo $case->o_lawyer;?>" class="form-control"/>
                                </div>
                            </div>
                        </div>
						


						
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-3">
                                	<b><?php echo lang('total_fees')?></b>
								</div>
								<div class="col-md-4">
                                   <input type="text" name="fees" value="<?php echo $case->fees;?>" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        -->
						
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
							  
                                <div class="col-md-3">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
								</div>
								<div class="col-md-4">	
							<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$case->id."' AND form = '".$doc->form."' ")->row();?>		
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
                                <div class="col-md-3">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
									</div>
								<div class="col-md-4">
								<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$case->id."' AND form = '".$doc->form."' ")->row();?>	
							<select name="reply[<?php echo $doc->id ?>]" class="form-control">
							<?php	
										foreach($values as $key=>$val) {
											$sel='';
											if($val==$result->reply) $sel = "selected='selected'";
											echo '<option value="'.$val.'" '.$sel.'>'.$val.'</option>';
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
							<?php 
							$x="";
							$result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$case->id."' AND form = '".$doc->form."' ")->row();
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
                                <div class="col-md-3">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
									</div>
								<div class="col-md-4">
							
							<?php	
										foreach($values as $key=>$val) { ?>
							<?php 
							$x="";
							$result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$case->id."' AND form = '".$doc->form."' ")->row();
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
                                <div class="col-md-3">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
								</div>
								<div class="col-md-4">	
									<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$case->id."' AND form = '".$doc->form."'")->row();?>	
										<textarea class="form-control" name="reply[<?php echo $doc->id ?>]" ><?php echo @$result->reply;?></textarea>
								</div>
                            </div>
                        </div>
							<?php }	if($doc->field_type==6) //url
						  {		?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
									<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$case->id."' AND form = '".$doc->form."'")->row();?>	
										<input type="url" value="<?php echo @$result->reply;?>" class="form-control" name="reply[<?php echo $doc->id ?>]"  />
								</div>
                            </div>
                        </div>
					
						<?php }	if($doc->field_type==7) //email
						  {		?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
									<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$case->id."' AND form = '".$doc->form."'")->row();?>	
										<input type="email" value="<?php echo @$result->reply;?>" name="reply[<?php echo $doc->id ?>]"  class="form-control" />
								</div>
                            </div>
                        </div>
							
							
					<?php }	if($doc->field_type==8) //Phone
						  {		?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
									<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$case->id."' AND form = '".$doc->form."'")->row();?>	
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
             <?php echo form_close()?>
            </div><!-- /.box -->
        </div>
     </div>
</section>  
<script src="<?php echo base_url('assets/js/chosen.jquery.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/jquery.datetimepicker.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js')?>" type="text/javascript"></script>
  <!-- Ion Slider -->
<script src="<?php echo base_url()?>/assets/js/plugins/ionslider/ion.rangeSlider.min.js" type="text/javascript"></script>
<!-- Bootstrap slider -->
<script src="<?php echo base_url()?>/assets/js/plugins/bootstrap-slider/bootstrap-slider.js" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/redactor.min.js')?>"></script>

<script type="text/javascript">
$(function() {
	
	$('.chzn').chosen();
	$('.slider').slider();
});


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


$(document).on('change', '#departamento_id', function(){
 //alert(12);
 	location_id = $('#location_id').val();
	c_c_id 		= $('#departamento_id').val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#dept_result').html(ajax_load);
	  
  $.ajax({
    url: '<?php echo site_url('admin/cases/get_depts') ?>',
    type:'POST',
    data:{l_id:location_id,c_id:c_c_id},
	
	success:function(result){
      //alert(result);return false;
	  $('#dept_result').html(result);
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
             format:'Y-m'
            });
     }
  });
});


function cargaInicial(){
 //alert(12);
    categoria_id = $('#categorias').val();
    location_id = $('#location_id').val();
    llave = $('#llave').val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#category_result').html(ajax_load);
      
  $.ajax({
    url: '<?php echo site_url('admin/cases/opciones2') ?>',
    type:'POST',
    data:{l_id:categoria_id,empresa:location_id,ll:llave},
    
    success:function(result){
      //alert(result);return false;
      $('#category_result').html(result);
      $(".chzn").chosen();
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
     }
  });
}

$(document).on('change', '#court_category_id', function(){
 //alert(12);
 	location_id = $('#location_id').val();
	c_c_id 		= $('#court_category_id').val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#court_result').html(ajax_load);
	  
  $.ajax({
    url: '<?php echo site_url('admin/cases/get_courts') ?>',
    type:'POST',
    data:{l_id:location_id,c_id:c_c_id},
	
	success:function(result){
      //alert(result);return false;
	  $('#court_result').html(result);
	  $(".chzn").chosen();
	 }
  });
});


$(document).on('change', '#departamento_id', function(){
  c_c_id    = $('#departamento_id').val();
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

$(function() {
	//bootstrap WYSIHTML5 - text editor
	$(".txtarea").wysihtml5();
});

 $(function() {
    $( ".datepicker" ).pickmeup({
    format  : 'Y-m-d'
});
  });

cargaInicial();

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