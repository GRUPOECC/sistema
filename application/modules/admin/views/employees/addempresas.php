<link href="<?php echo base_url('assets/css/datatables/dataTables.bootstrap.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/jquery.datetimepicker.css')?>" rel="stylesheet" type="text/css" />
            <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
            <link href="<?php echo base_url('assets/css/bootstrap.min.css')?>" rel="stylesheet" type="text/css" />

            <!-- font Awesome -->
            <link href="<?php echo base_url('assets/css/font-awesome.min.css')?>" rel="stylesheet" type="text/css" />
            <!-- Ionicons -->
            <link href="<?php echo base_url('assets/css/ionicons.min.css')?>" rel="stylesheet" type="text/css" />
            <!-- Morris chart -->
            <link href="<?php echo base_url('assets/css/morris/morris.css')?>" rel="stylesheet" type="text/css" />
            <link href="<?php echo base_url('assets/css/pickmeup.min.css')?>" rel="stylesheet" type="text/css" />
          
            <!-- Theme style -->
            <link href="<?php echo base_url('assets/css/AdminLTE.css')?>" rel="stylesheet" type="text/css" />
            <link href="<?php echo base_url('assets/css/redactor.css')?>" rel="stylesheet" type="text/css" />
            
            <!-- jQuery 2.0.2 -->
            <script src="<?php echo base_url('assets/js/jquery.js')?>"></script>
<script type="text/javascript">
function areyousure()
{
	return confirm('Are You Sure You Want Delete This Employee');
}
</script>
<?php session_start(); ?>

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
                                <th><?php echo lang('position')?></th>
                                <th><?php echo lang('nomina_code')?></th>
                                <th><?php echo lang('joining_date')?></th>
                                <th><?php echo lang('action')?></th>	
                            </tr>
                        </thead>
                        
                        <?php if((isset($empresas))&&(isset($_SESSION['empresas']))):?>
                        <tbody>
                            <?php

                             $i=0;  foreach ($_SESSION['empresas'] as $key => $value){
                               
                              ?>
                                        
                                <tr class="gc_row">
                                    
                                    <td><?php echo $i?></td>
                                    <td>       
                                    <?php 
                                         foreach ($empresas as $new){
                                            
                                             if($value['empresa']==(string)$new->id){ 
                                               echo ucwords($new->name);             
                                               if ($value['principal']==1)
                                                echo '<IMG SRC="'.base_url('assets/img/star.png').'" WIDTH=20 HEIGHT=20>'; 
                                               break;

                                              }
                                         }

                                          $i++; 
                                    ?>  
                                    </td>
                                    <td>
                                     <?php
                                        foreach($departments as $dept){
                                            if($dept->id==$value['departamento']) 
                                                echo $dept->name;
                                         }
                                     ?>  
                                    </td>
									                   <td>
                                     <?php
                                        foreach($cargos as $rol){
                                            if($rol->id==$value['role']) 
                                                echo $rol->designation;
                                         }
                                     ?>  
                                    </td>
                                    <td>
                                     <?php
                                                echo $value['nomina'];
                                     ?>  
                                    </td>
                                    <td>
                                     <?php
                                                echo $value['date'];
                                     ?>  
                                    </td>
									
                                    <td width="30%">
                                        <div class="btn-group">	  
                                         <form id="formulario2" action="" method="post" accept-charset="utf-8" enctype="multipart/form-data">
										 <?php if(check_user_role(190)==1){?>	 
                                         <input type="hidden" name="elemento" value="<?php echo $key; ?>">
                                         <button type="submit" name="delete" value="" class="btn btn-danger"><i class="fa fa-trash"></i> <?php echo lang('delete')?></button>


										 <?php } ?>	
                                         </form>

                                        </div>
                                    </td>
                                     


                                     

                                </tr>
                                <?php 

                                }?>
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
             
                 <form id="formulario" action="" method="post" accept-charset="utf-8" enctype="multipart/form-data"> 
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-6">
                                    <label for="empresa_id" style="clear:both;"><?php echo lang('company_name');?></label>
                                    <select name="empresa_id" class="form-control chzn" id="empresa_id">
                                        <option value="">-- <?php echo lang('select');?> <?php echo lang('company_name');?> ---</option>
                                        <?php 
                                         $listaempresas2 = $listaempresas;
                                         $listaempresas3 = $listaempresas;                                          

                                        foreach($listaempresas as $new) {
                                            $sel = "";


                                            if (($new->id == 0)){
                                            echo '<option class="padre" selected="selected" value="'.$new->id.'" '.$sel.'> - '.$new->name.'</option>';
                                                foreach($listaempresas2 as $new2) {
                                                      if ($new2->parent_id == $new->id){
                                                          echo '<option class="hijo" selected="selected" value="'.$new2->id.'" '.$sel.'> -- '.$new2->name.'</option>';
                                                          foreach($listaempresas3 as $new3) {
                                                                if ($new3->parent_id == $new2->id){
                                                              echo '<option class="nieto" selected="selected" value="'.$new3->id.'" '.$sel.'> --- '.$new3->name.'</option>';
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
                                    <label for="email" style="clear:both;"><?php echo lang('position');?></label>
                                    <div id="dept_result">
                                    <select name="role_id" id="role_id" class="form-control chzn" disabled="disabled">
                                        <option value="">--<?php echo lang('select');?> <?php echo lang('user_role');?>---</option>
                                        <?php foreach($cargos as $new) {
                                            $sel = "";
                                            echo '<option value="'.$new->id.'" '.$sel.'>'.$new->designation.'</option>';
                                        }
                                        
                                        ?>
                                    </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-6">
                                    <label for="email" style="clear:both;"><?php echo lang('nomina_code');?></label>
                                    <input type="text" name="nomina">
                                </div>
                            </div>
                        </div>

                       <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="name" style="clear:both;"><?php echo lang('joining_date')?></label>
                                    <input type="text" name="date" value="<?php echo set_value('joining_date')?>" class="form-control datepicker">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                     <?php
                                        $existe = false; 
                                       foreach ($_SESSION['empresas'] as $key => $value){ 
                                               if (isset($value['principal'])){     
                                                  if($value['principal']==1)
                                                    $existe = true;  
                                               }
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

  <!--Almacenamiento en memoria de los datos-->
  <?php 
     if(isset($_POST['empresa_id'])){
       
       $empresas = array();
       
       if(isset($_SESSION['empresas'])) {
          $empresas = $_SESSION['empresas']; 
       }

        $nuevo = array(); 
        $nuevo['empresa'] = $_POST['empresa_id'];
        $nuevo['role'] = $_POST['role_id'];
        $nuevo['departamento'] = $_POST['department_id'];
        $nuevo['nomina'] =  $_POST['nomina'];
        $nuevo['date'] =  $_POST['date'];
        if($_POST['principal']=="1") 
        $nuevo['principal'] = 1; 
        else 
        $nuevo['principal'] = 0; 

        array_push($empresas,$nuevo);
        $_SESSION['empresas'] = $empresas; 
        //header("Refresh:0");
        header("location: {$_SERVER['PHP_SELF']}");
     }

     if(isset($_POST['delete'])){

       $eliminar = $_SESSION['empresas'];
       $posicion = (int)$_POST['elemento'];   
       
       unset($eliminar[$posicion]);
       var_dump($eliminar);

       $_SESSION['empresas'] = $eliminar; 
       header("Refresh:0");

     }

  ?>

 <!--Almacenamiento en memoria de los datos-->


<script src="<?php echo base_url('assets/js/plugins/datatables/jquery.dataTables.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/jquery.datetimepicker.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/plugins/datatables/dataTables.bootstrap.js')?>" type="text/javascript"></script>

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

  $(document).on('change', '#department_id', function(){
 
  c_c_id = $('#department_id').val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#dept_result').html(ajax_load);
    
  $.ajax({
    url: '<?php echo site_url('admin/employees/cargos') ?>',
    type:'POST',
    data:{c_id:c_c_id},
  
  success:function(result){
      //alert(result);return false;
    $('#dept_result').html(result);
    $(".chzn").chosen();
   }
  });
});


function editarEmpresa(id, idempresa, iddepartamento, idcargo){
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


}

function agregarEmpresa(id){
        var titulo = document.getElementById('titulomodal');
         titulo.innerHTML= "Añadir";

        var formulario = document.getElementById('formulario');
        formulario.action = "";

        var element = document.getElementById('empresa_id');
        element.value = "";

        var element2 = document.getElementById('department_id');
        element2.value = "";

        var element3 = document.getElementById('role_id');
        element3.value = "";


}

</script>
        <script src="<?php echo base_url('assets/js/jquery-ui-1.10.3.min.js')?>" type="text/javascript"></script>
         <script src="<?php echo base_url('assets/js/jquery.pickmeup.min.js')?>" type="text/javascript"></script>
        <!-- Bootstrap --> 
        <script src="<?php echo base_url('assets/js/bootstrap.min.js')?>" type="text/javascript"></script>    
        <!-- iCheck -->
        <script src="<?php echo base_url('assets/js/plugins/iCheck/icheck.min.js')?>" type="text/javascript"></script>    
        <!-- AdminLTE App -->
        <script src="<?php echo base_url('assets/js/AdminLTE/app.js')?>" type="text/javascript"></script>