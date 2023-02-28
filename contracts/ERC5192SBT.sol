// SPDX-License-Identifier: MIT
pragma solidity <=9.0.0;
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./ERC5192.sol";
contract ERC5192SBT is ERC5192 {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
  uint256 public totalSupply = 3333;

  constructor(string memory _name,string memory _symbol) ERC5192(_name,_symbol){

  }
  function test1() pure public returns(bytes4){
    return (bytes4(keccak256('supportsInterface(bytes4)')));
  }
   function mint(bool lock) public{
    
    _tokenIds.increment();
    uint256 tokenId=_tokenIds.current();
    require(tokenId <= totalSupply, "NFT Supply Full");
    _mint(msg.sender, tokenId);
    setTokenIdLock(tokenId,lock);
    
  }
}