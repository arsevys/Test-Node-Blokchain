pragma solidity ^0.4.17;

/**
 * SmartContract Torioux
 */
contract Votos {
    address owner;
    string PName1="Andy Javier Reyes";
    string PName2="Jose Campos";
   address Postulante1=0x2c50E3380C8D1B653cfE271139B2f1d57d1DDFa9;
   address Postulante2=0xd1dbAe00541564cd6cEEC9992e06EcBBc87605eB;
   uint p1=0;
   uint p2=0;
	struct Votante {
     bool votado;
     address dir;
     uint vote;
	}
   struct Postulante{
    string nombre;
    uint votosacumulados;
    address dire;
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
    

    
   
		  
	function Votos () public {
	owner=msg.sender;/*
    postulantes.push(Postulante({
   	nombre:"Andy Javier Reyes",
   	votosacumulados:0,
   	dire:0x2c50E3380C8D1B653cfE271139B2f1d57d1DDFa9

   	}));
   postulantes.push(Postulante({
   	nombre:"Jose Campo",
   	votosacumulados:0,
   	dire:0xd1dbAe00541564cd6cEEC9992e06EcBBc87605eB

   	}));*/
	}

	mapping(address => Votante) votantes;
    /*address public chairperson;*/
    
    function votar(address llave) public {
       Votante storage  v=votantes[msg.sender];

       require(v.votado==false);

       require(llave != msg.sender);
       require(llave==Postulante1||llave==Postulante2);
      if(llave ==Postulante1){
         p1=p1+1;
      }
      else {
           p2=p2+1;
      }
     votantes[msg.sender].votado=true;
     
     
    }
			
}