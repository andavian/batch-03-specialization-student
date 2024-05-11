// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Constructor2 {
    /**
        Constructor:
        - Es un método especial que se dispara solo
        - Métod se dispara una sola vez durante la vide del contrato
        - Versiones anteriores a 0.4.22: function Contract() {}
        - Se utiliza para inicializar variables
        - También se puede inyectar valores de afuera del contrato inteligente
        - Todo el código del constructor pertence al init-code (no es parte del run-time code)
        - Desde el constructor también se puede llamar métodos del contrato
        - El constructor utiliza el OPCODE JUMP para ejectuar metodos del contrato
        - El constructor no se utiliza en un patrón Proxy
        - Dentro del constructor podemos capturar a la persona que publica el contrato (msg.sender)
        - Si hay muchas operaciones dentro del constructor ello incrementará el costo de publicación del contrato
    */

    // Todas las variables que están fuera de los metodos pertencen a STORAGE.
    // STORAGE: memoria permanente del contrato inteligente (casilleros. cada casillero 32 bytes)
    address public owner;
    mapping(address => bool) whitelist;

    event Published();

    constructor() {
        owner = msg.sender;
        whitelist[msg.sender] = true;
        emit Published();
    }

    // Este método cambia información del contrato
    // Sin function view: 26947
    // Con function view: 31434
    function updateOwner(address _newOwner) public {
        functionComplejaYCostosa();
        owner = _newOwner;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    uint256 a = 100000;
    uint256 b = 500000;

    function functionComplejaYCostosa() public view returns (uint256) {
        return a * b;
    }
}
