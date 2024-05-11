// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract Modifiers {
    event SaveData();
    event Delete(address _wallet);

    mapping(address => uint256) mappingWalletAge;

    modifier ageOutOfRange(uint256 _age) {
        if (_age < 18 || _age > 65) revert AgeOutOfRange();
        _;
    }

    error AgeOutOfRange();

    function saveData(
        address _wallet,
        uint256 _age
    ) public ageOutOfRange(_age) {
        emit SaveData();
        mappingWalletAge[_wallet] = _age;
    }

    function getData(address _wallet) public view returns (uint256) {
        return mappingWalletAge[_wallet];
    }

    error AddressZero();

    modifier validateAddressZero(address _wallet) {
        if (_wallet == address(0)) revert AddressZero();
        _;
    }

    function deleteRow(address _wallet) public validateAddressZero(_wallet) {
        require(_wallet != address(this), "Deleting contract address");

        delete mappingWalletAge[_wallet];
        emit Delete(_wallet);
    }

    function deleteRow2(
        address _wallet
    ) public pure validateAddressZero(_wallet) {}
}
