// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract EnviarEther {
    constructor() payable {}

    function enviarEther(address _destinatario) public {
        // ¿Cómo obtener el balance de token nativo del contrato?
        // address(this): address del contrato
        // address(this).balance: balance de Ether del contrato
        uint256 cantidadEther = address(this).balance;

        // El address _destinario va a recibir 'cantidadEther' del contrato inteligente
        payable(_destinatario).transfer(cantidadEther);
    }

    // Si solamente se envia Ether, receive se dispara
    receive() external payable {}

    // Si se envia Ether y codigo, fallback se dispara
    // Si codigo, fallback se dispara
    // la manera antigua (y confusa)
    fallback() external payable {
        // 0x0331f5d60000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4
        // ejecutar codigo
    }
}
