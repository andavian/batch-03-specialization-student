// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

// OBJETIVO: Lograr una llamada intercontrato
// 1. Publicar un contrato inteligente y obtener su address
//      Address eleccioens: 0x00000Elecciones

contract Elecciones {
    mapping(address => bool) public votos;
    uint256 public votosTotales;

    function votar(address votante) public returns (bool) {
        require(!votos[votante], "Ya votaste");

        votos[votante] = true;
        votosTotales++;
        return true;
    }

    function consultarConteo() public view returns (uint256) {
        return votosTotales;
    }
}

// 2. Definir la interface del contrato (del cual usaré sus métodos)
interface IElecciones {
    function votar(address wallet) external returns (bool);

    function consultarConteo() external view returns (uint256);

    function votosTotales() external view returns (uint256); // firma getter de la variable votosTotales

    function votos(address wallet) external view returns (bool); // firma getter del mapping votos
}

// 3. Crear el contrato que usará los métodos del contrato Elecciones
contract Medellin {
    address addressElecciones; // = 0x00000Elecciones;

    // 1. Creando una referencia en storage
    // elecciones es una referencia del contrato Elecciones
    IElecciones elecciones = IElecciones(addressElecciones);

    function votarDesdeMedellin(address votanteMedellin) public {
        // Elecciones.votar(votanteMedellin);
        elecciones.votar(votanteMedellin);
    }

    // 2. A la volada
    function votarDesdeMedellinVolada(address votanteMedellin) public {
        // Elecciones.votar(votanteMedellin);
        IElecciones(addressElecciones).votar(votanteMedellin);
    }
}
