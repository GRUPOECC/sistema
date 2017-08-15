
//Codigo implementado por: Garry Jr. Bruno 
//--------------------------------------------------------------------------
//Descripcion de la funcion:
/**
  Se encarga de gestionar la manera en como se ven los listados de datos 
  en el sitio web. Esta puede verse en forma de lista o en forma de cuadriculas.

**/

//Indicador de tipo de listado activa:
//Vale 1 si esta activo el listado en modo lista 
//Vale 2 si esta activo el listado en modo cuadricula 


//Inizializo variables:
//----------------------------------------------------------
var x =0;  //Vale 0 por que es el estado inicial del listado
var y =9;  // Variable que controla la paginacion 
//Inilizo una lista por defecto:
listaporDefecto();
//----------------------------------------------------------

function cambioVista() {
      
    if (x==1){
         document.getElementById('modo-lista').style.display = "none";
         document.getElementById('modo-cuadricula').style.display = "block";
         x=2;
	} else if (x==2){
         document.getElementById('modo-lista').style.display = "block";
         document.getElementById('modo-cuadricula').style.display = "none";
         x=1;
	} 

}

function listaporDefecto(){
         document.getElementById('modo-lista').style.display = "block";
         document.getElementById('modo-cuadricula').style.display = "none";
         x=1;
         paginamiento(9);
       
}


//Funcion encargada de distribuir los resultados en paginas 
//---------------------------------------------------------------------------------
function paginamiento(pagina){
     var listado = document.getElementById("resultados"),
         contacto = listado.getElementsByTagName("p");
         for (i=0;i<contacto.length;i++){
             
         
            if (((pagina-9)<i)&&(pagina>=i)){

               contacto[i].parentNode.style.display='block';
             
             }else 
                 contacto[i].parentNode.style.display = "none";   

               
            }
            

}

function siguiente(){
   y=y+9;
   paginamiento(y);
}

function anterior(){
   if (y!=9) 
   y=y-9;
   paginamiento(y);
} 

//-----------------------------------------------------------------------------------
//Proceso encargado de la busqueda de datos el listado de Contactos: 

    var search = document.getElementById("search"),
    listado = document.getElementById("resultados"),
    contacto = listado.getElementsByTagName("p"),
    forEach = Array.prototype.forEach;

    search.addEventListener("keyup", function(e){
    var choice = this.value;
  
    forEach.call(contacto, function(f){
        if (f.innerHTML.toLowerCase().search(choice.toLowerCase()) == -1)
            f.parentNode.style.display = "none";        
        else
            f.parentNode.style.display = "block";     

    });
    
    }, false);

//------------------------------------------------------------------------------------