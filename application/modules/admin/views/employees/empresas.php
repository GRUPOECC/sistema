<link href="<?php echo base_url('assets/css/datatables/dataTables.bootstrap.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/jquery.datetimepicker.css')?>" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function areyousure()
{
	return confirm('Are You Sure You Want Delete This Employee');
}
</script>
<section class="content-header">
        <h1>
            <?php echo $page_title; ?>
            <small><?php echo lang('list')?></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard')?></a></li>
            <li class="active"><?php echo lang('employees')?></li>
        </ol>
</section>

<section class="content">
  	  	 <div class="row" style="margin-bottom:10px;">
            <div class="col-xs-12">
                <div class="btn-group pull-right">
				<?php if(check_user_role(191)==1){?>	
                    <a class="btn btn-default"  data-toggle="modal"  data-id="<?php $new->id ?>" data-target="#myModalData" onclick="agregarEmpresa(<?php echo $id; ?>)" href=""><i class="fa fa-plus"></i> <?php echo lang('add')?> <?php echo lang('new')?></a>
					<?php } ?>	
                </div>
            </div>    
        </div>	
        
  	  	<div class="row">
          <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"></h3>                                    
                </div><!-- /.box-header -->
				
                <div class="box-body table-responsive" style="margin-top:0px;">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th><?php echo lang('serial_number')?></th>
								<th><?php echo lang('company_name')?></th>
								<th><?php echo lang('Dept')?></th>
                                <th><?php echo lang('role')?></th>
                                <th><?php echo lang('action')?></th>	
                            </tr>
                        </thead>
                        
                        <?php if(isset($empresas)):?>
                        <tbody>
                            <?php $i=1;foreach ($empresas as $new){?>
                                <tr class="gc_row">
                                    <td><?php echo $i?></td>
                                    <td><?php echo ucwords($new->compania);
                                         if ($new->ppal==1)
                                                echo '<IMG SRC="'.base_url('assets/img/star.png').'" WIDTH=20 HEIGHT=20>'; 
                                          ?>
                                    </td>
                                    <td><?php echo $new->rol; ?></td>
									<td><?php echo $new->depto;?> </td>
									
                                    <td width="30%">
                                        <div class="btn-group">	  	
										  <?php if(check_user_role(192)==1){?>	
										  <a class="btn btn-primary" data-toggle="modal"  data-id="<?php $new->id ?>" data-target="#myModalData" style="margin-left:12px;" onclick="editarEmpresa(<?php echo $new->idrelacion ?>,<?php echo $new->id ?>,<?php echo $new->iddepto ?>,<?php echo $new->idrol ?>,<?php echo $new->fecha ?>,<?php echo $new->nom ?>)" href=""><i class="fa fa-edit"></i> <?php echo lang('edit')?></a>
										  <?php } ?>
                                         
                                    
										 <?php if(check_user_role(190)==1){?>	 
                                         <a class="btn btn-danger" style="margin-left:20px;" href="<?php echo site_url('admin/employees/deletecompany/'.$new->idrelacion); ?>" onclick="return areyousure()"><i class="fa fa-trash"></i> <?php echo lang('delete')?></a>
										 <?php } ?>	

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

<!-- Modal para agregar empresas al usuario  -->
  <div class="modal fade" id="myModalData" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 id="titulomodal" class="modal-title"><?php echo lang('add');?></h4>
        </div>
        <div class="modal-body">
           
                 <form id="formulario" action="../addcompany/<?php echo $id; ?>" method="post" accept-charset="utf-8" enctype="multipart/form-data"> 
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-6">
                                    <label for="empresa_id" style="clear:both;"><?php echo lang('company_name');?></label>
                                    <select name="empresa_id" class="form-control chzn" id="empresa_id">
                                        <option value="">--<?php echo lang('select');?> <?php echo lang('company_name');?>---</option>
                                        <?php foreach($listaempresas as $new) {
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
                                <div class="col-md-6">
                                    <label for="email" style="clear:both;"><?php echo lang('user_role');?></label>
                                    <select name="role_id" id="role_id" class="form-control chzn">
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
                                <div class="col-md-6">
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


                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-6">
                                    <label for="email" style="clear:both;"><?php echo lang('nomina_code');?></label>
                                    <input type="text" id="nomina" name="nomina">
                                </div>
                            </div>
                        </div>

                       <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="name" style="clear:both;"><?php echo lang('joining_date')?></label>
                                    <input type="text" id="date" name="date" value="<?php echo set_value('joining_date')?>" class="form-control datepicker">
                                </div>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                     <?php
                                        $existe = false; 
                                       foreach ($empresas as $value){ 
                                                  if($value->ppal==1)
                                                    $existe = true;                      
                                       }

                                       if (!$existe){?>
                                         <label for="name" style="clear:both;"><?php echo lang('main_company')?></label>
                                         <input id="principal" name="principal" type="checkbox" class="form-control" value="1">
                                     <?php } ?>
                                </div>
                            </div>
                        </div>

                      <div class="box-footer">
                        <button type="submit" class="btn btn-primary"><?php echo lang('save')?></button>
                    </div>

         
             </form>
 
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo lang('close');?></button>
        </div>
      </div>
      
    </div>
  </div>


<script src="<?php echo base_url('assets/js/plugins/datatables/jquery.dataTables.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/plugins/datatables/dataTables.bootstrap.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/jquery.datetimepicker.js')?>" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	$('#example1').dataTable({
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

function editarEmpresa(id, idempresa, iddepartamento, idcargo,fecha,nomina){
        var titulo = document.getElementById('titulomodal');
         titulo.innerHTML= "Editar";

        var formulario = document.getElementById('formulario');
        formulario.action = "../editcompany/"+id;

        var element = document.getElementById('empresa_id');
        element.value = idempresa;

        var element2 = document.getElementById('department_id');
        element2.value = iddepartamento;

        var element3 = document.getElementById('role_id');
        element3.value = idcargo;

        var element4 = document.getElementById('date');
        element4.value = fecha;

        var element5 = document.getElementById('nomina');
        element5.value = nomina;

}

function agregarEmpresa(id){
        var titulo = document.getElementById('titulomodal');
         titulo.innerHTML= "Añadir";

        var formulario = document.getElementById('formulario');
        formulario.action = "../addcompany/"+id;

        var element = document.getElementById('empresa_id');
        element.value = "";

        var element2 = document.getElementById('department_id');
        element2.value = "";

        var element3 = document.getElementById('role_id');
        element3.value = "";

        var element4 = document.getElementById('date');
        element4.value = "";

        var element5 = document.getElementById('nomina');
        element5.value = "";

}

</script>