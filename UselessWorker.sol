pragma solidity ^0.4.10;

contract UselessWorker {
    int public successfullyExecutedIterations = 0;
    
    function doWork(int _iterations) {
        successfullyExecutedIterations = _iterations;
        for (int i = 0; i < _iterations; i++) {
            keccak256(i);
        }
    }
}