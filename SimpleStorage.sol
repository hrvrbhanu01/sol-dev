// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract testSimpleStorage {
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

    //Person public pat = Person({favoriteNumber: 7, name: "pat"});

    function store(uint256 _favoriteNumber) public {
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

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        //Person memory newPerson = Person(_favoriteNumber, _name);
        listOfPeople.push(Person(_favoriteNumber, _name));
    }
}
