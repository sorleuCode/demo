// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

contract Message {
    address public owner;
    string public message;

    constructor() {
        owner = msg.sender;
    }

    event messageSet(address setter, string message);
    event OwnershipTransfered(address previousOwner, address newOwner);


    function setMessage(string memory _message) public {
        require((msg.sender != address(0)), "You can't set your own message");
        require(msg.sender == owner, "You are'nt the owner of this message");
        message = _message;

        
    }

    function getMessage() public view returns (string memory) {
        return message;
    }

    function transferOwnership(address _newOwner) public {
        require(msg.sender == owner, "You are't the owner");
        require(_newOwner != address(0), "You can't transfer ownership to the zero");
        owner = _newOwner;
        emit OwnershipTransfered(owner,_newOwner);

    }
}