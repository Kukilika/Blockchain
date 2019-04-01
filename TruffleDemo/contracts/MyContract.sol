pragma solidity ^0.5.0;

import "./Bank.sol"; 

contract MyContract is Bank(10){
    string private name;
    uint private age;
    
    function setName (string memory newName) public{
    name = newName;
    }
    
    function getName() public view returns (string memory)  {
    return name;
    }
    
    function setAge (uint newAge) public{
        age = newAge;
    }
    
    function getAge() public view returns (uint) {
        return age;
    }
    
}