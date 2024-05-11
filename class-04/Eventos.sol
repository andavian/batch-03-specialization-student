// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract Events {
    /**
        Eventos:
        - Los eventos generan cambios de estado en el Blockchain
        - No pueden ser disparados desde métodos de lectura (view)
    */


    event SaveData();
    event SaveData(address indexed _wallet);
    event SaveData(address _wallet, uint256 _age);
    event SaveData(
        address indexed _wallet,
        uint256 indexed _age,
        uint256 indexed _date,
        uint256  _year
    );

    // Evento anonimos
    event SaveData(address _wallet, uint256 _age, uint256 _date) anonymous;

    event Delete(address _wallet);

    mapping(address => uint256) mappingWalletAge;

    // setter
    function saveData(address _wallet, uint256 _age) public {
        emit SaveData();
        mappingWalletAge[_wallet] = _age;
    }

    // getter
    function getData(address _wallet) public view returns (uint256) {
        return mappingWalletAge[_wallet];
    }

    // delete
    function deleteRow(address _wallet) public {
        delete mappingWalletAge[_wallet];
        emit Delete(_wallet);
    }
}
