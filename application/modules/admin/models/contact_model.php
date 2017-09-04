<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Memento admin_model model
 *
 * This class handles admin_model management related functionality
 *
 * @package		Admin
 * @subpackage	admin_model
 * @author		propertyjar
 * @link		#
 */

class contact_model extends CI_Model 
{
	function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	
	function import_data($save)
	{
		$this->db->insert_batch('contacts', $save); 
	}
	
	function save($save,$categoria)
	{

		$this->db->insert('contacts',$save);
		$clave = $this->db->insert_id();			
        $this->saveCategory($clave,$categoria); 
	
		return $clave;
	}

    //Codigo implementado pro Garry Bruno
    // Se encarga de ditribuir los ids de las categorias en la tabla "Muchos a muchos de categoria y contacto"
    //-----------------------------------------------------------------------------------------------------------
	function saveCategory($id,$categoria){
		$this->db->where('id_contact',$id);
		$this->db->delete('rel_contact_category');
        $idcategorias = explode('"', $categoria);
        $i=0; 
		while($i<count($idcategorias)){
             if (($idcategorias[$i]!="[")&&($idcategorias[$i]!="]")&&($idcategorias[$i]!=",")){
                $savecategory['id_category'] = $idcategorias[$i];
                $savecategory['id_contact'] = $id;
                $this->db->insert('rel_contact_category',$savecategory);
             } 
            $i = $i+1; 
		}

	} 

	function saveCategoryGroup($id,$categoria){
        $idcategorias = explode('"', $categoria);
        $i=0; 
		while($i<count($idcategorias)){
             if (($idcategorias[$i]!="[")&&($idcategorias[$i]!="]")&&($idcategorias[$i]!=",")){
                $savecategory['id_category'] = $idcategorias[$i];
                $savecategory['id_contact'] = $id;
                if (($savecategory['id_contact']!=null)&&($savecategory['id_category']!=null)) {
                   $this->db->select('*');
                   $array = array('id_contact' => $id, 'id_category' => $idcategorias[$i]);
                   $this->db->where($array);
                   $query = $this->db->get('rel_contact_category');
                   $num = $query->num_rows();
                   if ($num==0) 
                   $this->db->insert('rel_contact_category',$savecategory);
                }
                else
                  {
                    return false; 
                  	break;
                  }
             } 
            $i = $i+1; 
		}
           return true;

	} 
    //-----------------------------------------------------------------------------------------------------------

	function get_all()
	{ 
		  $this->db->select('V.*,E.name empresa');
		  $this->db->from('v_contactos V');
          $this->db->order_by("name", "asc");
          $this->db->join('contacts C', 'C.id = V.id', 'LEFT');
          $this->db->join('empresas E', 'E.id = C.id_empresa', 'LEFT');
          $query = $this->db->get(); 
         return $query->result();
			
	}
	
	function get_contact_by_id($id)
	{          $this->db->select('V.*,E.name empresa,E.id idempresa');
			   $this->db->where('V.id',$id);
			   $this->db->join('contacts C', 'C.id = V.id', 'LEFT');
          $this->db->join('empresas E', 'E.id = C.id_empresa', 'LEFT');
		return $this->db->get('v_contactos V')->row();
	}
	
	function update($save,$id,$categoria)
	{
			   $this->db->where('id',$id);
		       $this->db->update('contacts',$save);
		       $this->saveCategory($id,$categoria);

	}
	
    function get_contact_categories($id)
	{
		$this->db->where('id_contact',$id);
		return $this->db->get('rel_contact_category')->result();
	}

	function get_all_contact_categories()
	{
		return $this->db->get('contact_categories')->result();
	}
	
	function delete($id)//delte contact
	{
		       $this->db->where('id_contact',$id);
		       $this->db->delete('rel_contact_category');
			   $this->db->where('id',$id);
		       $this->db->delete('contacts');

	}
}