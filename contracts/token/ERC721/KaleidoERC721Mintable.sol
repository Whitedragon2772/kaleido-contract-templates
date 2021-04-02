pragma solidity ^0.6.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract ERC721Mintable is ERC721, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(string memory name, string memory symbol) ERC721(name, symbol) public {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }

    function mint(address to, uint256 tokenId) public {
        _mint(to, tokenId);
    }

    function mintWithTokenURI(address to, uint256 tokenId, string memory tokenURI) public {
        mint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
    }
}
