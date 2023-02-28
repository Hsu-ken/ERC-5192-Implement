const testSwichType = artifacts.require("testSwichType");
contract('testSwichType', (accounts) => {

    it('first', async() => {

        const contractT = await testSwichType.deployed();
        console.log(await contractT.test1());

        console.log(await contractT.supportsInterface("0xb45a3c0e"));
    });
});