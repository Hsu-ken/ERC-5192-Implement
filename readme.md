# ERC5192 Implementation

from : https://eips.ethereum.org/EIPS/eip-5192

ERC-5192 is about a minimal SBT interface.
This implementation is based on Truffle, so you can use the Truffle flow.

```js
truffle compile
truffle devlop
truffle test
```
## Install
```js
git clone https://github.com/Hsu-ken/ERC-5192-Implement.git
```
```js
npm install
```
## Uasge
For example, when the contract mints an NFT, you can choose to lock it or not.

```solidity
contract ERC5192SBT is ERC5192 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    uint256 public totalSupply = 3333;

    constructor(string memory _name, string memory _symbol)
        ERC5192(_name, _symbol)
    {}

    function mint(bool lock) public {
        _tokenIds.increment();
        uint256 tokenId = _tokenIds.current();
        require(tokenId <= totalSupply, "NFT Supply Full");
        _mint(msg.sender, tokenId);
        setTokenIdLock(tokenId, lock);
    }
}
}
```
## Truffle Test
This implementation complies with the ERC-5192 interface.
```js
supportsInterface(bytes4 interfaceID) external view returns (bool) //true
with interfaceID=0xb45a3c0e
```
test case about locked().
```solidity
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
```