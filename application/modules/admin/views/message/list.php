<?php
$CI = get_instance();
$CI->load->model('message_model');

?>	
<link href="<?php echo base_url('assets/css/chosen.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/datatables/dataTables.bootstrap.css')?>" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<?php echo base_url('assets/css/select2.min.css')?>" />

<script type="text/javascript">
function areyousure()
{
	return confirm('Are You Sure You Want Delete This Act');
}
</script>
<section class="content-header">
        <h1>
            <?php echo $page_title; ?>
            <small><?php echo lang('list');?></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard');?></a></li>
            <li class="active"><?php echo lang('message');?></li>
        </ol>
</section>

<section class="content">
  	  	 
        
  	  	<div class="row">
          <div class="col-xs-12">
            <div class="box">
                <div class="box-header">                 
                    <h3 class="box-title" style="width: 100%">
                    <p id="tipoBandeja">Bandeja de Entrada</p>
                    <p align="right">
                    <a class="btn btn-success" style="margin-left:10px; color:white;" onclick="bandejaEntrada()" href="javascript:void(0)"> <i class="fa fa-caret-square-o-down"></i> <?php echo lang('inbox');?></a>
                    <a class="btn btn-danger" style="margin-left:10px; color:white;" onclick="bandejaSalida()" href="javascript:void(0)"> <i class="fa fa-caret-square-o-down"></i> <?php echo lang('outbox');?></a>


                    <?php if(check_user_role(111)==1){?>
                     <a class="btn btn-primary" data-toggle="modal" data-target="#myModalSend" style="margin-left:10px; color:white;" href=""> <i class="fa fa-plus"></i> <?php echo lang('sendMessage');?></a>
                     <?php } ?>
                    </p>    
                    </h3>
            
                      
                                                    
                </div><!-- /.box-header -->
                <!-- /.Aqui se muestrac la bandeja de Entrada -->
				        <div id="bandejaEntrada">
                <div class="box-body table-responsive" style="margin-top:0px;">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                <th><?php echo lang('serial_number');?></th>
								<th><?php echo lang('title');?></th>
                <th><?php echo lang('from');?></th>
                <th><?php echo lang('date');?></th>
                <th><?php echo lang('type');?></th>
								<th width="40%"><?php echo lang('action');?></th>
                            </tr>
                        </thead>
                        
                        <tbody>

                            <?php foreach ($entradas as $new) { ?>
                                      
                                <tr class="gc_row">
                                    <td><?php echo $new->idmensaje?></td>
                                    <td><?php echo $new->title ?></td>
                                    <td><?php echo $new->from_user ?></td>
                                    <td><?php echo $new->date_time ?></td>
                                    <td><?php echo $new->type ?></td>
                                    <td>
                                        <div class="btn-group">
										
                                      
                                          <a class="btn btn-primary"  href="<?php echo site_url('admin/message/send/'.$new->idfrom); ?>"><i class="fa fa-eye"></i> <?php echo lang('view');?></a>
                                          <a class="btn btn-primary"  href="<?php echo site_url('admin/message/send/'.$new->idfrom); ?>"><i class="fa fa-eye"></i> <?php echo lang('answer');?></a>
                                          <a class="btn btn-primary" data-toggle="modal" data-target="#myModalSend" onclick="reenviarMensaje('<?php echo $new->message ?>')"  href=""><i class="fa fa-caret-square-o-down"></i> <?php echo lang('resend');?></a> 
                                          <?php if(check_user_role(196)==1){?>  
                                          <a class="btn bg-red"  href="<?php echo site_url('admin/message/delete/'.$new->id); ?>"><i class="fa fa-trash"></i> <?php echo lang('delete');?></a> 		
                                          <?php } ?> 
                                         
                                        </div>
                                    </td>
                                </tr>

                               <?php } ?>

                        </tbody>
                    </table>
					
                </div><!-- /.box-body -->
               </div>
                <!-- /.Aqui se muestra la bandeja de Salida -->
                <div id="bandejaSalida">
                <div class="box-body table-responsive" style="margin-top:0px;">
                    <table id="example2" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                <th><?php echo lang('serial_number');?></th>
                <th><?php echo lang('title');?></th>
                <th><?php echo lang('to');?></th>
                <th><?php echo lang('date');?></th>
                <th><?php echo lang('type');?></th>
                <th width="40%"><?php echo lang('action');?></th>
                            </tr>
                        </thead>
                        
                        <tbody>

                            <?php foreach ($salidas as $new) { ?>
                                      
                                <tr class="gc_row">
                                    <td><?php echo $new->idmensaje?></td>
                                    <td><?php echo $new->title ?></td>
                                    <td><?php echo $new->to_user ?></td>
                                    <td><?php echo $new->date_time ?></td>
                                    <td><?php echo $new->type ?></td>
                                    <td>
                                        <div class="btn-group">
                    
                                      
                                          <a class="btn btn-primary"  href="<?php echo site_url('admin/message/send/'.$new->idto); ?>"><i class="fa fa-eye"></i> <?php echo lang('view');?></a>
                                          <a class="btn btn-primary"  href="<?php echo site_url('admin/message/send/'.$new->idto); ?>"><i class="fa fa-eye"></i> <?php echo lang('answer');?></a>
                                          <a class="btn btn-primary" data-toggle="modal" data-target="#myModalSend" onclick="reenviarMensaje('<?php echo $new->message ?>')"  href=""><i class="fa fa-caret-square-o-down"></i> <?php echo lang('resend');?></a> 
                                          <?php if(check_user_role(196)==1){?>  
                                          <a class="btn bg-red"  href="<?php echo site_url('admin/message/delete/'.$new->id); ?>"><i class="fa fa-trash"></i> <?php echo lang('delete');?></a>    
                                          <?php } ?> 
                                         
                                        </div>
                                    </td>
                                </tr>

                               <?php } ?>

                        </tbody>
                    </table>
          
                </div><!-- /.box-body -->
               </div>

            </div><!-- /.box -->
        </div>
    </div>
</section>


<!-- Modal para la Informacion de los contactos  -->
  <div class="modal fade" id="myModalSend" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->

      <div class="modal-content">


        <form id="enviar" method="post" action="<?php echo site_url('admin/message/send/'); ?>" onSubmit="return validacion()">
        
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><?php echo lang('sendMessage');?></h4>
        </div>
       
        <div style="height: 350px;" class="modal-body">
         
        <strong><?php echo lang('select_contact');?>: </strong> 
        <select id ="usuarios[]" name="usuarios[]" style="width: 300px;" multiple="multiple" class="chzn" data-placeholder="Seleccione">
             <?php foreach ($clients as $new){?>                    
               <option value="<?php echo $new->id; ?>"><?php echo $new->name; ?></option>
             <?php }?>
        </select>
        <br>
         <label for="name" style="" ><?php echo lang('title');?>:</label>
        <input type="text" id="titulo" name="titulo" style="width: 310px;" class="form-control">

         <label for="name" style="clear:both;" ><?php echo lang('type');?>:</label>
        
          <select class="form-control" name="tipo" style="width: 190px;" >
            <option value="Mensaje">Mensaje</option>
            <option value="Llamada Telefonica">Llamada Telefónica</option>
            <option value="Visita">Visita</option>
            <option value="Tiene un Paquete">Tiene un Paquete</option>
          </select>
      
            <div style="width: 540px;">
               <label for="name" style="clear:both;"><?php echo lang('message');?></label>
               <textarea id="message" name="message" class="form-control redactor"></textarea>
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <div class="modal-footer">
          <input type="submit" class="btn btn-default"  value="<?php echo lang('sendMessage');?>">
        </div>
        </form>

      </div>
      
    </div>
  </div>

<script src="<?php echo base_url('assets/js/jquery-1.11.3.min.js')?>"></script>
<script src="<?php echo base_url('assets/js/select2.min.js')?>""></script>
<script src="<?php echo base_url('assets/js/redactor.min.js')?>"></script>
<script src="<?php echo base_url('assets/js/plugins/datatables/jquery.dataTables.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/plugins/datatables/dataTables.bootstrap.js')?>" type="text/javascript"></script>
<script type="text/javascript">
     function validacion(){
         var titulo = document.getElementById("titulo").value;  
         if(titulo=="")
           { 
                alert("Debe colocar un titulo al mensaje");    
                return false;  
           }

         var contactos = document.getElementById("usuarios[]").value;  
         if(contactos=="")
           { 
                alert("Debe seleeccionar al menos un contacto");    
                return false;  
           }

         return true; 
     } 
</script>


<script type="text/javascript">
    function enviarMensaje(direccion){
        
        var e = document.getElementById("contactos");
        location.href = direccion + e.options[e.selectedIndex].value;
     } 

     function reenviarMensaje(informacion){
            document.getElementById("message").value =informacion;  
            document.getElementsByClassName("redactor_form-control redactor_redactor redactor_editor")[0].innerHTML = informacion; 

     }

     function bandejaEntrada(){
            document.getElementById("bandejaEntrada").style.display = "";
            document.getElementById("bandejaSalida").style.display = "none";
            document.getElementById("tipoBandeja").innerHTML = "Bandeja de Entrada";
     }

     function bandejaSalida(){
            document.getElementById("bandejaSalida").style.display = "";
            document.getElementById("bandejaEntrada").style.display = "none";
            document.getElementById("tipoBandeja").innerHTML = "Bandeja de Salida";
     }
</script>

<script type="text/javascript">
    
$(function() {
    $('#example2').dataTable({
    });
    $('#example1').dataTable({
    });

});


</script>


<script type="text/javascript">

$(document).ready(function(){
   document.getElementById("bandejaSalida").style.display = "none";

  //Select2
  $(".chzn").select2({
        maximumSelectionLength: 5,
    placeholder: "Which are two of most productive days of your week"
    })

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