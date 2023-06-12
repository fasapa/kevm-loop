// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract L {

    uint256[] _numbers;

    function max() public view returns (uint256) {
        uint256 result = 0;
        for (uint256 i = 0; i < _numbers.length; i++) {
            if (_numbers[i] > result) result = _numbers[i];
        }
        return result;
    }
    
    function testMax() public view returns (bool) {
        uint256 maxium = max();
        bool isMax = true;
        for (uint256 i = 0; i < _numbers.length && isMax; i++) {
            isMax = maxium >= _numbers[i];
        }
        
        return isMax;
    }
}