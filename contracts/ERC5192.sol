// SPDX-License-Identifier: MIT
pragma solidity <=9.0.0;
import "./IERC5192.sol";

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ERC5192 is ERC721, IERC5192 {
    mapping(uint256 => bool) private tokenIdLock;

    constructor(string memory name_, string memory symbol_)
        ERC721(name_, symbol_)
    {}

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC721)
        returns (bool)
    {
        return (interfaceId == type(IERC5192).interfaceId ||
            
            super.supportsInterface(interfaceId));
    }

    function setTokenIdLock(uint256 tokenId, bool lock)
        internal
        virtual
        returns (bool)
    {
        if (lock) emit Locked(tokenId);
        tokenIdLock[tokenId] = lock;
        return tokenIdLock[tokenId] = lock;
    }

    function locked(uint256 tokenId) external view returns (bool) {
        return tokenIdLock[tokenId];
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
        require(!tokenIdLock[tokenId], "Locked");
        super.transferFrom(from, to, tokenId);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual override {
       require(!tokenIdLock[tokenId], "Locked");
      super.safeTransferFrom(from, to, tokenId);
    }
     function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) public virtual override {
       require(!tokenIdLock[tokenId], "Locked");
       super.safeTransferFrom(from, to, tokenId,data);
    }
}
