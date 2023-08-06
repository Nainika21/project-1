//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ErrorHandlingExample {
  address public owner;
  uint256 public value;
  
  construct() {
    owner = msg.sender;
    value = 100;
  }
  
  function setvalue(uint256 newvalue) public{
    //use require()
    require(msg.sender == owner, "only owner can set the value);
    require(newvalue > value, "new value must be greater than the current value");

    value = newvalue;
  }

  function performassert(uint256 x, uint256 y) public pure returns (uint256) {
    //use assert()
    uint256 result = x + y;
    assert(result >= x);

    return result;
  }

  function triggerrevert(bool torevert) public pure returns(string memory) {
    //use revert()
    if(torevert == false) {
      revert("the transaction is intentionally reverted");
    }

    return "Transaction Successful";
  }
