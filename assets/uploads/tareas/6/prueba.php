  <!-- Proceso de eliminacion de varios Contactos -->
  <?php

     if (isset($_POST["contact_check"])){
        $delete = $_POST["contact_check"]; 
        $cantidad = count($delete); 
         for ($i=0; $i<$cantidad; $i++) {  
         $del_id = $delete[$i];       
         new contact_model()->delete($del_id);   
       } 
   }

?>