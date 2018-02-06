pragma solidity ^0.4.17;

/**
 * SmartContract Torioux
 */
contract Votos {
    
   address owner;
   string PName1="Brian Jhonson";
   string PName2="Jose Campos";
   address Postulante1=0x2c50E3380C8D1B653cfE271139B2f1d57d1DDFa9;
   address Postulante2=0xd1dbAe00541564cd6cEEC9992e06EcBBc87605eB;
   uint8 p1=0;
   uint8 p2=0;
   
  //Eventos
   event cantidadVotantes(uint);
   event tiempo(string n1,uint p1,string n2,uint p2,address nc);
   event realisado(address);
   event votosRealizados(uint);
  
   mapping(address => Votante) votantes;
   address[] comprobados;
   

  struct Votante {
   string nombre;
   string apellidos;
   string dni;
     bool votado;
     address dir;
     uint vote;
     bool check;
  }
  

  /*** Funcion valida votante ****/
  function insertUsuario(string nom,string ape,string dni,address ad)public  {
      var i=votantes[ad];
      if(i.check==true){
          return ;
      }
      i.check=true;
      i.dir=ad;
      i.nombre=nom;
      i.apellidos=ape;
      i.dni=dni;
    realisado(ad);
  }
  
  /***funcion para validar el address si esta apto para votar****/
      function comprobar(address l) public view returns(bool,string){
        if(votantes[l].votado==true){
            return(false,"Ya as botado");
        }
        if(votantes[l].check!=true){
            return(false,"Este address no esta apto para votar");
        }
        
        return(true,"Comfirmado");
    }
   
  
      /***Info votante****/

    function viewVotante(address k)public view returns(bool,string,string,address) {
        var x=votantes[k];
        if(x.check==true){
            return(true,x.nombre, x.apellidos,x.dir);
        }
      
        
    }   
    
  
   
   function total()public view returns(string,uint,string,uint){ 
     
     return(PName1,p1,PName2,p2);
     
   }

  function getP (address key ) public view returns(string ,uint){
      
      require(key==Postulante1||key==Postulante2);
      if(key ==Postulante1){
          return("Andy Javier Reyes",p1);
      }
      else {
           return("Jose Campos",p2);
      }
  }
    



    function votar(address llave) public  {
       Votante storage  v=votantes[msg.sender];

       require(v.votado==false);
      require(v.check==true);

       require(llave==Postulante1||llave==Postulante2);
       
      if(llave ==Postulante1){
         p1=p1+1;
        
      }
      else {
           p2=p2+1;
      }
     votantes[msg.sender].votado=true;
     
      tiempo(PName1,p1,PName2,p2,msg.sender);
     
    }
      
}