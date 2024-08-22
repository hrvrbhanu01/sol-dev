// Get funds from Users
// Withdraw funds
// Set a minimum funding value

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol"; // this is for us getting ABI value.

contract FundMe {

    uint256 minimumUsd = 5;

    function fund() public payable {
        // allow users to send $
        // Have a minimum $ sent
        // 1. How do we send ETH to this contract?
        require(msg.value >= minimumUsd, "didn't send enough ETH"); // 1e18 = 1 ETH = 1000000000000000000 Wei = 1 * 10 ** 18
    }

    //function withdraw() public {}

    function getPrice() public view returns (uint256) {
        // Address  0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,) = priceFeed.latestRoundData();
        // Price of ETH in terms of USD
        // 200.00000000
        return uint256(price * 1e10);
        
    }
    function getConversionRate() public {}

    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}