pragma solidity ^0.4.24;

interface Regulator {
    function checkValue(uint amount) external constant returns (bool);
    function loan() external constant returns (bool);
}

contract Bank is Regulator {
    uint internal count;
    
    constructor(uint newCount) public {
        count = newCount;
    }
    
    function deposit(uint amount) public {
        count += amount;
    }
    function withdraw(uint amount) public {
        if (checkValue(amount)) {
            count -= amount;
        }
    }
    
    function ballance() public constant returns (uint) {
        return count;
    }
    
    function checkValue(uint amount) public constant returns (bool) {
        return amount >= count;
    }
    function loan() public constant returns (bool) {
        return count > 0;
    }
}

contract Person is Bank(100) {
    string private name;
    uint private age;
    
    function setName(string newName) public {
        name = newName;
    }
    function getName() public constant returns (string) {
        return name;
    }
    
    function setAge(uint newAge) public {
        age = newAge;
    }
    function getAge() public constant returns (uint) {
        return age;
    }
}