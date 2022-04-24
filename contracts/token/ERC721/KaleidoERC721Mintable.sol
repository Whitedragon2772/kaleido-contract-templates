pragma solidity ^0.6.2;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

contract ERC721MintableBurnable is ERC721 {

    uint256 private _currentTokenId = 0;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) public {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }
    
    function mintWithTokenURI(address to, string memory tokenURI) public {
        uint256 newTokenId = _getNextTokenId();
        _mint(_to, newTokenId);
        _incrementTokenId();
        _setTokenURI(newtokenId, tokenURI);
        
    }
    
        /**
     * @dev calculates the next token ID based on value of _currentTokenId
     * @return uint256 for the next token ID
     */
    function _getNextTokenId() private view returns (uint256) {
        return _currentTokenId.add(1);
    }
    
    
    function _incrementTokenId() private {
        _currentTokenId++;
    }
    
   function _burn(uint256 tokenId) internal virtual {
        address owner = ERC721.ownerOf(tokenId);

        _beforeTokenTransfer(owner, address(0), tokenId);

        // Clear approvals
        _approve(address(0), tokenId);

        _balances[owner] -= 1;
        delete _owners[tokenId];

        emit Transfer(owner, address(0), tokenId);
    }

}
