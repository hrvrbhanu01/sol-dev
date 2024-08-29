// Get funds from Users
// Withdraw funds
// Set a minimum funding value

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { PriceConverter } from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;  // all uint256 values can now call getConversionRate() from PriceConverter.sol

    uint256 public minimumUsd = 5 * 1e18;

    address [] public funders; // i want to keep track of the users who sent us money!
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable {
        require(msg.value.getConversionRate() >= minimumUsd, "didn't send enough ETH"); // 1e18 = 1 ETH = 1000000000000000000 Wei = 1 * 10 ** 18
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public {
        // for loop
        // [1, 2, 3, 4] elements
        // 0, 1, 2, 3   indexes
        //for( starting index, ending index, step amount )
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
            
        }
        //reset the funders array
        funders = new address[](0);
        // withdraw the funds :

        // 1.transfer 
        // msg.sender = address
        // payable(msg.sender) = payable address

        /* payable(msg.sender).transfer(address(this).balance); */

        // 2.send 

        /* bool sendSuccess = payable(msg.sender).send(address(this).balance);  // refer doc at : solidity-by-example.org/sending-ether
        require(sendSuccess, "Send Failed!"); */

        // 3.call

        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed!");

    }

}