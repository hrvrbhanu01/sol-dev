// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {SimpleStorage} from "../contracts/SimpleStorage.sol";

// we can have our AddFiveStorage contract inherit all of the functionalities of SimpleStorge contract.
contract AddFiveStorage is SimpleStorage{
    // +5
    //override
    // virtual override
    function store(uint256 _newNumber) public override{ // you need to declare this function as virtual or override
        myFavoriteNumber = _newNumber + 5;
    }
}