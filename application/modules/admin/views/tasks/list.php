<link href="<?php echo base_url('assets/css/datatables/dataTables.bootstrap.css')?>" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function areyousure()
{
	return confirm('Are You Sure You Want Delete This Task');
}
</script>
<section class="content-header">
        <h1>
            <?php echo $page_title; ?>
            <small><?php echo lang('list')?></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard')?></a></li>
            <li class="active"><?php echo lang('Tasks')?></li>
        </ol>
         <div id="errorcontacto" class="alert alert-danger">
          <strong>Error: </strong> <?php echo lang('titleSelectTask');?>
        </div>
</section>

  <!-- Proceso de eliminacion de varias Tareas -->
  <?php

     if (isset($_POST["task_check"])){
      
        $conjunto = "";
        $delete = $_POST["task_check"]; 
        $cantidad = count($delete); 
       
         for ($i=0; $i<$cantidad; $i++) {  
          $del_id = $delete[$i]; 
          $conjunto = $conjunto . $del_id . "-";
         } 
         if (isset($_POST["submit"])) 
           header('Location: '.site_url('admin/tasks/delete/').'/'.$conjunto);    
      }

?>


<section class="content">

        <form id="formulariocontactos" onsubmit="return validar();" action="" method="post">
  	  	 <div class="row" style="margin-bottom:10px;">
            <div class="col-xs-12">
                <div class="btn-group pull-left">
				  <?php if(check_user_role(113)==1){?>	
                    <a class="btn btn-default" href="<?php echo site_url('admin/tasks/add/'); ?>"><i class="fa fa-plus"></i> <?php echo lang('add')?> <?php echo lang('new')?></a>
					<?php } ?>	
          <?php if(check_user_role(24)==1){?>
                      <input id="boton_eliminarvarios" class="btn bg-red" style="margin-left:10px; display:none;" type='submit' name='submit' value='<?php echo lang('deleteGroup');?>' onclick=this.form.action="<?php echo site_url('admin/tasks'); ?>">
                <?php } ?>   
          <?php if(check_user_role(184)==1){?>
                      <a class="btn bg-olive" onclick="Agrupar()" style="margin-left:10px;" href="javascript:void()">
                     <i class="fa fa-caret-square-o-down"></i><i id="boton_select"> <?php echo lang('select');?></i></a> 
                     <?php } ?> 
					
                </div>
            </div>    
        </div>	
        
  	  	<div class="row">
          <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                                                     
                </div><!-- /.box-header -->


                <div id="tipo-vista" style="margin-left: 370px; z-index: 2; position: absolute;">                 
                  <p > 
                      <center> 
                    
                       <a href="javascript:void()" onclick="mostrarTerminados()">
                       <IMG SRC="<?php echo base_url('assets/img/boton-mostrar.png')?>" WIDTH=178 HEIGHT=36 ALT="Ver Tareas Terminadas">
                       </a>
                       <a href="javascript:void()" onclick="ocultarTerminados()">
                       <IMG SRC="<?php echo base_url('assets/img/boton-ocultar.png')?>" WIDTH=178 HEIGHT=36 ALT="Ocultar Tareas Terminadas">
                       </IMG>
                       </a>
                       
                     </center>
                  </p>
                </div> 




                <div class="box-body table-responsive" style="margin-top:0px;">
                    <table id="example" class="table table-bordered table-striped">
                        <thead>
                <tr>        
                <th><input style="display: none;" type="checkbox" id="check_group[]" name="check_group[]" onclick="seleccionarTodos()" value=""></th>            
                <th><?php echo lang('serial_number')?></th>
								<th><?php echo lang('title')?></th>
                <th><?php echo lang('assigned_to')?></th>
								<th width="12px;"><?php echo lang('priority')?></th>
                                <th><?php echo lang('due_date')?></th>
								<th><?php echo lang('created_by')?></th>
                            	<th width="20%"><?php echo lang('action')?></th>
                            </tr>
                        </thead>
                        
                        <?php if(isset($tasks)):?>
                        <tbody>
                            <?php $i=1;foreach ($tasks as $new){
							$pr = "";
							if($new->priority==1){
								$pr = "<small class='label pull-right bg-blue'>Low</small>";
							}
							if($new->priority==2){
								$pr = "<small class='label pull-right bg-green'>Medium</small>";
							}
							
							if($new->priority==3){
								$pr = "<small class='label pull-right bg-red'>High</small>";
							}
							
							?>


                                 <tr <?php if($new->progress==100) echo ' id="terminado" ' ?> class="gc_row">
                                    <td><input style="display: none;" type="checkbox" id="task_check[]" name="task_check[]" value="<?php echo $new->id ?>"></td>
                                    <td><?php echo $new->id?></td>
                                    <td><?php echo $new->name?></td>
                                    <td><?php foreach ($assigned_users as $key) {
                                          if($key->id == $new->id)
                                            echo $key->name;
                                          }?></td>
                                    <td><?php echo $pr ?></td>
                                    <td><?php $formato = explode("-", $new->due_date); 
                                              echo $formato[2] . "-" . $formato[1] . "-" . $formato[0];
                                          ?> <?php if($new->due_date<date("Y-m-d") && $new->progress!=100 ){?> <small class='label pull-right bg-red'>Over Due</small> <?php }?></td>
                                    <td><?php echo $new->username ?> </td>
									
                                    <td width="38%">
                                        <div class="btn-group">
									<?php if(check_user_role(115)==1){?>		
                                          <a class="btn btn-default"  href="<?php echo site_url('admin/tasks/view/'.$new->id); ?>"><i class="fa fa-eye"></i> <?php echo lang('view')?></a>
									<?php } ?>	
									      <?php if(check_user_role(114)==1){?>	
                                          <?php  if($new->progress!=100){?>		  	
										  <a class="btn btn-primary"  style="margin-left:12px;" href="<?php echo site_url('admin/tasks/edit/'.$new->id); ?>"><i class="fa fa-edit"></i> <?php echo lang('edit')?></a>
                                          <?php } ?>
                                          <?php } ?>
										<?php if(check_user_role(116)==1){?>	
                                         <?php if($new->progress!=100){?>
										 <a class="btn btn-danger" style="margin-left:20px;" href="<?php echo site_url('admin/tasks/delete/'.$new->id); ?>" onclick="return areyousure()"><i class="fa fa-trash"> </i> <?php echo lang('delete')?></a>
                                         <?php } ?>
										<?php } ?>

										<?php if(check_user_role(117)==1){?>		 
										  <a class="btn btn-warning" style="margin-left:20px;" href="<?php echo site_url('admin/tasks/comments/'.$new->id); ?>" ><i class="fa fa-comments"></i> <?php echo lang('comments')?></a>
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
    </form>
</section>

<script src="<?php echo base_url('assets/js/plugins/datatables/jquery.dataTables.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/plugins/datatables/dataTables.bootstrap.js')?>" type="text/javascript"></script>
<?php 
   //(filtrado de un total de _MAX_ registros)

 $idioma = lang ('search');

  if ($idioma == 'Buscar')  {
     echo '

       <script>

  var oTable = $("#example").dataTable({
  "oLanguage": {
        "sProcessing":    "Procesando...",
        "sLengthMenu":    "Mostrar _MENU_ registros",
        "sZeroRecords":   "No se encontraron resultados",
        "sEmptyTable":    "Ningún dato disponible en esta tabla",
        "sInfo":          "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "sInfoEmpty":     "Mostrando registros del 0 al 0 de un total de 0 registros",
        "sInfoFiltered":  "",
        "sInfoPostFix":   "",
        "sSearch":        "Buscar:",
        "sUrl":           "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",
        "oPaginate": {
            "sFirst":    "Primero",
            "sLast":    "Último",
            "sNext":    "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        }
  },
  "aoColumnDefs": [{ "bSortable": false, "aTargets": [ 0] }, 
                { "bSearchable": false, "aTargets": [ 0 ] }]
  
  });






</script>
     '; 

  }else if ($idioma == 'Search') {
          echo '
       <script>

  var oTable = $("#example").dataTable({
  "oLanguage": {
    "sEmptyTable":     "No data available in table",
    "sInfo":           "Showing _START_ to _END_ of _TOTAL_ entries",
    "sInfoEmpty":      "Showing 0 to 0 of 0 entries",
    "sInfoFiltered":   "",
    "sInfoPostFix":    "",
    "sInfoThousands":  ",",
    "sLengthMenu":     "Show _MENU_ entries",
    "sLoadingRecords": "Loading...",
    "sProcessing":     "Processing...",
    "sSearch":         "Search:",
    "sZeroRecords":    "No matching records found",
    "oPaginate": {
        "sFirst":    "First",
        "sLast":     "Last",
        "sNext":     "Next",
        "sPrevious": "Previous"
    },
    "oAria": {
        "sSortAscending":  ": activate to sort column ascending",
        "sSortDescending": ": activate to sort column descending"
    }
  },
  "aoColumnDefs": [{ "bSortable": false, "aTargets": [ 0] }, 
                { "bSearchable": false, "aTargets": [ 0 ] }]
  
  });


</script>
     '; 
  }

?>

<script type="text/javascript">


   function validar(){
        var cont = 0; 
        var checkboxes = document.getElementsByName("task_check[]");
        for (var x=0; x < checkboxes.length; x++) {
            if (checkboxes[x].checked) {
                 cont = cont + 1;
            }
        }
       if (cont==0){
            $("#errorcontacto").css("display", "block");
            //$("#errorcontacto2").css("display", "block");
           return false;
         }  
        else 
          return true; 
   }

   function validarCategoria(){

        var ddl = document.getElementById("category2");
        var selectedValue = ddl.options[ddl.selectedIndex].value;
        if (selectedValue == "blank")
          {
            $("#errorcontacto3").css("display", "block");
            return false; 
          }else{
             return true;
          }
   }
   
   function Agrupar () {

        if (($('input[type=checkbox]').css("display"))=="none"){ 
          
         $('input[type=checkbox]').css("display", "block");
         var allPages = oTable.fnGetNodes();
         $('input[type="checkbox"]', allPages).css('display','block');
         var boton = document.getElementById("boton_select");
         if (boton.innerHTML == " Seleccionar") {
            boton.innerHTML = " Deseleccionar"; 
         } 
         else if (boton.innerHTML == " Select"){
            boton.innerHTML = " Unselect";           
         }   
          //$('input[type=text]').attr("disabled",true);
         document.getElementById("boton_eliminarvarios").style.display="inline";
         
       }else 
          {
            $('input[type=checkbox]').css("display", "none");
            var allPages = oTable.fnGetNodes();
            $('input[type="checkbox"]', allPages).css('display','none');
            var boton = document.getElementById("boton_select");
            if (boton.innerHTML == " Deseleccionar") 
              boton.innerHTML = " Seleccionar"; 
            else if (boton.innerHTML == " Unselect")
              boton.innerHTML = " Select"; 

           $('input[type="checkbox"]').prop('checked',false);
           var allPages = oTable.fnGetNodes();
           $('input[type="checkbox"]', allPages).prop('checked',false);          
            document.getElementById("boton_eliminarvarios").style.display="none";
          }    
   }
  

  function seleccionarTodos(){ 
   if ($('input[type=checkbox]').prop('checked')) {
        var allPages = oTable.fnGetNodes();
        $('input[type="checkbox"]', allPages).prop('checked', true);
   }else {
       var allPages = oTable.fnGetNodes();
        $('input[type="checkbox"]', allPages).prop('checked',false);
   }
  }

  function seleccionarTodos2(){ 
   if ($('input[type=checkbox]').prop('checked')) {
        $('input[type="checkbox"]').prop('checked',false);
        
   }else {
       $('input[type="checkbox"]').prop('checked',true);
    
   }
  }

  function mostrarTerminados(){

     $("#terminado").css("display", "");
     var allPages = oTable.fnGetNodes();
        $('#terminado', allPages).css("display", "");
  }

  function ocultarTerminados(){
     $("#terminado").css("display", "none");
     var allPages = oTable.fnGetNodes();
        $('#terminado', allPages).css("display", "none");
  }
  //Oculta las tareas terminadas por defecto.
  ocultarTerminados();
</script>