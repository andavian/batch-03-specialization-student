// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// ¿Qué elementos son parte de la herencia de contratos?
// - variables de storage que son public
// - modifiers
// - eventos
// - errores
// - metodos public o external

// Contrato base, papá
contract Humano {
    uint256 public yearHumano = 2024;

    // pure: no estamos leyendo ninguna variable del contrato inteligente
    function saludoHumano() public pure returns (string memory) {
        return "Hola. Soy humano";
    }

    function saludoHumano2() private pure returns (string memory) {
        return "Hola. Soy humano";
    }
}

// Contrato derivado, hijo
contract Hombre is Humano {
    function saludoHombre() public pure returns (string memory) {
        return "Hola, soy Hombre";
    }

    // super
    // Puedes acceder sus setter y getter que son del tipo 'public' y 'external'
    function bienvenidaDehumano() public pure returns (string memory) {
        return super.saludoHumano();
    }

    // Puedes acceder sus setter y getter que son del tipo 'public' y 'external'
    function bienvenidaDehumano2() public pure returns (string memory) {
        return Humano.saludoHumano();
    }
}

// Herencia múltiple
// El orden de herencia es IMPORTANTE
// EL orden de herencia va desde el más base hasta el más derivado
// contract Marcos is Hombre, Humano{} ERROR
// Un contrato no puede heredar un contrato que se encuentra publicado
// Cuanto el contrato Marcos se publica, Humano, Hombre y Marcos se convierten en un solo contrato

// Patrones de Diseño: un contrato inteligente busca ser un SINGLETON

// Solidity usa C3Linearization
contract Marcos is Humano, Hombre {
    function getYear() public view returns (uint256) {
        return yearHumano;
    }

    function saludoMarcos() public pure returns (string memory) {
        return "Hola Soy Marcos";
    }

    function saludoHumanoDesdeMarcos() public pure returns (string memory) {
        return Humano.saludoHumano();
    }
}
