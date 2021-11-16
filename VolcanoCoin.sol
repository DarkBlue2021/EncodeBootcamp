// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

 // HW5
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/access/Ownable.sol";

contract VolcanoCoin is ERC20{
    
    uint totalSupplyValue = 10000;
    address owner;
    event TotalSupplyChanged(uint);
    
    mapping (address => uint) balance;  // HW4, Q1
    
    event TransferOccured(uint, address);  // HW4, Q5
    struct Payment{  // HW4, Q6
        uint amount;
        address addr;
    }
    Payment[] public payRef;
    
    mapping (uint => Payment) payReference; // HW4, Q7
    
    constructor () ERC20("VolcanoCoin", "VOL")    {
        owner = msg.sender;
        // HW4, Q3 ?? 
        balance[owner] = totalSupplyValue;
    }
    
    modifier onlyOwner
    {
        if (msg.sender == owner){
            _;
        }
    }
    
    function getTotalSupply() public view onlyOwner returns (uint supply)
    {
        return totalSupplyValue;
    }

    function increaseTotalSupply() public onlyOwner()
    {
        totalSupplyValue = totalSupplyValue + 1000;
        emit TotalSupplyChanged (totalSupplyValue);
    }
    
    function getBalance(address user) public view returns (uint){  // HW4, Q2
        return balance[user];
    }
   
    function transferToken (uint amount, address recipient) public{
        
        // HW4, Q4 
        //   Called transfer to allow a user to transfer their tokens toanother address
        balance[recipient]  = balance[owner];
        
        // HW4, Q7
        Payment memory newRef;
        newRef.amount = amount;
        newRef.addr = recipient;
        payRef.push(newRef);
        
        // HW4, Q5 
        emit TransferOccured (amount, recipient);
    }
}
