<link href="<?php echo base_url('assets/css/datatables/dataTables.bootstrap.css')?>" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function areyousure()
{
	return confirm('<?php echo lang('are_you_sure');?>');
}
</script>
<section class="content-header">
        <h1>
            <?php echo $page_title; ?>
            <small><?php echo lang('list');?></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard');?></a></li>
            <li class="active"><?php echo lang('parrillas');?></li>
        </ol>
</section>

<section class="content">
  	  	 <div class="row" style="margin-bottom:10px;">
            <div class="col-xs-12">
                <div class="btn-group pull-right">
				<?php if(check_user_role(26)==1){?>
                    <a class="btn btn-default" href="<?php echo site_url('publi/parrillas/add/'); ?>"><i class="fa fa-plus"></i> <?php echo lang('add_new');?></a>
                 <?php } ?>	
				</div>
            </div>    
        </div>	
        
  	  	<div class="row">
          <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"><?php echo lang('add');?></h3>                                    
                </div><!-- /.box-header -->
				
                <div class="box-body table-responsive" style="margin-top:40px;">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th><?php echo lang('serial_number');?></th>
								<th><?php echo lang('Cliente');?></th>
								<th><?php echo lang('Pilar');?></th>
								<th><?php echo lang('Campana');?></th>
                                <th><?php echo lang('Medio');?></th>
								<th><?php echo lang('Fecha_pub');?></th>
								<th><?php echo lang('copy');?></th>
                                <th><?php echo lang('etiquetas');?></th>
								<th width="20%"><?php echo lang('action');?></th>
                            </tr>
                        </thead>
                        
                        <?php if(isset($parrillas)):?>
                        <tbody>
                            <?php $i=1;foreach ($parrillas as $new){?>
                                <tr class="gc_row">
                                    <td><?php echo $i?></td>
                                    <td><?php echo $new->cliente_id?></td>
                                    <td><?php echo $new->pilar_id?></td>
                                    <td><?php echo $new->campana_id?></td>
                                    <td><?php echo $new->medio_id?></td>
                                    <td><?php echo date_time_convert($new->fecha_pub)?></td>
                                    <td width="20%"><?php echo $new->copy?></td>
                                    <td width="20%"><?php echo $new->etiquetas?></td>


                                   	<td width="10%">
                                        <div class="btn-group">
									<?php if(check_user_role(29)==1){?>	
                                          <a class="btn btn-default"  href="<?php echo site_url('publi/parrillas/view_appointment/'.$new->id); ?>"><i class="fa fa-eye"></i> <?php echo lang('view');?></a>
										   <?php } ?>	
										<?php if(check_user_role(27)==1){?>
										  <a class="btn btn-primary"  style="margin-left:10px;" href="<?php echo site_url('publi/parrillas/edit/'.$new->id); ?>"><i class="fa fa-edit"></i> <?php echo lang('edit');?></a>
										   <?php } ?>	
										 <?php if(check_user_role(28)==1){?> 
                                         <a class="btn btn-danger" style="margin-left:10px;" href="<?php echo site_url('publi/parrillas/delete/'.$new->id); ?>" onclick="return areyousure()"><i class="fa fa-trash"></i> <?php echo lang('delete');?></a>
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