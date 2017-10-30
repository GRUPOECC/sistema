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
        <small><?php echo lang('edit');?></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard');?></a></li>
        <li><a href="<?php echo site_url('admin/case_category')?>"><?php echo lang('case');?> <?php echo lang('category');?></a></li>
        <li class="active"><?php echo lang('edit');?></li>
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
            <div class="box box-primary" style="height: 900px;">
                <div class="box-header">
                    <h3 class="box-title"><?php echo lang('edit');?></h3>
                </div><!-- /.box-header -->
                <!-- form start <?php echo form_open_multipart('admin/case_category/edit/'.$id); ?>-->
				        

                  <div class="col-md-6">  
                    <form id="formulario" method="post" action="<?php echo site_url('admin/case_category/edit/'.$id); ?>">

                    <div class="box-body">
                      
                     
                        <div class="form-group">
                        	<div class="row">
                                <div class="col-md-12">
                                    <label for="name" style="clear:both;"><?php echo lang('category_name');?> </label>
									<input type="text" name="name" value="<?php echo $category->name?>" class="form-control">
                                </div>
                            </div>
                        </div>
						
						
			   			
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-12">
                                    <label for="email" style="clear:both;"><?php echo lang('parent');?> <?php echo lang('department');?></label>
									<select name="parent_id" class="form-control chzn">
										<option value="">--<?php echo lang('select');?> <?php echo lang('department');?>---</option>
										<?php foreach($departments as $new) {
											$sel = "";
											if($new->id==$category->parent_id) $sel = "selected='selected'";
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
                                    <label for="name" style="clear:both;"><?php echo lang('formattitle');?> </label>
                                    <input type="text" name="titulo" value="<?php echo $category->title_format?>" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="name" style="clear:both;"><a href="#" onclick="mostrarclaves()">Ver Palabras clave</a></label>
                                    <div id="listaclaves">
                                    <ul>
                                        <li type="square">[empresa.name] - Indica nombre de la empresa</li>
                                        <li type="square">[empresa.code] - Indica código de la empresa</li>
                                        <li type="square">[campo.#] - Indica valor de campo dinámico #</li>
                                        <li type="square">[fecha.now] - Indica la fecha de creación del ticket</li>
                                        <li type="square">[fecha.end] - Indica la fecha de finalización del ticket</li>
                                        <li type="square">[category.name] - Indica nombre de la categoria</li>
                                    </ul>
                                    <strong>Ejemplo:</strong> Ticket de la empresa <strong>empresa.name</strong> en la fecha <strong>fecha.now</strong> para el periodo <strong>campo.1</strong>
                                    </div>
                                </div>
                            </div>
                        </div>
           
          

                         <div id="adicionales">
                    
                          <strong><?php echo lang('field_aditional');?></strong>
                          <br>
                          <br>
                          <?php 
                           $i=1;  
                          foreach ($fields as $new) {
                            echo "<strong> ".$i.") ".lang('field_name').": </strong>". $new->name . ' - <a href="'.site_url('admin/case_category/deleteField/'.$new->id).'">'.lang('delete').'</a> <br>';
                            $i = $i + 1; 
                          }
                          ?>
                      
                        </div>

                        

						
                    </div><!-- /.box-body -->
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>

                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary"><?php echo lang('update');?></button>
                    </div>
              </form>
               
               </div>
                   <div class="col-md-6">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="name" style="clear:both;"><?php echo lang('add_field');?>  </label>
                                         <input type="Checkbox" id="adicion" name="adicion" value="1">
                                    </div>
                                </div>
                            </div>

                            <div id="adicional">
                                   <div class="row">
                                    <form id="formulario" method="post" action="<?php echo site_url('admin/case_category/addField/'.$id); ?>">               
                                   <div id="opciones"  class="col-md-12">
                                      
                                   </div>
                                   </form>
                                   </div>
                            </div>
                 </div>

                       

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
/*
function campos(){
  $.ajax({
        url: '<?php echo site_url('admin/case_category/aditionalField') ?>',
        type:'POST',
        data:{'id:vch'}
        success:function(result){
          //alert(result);return false;
        $('#opciones').html(result);
        $(".chzn").chosen();
        $(function() {
            //bootstrap WYSIHTML5 - text editor
            $(".txtarea").wysihtml5();
        });

         $(function() {
            $( "#datepicker" ).pickmeup({
            format  : 'Y-m-d'
        });
          });
       
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
         
        });

        $(document).on('change', '#alfabetico', function(){
                var valores = document.getElementById('elementos');
                var array = (valores.value).split(',');
                valores.value = array.sort();  
        });


        

       }
      });
}

*/


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
       

                             $.ajax({
                                    url: '<?php echo site_url('admin/case_category/aditionalField/'.$id); ?>',
                                    type:'POST',
                                    success:function(result){

                                              //alert(result);return false;
                                            $('#opciones').html(result);
                                            $(".chzn").chosen();
                                            $('#value-div').hide();
                                            $('#formato').hide();

                                            $(function() {
                                                //bootstrap WYSIHTML5 - text editor
                                                $(".txtarea").wysihtml5();
                                            });

                                             $(function() {
                                                $( "#datepicker" ).pickmeup({
                                                format  : 'Y-m-d'
                                            });
                                              });
                                           
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

                                            $(document).on('change', '#alfabetico', function(){
                                                    var valores = document.getElementById('elementos');
                                                    var array = (valores.value).split(',');
                                                    valores.value = array.sort();  
                                            });

                                            function chgAction(id)
                                                {
                                                      document.getElementById("formulario").action ="admin/case_category/addField/"+id; 
                                                      document.getElementById("formulario").submit();
                                                
                                                } 

                                   }
                                  });

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