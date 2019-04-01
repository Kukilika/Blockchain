pragma solidity ^0.5.0;

import "./MyInterface.sol";  

contract Bank is MyInterface{
    //uint internal myInternalValue;//acces din ContractulMeu, dar nu din exterior
    uint private value;
    address private owner; // owner of the contract
    
    event SenderLogger(address); //logging
    event ValueLogger(uint);  //logging
    
    constructor(uint amount) public{
        value = amount;
        owner = msg.sender;
    }
    
    modifier ownerFunc{//
        require (owner == msg.sender); // doar daca este proprietarul 
        _; //executarea functiei
    }
    
    modifier validValue {
        assert(msg.value >= 1); //nr de wei trimisi cu mesajul
        _;
    }
    
    function () external payable ownerFunc validValue{
        emit SenderLogger(msg.sender); //invocare eveniment
        emit ValueLogger(msg.value);
    }
    
    function deposit (uint amount) public ownerFunc {
        value += amount;
    }
    
    
    function balance() public view returns (uint){
        return value;
    }
    
    function checkValue (uint amount) public returns (bool){
        //require(amount > 0);
        return value >= amount;
    }
    
    function loan() public returns (bool){
        return value > 0 ;
    }
    
    function withdraw (uint amount) public ownerFunc{
        if (checkValue(amount)) {
            value -= amount;
        }
    }
}