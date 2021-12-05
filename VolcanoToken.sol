// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

 // HW6
 
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VolcanoToken is ERC721, Ownable{
    
    uint256 mytokenId;
    
    struct VolcanoTokenStruct{
        uint timestamp;
        uint256 tokenId;
        string tokenURL;
    }
    
     mapping(address => VolcanoTokenStruct) tokenOwnership;
     address[] tokenOwnershipArray;
    
     constructor() ERC721 ("VolcanoToken", "VLT"){
     }
     
     function mintToken(address receiver) public onlyOwner{
         // Store the struct to the user’s record.
         // Call: _safeMin
        _safeMint (receiver, mytokenId);

        VolcanoTokenStruct memory newTokenData;
        newTokenData.timestamp = block.timestamp;
        newTokenData.tokenId = mytokenId;
        newTokenData.tokenURL = "My ID Test";

        //tokenOwnership[mytokenId].push(receiver);
        tokenOwnershipArray.push(receiver);
        mytokenId = mytokenId + 1; 
     }
     
     function burnToken(uint256 tokenID) public onlyOwner{
         _burn(tokenID);

         removeTokenId(tokenID);
         removeTokenFromMapping(tokenID);
     }
     
     function removeTokenId(uint256 tokenID) internal  {
        uint256 count;
        //uint256 tokenIDIndex;
         // Make an internal function that loops over the array of structs 
         // and removes the burnedtokenID. 
        count = tokenOwnershipArray.length;
        for (uint256 id=1; id < count; id++){
            // Check: How to get the token ID, or using address ? 
            // tokenIDIndex = tokenOwnershipArray[id].tokenId;  
             if (tokenID == id){
                 delete tokenOwnershipArray[id];
             }
        }
     }

    function  removeTokenFromMapping(uint256 tokenID) internal {
        // Check: How to delete from mapping with Token ID, or address? 
        delete tokenOwnershipArray[tokenID];
    }
}
