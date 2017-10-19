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
                                    <label for="email" style="clear:both;"><?php echo lang('department');?></label>
									<select name="parent_id" class="form-control chzn">
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

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"><?php echo lang('formattitle');?> </label>
                                    <input type="text" name="titulo" value="" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="name" style="clear:both;"><a href="#" onclick="mostrarclaves()">Ver Palabras clave</a></label>
                                    <div id="listaclaves">
                                    <ul>
                                        <li type="square">[empresa.name] - Indica nombre de la empresa</li>
                                        <li type="square">[empresa.code] - Indica código de la empresa</li>
                                        <li type="square">[campo.#] - Indica valor de campo dinámico #</li>
                                        <li type="square">[fecha.now] - Indica la fecha de creación del ticket</li>
                                        <li type="square">[fecha.end] - Indica la fecha de finalización del ticket</li>
                                    </ul>
                                    </div>
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
                                        <option value="9">Fecha</option>
                                        <option value="10">Hora</option>

                                    </select>    
                                </div>
                                <div id="limitaciones">
                                <div class="col-md-12">
                                </br>
                                    <div class="col-md-3">
                                        <b><?php echo lang('max')?></b>
                                    </div>
                                    <div class="col-md-4">         
                                        <input type="number" name="maximo" value="" class="form-control">
                                    </div>

                                </br>
                                </br>

                                </div>

                                <div class="col-md-12">

                                    <div class="col-md-3">
                                        <b><?php echo lang('upper')?></b>
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
                                        <b><?php echo lang('format')?></b>
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
                                      <textarea id="elementos" name="values" class="form-control"></textarea>
                                </div>
                                <div class="col-md-4">
                                        <?php echo lang('custom_field_instruction')?>
                                </div>
                             </div>
                             <div class="row">
                             <div class="col-md-12">

                                    <div class="col-md-3">
                                        <b><?php echo lang('sort')?></b>
                                    </div>
                                    <div class="col-md-4">         
                                        <input id="alfabetico" type="Checkbox" name="alfabetico" value="1">
                                    </div>
                                
                             </div>
                                </br>
                                </br>
                             </div>
                       </div>

                        </div>


						
						
                    </div><!-- /.box-body -->
    
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary"><?php echo lang('add');?></button>
                    </div>
             <?php form_close()?>
            </div><!-- /.box -->
        </div>
     </div>
</section>  
<script src="<?php echo base_url('assets/js/chosen.jquery.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/bootstrap-datepicker.js')?>" type="text/javascript"></script>


<script src="<?php echo base_url('assets/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js')?>" type="text/javascript"></script>
<script>
 var suiche=0;
 document.getElementById('listaclaves').style.display = 'none';
    function mostrarclaves(){
          
          if(suiche==0) {
              document.getElementById('listaclaves').style.display = 'block';
              suiche=1; 
          }else{
              document.getElementById('listaclaves').style.display = 'none';
              suiche=0; 
          }

    }


</script>

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

    if (field ==1)
    $('#limitaciones').show();
    else 
      $('#limitaciones').hide();  

    if (field ==9)
    $('#formato').show();
    else 
      $('#formato').hide();  
 
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

$(document).on('change', '#alfabetico', function(){
        var valores = document.getElementById('elementos');
        var array = (valores.value).split(',');
        valores.value = array.sort();  
});

$('#adicional').hide();
$('#formato').hide();  
$('#limitaciones').show();
</script>

