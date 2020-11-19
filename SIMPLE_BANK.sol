pragma solidity ^0.4.0;
/* Interfaces are basically absract contracts . 
  functions can be declared in interface but the body of the 
  function cannot get implemented inside interface. They can have 
  data types like enum and structs*/
/* Visibility modes : - Public, Private, External , Internal */  


interface Regulator{
    function checkValue(uint amount) external returns (bool);  // interface lets us make few functions of Bank as public 
    function loan() external view returns (bool);
}


contract Bank is Regulator{ 
    uint internal myinternalvalue; // this cant be accessed by any other person but can get inherited and used
    uint private value;   // none can access or modify other than programmer
    address private owner;
    
    modifier ownerfun{
        assert(owner== msg.sender);
        _; // so that when you put this modifier in a function the function cant execute before checking the condition
    }
    function constuctor(uint amount) external { value=amount; owner=msg.sender;} 
    // CONSTRUCTOR
    
    
    function deposit(uint amount)  external ownerfun { value+=amount; }// DEPOSIT
    function withdraw(uint amount) external ownerfun {  if( checkValue(amount) ){   value-=amount; } } // WITHDRAW
    
    function balance() public view returns(uint) { return value; }
    
    function loan() external view returns(bool){  if(value > 50) {return true;  } }
    
    function checkValue(uint amount) public constant returns (bool) { if( amount <= value) return true; }
    
 
}    
    
    


contract MyfirstContract is Bank{          // contract have properties same as classes and structures in C and other languages
    string private  name;     // string variable declaration , access specified private so that only the one programming can make ammends as any variable declared exists on blockchain itself
    uint private age;   // uint is used  for unsigned integer
    
    function setName(string memory newName) public {   //function is reserve word used to declare a function , here data type and parameter is also provided in simple brackets
        name=newName;
    }
    function getName() public view returns (string) {  // here the returns(data type of return value ) is syntax 
        return name;
    }
    
    function getAge() public view returns(uint) {
        return age;
    }
    
    function setAge(uint newAge) external  {
        age= newAge;
    }
    
    
}