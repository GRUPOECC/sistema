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
                    <p>
                    <?php echo lang('titleMessage'); ?>
                    </p>
                    <p align="right">
                    <?php if(check_user_role(111)==1){?>
                     <a class="btn bg-olive" data-toggle="modal" data-target="#myModalSend" style="margin-left:10px;" href=""> <i class="fa fa-plus"></i> <?php echo lang('sendMessage');?></a>
                     <?php } ?>
                    </p>    
                    </h3>
            
                      
                                                    
                </div><!-- /.box-header -->
				
                <div class="box-body table-responsive" style="margin-top:0px;">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th><?php echo lang('serial_number');?></th>
								<th><?php echo lang('name');?></th>
								<th width="20%"><?php echo lang('action');?></th>
                            </tr>
                        </thead>
                        
                        <?php 
						if(isset($clients)):?>
                        <tbody>
						
                            <?php $i=1;foreach ($clients as $new){?>
                                <tr class="gc_row">
                                    <td><?php echo $i?></td>
                                    <td><?php echo $new->name?>
									<?php
                                    $admin = $this->session->userdata('admin');
									$result = $CI->db->query("SELECT `M`.*, `U1`.`name` from_user, `U2`.`name` to_user, `U1`.`image` FROM (`message` M) LEFT JOIN `users` U2 ON `U2`.`id` = `M`.`to_id` LEFT JOIN `users` U1 ON `U1`.`id` = `M`.`from_id` WHERE `M`.`to_id` = '".$admin['id']."' AND `M`.`from_id` = '".$new->id."' AND `M`.`is_view_to` = 1 ")->result();
									if(!$result!=0){
									echo "";
									}else{
									?>	
										 <small class="badge pull-right bg-red"><?php echo count($result) ?></small>
									<?php
									}
									?>
									</td>
									
                                    <td>
                                        <div class="btn-group">
										
                                        <!--<?php if(check_user_role(111)==1){?> -->
                                          <a class="btn btn-primary"  href="<?php echo site_url('admin/message/send/'.$new->id); ?>"><i class="fa fa-eye"></i> View Message Board</a>										<!-- <?php } ?> -->
                                         
                                        </div>
                                    </td>
                                </tr>
                                <?php $i++;}?>
                        </tbody>
                        <?php endif;?>
                    </table>
					
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>
</section>
<script>
     function validacion(){
         var sel = document.getElementById("usuarios");
    
         var selectedText = sel.options[sel.selectedIndex].value;
         alert("You have selected : "+selectedText);
         return false; 
     } 
</script>

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
         
        <?php echo lang('select_contact');?>: 
        <select id ="usuarios[]" name="usuarios[]" style="width: 300px;" multiple="multiple" class="chzn" data-placeholder="Seleccione">
             <?php foreach ($clients as $new){?>                    
               <option value="<?php echo $new->id; ?>"><?php echo $new->name; ?></option>
             <?php }?>
        </select>
        <hr>
            <div style="width: 540px;">
               <label for="name" style="clear:both;"><?php echo lang('message');?></label>
               <textarea id="message" name="message" class="form-control redactor"></textarea>
            </div>
        </div>
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
    function enviarMensaje(direccion){
        
        var e = document.getElementById("contactos");
        location.href = direccion + e.options[e.selectedIndex].value;
     } 
</script>

<script type="text/javascript">
    
$(function() {
    $('#example1').dataTable({
    });
});


</script>


<script type="text/javascript">

$(document).ready(function(){

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