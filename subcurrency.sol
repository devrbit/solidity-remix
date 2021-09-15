//SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.8.0;

contract Coin{
    
    address public minter;
    mapping(address => uint) public balances;
    
    event Sent(address from, address to, uint amount);
    
    //called only oncec when contract is created
    constructor(){
       minter = msg.sender;
    }
    
    //mint coins into address
    function mint(address receiver, uint amount) public{
        
        require(msg.sender == minter);
        balances[receiver] += amount;
    }
    
    error InsufficientBalance(uint requested, uint available);
    
    //send coins to any address, call error if insufficient balance
    function send(address receiver, uint amount) public{
        if(amount > balances[msg.sender])
                revert InsufficientBalance({
                    requested: amount,
                    available: balances[msg.sender]
                });
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
    
}
