//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.0;

contract SimpleStorage{
    
    uint256 storedValue;
    
    function set(uint x) public{
        storedValue = x;
    }
    
    function get() public view returns(uint256){
        return storedValue;
    }
}
