// SPDX-License-Identifer: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract PeopleDatabase {
    struct Person {
        string firstName;
        string lastName;
        address personAddress;
    }
    mapping(address => Person) data;
    Person[] people;
    address admin;
    
    constructor() {
        admin = msg.sender;
    }
    
    modifier requireAdmin() {
        require(msg.sender == admin, "Must be admin.");
        _;
    }
    function addPerson(string memory firstName, string memory lastName) external {
        data[msg.sender] = Person(firstName, lastName, msg.sender);
        people.push(data[msg.sender]);
    }
    function getMyPerson() external view returns (Person memory) {
        return data[msg.sender];
    }
    function getPersonByAddress(address addr) external view requireAdmin() returns (Person memory) {
        return data[addr];
    }
    function getAllPeople() external view requireAdmin() returns(Person[] memory) {
        return people;
    }
}
