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
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    //function withdraw() public {}

}