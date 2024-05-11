// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract ReceiveAndFallback {
    mapping(uint256 => bool) booleans;

    event Received(uint256 etherAmount);
    event Fallback(uint256 etherAmount);
    event MethodIncrease(uint256 etherAmount);

    constructor() payable {}

    function consumeGas() public payable {
        emit MethodIncrease(msg.value);

        for (uint256 i; i < 15; i++) {
            booleans[i] = true;
        }
    }

    receive() external payable {
        // Se dispara cuando SOLO envio ether
        // Receive no se dispara cuando se envia calldata
        // msg.value: variable global que indica la cantidad de ether que se esta enviando
        emit Received(msg.value);
    }

    fallback() external payable {
        // cuando se envia Ether Y calldata desconocido (CODIGO)
        // cuando se envia SOLO calldata y el selector de dicho calldata
        //      no se parece a ninguno de los metodos del contrato
        emit Fallback(msg.value);
    }
}

contract Sender {
    constructor() payable {}

    /**
     * .transfer
     * - solamente tiene un presupuesto de 2300 gas (ciclos de comp) a gastar
     * - (en caso transfer falle) se revierte automaticamente (no puedes manejar el fallo)
     * - puede fallar cuando el contrato al cual se le envia ether no tiene ni receive ni fallback
     * - no se pueede efectuar el reentrancy attack
     */
    function transfer(address _scAddress, uint256 _amount) public {
        // X: el address _scAddress va a transferir la cantidad de _amount
        // O: el contrato Sender le va a enviar a _scAddress la cantidad de _amount Ether
        payable(_scAddress).transfer(_amount);
    }

    /**
     * .send
     * - solamente tiene un presupuesto de 2300 gas (ciclos de comp) a gastar
     * - puedes manejar el error y definir una logica cuando falla o es exitoso
     * - no se pueede efectuar el reentrancy attack
     */
    function send(address _scAddress, uint256 _amount) public {
        bool success = payable(_scAddress).send(_amount);
        // pudes definir una logica particular si falla o si tiene exito
        require(success, "Ha fallado el envio de Ether");
        // otras operaciones
    }

    /**
     * .call
     * - permite cofigurar el presupuesto de gas a enviar
     * - permite crear un calldata para llamar al otro contrato
     * - si se enviar calldata "" (vacio) se disparara el receive o fallback (si no hay receive)
     */
    function call(address _scAddress, uint256 _amount) public {
        // info:
        // - el error que se generó
        // - el valor de retorno si el metodo tuvo exito

        // (bool sucess , /**bytes memory info */ ) = payable(_scAddress).call{
        (bool sucess, ) = payable(_scAddress).call{gas: 500000, value: _amount}(
            ""
        );
        require(sucess, "Ha fallado el envio de Ether");
    }

    /**
     * - si construiimos un calldata de un metodo que existe, dicho metodo se disparará
     */
    function callWithMethodThatExists(
        address _scAddress,
        uint256 _amount
    ) public {
        (bool success, ) = payable(_scAddress).call{
            gas: 500000,
            value: _amount
        }(abi.encodeWithSignature("consumeGas()"));
        require(success, "Ha fallado el envio de Ether");
    }

    /**
     * - cuando construyo un calldata cuyo selector no esta definido en el contrato llamado
     *      se disparar el metodo fallback
     */
    function callWithMethodThatDoesNotExist(
        address _scAddress,
        uint256 _amount
    ) public {
        (bool sucess, ) = payable(_scAddress).call{gas: 500000, value: _amount}(
            abi.encodeWithSignature("nonExistantMethod()")
        );
        require(sucess, "Ha fallado el envio de Ether");
    }
}

// Manera forzosa de enviar Ether a un contrato
