<link href="<?php echo base_url('assets/css/chosen.css')?>" rel="stylesheet" type="text/css" />
<!-- Content Header (Page header) -->
<style>
.row{
	margin-bottom:10px;
}
</style>
 <!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        <?php echo lang('case');?> <?php echo lang('category');?>
        <small><?php echo lang('add');?></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard');?></a></li>
        <li><a href="<?php echo site_url('admin/case_category')?>"><?php echo lang('case');?> <?php echo lang('category');?></a></li>
        <li class="active"><?php echo lang('add');?></li>
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
                    <h3 class="box-title"><?php echo lang('add');?></h3>
                </div><!-- /.box-header -->
                <!-- form start -->
				
				<?php echo form_open_multipart('admin/case_category/add/'); ?>
                    <div class="box-body">


                        <div class="form-group">
                        	<div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"><?php echo lang('category_name');?> </label>
									<input type="text" name="name" value="" class="form-control">
                                </div>
                            </div>
                        </div>
						
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-4">
                                    <label for="email" style="clear:both;"><?php echo lang('parent');?> <?php echo lang('category');?></label>
									<select name="parent_id" class="form-control chzn">
										<option value="">--<?php echo lang('select');?> <?php echo lang('parent');?> <?php echo lang('category');?>---</option>
										<?php foreach($categories as $new) {
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
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"><?php echo lang('add_field');?>  </label>
                                     <input type="Checkbox" id="adicion" name="adicion" value="1">
                                </div>
                            </div>
                        </div>


                        <div id="adicional">

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="name" style="clear:both;"><?php echo lang('field_add');?> </label>
                                    <hr>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <b><?php echo lang('field_type')?></b>
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
                                    </select>    
                                </div>
                                <div class="col-md-4">
                                
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <b><?php echo lang('field_name')?></b>
                                </div>
                                <div class="col-md-4">         
                                    <input type="text" name="namefield" value="" class="form-control">
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="form-group" id="value-div">
                            <div class="row">
                                <div class="col-md-3">
                                    <b><?php echo lang('enter_field_values')?></b>
                                </div>
                                <div class="col-md-4">
                                      <textarea name="values" class="form-control"></textarea>
                                </div>
                                <div class="col-md-4">
                                        <?php echo lang('custom_field_instruction')?>
                                </div>
                             </div>
                        </div>

                        </div>


						
						
                    </div><!-- /.box-body -->
    
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary"><?php echo lang('save');?></button>
                    </div>
             <?php form_close()?>
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

<script type="text/javascript">
$(document).on('ready', function(){
        $('#value-div').hide();
});

$(document).on('change', '#field', function(){
    var field = $('#field').val();
   // alert(field);
    if(field==3 || field==2 || field==4){
        $('#value-div').show();
    }else{
        $('#value-div').hide();
    }
 
});
var suiche =false; 
$(document).on('change', '#adicion', function(){
      
      if (suiche==true){ 
        $('#adicional').hide();
        suiche = false;
       }else{
        $('#adicional').show();
        suiche = true;
        }        
 
});

$('#adicional').hide();
</script>