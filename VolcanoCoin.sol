// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract VolcanoCoin{
    
    uint totalSupply = 10000;
    address owner;
    event TotalSupplyChanged(uint);
    
    mapping (address => uint) balance;  // HW4, Q1
    
    event TransferOccured(uint, address);  // HW4, Q5
    
    struct Payment{  // HW4, Q6
        uint amout;
        address addr;
    }
    
    mapping (uint => Payment) payReference; // HW4, Q7
    
    constructor()
    {
        owner = msg.sender;
        // HW4, Q3 ?? 
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
    
    function getBalance(address user) public view returns (uint){  // HW4, Q2
        return balance[user];
    }
   
    function transferToken (uint amount, address recipient) public{
        
        // HW4, Q4 
        //   Called transfer to allow a user to transfer their tokens toanother address
        // HW4, Q5 
        emit TransferOccured (amount, recipient);
    }
}
