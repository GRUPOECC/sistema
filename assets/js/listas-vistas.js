
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
var buscar = false; // Indica si el buscador esta activo o no
var choice; // Contenido de la busqueda 
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
     y= pagina; 
     var informacion = document.getElementById("infoTabla"),
         total = 0;
     
     var listado = document.getElementById("resultados"),
         contacto = listado.getElementsByTagName("p");
         for (i=0;i<contacto.length;i++){
             
            if (((pagina-9)<i)&&(pagina>=i)){
               contacto[i].parentNode.style.display='block';          
             }else 
                 contacto[i].parentNode.style.display = "none";   
                
            }
      distrubuirResultados(informacion,total,contacto,pagina); 
 
}

//Muestra los resultados de la busqueda en grupos de 9
function paginamientoBuscador(choice,contacto,pagina){ 
      y= pagina;
      var j =1;  
       forEach.call(contacto, function(f){
        if (f.innerHTML.toLowerCase().search(choice.toLowerCase()) == -1){
            f.parentNode.style.display = "none";       
        }
        else{ 
               if (((pagina-9)<j)&&(pagina>=j)){
                 f.parentNode.style.display = "block"; 
                 j=j+1;   
               }else{
                  f.parentNode.style.display = "none"; 
                   j=j+1;  
               } 
        }  
           
       }    
      );

           
}

function distrubuirResultados(informacion,total,contacto,pagina){
      total = contacto.length;
        //Mostrando Informacion de paginas: 
         var actual = (pagina/9), totalpaginas = Math.trunc(total/9);
        informacion.innerHTML = 'Mostrando pagina ' + actual.toString() + ' de ' + totalpaginas.toString()
         + ' en ' + total.toString() + ' respuestas.';
        var q=0; //<- Variable que marca valores del 1 al 5 para la distribucion   
        //Modificando Posicion de Paginacion: 
        var posiciones = ["posicion1", "posicion2", "posicion3","posicion4","posicion5"];
        while (q<5){
            var valor = actual + q; 
            //var redireccion = (9*(valor-q))*();
            var redireccion = valor * 9;
            if (q!=0){

                if (!buscar) 
                 document.getElementById(posiciones[q]).innerHTML = '<a onclick="paginamiento('+redireccion+
                 ')" href="javascript:void(null)">'+ valor+'</a>'; 
                 else 
                 document.getElementById(posiciones[q]).innerHTML ='<a onclick="paginamientoBuscador('+choice+','+contacto +','+redireccion+
                 ')" href="javascript:void(null)">'+ valor +'</a>';  

             }else{
                if (!buscar)
                 document.getElementById(posiciones[q]).innerHTML ='<a onclick="paginamiento('+redireccion+
                 ')" href="javascript:void(null)">'+ valor +'</a>'; 
                 else 
                 document.getElementById(posiciones[q]).innerHTML ='<a onclick="paginamientoBuscador('+choice+','+contacto +','+redireccion+
                 ')" href="javascript:void(null)">'+ valor +'</a>';  

                 document.getElementById(posiciones[q]).className = "active";
             } 

            q= q +1; 
        }
}
//Pasa a la siguiente pagina
function siguiente(){
   y=y+9;

   if(!buscar)
   paginamiento(y);
   else{
      var listado = document.getElementById("resultados");
      var contactos = listado.getElementsByTagName("p");
      paginamientoBuscador(choice,contactos,y);
      var informacion = document.getElementById("infoTabla");
      console.log("El valor de y es %i",y);
      distrubuirResultados(informacion,0,contactos,y);

   }
}

//Pasa a la pagina anterior 
function anterior(){
   if (y!=9) 
   y=y-9;

   if(!buscar) 
   paginamiento(y);
   else{
      var listado = document.getElementById("resultados");
      var contactos = listado.getElementsByTagName("p");
      paginamientoBuscador(choice,contactos,y);
      var informacion = document.getElementById("infoTabla");
      distrubuirResultados(informacion,0,contactos,y);
   }
} 

//-----------------------------------------------------------------------------------
//Proceso encargado de la busqueda de datos el listado de Contactos: 

    var search = document.getElementById("search"),
    listado = document.getElementById("resultados"),
    contacto = listado.getElementsByTagName("p"),
    forEach = Array.prototype.forEach;

    search.addEventListener("keyup", function(e){
    buscar = true; 
    choice = this.value;
    y=9;
    var j=1; //<--Id de Elemento a mostrar  
    paginamientoBuscador(choice,contacto,y,j);
    var informacion = document.getElementById("infoTabla");
    distrubuirResultados(informacion,0,contacto,y);
    if (this.value=="")
    { 
        buscar = false;
        paginamiento(y);
    }

    }, false);

//------------------------------------------------------------------------------------