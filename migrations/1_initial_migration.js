const Migrations = artifacts.require("ERC5192SBT");

module.exports = function(deployer) {
    deployer.deploy(Migrations, "ERC5192SBT", "SBT");

};