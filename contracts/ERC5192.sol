// SPDX-License-Identifier: MIT
pragma solidity <=9.0.0;
import "./IERC5192.sol";
import "@openzeppelin/contracts/utils/introspection/IERC165.sol";
contract ERC5192 is IERC5192,IERC165 {
  bool lock = true;
  function supportsInterface(bytes4 interfaceId) external pure returns (bool){
     return (interfaceId == type(IERC165).interfaceId || interfaceId == type(IERC5192).interfaceId);
  }
  function locked(uint256 tokenId) external view  returns (bool){
    tokenId == tokenId;
    return lock;
  }
}