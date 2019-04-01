var Bank = artifacts.require("./Bank");
var MyContract = artifacts.require("./MyContract");
// var MyTest = artifacts.require("../tes/TestFirst");
// var MyTest = artifacts.require("TestFirst");
module.exports = function(deployer) {
  deployer.deploy(MyContract).then
  ( DeployedContract => {
	  return deployer.deploy(Bank, DeployedContract.address);
	  }
  )
};
// link intre Bank si MyContract