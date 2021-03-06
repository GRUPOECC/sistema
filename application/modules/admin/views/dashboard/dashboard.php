<link href="<?php echo base_url('assets/css/fullcalendar.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/fullcalendar.print.css')?>" rel="stylesheet" type="text/css" />
<link href="<?php echo base_url('assets/css/jquery.datetimepicker.css')?>" rel="stylesheet" type="text/css" />
<style type="text/css">
.custom,
.custom div,
.custom span {
    border-color: #3c8dbc;
	 background-color: #3c8dbc;
    
    color: white;           /* text color */
}
.fc-event-time {
    display:none !important;
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

.caption-element {
    padding: 10px;
    display: inline-block;
    width: 105px;
    margin: 5px 0px 5px 10px;
    cursor: pointer;
}
</style>

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        <?php echo lang('dashboard') ?>
         <?php if(!empty($page_title)):?>
    	 <small>
        	<?php echo  $page_title; ?>
        </small>
   		<?php endif;?>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard') ?></a></li>
    </ol>
</section>

<!-- Main content -->
<section class="content">

    <!-- Small boxes (Stat box) -->
	
		<?php
        $admin = $this->session->userdata('admin');
		$access = $admin['user_role'];
		if($access==2){
		?>
					<div class="row">
	                    <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3>
                                        <?php echo count($my_cases)?>
                                    </h3>
                                    <p>
                                       <?php echo lang('my_cases');?>
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-list"></i>
                                </div>
                                <a href="<?php echo site_url('admin/my_cases')?>" class="small-box-footer">
                                    <?php echo lang('more_info')?><i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
						<div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3>
                                        <?php echo $client_setting->client_case_alert;?>
                                    </h3>
                                    <p>
                                       <?php echo lang('case_alert_days')?>
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-bell"></i>
                                </div>
                                <a href="#myModal" data-toggle="modal"  class="small-box-footer">
                                    <?php echo lang('click_here_to_change_setting'); ?><i class="fa fa-cog"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                    </div>
	
		<?php }else{?>		

	<section>
        <section>

    <div class="row">
                        <div class="col-lg-2 col-xs-4">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3>
                                       <?php echo count($my_cases)?>
                                    </h3>
                                    <p>
                                       <?php echo lang('my_cases');?>
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-list"></i>
                                </div>
                                <a href="<?php echo site_url('admin/my_cases')?>" class="small-box-footer">
                                    <?php echo lang('more_info');?>  <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-2 col-xs-4">
                            <!-- small box -->
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3>
                                        <?php echo count($my_tasks)?>
                                    </h3>
                                    <p>
                                        <?php echo lang('my_tasks'); ?>
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-list"></i>
                                </div>
                                <a href="<?php echo site_url('admin/tasks/my_tasks')?>" class="small-box-footer">
                                   <?php echo lang('more_info');?> <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        
                        <div class="col-lg-2 col-xs-4">
                            <!-- small box -->
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3>
                                       <?php echo count($messages)?>
                                    </h3>
                                    <p>
                                       <?php echo lang('messages');?>
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-inbox"></i>
                                </div>
                                <a href="<?php echo site_url('admin/message')?>" class="small-box-footer">
                                    <?php echo lang('more_info');?>  <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                                                                    
                        <div class="col-lg-2 col-xs-4">
                            <!-- small box -->
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3>
                                       <?php echo count($messages)?>
                                    </h3>
                                    <p>
                                       <?php echo lang('messages');?>
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-inbox"></i>
                                </div>
                                <a href="<?php echo site_url('admin/message')?>" class="small-box-footer">
                                    <?php echo lang('more_info');?>  <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-2 col-xs-4">
                            <!-- small box -->
                            <div class="small-box bg-orange">
                                <div class="inner">
                                    <h3>
                                       <?php echo count($documents)?>
                                    </h3>
                                    <p>
                                       <?php echo lang('documents');?>
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-book"></i>
                                </div>
                                <a href="<?php echo site_url('admin/documents')?>" class="small-box-footer">
                                   <?php echo lang('more_info');?> <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
                        <div class="col-lg-2 col-xs-4">
                            <!-- small box -->
                            <div class="small-box bg-light-blue-gradient">
                                <div class="inner">
                                    <h3>
                                       <?php echo count($documents)?>
                                    </h3>
                                    <p>
                                       <?php echo lang('documents');?>
                                    </p>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-book"></i>
                                </div>
                                <a href="<?php echo site_url('admin/documents')?>" class="small-box-footer">
                                   <?php echo lang('more_info');?> <i class="fa fa-arrow-circle-right"></i>
                                </a>
                            </div>
                        </div><!-- ./col -->
     </div> 

        </section>  
	</section>                   
    <section>
        <section>
                <div class="row">   
                    <div class="col-md-6">
                        <div class="box box-primary">
                            <div class="box-body ">
                                    <!-- THE CALENDAR -->
                                    <h4><?php echo lang('calendar'); ?></h4>
                                    <div id="caption-cases" class="caption-element external-event bg-red ui-draggable ui-draggable-handle" style="position: relative;">
                                    <?php echo lang('cases'); ?>
                                    </div>
                                    <div id="caption-appointments" class="caption-element external-event ui-draggable ui-draggable-handle bg-light-blue" style="position: relative;">
                                    <?php echo lang('appointments'); ?>
                                    </div>
                                    <div id="caption-tasks" class="caption-element external-event bg-yellow ui-draggable ui-draggable-handle" style="position: relative;">
                                    <?php echo lang('Tasks'); ?>
                                    </div>
                                    <div id="caption-all" class="caption-element external-event bg-purple-gradient ui-draggable ui-draggable-handle" style="position: relative;">
                                    <?php echo lang('show_all_events'); ?>
                                    </div>
                            </div><!-- /.box-body -->
                        </div><!-- /. box -->
                    </div><!-- /.col -->
                </div>
                <div class="row">      
                    <div class="col-md-6">
                        <div class="box box-primary">
                            <div class="box-body no-padding">
                                    <!-- THE CALENDAR -->
                                    <div id="calendar"></div>
                            </div><!-- /.box-body -->
                        </div><!-- /. box -->
                    </div><!-- /.col -->
                    <div class="col-md-6">
                        <div class="box box-primary">
                            <div class="box-body no-padding">
                                
                                <div class="box-header ui-sortable-handle" style="cursor: move;">
                                    <i class="ion ion-clipboard"></i>
                                    <h4 class="box-title"><?php echo lang('notice_board')?></h4>
                                </div><!-- /.box-header -->
                                <div class="box-body">
                                    <ul class="todo-list ui-sortable">
                                      <?php if(isset($notice)):?>
                                         <?php $i=1;foreach ($notice as $new){?>  
                                        <li>
                                            <span class="label label-info"><i class="fa fa-clock-o"></i> <?php echo date_time_convert($new->date_time); ?></span>
                                            <span class="text"><?php echo $new->title; ?></span>
                                            
                                            <div class="tools">
                                               <a href="<?php echo site_url('admin/notice/view/'.$new->id)?>"> <i class="fa fa-eye"></i></a>
                                            </div>
                                        </li>
                                        <?php $i++;}?>
                                    <?php endif;?>  
                                    </ul>
                                </div>
                                <div class="box-footer clearfix no-border">
                                    <button class="btn btn-default pull-right"><i class="fa fa-plus"></i> <a href="<?php echo site_url('admin/notice/')?>"><?php echo lang('view_all')?></a></button>
                                </div><!-- /.box-footer -->
                                
                            </div>
                        </div>
                    </div>
                </div><!-- /.row -->

                    <?php } ?>
    </section><!-- /.content -->                       
                        
    </div>

	<div class="row">	
	<?php {?>		

	<?php } {?>		

    <?php }?>
    




<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?php echo lang('case_alert_days') ?> <?php echo lang('settings') ?></h4>
      </div>
      <div class="modal-body">
			<?php echo form_open_multipart('admin/my_cases/case_alert/'); ?>
                    <div class="box-body">
                        <div class="form-group">
                        	<div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"> <?php echo lang('case_alert_days') ?></label>
									<input type="text" name="days" value="" class="form-control">
                                </div>
                            </div>
                        </div>
						
							

                    </div><!-- /.box-body -->
    
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary"><?php echo lang('save') ?></button>
                    </div>
             </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo lang('close') ?></button>  
      </div>
    </div>
  </div>
</div>



<!-- Modal -->
<div class="modal fade" id="mark_in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?php echo lang('mark_in') ?> </h4>
      </div>
      <div class="modal-body">
			<?php echo form_open_multipart('admin/attendance/mark_in/'); ?>
                    <div class="box-body">
                        <div class="form-group">
                        	<div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"> <?php echo lang('notes') ?></label>
									<textarea name="notes" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>
						
							

                    </div><!-- /.box-body -->
    
                    <div class="box-footer">
                        <button type="submit" class="btn bg-olive btn-flat margin" ><i class="fa fa-sign-in"></i> <?php echo lang('mark_in')?></button>
                    
					</div>
             </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo lang('close') ?></button>  
      </div>
    </div>
  </div>
</div>


<!-- Mark Out Modal -->
<div class="modal fade" id="mark_out" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?php echo lang('mark_out') ?> </h4>
      </div>
      <div class="modal-body">
			<?php echo form_open_multipart('admin/attendance/mark_out/'); ?>
                    <div class="box-body">
                        <div class="form-group">
                        	<div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"> <?php echo lang('notes') ?></label>
									<textarea name="notes" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>
						
							

                    </div><!-- /.box-body -->
    
                    <div class="box-footer">
                        <button type="submit" class="btn bg-orange btn-flat margin" ><i class="fa fa-sign-out"></i> <?php echo lang('mark_out')?></button>
                    
					</div>
             </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo lang('close') ?></button>  
      </div>
    </div>
  </div>
</div>


<!-- Apply Leave Modal -->
<div class="modal fade" id="apply_leave" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><?php echo lang('apply_leave') ?> </h4>
      </div>
      <div class="modal-body">
			<?php echo form_open_multipart('admin/attendance/apply_leave/'); ?>
                    <div class="box-body">
                        <div class="form-group input_fields_wrap">
                        	<div class="row  ">
                               
								<div class="col-md-3">
								 	<input type="text" name="date[]" value="" placeholder="<?php echo lang('date')?>" class="form-control datepicker" required/>
								</div>
								<div class="col-md-3" >
									<div>
										<select name="leave_id[]" class="form-control" required>
											<option value="">-- Select Leave Type</option>
											<?php 
											foreach($leave_types as $new){
												echo "<option value='".$new->id."'>".$new->name."</option>";
											}
											?>
										</select>
									</div>	
										
                                </div>
								<div class="col-md-4">
									<input type="text" name="reason[]" value="" placeholder="Reason" class="form-control" required />
									
								</div>
								
								<div class="form-group">
									<div class="row">
										<div class="col-md-offset-2" style="padding-left:12px;">
												<button class="add_field_button btn btn-success">Add More </button>
										</div>
									</div>
								</div>	
								
                            </div>
                        </div>
							

                    </div><!-- /.box-body -->
    
                    <div class="box-footer">
                        <button type="submit" class="btn bg-blue btn-flat margin" ><?php echo lang('submit')?></button>
                    
					</div>
             </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo lang('close') ?></button>  
      </div>
    </div>
  </div>
</div>

  <!-- Morris.js charts -->
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="<?php echo base_url('assets/js/plugins/morris/morris.min.js')?>" type="text/javascript"></script>
<!-- Sparkline -->
<script src="<?php echo base_url('assets/js/plugins/sparkline/jquery.sparkline.min.js')?>" type="text/javascript"></script>
<!-- jvectormap -->
<script src="<?php echo base_url('assets/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js')?>" type="text/javascript"></script>
<!-- fullCalendar -->
<script src="<?php echo base_url('assets/js/moment.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/fullcalendar.min.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/lang-all.js')?>" type="text/javascript"></script>
<!-- jQuery Knob Chart -->
<script src="<?php echo base_url('assets/js/plugins/jqueryKnob/jquery.knob.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/jquery.datetimepicker.js')?>" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
    var max_fields      = 100; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
    
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
            x++; //text box increment
            $(wrapper).append('<div class="row" style="padding-top:10px;"><div class="col-md-3"><input type="text" name="date[]" value="" placeholder="<?php echo lang('date')?>" class="form-control datepicker"  required/></div><div class="col-md-3"><select name="leave_id[]" class="form-control" required><option value="">-- Select Leave Type</option><?php foreach($leave_types as $new){echo "<option value=".$new->id.">".$new->name."</option>";}?></select></div><div class="col-md-4"><input type="text" name="reason[]" value="" placeholder="Reason" class="form-control" required /></div><a href="#" class="remove_field btn btn-danger">Remove</a></div></div>'); //add input box
            jQuery('.datepicker').datetimepicker({
             timepicker:false,
             format:'Y-m-d'
            });         

        }
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
});



</script>




<script type="text/javascript">
      $(function() {

        <?php 
        // defining reusable blocks of code to generate the calendar events
            function print_case($order){
                if (strlen($order->case_no) > 34) { //Names of the task will be limited to 34 characters
                    $order->case_no = substr($order->case_no, 0, 34).'...';
                }
                echo "{
                title: '".'#'.$order->case_no."',
                start: '".date('M d Y 12:00:00', strtotime($order->next_date))."',
                backgroundColor: '#3c8dbc',
                className : 'custom1',
                url:   '".site_url('admin/cases/view_case/'.$order->case_id)."'
                },
                      ";
            }

            function print_appointment($new){
                if (strlen($new->title) > 34) { //Names of the task will be limited to 34 characters
                    $new->title = substr($new->title, 0, 34).'...';
                }
                echo "{
                title: '".$new->title."',
                date: '".date('M d Y 12:00:00', strtotime($new->date_time))."',
                backgroundColor: '#3c8dbc',
                className : 'custom',
                
                url:   '".site_url('admin/appointments/view_appointment/'.$new->id)."'
                },
                      ";
            }

            function print_tasks($task){
                if (strlen($task->name) > 34) { //Names of the task will be limited to 34 characters
                    $task->name = substr($task->name, 0, 34).'...';
                }
                echo "{
                title: '".$task->name."',
                date: '".date('M d Y 12:00:00', strtotime($task->due_date))."',
                backgroundColor: '#3c8dbc',
                className : 'custom2',
                editable: false,
                
                url:   '".site_url('admin/tasks/view/'.$task->id)."'
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
                    events:[
                    
                        <?php  
                            foreach($case_all_cal as $order)    
                                print_case($order);
                            foreach($appointment_all_cal as $new)
                                print_appointment($new); 
                            foreach ($my_tasks_info as $task)
                                print_tasks($task);
                        ?>
                            
                            ],
                    calendarProperties
                };

        let calendar_cases = {
                     showAgendaButton: true,
                columnFormat: { month: 'ddd', week: 'ddd d/M', day: 'dddd d/M' },
                timeFormat: 'H:mm',
                axisFormat: 'H:mm',
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    lang: currentLangCode,
                    buttonText: {
                        // today: 'today',
                        // month: 'month',
                        // week: 'week',
                        // day: 'day'

                        today: '<?php echo lang('calen_button_t'); ?>',
                        month: '<?php echo lang('calen_button_m'); ?>',
                        week: '<?php echo lang('calen_button_w'); ?>',
                        day: '<?php echo lang('calen_button_d'); ?>'
                    },
                    allDayText: '<?php echo lang('calen_all_day'); ?>',

                    events:[
                    
                                <?php  
                                    foreach($case_all_cal as $order)    
                                        print_case($order);
                                ?>

                            ],
                            calendarProperties
                                        
                };
                

            let calendar_appointments = {
                     showAgendaButton: true,
                columnFormat: { month: 'ddd', week: 'ddd d/M', day: 'dddd d/M' },
                timeFormat: 'H:mm',
                axisFormat: 'H:mm',
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    lang: currentLangCode,
                    buttonText: {

                        today: '<?php echo lang('calen_button_t'); ?>',
                        month: '<?php echo lang('calen_button_m'); ?>',
                        week: '<?php echo lang('calen_button_w'); ?>',
                        day: '<?php echo lang('calen_button_d'); ?>'
                    },
                    allDayText: '<?php echo lang('calen_all_day'); ?>',

                    events:[
                        
                                <?php  
                                     foreach($appointment_all_cal as $new)
                                        print_appointment($new);    
                                ?>

                            ],
                            calendarProperties
                };

            let calendar_tasks = {
                     showAgendaButton: true,
                columnFormat: { month: 'ddd', week: 'ddd d/M', day: 'dddd d/M' },
                timeFormat: 'H:mm',
                axisFormat: 'H:mm',
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    lang: currentLangCode,
                    buttonText: {

                        today: '<?php echo lang('calen_button_t'); ?>',
                        month: '<?php echo lang('calen_button_m'); ?>',
                        week: '<?php echo lang('calen_button_w'); ?>',
                        day: '<?php echo lang('calen_button_d'); ?>'
                    },
                    allDayText: '<?php echo lang('calen_all_day'); ?>',
                    events:[
                    
                            <?php  
                                 foreach ($my_tasks_info as $task)
                                     print_tasks($task);
                            ?>

                            ],
                    calendarProperties
                };




        $('#caption-cases').on("click",function(){
            $('#calendar').fullCalendar( 'destroy' );


                $('#calendar').fullCalendar(
                    calendar_cases
                    );

        });



        $('#caption-appointments').on("click",function(){
            $('#calendar').fullCalendar( 'destroy' );


                $('#calendar').fullCalendar(
                    calendar_appointments
                    );


        });



        $('#caption-tasks').on("click",function(){
            $('#calendar').fullCalendar( 'destroy' );


                $('#calendar').fullCalendar(
                    calendar_tasks
                    );

        });

        $('#caption-all').on("click",function(){
            $('#calendar').fullCalendar( 'destroy' );
                $('#calendar').fullCalendar(
                    calendar_all_events
                    );
        });

                $('#calendar').fullCalendar(
                    calendar_all_events
                    );
            

                
               
            });




jQuery('.datepicker').datetimepicker({
 timepicker:false,
 format:'Y-m-d'
});			
        </script>  
