<link href="<?php echo base_url('assets/css/jquery.datetimepicker.css')?>" rel="stylesheet" type="text/css" />
            <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
            <link href="<?php echo base_url('assets/css/bootstrap.min.css')?>" rel="stylesheet" type="text/css" />

            <!-- font Awesome -->
            <link href="<?php echo base_url('assets/css/font-awesome.min.css')?>" rel="stylesheet" type="text/css" />
            <!-- Ionicons -->
            <link href="<?php echo base_url('assets/css/ionicons.min.css')?>" rel="stylesheet" type="text/css" />
            <!-- Morris chart -->
            <link href="<?php echo base_url('assets/css/morris/morris.css')?>" rel="stylesheet" type="text/css" />
            <link href="<?php echo base_url('assets/css/pickmeup.min.css')?>" rel="stylesheet" type="text/css" />
          
            <!-- Theme style -->
            <link href="<?php echo base_url('assets/css/AdminLTE.css')?>" rel="stylesheet" type="text/css" />
            <link href="<?php echo base_url('assets/css/redactor.css')?>" rel="stylesheet" type="text/css" />
            
            <!-- jQuery 2.0.2 -->
            <script src="<?php echo base_url('assets/js/jquery.js')?>"></script>
<!-- Content Header (Page header) -->
<style>
.row{
	margin-bottom:10px;
}
</style>
 <!-- Content Header (Page header) -->
<section class="content-header">
  <!--
    <h1>
        <?php echo lang('bank_details')?>

    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i><?php echo lang('dashboard')?></a></li>
        <li><a href="<?php echo site_url('admin/employees')?>"><?php echo lang('employees')?></a></li>
        <li class="active"><?php echo lang('bank_details')?></li>
    </ol>
    -->
</section>

<section class="content">
    <div class="row">
	<?php 
	if(validation_errors()){
?>
<div class="alert alert-danger alert-dismissable">
                                        <i class="fa fa-ban"></i>
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-close"></i></button>
                                        <b><?php echo lang('alert');?>!</b><?php echo validation_errors(); ?>
</div>

<?php  } ?>
        <!-- left column -->
        <div class="col-md-12">
		
		<div class="row" style="margin-bottom:10px;">
            <div class="col-xs-12">
                <div class="btn-group pull-right">
				    <a class="btn btn-default" href="<?php echo site_url('admin/employees/addbankinterno/'.$id); ?>"><i class="fa fa-plus"></i> <?php echo lang('add')?> <?php echo lang('new')?></a>
				</div>
            </div>    
        </div>	
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title"><?php echo lang('bank_details')?></h3>
                </div><!-- /.box-header -->
                <!-- form start -->
		
					
						 <div class="box-body table-responsive" style="margin-top:40px;">
                     <?php if(!empty($details)):?>
                      
				    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th><?php echo lang('serial_number')?></th>
								<th><?php echo lang('account_holder_name')?></th>
								<th><?php echo lang('account_number')?></th>
                                <th><?php echo lang('bank_name')?></th>
								<th><?php echo lang('ifsc_code')?></th>
								<th><?php echo lang('pan_number')?></th>
								<th><?php echo lang('branch')?></th>
								<th width="20%"><?php echo lang('action')?></th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            <?php $i=1;foreach ($details as $new){?>
                                <tr class="gc_row">
                                    <td><?php echo $i?></td>
                                    <td><?php echo $new->account_holder_name ?></td>
									<td><?php echo $new->account_number ?></td>
									<td><?php echo $new->bank_name ?></td>
									<td><?php echo $new->ifsc?></td>
									<td><?php echo $new->pan ?></td>
									<td><?php echo $new->branch ?></td>
									
                                    <td class="col-md-1">
									<?php if(check_user_role(125)==1){?>	
                                        <div class="btn-group">
								         <a class="btn btn-danger" style="margin-left:20px;" href="<?php echo site_url('admin/employees/delete_bank_details/'.$new->id); ?>" onclick="return areyousure()"><i class="fa fa-trash"></i> <?php echo lang('delete')?></a>
								        </div>
										<?php } ?>
                                    </td>
                                </tr>
                                <?php $i++;}?>
                        </tbody>
                       
                    </table>
					 <?php endif;?>
                </div>
					

                    </div><!-- /.box-body -->
    
                  
             <?php form_close()?>
            </div><!-- /.box -->
        </div>
     </div>
</section>  

<script type="text/javascript">
function areyousure()
{
	return confirm('Are You Sure ');
}
</script>
        <script src="<?php echo base_url('assets/js/jquery-ui-1.10.3.min.js')?>" type="text/javascript"></script>
         <script src="<?php echo base_url('assets/js/jquery.pickmeup.min.js')?>" type="text/javascript"></script>
        <!-- Bootstrap --> 
        <script src="<?php echo base_url('assets/js/bootstrap.min.js')?>" type="text/javascript"></script>    
        <!-- iCheck -->
        <script src="<?php echo base_url('assets/js/plugins/iCheck/icheck.min.js')?>" type="text/javascript"></script>    
        <!-- AdminLTE App -->
        <script src="<?php echo base_url('assets/js/AdminLTE/app.js')?>" type="text/javascript"></script>