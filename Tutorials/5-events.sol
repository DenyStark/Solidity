pragma solidity ^0.4.25;

contract Test {
    event NewPayment(uint value);
    event NewPayer(address payer);
    
    function () public payable {
        emit NewPayment(msg.value);
        emit NewPayer(msg.sender);
    }
}