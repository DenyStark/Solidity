pragma solidity ^0.4.25;

contract TestThrows {
    // For not payable functions
    function testAssert() public pure returns (bool) {
        assert(1 == 2);
        return true;
    }
    
    // Break by conditions and return ether value to user
    function testRequire() payable public returns (bool) {
        require(1 == 2);
        return true;
    }
    
    // Break and return ether value to user
    function testRevert() payable public returns (bool) {
        revert();
        return true;
    }
}