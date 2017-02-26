var ConvertLib = artifacts.require("./ConvertLib.sol");
var Blockbudget = artifacts.require("./Blockbudget.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, Blockbudget);
  deployer.deploy(Blockbudget);
};
