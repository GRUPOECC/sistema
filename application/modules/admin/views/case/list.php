<link href="<?php echo base_url('assets/css/datatables/dataTables.bootstrap.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/chosen.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/jquery.datetimepicker.css')?>" rel="stylesheet" type="text/css" />
<style>

</style>       
<script type="text/javascript">
function areyousure()
{
	return confirm('<?php echo lang('are_you_sure')?>');
}
</script>
<section class="content-header">
        <h1>
            <?php echo $page_title; ?>
            <small><?php echo lang('list')?></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard')?></a></li>
            <li class="active"><?php echo lang('case')?></li>
        </ol>
</section>


<section class="content">
  	  	 <div class="row" style="margin-bottom:10px;">
            <div class="col-xs-12">
                <div class="btn-group pull-right">
				<?php if(check_user_role(5)==1){?>	
                    <a class="btn btn-default" href="<?php echo site_url('admin/cases/add/'); ?>"><i class="fa fa-plus"></i> <?php echo lang('add')?> <?php echo lang('new')?></a>
             	<?php } ?>
        <?php if(check_user_role(24)==1){?>
                      <input id="boton_eliminarvarios" class="btn bg-red" style="margin-left:10px; display:none;" type='submit' name='submit' value='<?php echo lang('deleteGroup');?>' onclick=this.form.action="<?php echo site_url('admin/tasks'); ?>">
                <?php } ?>   
          <?php if(check_user_role(188)==1){?>
                      <a class="btn bg-olive" onclick="Agrupar()" style="margin-left:10px;" href="javascript:void()">
                     <i class="fa fa-caret-square-o-down"></i><i id="boton_select"> <?php echo lang('select');?></i></a> 
                     <?php } ?> 





			    </div>
            </div>    
        </div>	
		 <div class="row" style="margin-bottom:10px;">
            <div class="col-xs-12">
                <div class="">
                    

          					
					 <div class="col-xs-2">
						<select name="filter_dept_cat" id="dept_cat_id" class="form-control chzn">
							<option>--<?php echo lang('filter')?> <?php echo lang('by')?> <?php echo lang('dept_category')?>--</option>
									<?php foreach($depts_cats as $new) {
											$sel = "";
											echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
											}
										
									?>
						</select>
					</div>
					<div class="col-xs-2">
            <select name="filter_dept" id="dept_id" class="form-control chzn">
              <option>--<?php echo lang('filter')?> <?php echo lang('by')?> <?php echo lang('dept')?>--</option>
                  <?php foreach($depts as $new) {
                      $sel = "";
                      echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
                      }
                    
                  ?>
            </select>
          </div>
					 <div class="col-xs-2">
						<select name="filter_location" id="location_id" class="form-control chzn">
							<option>--<?php echo lang('filter')?> <?php echo lang('by');?> <?php echo lang('location');?>--</option>
							<?php foreach($locations as $new) {
											$sel = "";
											echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
								  }
										
							?>
						</select>
					</div>
					
					<div class="col-xs-2">
						<select name="filter_location" id="case_stage_id" class="form-control chzn">
							<option>--<?php echo lang('filter')?> <?php echo lang('by')?> <?php echo lang('case') ." ". lang('stages');?>--</option>
							<?php foreach($stages as $new) {
											$sel = "";
											echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
								  }
										
							?>
						</select>
					</div>
					
					<div class="col-xs-2">
						<input type="text" name="date1" id="date1" class="form-control datepicker" placeholder="<?php echo lang('filling_date')?>" />
					</div>
					
					<div class="col-xs-2">
						<input type="text" name="date2" id="date2" class="form-control datepicker" placeholder="<?php echo lang('hearing_date')?>" />
					</div>
					
                </div>
            </div>    
        </div>	
        
  	  	<div class="row">
          <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"></h3>                                    
                </div><!-- /.box-header -->
				
                <div class="box-body table-responsive" style="margin-top:0px;" id="result">
                    <table id="example1" class="table table-bordered table-striped table-mailbox">
                        <thead>
                            <tr>
                            <th><input style="display: none;" type="checkbox" id="check_group[]" name="check_group[]" onclick="seleccionarTodos()" value=""></th>   
                             <th width="5%"><?php echo lang('serial_number')?></th>
								<th width="8%"><?php echo lang('star')?></th>
								<th><?php echo lang('case')?> <?php echo lang('title')?></th>
								<th><?php echo lang('case')?> <?php echo lang('number')?></th>
								<th><?php echo lang('client')?></th>
								<th width="20%"><?php echo lang('action')?></th>
                            </tr>
                        </thead>
                        
                        <?php if(isset($cases)):?>
                        <tbody>
                            <?php $i=1;foreach ($cases as $new){?>
                                <tr class="gc_row">
                                 <td><input style="display: none;" type="checkbox" id="task_check[]" name="task_check[]" value="<?php echo $new->id ?>"></td>
                                    <td><?php echo $i?></td>
									
									<td class="small-col">
									
									<?php if($new->is_starred==0){ ?>
									<a href="" at="90" class="Privat"><span style="display:none"><?php echo $new->id?></span>
									<i class="fa fa-star-o"></i></a>
									<?php 
									}else{
									?>
									<a href="" at="90" class="Public"><span style="display:none"><?php echo $new->id?></span>
									<i class="fa fa-star"></i></a>
									<?php
									}
									?>
									</td>
                                    <td><?php echo $new->title?></td>
								    <td><?php echo $new->case_no?></td>
									<td><?php echo $new->client?></td>
									
                                    <td width="53%">
								<?php if(check_user_role(7)==1){?>		
									<a class="btn btn-default"  href="<?php echo site_url('admin/cases/view_case/'.$new->id); ?>"><i class="fa fa-eye"></i> <?php echo lang('view')?></a>
								<?php } ?>		
							<?php if(check_user_role(8)==1){?>			
									<a class="btn btn-info"  href="<?php echo site_url('admin/cases/fees/'.$new->id); ?>"><i class="fa fa-inr"></i> <?php echo lang('fees')?></a>	
                         <?php } ?>
						  <?php if(check_user_role(84)==1){?>	
						              <a class="btn btn-success"  href="<?php echo site_url('admin/cases/dates/'.$new->id); ?>"><i class="fa fa-calendar"></i> <?php echo lang('hearing_date')?></a>							
                           <?php } ?>              
									<?php if(check_user_role(6)==1){?>		  
										  <a class="btn btn-primary"  href="<?php echo site_url('admin/cases/edit/'.$new->id); ?>"><i class="fa fa-edit"></i> <?php echo lang('edit')?></a>								<?php } ?>
									<?php if(check_user_role(9)==1){?>		
                                        <a class="btn btn-warning"  href="<?php echo site_url('admin/cases/archived/'.$new->id); ?>"><i class="fa fa-close"></i> <?php echo lang('archived')?></a>					<?php } ?>
									<?php if(check_user_role(156)==1){?>		
                                        <a class="btn bg-purple"  href="<?php echo site_url('admin/cases/notes/'.$new->id); ?>"><i class="fa fa-pencil"></i> <?php echo lang('notes')?></a>					<?php } ?>	
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

<script src="<?php echo base_url('assets/js/plugins/datatables/jquery.dataTables.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/chosen.jquery.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/plugins/datatables/dataTables.bootstrap.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/jquery.datetimepicker.js')?>" type="text/javascript"></script>
<?php 
   //(filtrado de un total de _MAX_ registros)

 $idioma = lang ('search');

  if ($idioma == 'Buscar')  {
     echo '

       <script>

  var oTable = $("#example1").dataTable({
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

  var oTable = $("#example1").dataTable({
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
//$(function() {
//	$('#example1').dataTable({
//	});
//});



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

$(function() {
	
	$('.chzn').chosen();
	
});
 //Handle starring for glyphicon and font awesome
                $(".fa-star, .fa-star-o, .glyphicon-star, .glyphicon-star-empty").click(function(e) {
                    e.preventDefault();
                    //detect type
                    var glyph = $(this).hasClass("glyphicon");
                    var fa = $(this).hasClass("fa");

                    //Switch states
                    if (glyph) {
                        $(this).toggleClass("glyphicon-star");
                        $(this).toggleClass("glyphicon-star-empty");
                    }

                    if (fa) {
                        $(this).toggleClass("fa-star");
                        $(this).toggleClass("fa-star-o");
                    }
                });
$(".Privat").click(function (e) {
    e.preventDefault();
    //alert($(this).text());
  vch = $(this).text();
  //var ajax_load = '<img style="margin-left:200px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  //$('#reg_no_result').html(ajax_load);
	  
  $.ajax({
    url: '<?php echo site_url('admin/cases/set_starred') ?>',
    type:'POST',
    data:{id:vch},
    success:function(result){
     }
  });
  
  
});		


$(".Public").click(function (e) {
    e.preventDefault();
  	vch = $(this).text();
    
  $.ajax({
    url: '<?php echo site_url('admin/cases/update_set_starred') ?>',
    type:'POST',
    data:{id:vch},
    success:function(result){
      //alert(result);return false;
	  //$('#result_vehilces').html(result);
	 }
  });
  
  
});	



$(document).on('change', '#client_id', function(){
 //alert(12);
 	vch = $(this).val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#result').html(ajax_load);
	  
  $.ajax({
    url: '<?php echo site_url('admin/cases/get_case_by_client') ?>',
    type:'POST',
    data:{id:vch},
    success:function(result){
      //alert(result);return false;
	  $('#result').html(result);
	  $(".chzn").chosen();
	  $('#example1').dataTable({});
	 }
  });
});


$(document).on('change', '#dept_id', function(){
 //alert(12);
 	vch = $(this).val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#result').html(ajax_load);
	  
  $.ajax({
    url: '<?php echo site_url('admin/cases/get_case_by_dept') ?>',
    type:'POST',
    data:{id:vch},
    success:function(result){
      //alert(result);return false;
	  $('#result').html(result);
	  $(".chzn").chosen();
	  $('#example1').dataTable({});
	 }
  });
});

$(document).on('change', '#dept_cat_id', function(){
 //alert(12);
  vch = $(this).val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#result').html(ajax_load);
    
  $.ajax({
    url: '<?php echo site_url('admin/cases/get_case_by_dept_cat') ?>',
    type:'POST',
    data:{id:vch},
    success:function(result){
      //alert(result);return false;
    $('#result').html(result);
    $(".chzn").chosen();
    $('#example1').dataTable({});
   }
  });
});


$(document).on('change', '#location_id', function(){
 //alert(12);
 	vch = $(this).val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#result').html(ajax_load);
	  
  $.ajax({
    url: '<?php echo site_url('admin/cases/get_case_by_location') ?>',
    type:'POST',
    data:{id:vch},
    success:function(result){
      //alert(result);return false;
	  $('#result').html(result);
	  $(".chzn").chosen();
	  $('#example1').dataTable({});
	 }
  });
});

$(document).on('change', '#case_stage_id', function(){
 //alert(12);
 	vch = $(this).val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#result').html(ajax_load);
	  
  $.ajax({
    url: '<?php echo site_url('admin/cases/get_case_by_case_stage_id') ?>',
    type:'POST',
    data:{id:vch},
    success:function(result){
      //alert(result);return false;
	  $('#result').html(result);
	  $(".chzn").chosen();
	  $('#example1').dataTable({});
	 }
  });
});


$(document).on('change', '#date1', function(){
 //alert(12);
 	vch = $(this).val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#result').html(ajax_load);
	//alert(vch);	  
  $.ajax({
    url: '<?php echo site_url('admin/cases/get_case_by_case_filing_date') ?>',
    type:'POST',
    data:{id:vch},
    success:function(result){
      //alert(result);return false;
	  $('#result').html(result);
	  $(".chzn").chosen();
	  $('#example1').dataTable({});
	 }
  });
});

$(document).on('change', '#date2', function(){
 //alert(12);
 	vch = $(this).val();
  var ajax_load = '<img style="margin-left:100px;" src="<?php echo base_url('assets/img/ajax-loader.gif')?>"/>';
  $('#result').html(ajax_load);
	//alert(vch);	  
  $.ajax({
    url: '<?php echo site_url('admin/cases/get_case_by_case_hearing_date') ?>',
    type:'POST',
    data:{id:vch},
    success:function(result){
      //alert(result);return false;
	  $('#result').html(result);
	  $(".chzn").chosen();
	  $('#example1').dataTable({});
	 }
  });
});
			
				

</script>

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

     $('tr[name="terminado"]').css("display", "");
     var allPages = oTable.fnGetNodes();
        $('tr[name="terminado"]', allPages).css("display", "");
  }

  function ocultarTerminados(){
     $('tr[name="terminado"]').css("display", "none");
     var allPages = oTable.fnGetNodes();
        $('tr[name="terminado"]', allPages).css("display", "none");
  }

  function mostrarEliminados(){
     $('tr[name="eliminado"]').css("display", "");
    var allPages = oTable.fnGetNodes();
      $('tr[name="eliminado"]', allPages).css("display", "");
  }

  function ocultarEliminados(){
   
     $('tr[name="eliminado"]').css("display", "none");
     var allPages = oTable.fnGetNodes();
       $('tr[name="eliminado"]', allPages).css("display", "none");
  
  }

  var suiche = true; 
  function cambioMuestra(){
       if(suiche){
          mostrarEliminados();
          suiche = false; 
       }
        else {
          ocultarEliminados();
          suiche = true;  
        }
  }



  $(document).ready(function(){
      //Oculta las tareas terminadas y eliminadas por defecto.
      ocultarEliminados();
      ocultarTerminados();
   });
</script>