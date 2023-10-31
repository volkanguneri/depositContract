// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.20;

contract Deposit {
    mapping (address => uint) balances;

    event depotConforme(address _address, uint _amount);
    event appelNonConforme(address _address);

    fallback() payable external {
        emit appelNonConforme(msg.sender);
    }

    receive() payable external {
        emit depotConforme(msg.sender, msg.value);
    }

    function deposit() payable public {
    balances[msg.sender] += msg.value;
    emit depotConforme(msg.sender, msg.value);
}

}
