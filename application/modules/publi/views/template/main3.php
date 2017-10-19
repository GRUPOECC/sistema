<html>
    <head>
        <meta charset="utf-8" /> 
        <title><?php echo $setting->name;?></title>
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
 
	
    </head>
    <body>
<?php
	$this->load->view($body);
?>
        <!-- jQuery UI 1.10.3 -->
        <script src="<?php echo base_url('assets/js/jquery-ui-1.10.3.min.js')?>" type="text/javascript"></script>
		 <script src="<?php echo base_url('assets/js/jquery.pickmeup.min.js')?>" type="text/javascript"></script>
        <!-- Bootstrap -->
		
        <script src="<?php echo base_url('assets/js/bootstrap.min.js')?>" type="text/javascript"></script>
        
        <!-- iCheck -->
        <script src="<?php echo base_url('assets/js/plugins/iCheck/icheck.min.js')?>" type="text/javascript"></script>
        
        <!-- AdminLTE App -->
        <script src="<?php echo base_url('assets/js/AdminLTE/app.js')?>" type="text/javascript"></script>
		 
    </body>
</html>