// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    //Basic Types: boolean, uint, int, address, bytes
    //uint == uint256 
    //int == int256
    //int; could be positive or negative but uint; will always be positive
    //so the default value for : uint favoriteNumber will be 0, also for the boolean type it is false.
    //FOR MORE NOTES REFER TO THE NOTES DIARY.
    uint256 public favoriteNumber = 80;
    uint256 newFavoriteNumber; //0

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

}

