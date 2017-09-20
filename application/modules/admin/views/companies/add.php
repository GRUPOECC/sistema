<!-- Content Header (Page header) -->
<style>
.row{
	margin-bottom:10px;
}
</style>
 <!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        <?php echo lang('companies');?>
        <small><?php echo lang('add');?></small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url('admin')?>"><i class="fa fa-dashboard"></i> <?php echo lang('dashboard');?></a></li>
        <li><a href="<?php echo site_url('admin/companies')?>"><?php echo lang('companies');?></a></li>
        <li class="active"><?php echo lang('add');?></li>
    </ol>
</section>

<section class="content">
    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header">
                    <h3 class="box-title"><?php echo lang('add');?></h3>
                </div><!-- /.box-header -->
                <!-- form start -->
				<h3 style="color:#FF0000"><?php echo validation_errors(); ?></h3>
				<?php echo form_open_multipart('admin/companies/add/'); ?>
                    <div class="box-body">
                         <div>
                             (*) Campo Obligatorio 
                             </br>
                             </br>
                         </div>

                        <div class="form-group">
                        	<div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"> <?php echo lang('name');?> (*)</label>
									<input type="text" name="name" value="" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"> <?php echo lang('rif');?> (*)</label>
                                    <input type="text" name="rif" value="" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"> <?php echo lang('code');?> (*)</label>
                                    <input type="text" name="codigo" value="" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"> <?php echo lang('reason');?> (*)</label>
                                    <input type="text" name="razon" value="" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"> <?php echo lang('address');?> (*)</label>
                                    <textarea type="text" name="direccion" value="" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"> <?php echo lang('phone');?> (*)</label>
                                    <input type="text" name="telefono" value="" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"> <?php echo lang('extension');?> (*)</label>
                                    <input type="text" name="extension" value="" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"><?php echo lang('type');?>  (*)</label>
                                    <select name="tipo" class="form-control">                                     
                                         <?php 
                                            foreach($types as $new) {
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
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"><?php echo lang('status');?>  (*)</label>
                                    <select name="status" class="form-control">                                    
                                        <option value="1">Activo</option>
                                        <option value="0">Inactivo</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-4">
                                    <label for="name" style="clear:both;"><?php echo lang('subcompany');?></label>
                                    <select name="padre" class="form-control chzn">
                                    <option value="0">--<?php echo lang('none');?>---</option>
                                        <?php foreach($companies as $new) {
                                            $sel = "";
                                            echo '<option value="'.$new->id.'" '.$sel.'>'.$new->name.'</option>';
                                        }
                                        
                                        ?>
                                    </select>
                                </div>
                            </div>
                        </div>

                    </div><!-- /.box-body -->
    
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary"><?php echo lang('save');?></button>
                    </div>
             <?php form_close()?>
            </div><!-- /.box -->
        </div>
     </div>
</section>  

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
            $(wrapper).append('<div class="row"><div class="col-md-4"><input type="text" name="designations[]" value="" class="form-control" placeholder="<?php echo lang('designations');?>"></div><a href="#" class="remove_field btn btn-danger" >Remove</a></div></div>'); //add input box
			$('.chzn').chosen({search_contains:true});
        }
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
});



</script>