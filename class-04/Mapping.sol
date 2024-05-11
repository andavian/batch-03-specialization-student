// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract Mapping {
    // Table:
    // key: address     (billetera)
    // value: uint256   (age)

    //      Billetera                       Edad
    //  key(address)         |       value (uint1256)
    //  0x000...1                       23
    //  0x000...2                       66
    //  0x000...3                       66
    //  0x000...4                       45

    //    40 chars
    // 0x0000...1
    // 16^40 filas
    mapping(address => uint256) mappingWalletAge;

    // 2^256 filas
    mapping(uint256 => uint256) mappingUintToUint;

    // Propiedades del Mapping:
    /**
        - Mapping tiene todos valores inicializados
        - Tamaño máximo de un mapping es 2^256
        - Un mapping no es iterable (JS:    var obj = {};   Object.keys(obj).forEach...)
        - De un mapping no se puede saber qué keys ya han sido utilizados
        - NO podemos saber qué filas de la tabla ya han sido actualizadas
        - Tampoco podemos conocer la longitud de un mapping
        - Si paso el value del mapping, puedo obtener el key? No
        - Cada key del mapping viene a ser único e irrepetible
        - Un key puede ser visto como un UUID
        - Todas las filas posibles de un mapping ya tienen un valor por defecto
        - En Solidity no existe el null o el undefined
    */
    mapping(bool => uint256) mappingBoolUint;

    // setter
    function saveData(address _wallet, uint256 _age) public {
        mappingWalletAge[_wallet] = _age;
    }

    // getter
    function getData(address _wallet) public view returns (uint256) {
        return mappingWalletAge[_wallet];
    }

    uint256[][] array;

    function saveArray(uint256 _ix1, uint256 _ix2, uint256 _value) public {
        array[_ix1][_ix2] = _value;
    }

    // delete
    function deleteRow(address _wallet) public {
        delete mappingWalletAge[_wallet];
    }

    // Valores por defecto por cada tipo de dato
    uint256 age; // = 0
    bool isDay; // = false
    string name; // = ""

    uint256[] arrayNumbers;
}
