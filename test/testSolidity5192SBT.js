const ERC5192SBT = artifacts.require("ERC5192SBT");
contract('ERC5192SBT', (accounts) => {

    it('first', async() => {

        const contractSBT = await ERC5192SBT.deployed();

        await contractSBT.mint(true, { from: accounts[1] });
        await contractSBT.mint(false, { from: accounts[2] });
        console.log(await contractSBT.supportsInterface("0xb45a3c0e")); //true
        console.log(await contractSBT.locked(1)); //true
        console.log(await contractSBT.locked(2)); //false
        console.log(await contractSBT.locked(3)); //false


        await contractSBT.safeTransferFrom(accounts[2], accounts[3], 2, { from: accounts[2] }); //success
        await contractSBT.safeTransferFrom(accounts[1], accounts[3], 1, { from: accounts[1] }); //error Locked

    });
});