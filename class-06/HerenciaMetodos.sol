// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Human {
    // pure: no lee ninguno estado del contrato inteligente
    // virtual: marcar a un método para que se pueda sobreescribir
    function salute() public pure virtual returns (string memory) {
        return "Hello. I am a Human!";
    }
}

contract Male is Human {
    function salute() public pure virtual override returns (string memory) {
        return "Hello. I am a Male!";
    }

    function saluteHuman() public pure returns (string memory) {
        return super.salute();
    }

    function saluteHuman2() public pure returns (string memory) {
        return Human.salute();
    }
}

// Linea de herencia: C3 linearization
// Cuando se heredan contratos, en la lista de herencia, de izquierda a derecha,
// se empieza por el más papá (por el más base) y se va hasta el más hijo (hasta el más derivado)
// Micke tiene dos papás que posee el método salute. Por lo tanto Micke está obligado a sobreescrbir ambos métodos
contract Micke is Human, Male {
    function salute()
        public
        pure
        override(Human, Male)
        returns (string memory)
    {
        return "Hello. I am Micke!";
    }
}
