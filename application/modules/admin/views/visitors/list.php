<link href="<?php echo base_url('assets/css/datatables/dataTables.bootstrap.css')?>" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function areyousure()
{
	return confirm('<?php echo lang('are_you_sure');?>');
}

function returnbadge()
{
    return confirm('<?php echo lang('badge_returned');?>');
}
</script>

<?php 

        $this->load->model("visitors_model");

?>


<section class="content-header">
        <h1>
            <?php echo $page_title; ?>
            <small><?php echo lang('list');?></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard');?></a></li>
            <li class="active"><?php echo lang('visitors');?></li>
        </ol>
</section>

<section class="content">
  	  	 <div class="row" style="margin-bottom:10px;">
            <div class="col-xs-12">
                <div class="btn-group pull-right">
				<?php if(check_user_role(214)==1){?>
                    <a class="btn btn-default" href="<?php echo site_url('admin/visitors/add/'); ?>"><i class="fa fa-plus"></i> <?php echo lang('add_new');?></a>
                 <?php } ?>	
				</div>
            </div>    
        </div>	
        
  	  	
          <div class="col-xs-12">
            <div class="box">
                
				
                <div class="box-body table-responsive" style="margin-top:40px;">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th><?php echo lang('serial_number');?></th>
								<th><?php echo lang('badge');?></th>
								<th><?php echo lang('Visitor');?></th>
								<th><?php echo lang('who_visit');?></th>
								<th><?php echo lang('date_in');?></th>
                                <th><?php echo lang('date_out');?></th>
								<th><?php echo lang('notes');?></th>
								<th><?php echo lang('action');?></th>
                            </tr>
                        </thead>
                        
                        <?php if(isset($visitors)):?>
                        <tbody>
                            <?php $i=1;foreach ($visitors as $new){?>

                            <?php $name_e = $this->visitors_model->get_all_e($new->user_id);

                             ?>


                           


                                <tr class="gc_row">
                                    <td><?php echo $i?></td>
                                    <td><?php echo $new->badge_name?></td>
									<td><?php echo $new->name?></td>
									<td><?php echo $name_e->name_e?></td>
                                    <td><?php echo date_time_convert($new->date_time_in)?></td>


                                    <td><?php echo date('d/m/Y H:i',strtotime($new->date_time_out))?></td>
									<td><?php echo $new->notes?></td>
									<td width="28%">
                                        <div class="btn-group"> 
                                         <?php if(check_user_role(218)==1){?> 
                                         <a class="btn btn-danger" style="margin-left:10px;" href="<?php echo site_url('admin/visitors/close/'.$new->id); ?>" onclick="return areyousure()"><i class="fa fa-trash"></i> <?php echo lang('close');?></a>
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

<script src="<?php echo base_url('assets/js/plugins/datatables/jquery.dataTables.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/plugins/datatables/dataTables.bootstrap.js')?>" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	$('#example1').dataTable({
	});
});

</script>