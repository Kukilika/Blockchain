pragma solidity ^0.5.0;

interface MyInterface {
    function checkValue (uint amount) external returns (bool);
    function loan() external returns (bool);
}