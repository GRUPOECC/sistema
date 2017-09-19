<?php 
        $company_event = false;
 ?>
<link href="<?php echo base_url('assets/css/fullcalendar.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/fullcalendar.print.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/jquery.datetimepicker.css')?>" rel="stylesheet" type="text/css" />


<link rel="stylesheet" href="<?php echo base_url('assets/css/select2.min.css')?>" />

<link href="<?php echo base_url('assets/css/jquery.datetimepicker.css')?>" rel="stylesheet" type="text/css" />
<!-- Content Header (Page header) -->
<style>
.row{
    margin-bottom:10px;
}
.margin-right{
    margin-right: 10px;
}
</style>
 <!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        <?php echo lang('calendar');?>
        <small><?php echo lang('add_event');?></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url('admin/dashboard')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard');?></a></li>
        <li><a href="<?php echo site_url('admin/holidays')?>"><?php echo lang('calendar');?></a></li>
        <!-- <li class="active"><?php echo lang('add') . ' ' . lang('fiscal_event');?></li> -->
        <li class="active"><?php echo lang('add_new') . ' ' .lang('calendar') . ' ' . lang('event');?></li>
    </ol>
</section>

<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title">   <?php echo lang('add_new') . ' ' .lang('calendar') . ' ' . lang('event');?>   </h3>
                </div><!-- /.box-header -->
                <!-- form start -->
                <?php echo form_open_multipart('admin/holidays/add_event/'); ?>
                    <div class="box-body row">
                        <div class="box-body col-md-5">

                                            <div class="form-group">
                                                <div class="row">
                                                        <div class="col-md-4">
                                                            <label for="start_date" style="clear:both;"> <?php echo lang('start_date');?></label>
                                                            <input type="text" name="start_date" value="" class="form-control datetimepicker" id="start_date">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <label for="end_date" style="clear:both;"> <?php echo lang('end_date');?></label>
                                                                <input type="text" name="end_date" value="" class="form-control datetimepicker" id="end_date">
                                                        </div>
                                                    </div>
                                                </div>
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <label for="name" style="clear:both;"> <?php echo lang('name');?></label>
                                                        <input id="name" type="text" name="name" value="" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-10">
                                                        <label for="description" style="clear:both;"> <?php echo lang('description');?></label>
                                                        <input type="text" name="description" value="" class="form-control" id="description">
                                                    </div>
                                                </div>
                                            </div>
                    
                                            <div class="form-group">
                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <label for="event_type"><?php echo lang('event') . ' ' . lang('type');?></label>                   
                                                         <select name="event_type" id="event_type" class="range-options form-control chzn">
                                                            <option value="0" >--None (Casual Event)--</option>

                                                            <?php foreach ($event_types as $event): ?>
                                                                <option value="<?php echo $event->id;?>" >
                                                                    <?php  echo $event->name; ?>
                                                                </option>
                                                            <?php endforeach; ?>

                                                        </select>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="form-group">
                                                 <div class="row">
                                                    <div class="col-md-8">
                                                        <!-- Lo que necesito poner aca son las empresas que el usuario puede ver: 
                                                            -> $empresas_visibles
                                                        y las que el posee: 
                                                            -> $empresas_usuario -->


                                                    <label for="visible_companies_selected">My Companies</label>

                                                    <select name="visible_companies_selected[]" multiple="multiple" id="visible_companies_selected" class="form-control chzn">
                                                        <?php foreach ($mis_empresas as $empresa) : ?>
                                                                <option value="<?php echo $empresa->id ?>">
                                                                    <?php echo $empresa->name; ?>
                                                                </option>
                                                        <?php endforeach; ?>
                                                    </select>

                                                    </div>
                                                </div>
                                            </div>


                                <div class="form-group">
                                     <div class="row">
                                        <div class="col-md-8">


                                                        <label for="branches">Branch Offices</label>
                                                        <select name="" id="branches" class="form-control chzn" multiple="multiple">
                                                               
                                                            </select>

                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="form-group">
                                     <div class="row">
                                        <div class="col-md-8">

                                                <label for="visible_companies_selected">Other Companies I Can See</label>

                                                    <select name="visible_companies_selected[]" multiple="multiple" id="visible_companies_selected" class="form-control chzn">
                                                        <?php foreach ($empresas_visibles as $empresa) : ?>
                                                                <option value="<?php echo $empresa->id ?>">
                                                                    <?php echo $empresa->name; ?>
                                                                </option>
                                                        <?php endforeach; ?>
                                                    </select>

                                        </div>
                                    </div>
                                </div>                                                    

                         

                                            
                                            
                                        </div><!-- /.box-body -->

                    <div class="box-body col-md-5">
                        <!-- CALENDAR PREVIEW -->
                        <label>Preview</label>
                        <div id="calendar" style="margin: 5px;"></div>
                    </div>

                                    </div>

    
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary"><?php echo lang('save');?></button>
                    </div>
             <?php form_close()?>
            </div><!-- /.box -->
        </div>
     </div>
</section>  
<script src="<?php echo base_url('assets/js/jquery.datetimepicker.js')?>" type="text/javascript"></script>


<script src="<?php echo base_url('assets/js/select2.min.js')?>""></script>


<!-- fullCalendar -->
<script src="<?php echo base_url('assets/js/moment.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/fullcalendar.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/lang-all.js')?>" type="text/javascript"></script>


<script type="text/javascript">


 $(function() {


    function deepClone(initalObj) {
        var obj = {};
        try {
            obj = JSON.parse(JSON.stringify(initalObj));
        }
        catch(err){}
        return obj;
    }

    //recibo un objeto con arrays, lo convierto a objeto de objetos para manipulacion con js
    const sucursales_js =<?php echo json_encode($sucursales, JSON_FORCE_OBJECT);?>;

    $("#visible_companies_selected").change(function(){
        let sucursales_copy = deepClone(sucursales_js);

        let selected_branches = [] ;
        //GET SELECTED COMPANIES
        $( "#visible_companies_selected option:selected" ).each(function() {
             selected_branches.push($(this).val());
        });

        console.log('------------------------------------')
        for (let prop in sucursales_copy){
            //recorro las propiedades del objeto!
            // las borro si no son las seleccionadas
            if (!selected_branches.includes(prop)) {    delete sucursales_copy[prop]    }
        }
        console.log(sucursales_copy);
        console.log('------------------------------------')

        //ADD ALL THE BRANCH OFFICES TO THE SELECT
        $('#branches').empty();

        for (let prop in sucursales_copy){
        $.each(sucursales_copy[prop], function(key, value) {
                 $('#branches')
                     .append($("<option></option>")
                     .attr("value",key.id)
                     .text(value.name));
            });
        }

    });






    for (let sucursal in sucursales_js) {
        console.log(sucursal);
    }
    
    console.log(sucursales_js);





   //Select2
  $(".chzn").select2({
        maximumSelectionLength: 100000,
    placeholder: "Seleccione"
    })



    // ----------------CALENDAR---------------------

       var currentLangCode = '<?php echo lang('current_calen_lang'); ?>';
       // var currentLangCode = 'es';


      //Date for the calendar events (dummy data)
        var date = new Date();
        var d = date.getDate(),
                m = date.getMonth(),
                y = date.getFullYear();


        //Defining calendar properties once
        let calendarProperties = {editable: true,
                    droppable: true // this allows things to be dropped onto the calendar !!!

                };

                                    // CALENDAR OBJECTS

        let calendar_all_events = {
                     showAgendaButton: true,
                columnFormat: { month: 'ddd', week: 'ddd d/M', day: 'dddd d/M' },
                timeFormat: 'H:mm',
                axisFormat: 'H:mm',
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },

                    buttonText: {

                        today: '<?php echo lang('calen_button_t'); ?>',
                        month: '<?php echo lang('calen_button_m'); ?>',
                        week: '<?php echo lang('calen_button_w'); ?>',
                        day: '<?php echo lang('calen_button_d'); ?>'
                    },
                    lang: currentLangCode,
                    allDayText: '<?php echo lang('calen_all_day'); ?>',
                    // events:[
                    
                            
                    //         ],
                    calendarProperties
                };




       $('#calendar').fullCalendar(
                    calendar_all_events
                    );



    // ---------------------------------------------




    //SWITCH FOR 'Select Time Range'
        // source:http://icheck.fronteed.com/#features  (see callbacks)
        $('input').on('ifToggled', function(event){

          if ($('#periodic').prop("disabled") ) {
            $('#periodic').prop("disabled", false)
          } else {
            $('#periodic').prop("disabled", true)
          }
        });


   $('.datetimepicker').datetimepicker({
    //mask:'9999-19-39 29:59',
    format  : 'Y-m-d',
    timepicker:false
    });

  });
</script>