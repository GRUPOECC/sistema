<link href="<?php echo base_url('assets/css/datatables/dataTables.bootstrap.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/js/plugins/bootstrap-toggle-master/css/bootstrap-toggle.min.css')?>" rel="stylesheet">
<script src="<?php echo base_url('assets/js/plugins/bootstrap-toggle-master/js/bootstrap-toggle.min.js')?>"></script>

<script type="text/javascript">
//window.onload = detectarCarga;
//function detectarCarga(){
//   document.getElementById("modo-lista").style.display="block";
//}

function areyousure()
{
	return confirm('<?php echo lang('are_you_sure');?>');
}
</script>



<section class="content-header">
        <h1>
            <?php echo $page_title; ?>
            <small><?php echo lang('list');?></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard');?></a></li>
            <li class="active"><?php echo lang('contacts');?></li>
        </ol>
</section>

<section class="content">
  	  	 <div class="row" style="margin-bottom:10px;">
            <div class="col-xs-12">
                <div class="col-md3">
				     <?php if(check_user_role(22)==1){?>
                     <a class="btn btn-default" style="margin-left:10px;" href="<?php echo site_url('admin/contacts/add/'); ?>"> <i class="fa fa-plus"></i> <?php echo lang('add_new');?></a>
					 <?php } ?>	
                     <?php if(check_user_role(173)==1){?>
					 <a class="btn btn-primary" style="margin-left:10px;" href="<?php echo site_url('admin/contacts/export/'); ?>"><i class="fa fa-download"></i> <?php echo lang('export');?></a>
					 <?php } ?> 
                     <?php if(check_user_role(174)==1){?>
                     <a class="btn bg-olive" style="margin-left:10px;" href="#myModal" data-toggle="modal" >
                     <i class="fa fa-caret-square-o-down"></i> <?php echo lang('import');?></a>      
                     <?php } ?>  
    		         <?php if(check_user_role(175)==1){?>
                     <a class="btn bg-yellow" style="margin-left:10px;" href="<?php echo site_url('admin/contact_category/'); ?>"> <i class="fa fa-plus"></i> <?php echo lang('add_contact_category');?></a>
                     <?php } ?> 

                </div>
            </div>    
        </div>	
        
  	  	<div class="row">
          <div class="col-xs-12">
          
            <div class="box" style="display:inline-block;">
                
                <div class="box-header">
                                               
                </div><!-- /.box-header -->    

                <div class="box-body table-responsive" style="margin-top:40px;">


                  <p align="right">                              
                     <input type="checkbox" data-toggle="toggle" data-on="Cuadricula" data-off="Listado" onchange="cambioVista()">

                  </p>


                   <div id="modo-lista"> <!-- /.Vista de listado -->   
                    <table id="example" class="table table-bordered table-striped">
                     
                
                        <thead>
                            <tr>
 								<th><?php echo lang('name');?></th>
                                <th><?php echo lang('category');?></th>
                                <th><?php echo lang('contact_company');?></th>
								<th width="20%"><?php echo lang('action');?></th>
                            </tr>
                        </thead>
                        
                        <?php if(isset($contacts)):?>
                        <tbody>
                            <?php 
                               $contador = 0; 
                            $i=1;foreach ($contacts as $new){
                                 // if ($contador<=8) {
                              ?>
                                <tr class="gc_row">
                                    <td><?php echo $new->name?></td>
                                    <td><?php echo $new->category?></td>
                                    <td><?php echo $new->company?></td>

									
                                    <td  class="col-md-3">
                                        <div class="btn-group">
                                          <?php if(check_user_role(155)==1){?>  
										  <a class="btn btn-default"  href="<?php echo site_url('admin/contacts/view/'.$new->id); ?>"><i class="fa fa-eye"></i> <?php echo lang('view');?></a>
										   <?php } ?>
										  <?php if(check_user_role(23)==1){?>  
										  <a class="btn btn-primary"  href="<?php echo site_url('admin/contacts/edit/'.$new->id); ?>" style="margin-left:10px;"><i class="fa fa-edit"></i> <?php echo lang('edit');?></a>
										   <?php } ?>	
										    <?php if(check_user_role(24)==1){?>
                                         <a class="btn btn-danger" style="margin-left:10px;" href="<?php echo site_url('admin/contacts/delete/'.$new->id); ?>" onclick="return areyousure()"><i class="fa fa-trash"></i> <?php echo lang('delete');?></a>
										  <?php } ?>	
                                        </div>
                                    </td>
                                </tr>                         
                                <?php 
                                      //   $contador = $contador +1; 
                                     // }
                                $i++;   
                              }


                                ?>
                        </tbody>
                  

                        <?php endif;?>
                        
                    </table>
                </div>
                <!-- /. Fin Vista de Listado -->

                <!--Vista de Cuadricula  -->
                   <!--Codigo implementado por: Garry Bruno -->
                   <div id="modo-cuadricula" style="display: none;">
                          <div class="row">
                             <div class=" col-md-12">
                               <div>
                                   <p align="right"> Buscar: <input type="text" size="30" id="search" name="buscar" autofocus></p>
                               </div>
                             </div>

                          </div>
                           <div id="resultados">
                             <?php if(isset($contacts)):?>
                              <?php $i=1;foreach ($contacts as $new){ ?>
                            
                             <div name="elemento" class=" col-md-3" style="background: #EFEEEE; margin: 8px; color: #000; height: 200px">   
                               <p>
                                <label style="height: 120px">
                                <strong>Nombre:</strong> <?php echo $new->name?>
                                <br> 
                                <strong>Compañía:</strong> <?php echo $new->company?>                
                                <br>
                                <strong>Categoría:</strong> <?php echo $new->category?>
                                <br>
                                <strong>Correo:</strong> <?php echo $new->email?>
                                <br>
                                <strong>Teléfono:</strong>  <?php echo $new->phone1?>
                                <br>   
                                </label>          
                               </p>
                               
                               <div class="btn-group">
                                          <?php if(check_user_role(155)==1){?>  
                      <a class="btn btn-default"  href="<?php echo site_url('admin/contacts/view/'.$new->id); ?>"><i class="fa fa-eye"></i> <?php echo lang('view');?></a>
                       <?php } ?>
                      <?php if(check_user_role(23)==1){?>  
                      <a class="btn btn-primary"  href="<?php echo site_url('admin/contacts/edit/'.$new->id); ?>" style="margin-left:10px;"><i class="fa fa-edit"></i> <?php echo lang('edit');?></a>
                       <?php } ?> 
                        <?php if(check_user_role(24)==1){?>
                                         <a class="btn btn-danger" style="margin-left:10px;" href="<?php echo site_url('admin/contacts/delete/'.$new->id); ?>" onclick="return areyousure()"><i class="fa fa-trash"></i> <?php echo lang('delete');?></a>
                        <?php } ?>  
                                        </div>
                             </div>

   
                              <?php $i++;}?>
                             <?php endif;?>

                    </div>


                    <div class="col-md-12">
                       <div class="row">
                       <div class="col-xs-6">
                       <div id="infoTabla">Probando </div>
                       </div>
                       <div class="col-xs-6">
                       <div class="dataTables_paginate paging_bootstrap">
                       <ul id="pages" class="pagination">
                       <li class="prev">
                       <a onclick="anterior()" href="javascript:void(null)">← Anterior</a>
                       </li>
                       <li id="posicion1" class="active"></li>
                       <li id="posicion2"></li>
                       <li id="posicion3"></li>
                       <li id="posicion4"></li>
                       <li id="posicion5"></li>
                       <li id="siguiente" class="next"><a onclick="siguiente()" href="javascript:void(null)">Siguiente → </a></li></ul></div></div></div>
                      
                    </div>

                   </div>
                   <!--Fin Vista de Cuadricula  -->



			     </div><!-- /.box-body -->
          
            </div><!-- /.box -->
            


        </div>
    </div>
</section>



<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?php echo lang('import_contacts');?></h4>
      </div>
      <div class="modal-body">
			<form method="post" action="<?php echo site_url('admin/contacts/import') ?>" enctype="multipart/form-data">
			         <div class="alert alert-info alert-dismissable">
                                        <i class="fa fa-info"></i>
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-close"></i></button>
                                        <b><?php echo lang('instruction');?>!</b> <?php echo lang('contacts_import_instruction');?>  
                                    </div>
					 
					 <div class="box-body">
                        <div class="form-group">
                        	<div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"><?php echo lang('file');?></label>
									<input type="file" name="file" value="" class="form-control">
                                </div>
                            </div>
                        </div>
						
						

                    </div><!-- /.box-body -->
    
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary"><?php echo lang('save');?></button>
                    </div>
             </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo lang('close');?></button>  
      </div>
    </div>
  </div>
</div>


<script src="<?php echo base_url('assets/js/listas-vistas.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/plugins/datatables/jquery.dataTables.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/plugins/datatables/dataTables.bootstrap.js')?>" type="text/javascript"></script>




<script type="text/javascript">
$(function() {
  $('#example').dataTable({
  });
});


</script>


