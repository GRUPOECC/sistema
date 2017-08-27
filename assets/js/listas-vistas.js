
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
var tamano = 9; //Controla la cantidad de elementos a mostrar en pantalla 
var y = parseInt(tamano);  // Variable que controla la paginacion 
var buscar = false; // Indica si el buscador esta activo o no
var choice =""; // Contenido de la busqueda 
var distribucion = false; //Maneja la distribucion en el buscador
var cantidad =0; // Manja la cantidad de elementos por pagina 
var valoranterior =0; //Almacena el valor de la pagina anterior 
var valoranteriortotal =0; //Almacena el valor de la pagina anterior 
var valoranteriorrango =0; //Almacena el valor de la pagina anterior 
var mensajeinicial  =  document.getElementById("infoTabla").innerHTML;

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

function vistaLista(){
  document.getElementById('modo-lista').style.display = "block";
         document.getElementById('modo-cuadricula').style.display = "none";
         x=1;

}

function vistaCuadricula(){
         document.getElementById('modo-lista').style.display = "none";
         document.getElementById('modo-cuadricula').style.display = "block";
         x=2;
}

function cambiomuestra(){
   x =0;  //Vale 0 por que es el estado inicial del listado
   tamano = document.getElementById("mostrarregistros").value; //Controla la cantidad de elementos a mostrar en pantalla 
   y = parseInt(tamano);  // Variable que controla la paginacion 
   choice =""; // Contenido de la busqueda 
   distribucion = false; //Maneja la distribucion en el buscador
   cantidad =0; // Manja la cantidad de elementos por pagina 
   valoranterior =0; //Almacena el valor de la pagina anterior 
   valoranteriortotal =0; //Almacena el valor de la pagina anterior 
   valoranteriorrango =0; //Almacena el valor de la pagina anterior 
   var informacion = document.getElementById("infoTabla");
   informacion.innerHTML= mensajeinicial;
   //Inilizo una lista por defecto:
    x=2;
    if(!buscar)
    paginamiento(parseInt(tamano));
    else {
       document.getElementById("search").click();
    }

}

function listaporDefecto(){
         x=1;
         paginamiento(parseInt(tamano));
       
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
             
            if (((pagina-parseInt(tamano))<i)&&(pagina>=i)){
               contacto[i].parentNode.style.display='block';          
             }else 
                 contacto[i].parentNode.style.display = "none";   
                
            }
      distrubuirResultados(informacion,total,contacto,pagina); 
 
}

//Funcion para calcular el total de resultados en una busqueda parcial 
function totalRegistrosEncontrados(){
  var resultado = 0; 

      var listado = document.getElementById("resultados"),
      contacto = listado.getElementsByTagName("p"); 

       forEach.call(contacto, function(f){
        if (f.innerHTML.toLowerCase().search(choice.toLowerCase()) == -1){
             
        }
        else{ 
             resultado = resultado + 1;   
        }             
       }    
      );
   return Math.trunc(resultado/parseInt(tamano)); 
} 

function totalElementosEcontrados(){
  var resultado = 0; 

      var listado = document.getElementById("resultados"),
      contacto = listado.getElementsByTagName("p"); 

       forEach.call(contacto, function(f){
        if (f.innerHTML.toLowerCase().search(choice.toLowerCase()) == -1){
             
        }
        else{ 
             resultado = resultado + 1;   
        }             
       }    
      );
   return Math.trunc(resultado);

}
//Funcion para calcular el total de resultado en general 
function totalRegistroGeneral(){

var listado = document.getElementById("resultados"),
         contacto = listado.getElementsByTagName("p");
   return  Math.trunc(contacto.length/parseInt(tamano));         
} 

function totalElementosGeneral(){

var listado = document.getElementById("resultados"),
         contacto = listado.getElementsByTagName("p");
   return  Math.trunc(contacto.length);         
} 

//Muestra los resultados de la busqueda en grupos de 9
function paginamientoBuscador(pagina){ 
      y= pagina;
      var j =1;  
      var listado = document.getElementById("resultados"),
      contacto = listado.getElementsByTagName("p"); 
      cantidad = 0;
       forEach.call(contacto, function(f){
        if (f.innerHTML.toLowerCase().search(choice.toLowerCase()) == -1){
            f.parentNode.style.display = "none";       
        }
        else{ 
               if (((pagina-parseInt(tamano))<j)&&(pagina>=j)){
                 f.parentNode.style.display = "block"; 
                 cantidad = cantidad + 1; 
                 j=j+1;   
               }else{
                  f.parentNode.style.display = "none"; 
                   j=j+1;  
               } 
        }  
           
       }    
      );
         if (distribucion){
             var informacion = document.getElementById("infoTabla");
             distrubuirResultados(informacion,0,contacto,pagina);
         }         
}

function distrubuirResultados(informacion,total,contacto,pagina){
      total = contacto.length;
        //Mostrando Informacion de paginas: 
        var totalpaginas;
        if(!buscar)
          totalpaginas = totalRegistroGeneral();
         else 
            totalpaginas = totalRegistrosEncontrados();


         var actual = (pagina/parseInt(tamano));
         var dataInfo = informacion.innerHTML;
         var act = actual.toString(), pag = totalpaginas.toString();
         var  tlt = "0";
         if (!buscar)
          tlt = totalElementosGeneral().toString(); 
          else 
          tlt = totalElementosEcontrados().toString(); 
             
         var elementoinicial = pagina + 1 - parseInt(tamano); 
         var numact = (elementoinicial).toString(); 
         if ((totalpaginas>=1)) 
         var pagact = (elementoinicial-1 + parseInt(tamano)).toString();
         else
          var pagact = (totalElementosEcontrados()).toString(); 

         if (informacion.innerHTML.includes("FF")) 
           informacion.innerHTML = dataInfo.replace("FF",numact).replace("QQ",pagact).replace("RR",tlt);
         else 
         {
           informacion.innerHTML = dataInfo.replace(valoranterior.toString(),numact).replace(valoranteriorrango.toString(),pagact).replace(valoranteriortotal.toString(),tlt);
         } 
        //Actualizo el valor
        valoranterior = numact; 
        valoranteriorrango = pagact;
        valoranteriortotal = tlt;
        var q=0; //<- Variable que marca valores del 1 al 5 para la distribucion   
        //Modificando Posicion de Paginacion: 
        var posiciones = ["posicion1", "posicion2", "posicion3","posicion4","posicion5"];
        while (q<5){
            var valor = actual + q; 
            //var redireccion = (9*(valor-q))*();
            var redireccion = valor * parseInt(tamano);
               if (!buscar){ 
                    if (valor<=totalRegistroGeneral()+1){ 
                     document.getElementById(posiciones[q]).innerHTML = '<a onclick="paginamiento('+redireccion+
                     ')" href="javascript:void(null)">'+ valor+'</a>'; 
                     document.getElementById(posiciones[q]).style.display = 'inline';
                     document.getElementById("linksiguiente").style.display = 'inline';
                     document.getElementById("siguiente").className = "next";
                     document.getElementById("linksiguiente2").style.display = 'none';
                     }else {
                      document.getElementById(posiciones[q]).style.display = 'none';
                      document.getElementById("linksiguiente").style.display = 'none'; 
                      document.getElementById("siguiente").className = "next disabled";
                      document.getElementById("linksiguiente2").style.display = 'inline';
                      }
                     

                 }else {
                  if (valor<=totalRegistrosEncontrados()+1){ 
                      document.getElementById(posiciones[q]).innerHTML ='<a onclick="paginamientoBuscador('+redireccion+
                      ')" href="javascript:void(null)">'+ valor +'</a>';  
                      document.getElementById(posiciones[q]).style.display = 'inline';
                      document.getElementById("linksiguiente").style.display = 'inline';
                      document.getElementById("siguiente").className = "next";
                      document.getElementById("linksiguiente2").style.display = 'none';
                      }else{
                     document.getElementById(posiciones[q]).style.display = 'none';   
                     document.getElementById("linksiguiente").style.display = 'none'; 
                     document.getElementById("siguiente").className = "next disabled";
                     document.getElementById("linksiguiente2").style.display = 'inline';
                     }
                    
                 }

            if (q==0){
                 document.getElementById(posiciones[q]).className = "active";
             } 

            q= q +1; 
        }
}
//Pasa a la siguiente pagina
function siguiente(){
   y=y+parseInt(tamano);
   if(!buscar)
   paginamiento(y);
   else{
      paginamientoBuscador(y);
      var informacion = document.getElementById("infoTabla");
      console.log("El valor de y es %i",y);
      distrubuirResultados(informacion,0,contactos,y);

   }
}

//Pasa a la pagina anterior 
function anterior(){
   if (y!=parseInt(tamano))
   y=y-parseInt(tamano);

   if(!buscar) 
   paginamiento(y);
   else{
      paginamientoBuscador(y);
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
     var cajabuscador = document.getElementById('searchLabel');
     var buscador1 = cajabuscador.getElementsByTagName('input');
     buscador1[0].value = this.value; 
     buscador1[0].click();


    y=parseInt(tamano);
    buscar = true; 
    distribucion = true; 
    choice = this.value;
    var j=1; //<--Id de Elemento a mostrar  
    paginamientoBuscador(y);
    if (this.value=="")
    { 
        buscar = false;
        distribucion = false;
        paginamiento(y);
    }

    }, false);

    search.addEventListener("click", function(){
    var cajabuscador = document.getElementById('searchLabel');
     var buscador1 = cajabuscador.getElementsByTagName('input');
     this.value = buscador1[0].value; 
     buscador1[0].click();
    y=parseInt(tamano);
    buscar = true; 
    distribucion = true; 
    choice = this.value;
    var j=1; //<--Id de Elemento a mostrar  
    paginamientoBuscador(y);
    if (this.value=="")
    { 
        buscar = false;
        distribucion = false;
        paginamiento(y);
    }
    });

//------------------------------------------------------------------------------------



