// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/**
 * Herencia de contratos
 * - no puedes heredar un contrato que ya ha sido desplegado
 * - cuando un hijo hereda un contrato papá, es como si copiara y pegara todo su codigo
 */

/**
 * Herencia de constructores:
 * - Cuando un contrato hijo hereda un contrato papa con constructor
 *   es responsabilidad del hijo inicializar el constructor del papá
 */

contract Human {
    string saluteHuman;
    uint256 ageHuman;

    constructor(string memory _salute, uint256 _age) {
        saluteHuman = _salute;
        ageHuman = _age;
    }
}

// CASO 1
// Directamente en la lista de herencia
// Usarás este caso cuando a priori sabes los valores que tomará el papá
// Es una manera de hard codear los valores, de manera literal
contract Male is Human("Hello. I am a Human", 2000) {
    function getSaluteHuman() public view returns (string memory) {
        return saluteHuman;
    }

    function getAgeHuman() public view returns (uint256) {
        return ageHuman;
    }
}

// CASO 2
// Como si fuera un modifier en el constructor del hijo
// Es más dinámico
contract Male2 is Human {
    address owner;

    constructor(
        string memory _salute,
        uint256 _year,
        address _owner
    ) Human(_salute, _year) {
        owner = _owner;
    }
}
