pragma solidity ^0.4.25;

import './4-library.sol';

contract TestLibrary {
    using UintMath for uint;
    
    function testIncrement (uint _value) public pure returns (uint) {
        return _value.increment();
    }
    
    function testDecrement (uint _value) public pure returns (uint) {
        return UintMath.decrement(_value);
    }
}
