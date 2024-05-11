// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract StructAnidado {
    struct ID {
        uint256 numero;
        string nombre;
        string apellido;
    }
    mapping(address => ID) mappingAddressId;

    mapping(address => uint256 numero) mappingAddresNumero;
    mapping(address => string nombre) mappingAddressNombre;
    mapping(address => string apellido) mappingAddressApellido;

    struct Persona {
        ID id;
        uint256 altura;
        uint256 peso;
        mapping(string => uint256) listaDeActivos;
    }

    // Este mapping ya es parte de STORAGE
    mapping(address => Persona) public listaDePersonas;

    // memory: guardar en temporal
    // storage: guardar en memoria permanente
    function guardarPersona(address _wallet) public {
        ID memory _id = ID({numero: 1123123123, nombre: "J,", apellido: "M."});
        // Persona({id: _id, altura: 1234, peso: 23423, listaDeActivos: mapping(string => uint256)});

        Persona storage persona = listaDePersonas[_wallet];
        persona.id = _id;
        // persona.id = ID({numero: 1123123123, nombre: "J,", apellido: "M."});
        persona.altura = 1234;
        persona.peso = 23423;

        persona.listaDeActivos["Casa"] = 10;
        persona.listaDeActivos["Carro"] = 13;
        persona.listaDeActivos["Moto"] = 100;
    }

    /**
     struct ID {
        uint256 numero;
        string nombre;
        string apellido;
    }
    */
    mapping(address wallet => ID) public mappingWalletId;

    function saveIdConMemory(address _wallet) public {
        // Este struct esta alterado en memoria tempora y no tiene efectos permanentes
        ID memory _id = mappingWalletId[_wallet];
        _id.apellido = "Luna";
        _id.nombre = "Juan";
        _id.numero = 1234234;

        // Ahora sí tiene efectos permanentes
        mappingWalletId[_wallet] = _id;
    }

    function saveIdConStorage(address _wallet) public {
        // Este struct esta alterado en memoria tempora y no tiene efectos permanentes
        ID storage _id = mappingWalletId[_wallet];
        _id.apellido = "Luna";
        _id.nombre = "Juan";
        _id.numero = 1234234;

        // REDUNDANTE (guardarlo 2 veces)
        // mappingWalletId[_wallet] = _id;
    }
}
