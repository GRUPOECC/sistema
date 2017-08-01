<?php

header('Content-Type: "text/csv"');
header('Content-Disposition: attachment; filename="'.lang('contacts').'.csv"');
header('Expires: 0');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
header("Content-Transfer-Encoding: binary");
header('Pragma: public');

?>
<?php echo lang('serial_number');?>;<?php echo lang('name');?>;<?php echo lang('email');?>;<?php echo lang('phone');?>;<?php echo lang('phone');?>;<?php echo lang('phone');?>;<?php echo lang('phone');?>;<?php echo lang('category');?>;<?php echo lang('contact_company');?>;<?php echo lang('department');?>;<?php echo lang('address');?>,
							<?php $i=1;
								
							foreach ($contacts as $new)
							{
							?>
									<?php echo $i .";"?>
									<?php echo $new->name .";"?>
									<?php echo $new->email .";"?>
									<?php echo $new->phone1 .";"?>
									<?php echo $new->phone2 .";"?>
									<?php echo $new->phone3 .";"?>
									<?php echo $new->phone4 .";"?>
									<?php echo $new->category .";"?>
									<?php echo $new->company .";"?>
									<?php echo $new->department .";"?>
									<?php echo $new->address .";"?>
									<?php echo ",\n";?>
                                <?php $i++;}?>