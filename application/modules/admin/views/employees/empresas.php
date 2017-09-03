<link href="<?php echo base_url('assets/css/datatables/dataTables.bootstrap.css')?>" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function areyousure()
{
	return confirm('Are You Sure You Want Delete This Employee');
}
</script>
<section class="content-header">
        <h1>
            <?php echo $page_title; ?>
            <small><?php echo lang('list')?></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard')?></a></li>
            <li class="active"><?php echo lang('employees')?></li>
        </ol>
</section>

<section class="content">
  	  	 <div class="row" style="margin-bottom:10px;">
            <div class="col-xs-12">
                <div class="btn-group pull-right">
				<?php if(check_user_role(38)==1){?>	
                    <a class="btn btn-default"  data-toggle="modal"  data-id="<?php $new->id ?>" data-target="#myModalData" href=""><i class="fa fa-plus"></i> <?php echo lang('add')?> <?php echo lang('new')?></a>
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
								<th><?php echo lang('company_name')?></th>
								<th><?php echo lang('Dept')?></th>
                                <th><?php echo lang('role')?></th>
                                <th><?php echo lang('action')?></th>	
                            </tr>
                        </thead>
                        
                        <?php if(isset($empresas)):?>
                        <tbody>
                            <?php $i=1;foreach ($empresas as $new){?>
                                <tr class="gc_row">
                                    <td><?php echo $i?></td>
                                    <td><?php echo ucwords($new->compania)?></td>
                                    <td><?php echo $new->rol; ?></td>
									<td><?php echo $new->depto;?>  </td>
									
                                    <td width="10%">
                                        <div class="btn-group">	  	
										  <!--<?php if(check_user_role(39)==1){?>	
										  <a class="btn btn-primary"  style="margin-left:12px;" href="<?php echo site_url('admin/employees/edit/'.$new->id); ?>"><i class="fa fa-edit"></i> <?php echo lang('edit')?></a>
										  <?php } ?>
                                          -->
                                    
										 <?php if(check_user_role(40)==1){?>	 
                                         <a class="btn btn-danger" style="margin-left:20px;" href="<?php echo site_url('admin/employees/deletecompany/'.$new->idrelacion); ?>" onclick="return areyousure()"><i class="fa fa-trash"></i> <?php echo lang('delete')?></a>
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

<!-- Modal para la Informacion de los contactos  -->
  <div class="modal fade" id="myModalData" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><?php echo lang('add');?></h4>
        </div>
        <div class="modal-body">
            <?php echo form_open_multipart('admin/employees/addcompany/'.$id); ?>
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-6">
                                    <label for="empresa_id" style="clear:both;"><?php echo lang('company_name');?></label>
                                    <select name="empresa_id" class="form-control chzn" id="empresa_id">
                                        <option value="">--<?php echo lang('select');?> <?php echo lang('company_name');?>---</option>
                                        <?php foreach($listaempresas as $new) {
                                            $sel = "";
                                            echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
                                        }
                                        
                                        ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="form-group">
                              <div class="row">
                                <div class="col-md-6">
                                    <label for="email" style="clear:both;"><?php echo lang('user_role');?></label>
                                    <select name="role_id" class="form-control chzn">
                                        <option value="">--<?php echo lang('select');?> <?php echo lang('user_role');?>---</option>
                                        <?php foreach($roles as $new) {
                                            $sel = "";
                                            echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
                                        }
                                        
                                        ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                         <div class="form-group">
                              <div class="row">
                                <div class="col-md-6">
                                    <label for="department_id" style="clear:both;"><?php echo lang('departments');?></label>
                                    <select name="department_id" class="form-control chzn" id="department_id">
                                        <option value="">--<?php echo lang('select');?> <?php echo lang('department');?>---</option>
                                        <?php foreach($departments as $new) {
                                            $sel = "";
                                            echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
                                        }
                                        
                                        ?>
                                    </select>
                                </div>
                            </div>
                        </div>

                      <div class="box-footer">
                        <button type="submit" class="btn btn-primary"><?php echo lang('save')?></button>
                    </div>

             <?php form_close()?>
 
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo lang('close');?></button>
        </div>
      </div>
      
    </div>
  </div>

<script src="<?php echo base_url('assets/js/plugins/datatables/jquery.dataTables.js')?>" type="text/javascript"></script>
<script src="<?php echo base_url('assets/js/plugins/datatables/dataTables.bootstrap.js')?>" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	$('#example1').dataTable({
	});
});

</script>