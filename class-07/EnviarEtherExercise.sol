// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract ReceiveAndFallback {
    event Received();
    event Fallback();
    event Method();

    constructor() payable {}

    // enviar 1 wei
    function methodExists() public payable {
        emit Method();
    }

    receive() external payable {
        emit Received();
    }

    fallback() external payable {
        emit Fallback();
    }
}

contract Sender {
    constructor() payable {}

    function llamarMetodoExiste(address _scAddress) public {
        // payable(_scAddress).transfer(_amount);
        // bool success = payable(_scAddress).send(_amount);
        (bool success, ) = payable(_scAddress).call{value: 1}(
            abi.encodeWithSignature("methodExists()")
        );
        require(success);
    }

    function llamarReceive(address _scAddress) public {
        payable(_scAddress).transfer(1);
        // bool success = payable(_scAddress).send(1);
        // require(success);
    }

    function llamarFallback(address _scAddress) public {
        (bool success, ) = payable(_scAddress).call{value: 1}(
            abi.encodeWithSignature("methodQueNoExiste()")
        );
        require(success);
    }
}
