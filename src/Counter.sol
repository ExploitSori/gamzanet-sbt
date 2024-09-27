// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
contract SBT is ERC721 {
    mapping(uint256 tokenId => string) private proofs;
    uint256 idx;
    address owner;
    modifier chkAdmin{
        require(msg.sender == owner);
        _;
    }
    modifier undefine{
        revert("function_undefined");
    }
    constructor(string memory name, string memory symbol) ERC721(name, symbol) {
        idx = 0;
        owner = msg.sender;
    }
    function mint(address to, uint256 tokenId) external chkAdmin {
        _safeMint(to, tokenId);
    }
    function safeTransferFrom(address from,address to,uint256 tokenId) override public undefine{

    }
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) override public undefine {

    }
    function transferFrom(address from, address to, uint256 tokenId) override public undefine{

    }
    function approve(address to, uint256 tokenId)override public undefine() {
        
    }
    function setApprovalForAll(address operator, bool approved) override public undefine {
        
    }
}
