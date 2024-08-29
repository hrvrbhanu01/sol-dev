// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SafeMathTester{
    uint8 public bigNumber = 255;
    
    function add() public {
        unchecked {bigNumber = bigNumber + 1;}
    }
}
// This is called solidity safeMath , when we will hit add function the value 
// of bigNumber will reset to '0' again.