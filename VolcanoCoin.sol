// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract VolcanoCoin{
    
    uint totalSupply = 10000;
    address owner;
    event TotalSupplyChanged(uint);
    
    constructor()
    {
        owner = msg.sender;
    }
    
    modifier onlyOwner
    {
        if (msg.sender == owner){
            _;
        }
    }
    
    function getTotalSupply() public view onlyOwner returns (uint supply)
    {
        return totalSupply;
    }

    function increaseTotalSupply() public onlyOwner()
    {
        totalSupply = totalSupply + 1000;
        emit TotalSupplyChanged (totalSupply);
    }
    
}
