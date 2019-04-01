pragma solidity ^0.5.0;
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
//import "../contracts/Bank.sol";
import "../contracts/MyContract.sol";

contract TestFirst{
	function testNoName() public{
	MyContract myCtr = MyContract(DeployedAddresses.MyContract()); // referinta la contractul deployat
	myCtr.setName("test");
	
	AssertString.equal(myCtr.getName(), "test", "Valoarea setata este egala cu cea din test ");

	}
}