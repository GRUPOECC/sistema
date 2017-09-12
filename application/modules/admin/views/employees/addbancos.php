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
                                <th><?php echo lang('account_holder_name')?></th>
                                <th><?php echo lang('account_number')?></th>
                                <th><?php echo lang('bank_name')?></th>
                                <th><?php echo lang('ifsc_code')?></th>
                                <th><?php echo lang('pan_number')?></th>
                                <th><?php echo lang('branch')?></th>
                                <th width="20%"><?php echo lang('action')?></th>
                            </tr>
                        </thead>
                        
                        <?php if(isset($_SESSION['bancos'])):?>
                        <tbody>
                           
                                    <?php $i=0; foreach ($_SESSION['bancos'] as $key => $value){?>
                                <tr class="gc_row">

                                    <td><?php echo $i?></td>
                                    <td><?php echo $value['account_holder_name'] ?></td>
                                    <td><?php echo $value['account_number'] ?></td>
                                    <td><?php echo $value['bank_name'] ?></td>
                                    <td><?php echo $value['ifsc_code'] ?></td>
                                    <td><?php echo $value['pan_number'] ?></td>
                                    <td><?php echo $value['branch'] ?></td>
									
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
                        
                                <?php }?>
                               
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
                                        <div class="col-md-4">
                                            <label for="name" style="clear:both;"><?php echo lang('account_holder_name')?></label>
                          <input type="text" name="account_holder_name" value="<?php echo set_value('account_holder_name')?>" class="form-control">
                                        </div>
                                    </div>
                                </div>
                    
                    <div class="form-group">
                                  <div class="row">
                                        <div class="col-md-4">
                                            <label for="name" style="clear:both;"><?php echo lang('account_number')?></label>
                          <input type="text" name="account_number" value="<?php echo set_value('account_number')?>" class="form-control">
                                        </div>
                                    </div>
                                </div>
                    
                    <div class="form-group">
                                  <div class="row">
                                        <div class="col-md-4">
                                            <label for="name" style="clear:both;"><?php echo lang('bank_name')?></label>
                          <input type="text" name="bank_name" value="<?php echo set_value('bank_name')?>" class="form-control">
                                        </div>
                                    </div>
                                </div>

                    <div class="form-group">
                                  <div class="row">
                                        <div class="col-md-4">
                                            <label for="name" style="clear:both;"><?php echo lang('ifsc_code')?></label>
                          <input type="text" name="ifsc_code" value="<?php echo set_value('ifsc_code')?>" class="form-control">
                                        </div>
                                    </div>
                                </div>
                    
                    <div class="form-group">
                                  <div class="row">
                                        <div class="col-md-4">
                                            <label for="name" style="clear:both;"><?php echo lang('pan_number')?></label>
                          <input type="text" name="pan_number" value="<?php echo set_value('pan_number')?>" class="form-control">
                                        </div>
                                    </div>
                                </div>
                    
                      <div class="form-group">
                                  <div class="row">
                                        <div class="col-md-4">
                                            <label for="name" style="clear:both;"><?php echo lang('branch')?></label>
                          <input type="text" name="branch" value="<?php echo set_value('branch')?>" class="form-control">
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
     if(isset($_POST['account_holder_name'])){
       
       $bancos = array();
       
       if(isset($_SESSION['bancos'])) {
          $bancos = $_SESSION['bancos']; 
       }

        $nuevo = array(); 
        $nuevo['account_holder_name'] = $_POST['account_holder_name'];
        $nuevo['account_number'] = $_POST['account_number'];
        $nuevo['bank_name'] = $_POST['bank_name'];
        $nuevo['ifsc_code'] =  $_POST['ifsc_code'];
        $nuevo['pan_number'] =  $_POST['pan_number'];
        $nuevo['branch'] =  $_POST['branch'];

        array_push($bancos,$nuevo);
        $_SESSION['bancos'] = $bancos; 
        header("Refresh:0");
     }

     if(isset($_POST['delete'])){

       $eliminar = $_SESSION['bancos'];
       $posicion = (int)$_POST['elemento'];   
       
       unset($eliminar[$posicion]);
       var_dump($eliminar);

       $_SESSION['bancos'] = $eliminar; 
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

        //var element = document.getElementById('empresa_id');
        //element.value = "";

        //var element2 = document.getElementById('department_id');
        //element2.value = "";

        //var element3 = document.getElementById('role_id');
        //element3.value = "";

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