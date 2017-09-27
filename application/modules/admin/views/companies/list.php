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
            <li class="active"><?php echo lang('companies');?></li>
        </ol>
</section>

<section class="content">
  	  	 <div class="row" style="margin-bottom:10px;">
            <div class="col-xs-12">
                <div class="btn-group pull-right">
				<?php if(check_user_role(208)==1){?>	
                    <a class="btn btn-default" href="<?php echo site_url('admin/companies/add/'); ?>"><i class="fa fa-plus"></i> <?php echo lang('add_new');?></a>
				<?php } ?>		
                </div>
            </div>    
        </div>	
        
  	  	<div class="row">
          <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"><?php echo lang('company');?></h3>                                    
                </div><!-- /.box-header -->
				
                <div class="box-body table-responsive" style="margin-top:0px;">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th><?php echo lang('serial_number');?></th>
							 <th><?php echo lang('code');?></th>
                            	<th><?php echo lang('name');?></th>
							
                                <th><?php echo lang('rif');?></th>
                                <th><?php echo lang('reason');?></th>
                                <th><?php echo lang('type');?></th>
                                <th><?php echo lang('phone');?></th>
                                <th><?php echo lang('action');?></th>
                            </tr>
                        </thead>
                        
                        <?php if(isset($companies)):?>
                        <tbody>
                            <?php $i=1;foreach ($companies as $new){?>
                                <tr class="gc_row">
                                    <td><?php echo $i?></td>
					               <td><?php echo $new->cod_interno?></td>				
                                    <td><?php echo $new->name?></td>
					
                                    <td><?php echo $new->rif?></td>
                                    <td><?php echo $new->razon_social?></td>
                                    <td><?php echo $new->tipo?></td>
                                    <td><?php echo $new->telefono?></td>
                                    <td>
                                        <div class="btn-group">
                                         <?php if(check_user_role(211)==1){?>    
                                          <a class="btn btn-default"  href="<?php echo site_url('admin/companies/view/'.$new->id); ?>"><i class="fa fa-eye"></i><?php echo lang('view');?></a>
                                          <?php } ?>
                                         <?php if(check_user_role(209)==1){?>	 
										  <a class="btn btn-primary" style="margin-left:10px;"  href="<?php echo site_url('admin/companies/edit/'.$new->id); ?>"><i class="fa fa-edit"></i> <?php echo lang('edit');?></a>
										  <?php } ?>	
										 <?php if(check_user_role(210)==1){?>	 
                                         <a class="btn btn-danger" style="margin-left:10px;" href="<?php echo site_url('admin/companies/delete/'.$new->id); ?>" onclick="return areyousure()"><i class="fa fa-trash"></i> <?php echo lang('delete');?></a>
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