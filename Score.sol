

// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Score{
    
uint score;
address owner;
uint my_sore = score_list[owner];

event NewScore(uint _newScore);

event Score_set(uint);

mapping(address => uint) score_list;

struct Funder{
    address addr;
    uint amount;
}

constructor(){
    owner = msg.sender;
}

modifier onlyOwner{
    if (msg.sender == owner){
        _;
    }
}

modifier Fee (uint fee){
    if (msg.value == fee){
        _;
    }
}
    
function getScore() public view returns (uint){
    return score;
}

function setScore(uint _newScore) public onlyOwner{
    score = _newScore;
    
    emit NewScore(score);
    emit Score_set(_newScore);
}

function getUserScore(address user) public view returns (uint){
    return score_list[user];
}

}
