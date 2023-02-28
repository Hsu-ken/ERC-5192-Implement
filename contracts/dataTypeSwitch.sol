// SPDX-License-Identifier: MIT
pragma solidity <=9.0.0;
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "./ERC5192.sol";
contract testSwichType is ERC5192 {
  

  function test1() pure public returns(bytes4){
    return (bytes4(keccak256('supportsInterface(bytes4)')));
  }
  
}