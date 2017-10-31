<link href="<?php echo base_url('assets/css/fullcalendar.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/fullcalendar.print.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/jquery.datetimepicker.css')?>" rel="stylesheet" type="text/css" />


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
        <li class="active"><?php echo lang('add') . ' ' . lang('fiscal_event');?></li>
    </ol>
</section>

<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title"><!-- <?php echo lang('add');?> --><?php echo lang('add') . ' ' . lang('fiscal_event');?></h3>
                </div><!-- /.box-header -->
                <!-- form start -->
				<?php echo form_open_multipart('admin/holidays/add/'); ?>
                <div class="box-body row">
                    <div class="box-body col-md-6" style="margin: 0px 20px;">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-11">
                                    <label for="name" style="clear:both;"> <?php echo lang('name');?></label>
                                    <input id="name" type="text" name="name" value="" class="form-control">
                                </div>
                            
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-11">
                                    <label for="description" style="clear:both;"> <?php echo lang('description');?></label>
                                    <input id="description" type="text" name="date" value="" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                               
                                <div class="col-md-4">
                                    <label for="date" style="clear:both;"> <?php echo lang('date');?></label>
                                    <input type="text" name="date" value="" class="form-control datetimepicker">
                                </div>
                                <div class="col-md-6">

                                    <label for="repeat" class="margin-right">   <?php echo lang('repeat') . ' ' . lang('date');?>   </label>
                                    <input class="checkbox" id="repeat" type="checkbox" name="repeat" value="" />

                                    <select disabled name="filter_dept_cat" id="dept_cat_id" class="range-options form-control chzn">
                                        <option value="" selected disabled hidden>--Select Time Range--</option>
                                                <option value="1">Semanal</option>
                                                <option value="2">Mensual</option>
                                                <option value="1">Anual</option>
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

<!-- fullCalendar -->
<script src="<?php echo base_url('assets/js/moment.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/fullcalendar.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/lang-all.js')?>" type="text/javascript"></script>


<script type="text/javascript">
 $(function() {

    // source:http://icheck.fronteed.com/#features  (see callbacks)
    $('input').on('ifToggled', function(event){
      // alert(event.type + ' callback');
      if ($('.range-options').prop("disabled") ) {
        $('.range-options').prop("disabled", false)
      } else {
        $('.range-options').prop("disabled", true)
      }
    });



    // ----------------CALENDAR---------------------

       var currentLangCode = '<?php echo lang('current_calen_lang'); ?>';
       // var currentLangCode = 'es';
       console.log('<?php 
        echo lang('calen_button_t'); 
        ?>');


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

   $('.datetimepicker').datetimepicker({
	//mask:'9999-19-39 29:59',
	format  : 'Y-m-d',
	timepicker:false
	});

  });
</script>