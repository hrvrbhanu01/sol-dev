// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    //Basic Types: boolean, uint, int, address, bytes
    //uint == uint256
    //int == int256
    //int; could be positive or negative but uint; will always be positive
    //so the default value for : uint favoriteNumber will be 0, also for the boolean type it is false.
    //FOR MORE NOTES REFER TO THE NOTES DIARY.
    uint256 myFavoriteNumber; //0

    //uint256[] listOfFavoriteNumbers;
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople; //[]  empty list

    // bhanu -> 23
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
        retrieve(); //view functions don't cost any gas fees until unless you are not using them within some
        //function which is a gas costing function ; like this one here: store()
    }

    //view, pure functions:
    //view: just reads from the blockchain
    //pure: writes as well onto the blockchain
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    //calldata, memory, storages
    //calldata and memory are used for temporarily store the data for a short time period!
    //calldata are temporary variables cannot be modified , memory are temporary variables which can be verified
    //storage are permanent variables that can be modified.
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name)); //that's how we push objects in an array.
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

contract SimpleStorage2 {}

contract SimpleStorage3 {}
