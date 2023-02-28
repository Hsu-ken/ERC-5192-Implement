const Migrations = artifacts.require("testSwichType");

module.exports = function(deployer) {
    deployer.deploy(Migrations);

};