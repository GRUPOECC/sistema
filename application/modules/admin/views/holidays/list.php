<link href="<?php echo base_url('assets/css/fullcalendar.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/fullcalendar.print.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/jquery.datetimepicker.css')?>" rel="stylesheet" type="text/css" />



<link href="<?php echo base_url('assets/css/datatables/dataTables.bootstrap.css')?>" rel="stylesheet" type="text/css" />

<style type="text/css">
.custom,
.custom div,
.custom span {
    border-color: #3c8dbc;
   background-color: #3c8dbc;
    
    color: white;           /* text color */
}

.custom1,
.custom1 div,
.custom1 span {
   border-color: rgb(245, 105, 84);
   background-color: rgb(245, 105, 84);
   color: white;           /* text color */
}

.custom2,
.custom2 div,
.custom2 span {
   border-color:  #f39c12;
   background-color:  #f39c12;
   color: white;           /* text color */
}

</style>

<script type="text/javascript">
function areyousure()
{
	return confirm('<?php echo lang('are_you_sure');?>');
}
</script>

<!-- <?php var_dump($holidays); ?> -->
<!-- <?php
 $CI = &get_instance(); 
function get_holidays($m){
 $CI = &get_instance();
	$holidays = $CI->holiday_model->get_holidays_by_month($m);
	$default_days = $CI->holiday_model->get_default_holidays();
	$dates=array();
	foreach($default_days as $new){
	
// 		$dates = array_merge($dates,$CI->db->query(
// 		"select row+1  as DayOfMonth from   
// ( SELECT @row := @row + 1 as row FROM
//   (select 0 union all select 1 union all select 3 union all select 4 union all select 5 union all select 6) t1,
//   (select 0 union all select 1 union all select 3 union all select 4 union all select 5 union all select 6) t2,
//   (SELECT @row:=-1) t3 limit 31 ) b where
//          DATE_ADD('".date('Y-'.$m.'-01')."', INTERVAL ROW DAY) between '".date('Y-'.$m.'-01')."' and '".date('Y-'.$m.'-t')."' and DAYOFWEEK(DATE_ADD('".date('Y-'.$m.'-01')."', INTERVAL ROW DAY))=".$new->id.";" /* $new->id is for number of days  */)->result_array());
	}
	$dates = array_merge($dates,$holidays);
			
	 $dates[] = usort($dates, 'sortByOrder');
	return $dates;

}



	function sortByOrder($a, $b) {
		if($a['DayOfMonth']>31){
		return ;
		}else{
		  return $a['DayOfMonth'] - $b['DayOfMonth'];
		}
	}
//echo '<pre>-->';print_r(get_holidays());die;
?> -->

<section class="content-header">
        <h1>
            <?php echo $page_title; ?>
            <small><?php echo lang('list');?></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url('admin/dashboard')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard');?></a></li>
            <li class="active"><?php echo lang('calendar');?></li>
        </ol>
</section>

<section class="content">
      	<div class="row" style="margin-bottom:10px;">
            <div class="col-xs-12">
                <div class="btn-group pull-right">

                    <?php if(check_user_role(144)==1){?>
                        <a class="btn btn-default" href="<?php echo site_url('admin/holidays/add_event/'); ?>"><i class="fa fa-plus"></i> <?php echo lang('add_new') . ' ' .lang('calendar') . ' ' . lang('event');?></a>
                    <?php } ?>  

                    <?php if(check_user_role(144)==1){?>
                        <a class="btn btn-default" href="<?php echo site_url('admin/holidays/add_event_type/'); ?>"><i class="fa fa-plus"></i> <?php echo lang('add_new') . ' ' . lang('event') . ' ' . lang('type');?></a>
                    <?php } ?>  
                    

                </div>
            </div>  
        </div>	
        
  	  	<div class="row">
          <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"> <?php echo lang('events') . ' ' . lang('of') . ' ' . date("Y");?></h3>                                    
                </div><!-- /.box-header -->
				
     			<div class="row">
     				<div class="col-md-2">
     					<ul class="nav nav-tabs">
						 <?php $i=1; foreach($months as $new){ ?>
                            <li class="col-md-12 <?php echo (date("m")==$new->id)?'active':''?>">
                                    <a data-toggle="tab" id="<?php echo $i;?>" aria-expanded="false">
                                      <i class="fa fa-calendar"></i> <?php echo $new->name?> 
                                    </a>
                                    <span class="after"></span>
                             </li>
						<?php $i++; } ?>	 
     					  
     					</ul>
     				</div>
                   
                     
                        <!-- THE CALENDAR -->
                    <div id="calendar" class="col-md-9 pull-center" style="margin-bottom: 20px;" ></div>

     			</div>
     			<!-- END PAGE CONTENT-->

<!-- <?php 
  var_dump(
    $eventos_calendario
);
  echo "<hr>";
  $eventos = $eventos_calendario;
  foreach ($eventos as $evento) {
    var_dump($evento->name);
  }
 ?> -->
     			

                </div>
					
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div>
    </div>
</section>

<script src="<?php echo base_url('assets/js/plugins/datatables/jquery.dataTables.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/plugins/datatables/dataTables.bootstrap.js')?>" type="text/javascript"></script>


<!-- fullCalendar -->
<script src="<?php echo base_url('assets/js/moment.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/fullcalendar.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/lang-all.js')?>" type="text/javascript"></script>



<script type="text/javascript">
$(function() {

<?php 
            function print_event($event){
                if (strlen($event->name) > 34) { //Names of the task will be limited to 34 characters
                    $event->name = substr($event->name, 0, 34).'...';
                }

                echo "{
                title: '".$event->name."---"."',
                start: '".date('M d Y 12:00:00', strtotime($event->start_date))."',
                end: '".date('M d Y 12:00:00', strtotime($event->end_date))."',
                backgroundColor: '#3c8dbc',
                className : 'custom',
                url:  '".site_url('admin/holidays/')."'
                },
                      ";
            }

            function print_view($event){
                if (strlen($event->name) > 34) { //Names of the task will be limited to 34 characters
                    $event->name = substr($event->name, 0, 34).'...';
                }
                $estilo;
                if ($event->TASK == 'CITA') $estilo = 'custom1';
                if ($event->TASK == 'TASK') $estilo = 'custom2';

                echo "{
                title: '".$event->name."',
                start: '".date('M d Y 12:00:00', strtotime($event->due_date))."',
                end: '".date('M d Y 12:00:00', strtotime($event->due_date))."',
                backgroundColor: '#3c8dbc',
                className : '". $estilo ."',
                url:  '".site_url('admin/holidays/')."'
                },
                      ";
            }
 ?>





       var currentLangCode = '<?php echo lang('current_calen_lang'); ?>';
       // var currentLangCode = 'es';
       console.log('<?php 
        echo lang('calen_button_t'); 
        ?>');


      //Date for the calendar events (dummy data)
        var date = new Date();
        // var d = date.getDate(),
        //         m = date.getMonth(),
        //         y = date.getFullYear();

        // console.log(date,d,m,y);


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
                    events:[
                    
                    <?php 
                          //eventos de la tabla
                          foreach ($eventos_calendario as $event)
                              print_event($event);
                          // eventos de la vista
                          foreach ($v_calendario as $v_event)
                              print_view($v_event);
                    ?>        
                            ],
                    calendarProperties
                };




       $('#calendar').fullCalendar(
                    calendar_all_events
                    );
       // $("#calendar").fullCalendar('changeView', 'agendaWeek');

      $('li a').click(function(){
        console.log($(this).attr('id'));
            // $('#calendar').fullCalendar( 'destroy' );
            // m = $(this).attr('id');
            //     $('#calendar').fullCalendar(    calendar_all_events   );
            date.setMonth($(this).attr('id') - 1);
            $('#calendar').fullCalendar( 'gotoDate', date );
      });


  $('#example1').dataTable({
  });
});

</script>