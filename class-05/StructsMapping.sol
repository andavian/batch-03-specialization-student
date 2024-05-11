// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

struct Profesor {
    string nombre;
    string curso;
    uint256 edad;
    string locacion;
}

// eventos
// errors

contract StructMappgings1 {
    mapping(address => Profesor) public profesorPorAddress;

    // mapping setter (sin memory)
    function guardarInformationDirecta(address _wallet) public {
        profesorPorAddress[_wallet] = Profesor({
            nombre: "Luis",
            curso: "Solidity",
            edad: 123,
            locacion: "LA"
        });
    }

    function guardarInformationUsandoMemory(address _wallet) public {
        Profesor memory _profesor = Profesor({
            nombre: "Luis",
            curso: "Solidity",
            edad: 123,
            locacion: "LA"
        });
        _profesor.locacion = "USA";
        _profesor.nombre = "Juan";

        profesorPorAddress[_wallet] = _profesor;
    }
}

contract StructMapp2 {
    mapping(address => Profesor) public profesorPorAddress;
}
