<link href="<?php echo base_url('assets/css/chosen.css')?>" rel="stylesheet" type="text/css" />
<!-- Content Header (Page header) -->
<style>
.row{
	margin-bottom:10px;
}

.div{  font-family: sans-serif;
}

</style>
    
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
        <div class="col-md-12" style="font-family: sans-serif;">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                   
                </div><!-- /.box-header -->
                <!-- form start -->
				
				   <div class="box-body">
                        <div class="form-group">
                        	<div class="row">
                                <div class="col-md-2">
                                    <span for="name" style="clear:both;"><strong><?php echo lang('name');?></strong></span>
								</div>
								<div class="col-md-4">
									<?php echo @$contact->name ?>
                                </div>
                            </div>
                        </div>
						

						 <div class="form-group">
                        	<div class="row">
                                <div class="col-md-2">
                                    <span for="name" style="clear:both;"><strong><?php echo lang('phone');?></strong></span>
								</div>
								<div class="col-md-4">
									<?php echo $contact->phone1?>
                                </div>
                            </div>
                        </div>
                       <div class="form-group">
                        	<div class="row">
                                <div class="col-md-2">
                                    <span for="name" style="clear:both;"><strong><?php echo lang('phone');?></strong></span>
								</div>
								<div class="col-md-4">
									<?php echo $contact->phone2?>
                                </div>
                            </div>
                        </div>
                       <div class="form-group">
                        	<div class="row">
                                <div class="col-md-2">
                                    <span for="name" style="clear:both;"><strong><?php echo lang('phone');?></strong></span>
								</div>
								<div class="col-md-4">
									<?php echo $contact->phone3?>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                        	<div class="row">
                                <div class="col-md-2">
                                    <span for="name" style="clear:both;"><strong><?php echo lang('phone');?></strong></span>
								</div>
								<div class="col-md-4">
									<?php echo $contact->phone4?>
                                </div>
                            </div>
                        </div>
						
						 <div class="form-group">
                        	<div class="row">
                                <div class="col-md-2">
                                    <span for="name" style="clear:both;"><strong><?php echo lang('email');?></strong></span>
								</div>
								<div class="col-md-4">
									<?php echo @$contact->email ?>
                                </div>
                            </div>
                        </div>
						
						 <div class="form-group">
                        	<div class="row">
                                <div class="col-md-2">
                                   <span for="name" style="clear:both;"><strong><?php echo lang('address');?></strong></span>
								</div>
								<div class="col-md-4">
									<?php echo $contact->address?>
                                </div>
                            </div>
                        </div>
						<div class="form-group">
                        	<div class="row">
                                <div class="col-md-2">
                                    <span for="name" style="clear:both;"><strong><?php echo lang('category');?></strong></span>
								</div>
								<div class="col-md-4">
									<?php echo $contact->categoria?>
                                </div>
                            </div>
                        </div>
                       <div class="form-group">
                        	<div class="row">
                                <div class="col-md-2">
                                    <span for="name" style="clear:both;"><strong><?php echo lang('contact_company');?></strong></span>
								</div>
								<div class="col-md-4">
									<?php echo $contact->company?>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                        	<div class="row">
                                <div class="col-md-2">
                                    <span for="name" style="clear:both;"><strong><?php echo lang('department');?></strong></span>
								</div>
								<div class="col-md-4">
									<?php echo $contact->department?>
                                </div>
                            </div>
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
							  
                                <div class="col-md-2">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
							<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$contact->id."' AND form = '".$doc->form."' ")->row();?>		
							</div>
								<div class="col-md-4">
							<?php echo @$result->reply; ?>
								</div>
                            </div>
                        </div>
					 <?php 	}	
							if($doc->field_type==2) //dropdown list
							{
								$values = explode(",", $doc->values);
					?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-2">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
								</div>
								<div class="col-md-4">
								<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$contact->id."' AND form = '".$doc->form."' ")->row();?>	
							<?php	
										foreach($values as $key=>$val) {
											if($val==$result->reply) echo $val;
										}
							?>			
								</div>
                            </div>
                        </div>
						<?php	}	
								if($doc->field_type==3) //radio buttons
							{
								$values = explode(",", $doc->values);
					?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-2">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
								</div>
								<div class="col-md-4">
							<?php	
										foreach($values as $key=>$val) { ?>
							<?php 
							$x="";
							$result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$contact->id."' AND form = '".$doc->form."' ")->row();
							if(!empty($result->reply)){
								if($result->reply==$val){
									$x= $val;
								}else{
									$x='';
								}
							}
							?>			
						
						<?php echo $x;?> 
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
                                <div class="col-md-2">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
							</div>
								<div class="col-md-4">
							<?php	
										foreach($values as $key=>$val) { ?>
							<?php 
							$x="";
							$result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$contact->id."' AND form = '".$doc->form."' ")->row();
							if(!empty($result->reply)){
								if($result->reply==$val){
									$x= $val;
								}else{
									$x='';
								}
							}
							?>	
										
										<?php echo $x;?> 
 							<?php 			}
							?>			
								</div>
                            </div>
                        </div>
					<?php }	if($doc->field_type==5) //Textarea
						  {		?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-2">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
								</div>
								<div class="col-md-4">
									<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$contact->id."' AND form = '".$doc->form."'")->row();?>	
									<?php echo @$result->reply;?>
								</div>
                            </div>
                        </div>
							
							<?php }	if($doc->field_type==6) //URl
						  {		?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-2">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
								</div>	
								<div class="col-md-4">
									<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$contact->id."' AND form = '".$doc->form."'")->row();?>	
										<a href="<?php echo @$result->reply;?>" target="_blank"> <?php echo @$result->reply;?></a>
								</div>
                            </div>
                        </div>
						
					<?php }	if($doc->field_type==7) //EMAIL
						  {		?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-2">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
								</div>	
								<div class="col-md-4">
									<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$contact->id."' AND form = '".$doc->form."'")->row();?>	
										<a href="mailto:<?php echo @$result->reply;?>" target="_top"> <?php echo @$result->reply;?></a>
								</div>
                            </div>
                        </div>				
					
					<?php }	if($doc->field_type==8) //Phone
						  {		?>	<div class="form-group">
                              <div class="row">
                                <div class="col-md-2">
                                    <label for="contact" style="clear:both;"><?php echo $doc->name; ?></label>
								</div>	
								<div class="col-md-4">
									<?php  $result = $CI->db->query("select * from rel_form_custom_fields where custom_field_id = '".$doc->id."' AND table_id = '".$contact->id."' AND form = '".$doc->form."'")->row();?>	
										<?php echo @$result->reply;?>
								</div>
                            </div>
                        </div>	
						
						
						
						
					<?php 
								}	
							}
						}
					?>		

						
						
			   			
                      
						
                    </div><!-- /.box-body -->
    
                   
            </div><!-- /.box -->
        </div>
             </div>
</section> 
<script src="<?php echo base_url('assets/js/chosen.jquery.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/bootstrap-datepicker.js')?>" type="text/javascript"></script>


<script src="<?php echo base_url('assets/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js')?>" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	
	$('.chzn').chosen();
	
});


$(function() {
	//bootstrap WYSIHTML5 - text editor
	$(".txtarea").wysihtml5();
});

 $(function() {
    $( "#datepicker" ).pickmeup({
    format  : 'Y-m-d'
});
  });
</script>
<script src="<?php echo base_url('assets/js/chosen.jquery.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/bootstrap-datepicker.js')?>" type="text/javascript"></script>


<script src="<?php echo base_url('assets/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js')?>" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	
	$('.chzn').chosen();
	
});


$(function() {
	//bootstrap WYSIHTML5 - text editor
	$(".txtarea").wysihtml5();
});

 $(function() {
    $( "#datepicker" ).pickmeup({
    format  : 'Y-m-d'
});
  });
</script>

