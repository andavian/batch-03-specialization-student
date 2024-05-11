// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract InputValidation {
    event SaveData();
    event Delete(address _wallet);

    uint256 amountOfStudents; // En mi salon solo hay 50 alumnos
    mapping(address wallet => uint256 age) mappingWalletAge;

    error AgeOutOfRange();

    function saveData(address _wallet, uint256 _age) public {
        // require(_age >= 18 && _age <= 65, "Age out of range");
        require(_age > 17 && _age < 66, "Age out of range");
        if (_age < 18 || _age > 65) revert AgeOutOfRange();

        emit SaveData();
        mappingWalletAge[_wallet] = _age;

        // Los assert se utilizan para resguardar o validar los invariantes
        amountOfStudents++;
        assert(amountOfStudents < 51);
    }

    function getData(address _wallet) public view returns (uint256) {
        return mappingWalletAge[_wallet];
    }

    error AddressZero();

    // address(0) == 0x000......0000
    // address(this) == address de este contrato
    function deleteRow(address _wallet) public {
        // require(
        //     _wallet != address(0) && _wallet != address(this),
        //     "Deleting zero address"
        // );
        // require(_wallet != address(0), "Deleting zero address");
        if (_wallet == address(0)) revert AddressZero();

        require(_wallet != address(this), "Deleting contract address");

        delete mappingWalletAge[_wallet];
        emit Delete(_wallet);
    }
}
