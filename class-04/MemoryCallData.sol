// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract MemoryCalldata {
    // Tipos de dato dinámicos
    // arrays, bytes, mapping, strings
    string name =
        "Lee Marreros Lee MarrerosLee MarrerosLee MarrerosLee MarrerosLee MarrerosLee MarrerosLee MarrerosLee MarrerosLee Marreros";

    // Memory vs calldata
    // En solidity cuando usas tipo de dato dinámico especificas cómo será tratado

    // Memory
    // - con memory puedo modificar al tipo de dato dinámico
    // - ganas flexibilidad porque puedes alterar al dato
    // - pierdes porque es más costosa que calldata

    // Calldata
    // - el tipo de dato dinamico se conveirte en constante
    // - pierdes flexbilidad
    // - ganas en costo (menos costosa)

    mapping(address => string) mappingAddressString;

    function saveData(address _wallet, string memory _name) public {
        _name = string.concat(_name, "-2024");
        mappingAddressString[_wallet] = _name;
    }

    function saveData2(address _wallet, string calldata _name) public {
        // _name = string.concat(_name, "-2024");
        mappingAddressString[_wallet] = _name;
    }
}
