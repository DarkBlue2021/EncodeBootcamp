// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

 // HW6
 
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VolcanoToken is ERC721, Ownable{
    
    uint256 tokenId;
    
    struct VolcanoTokenStruct{
        uint timestamp;
        uint256 tokenId;
        string tokenURL;
    }
    
     mapping(address => VolcanoTokenStruct[]) public tokenOwnership;
    
     constructor() ERC721 ("VolcanoToken", "VLT"){}
     
     function mintToken() public view{
         //VolcanoTokenStruct memory newTokenData = VolcanoTokenStruct()
         // Use block.timestamp for timestamp and any string for the tokenURI.
         // Store the struct to the user’s record.
         // Call: _safeMin
     }
     
     function burnToken(string memory tokenID) public view onlyOwner{
         
         // Call: _burn
         // removeTokenId
     }
     
     function removeTokenId(string memory tokenID) public {
         // Make an internal function that loops over the array of structs 
         // and removes the burnedtokenID. Call the function inside your burn function.
     }
     
    function  removeTokenFromMapping(string memory tokenID) public {
        
         // We need to remove the token from the mapping. 
         // Make an function that deletes thetoken from the mapping. 
        // You can make this an internal function, which can then becalled within the burn function
    }
}
