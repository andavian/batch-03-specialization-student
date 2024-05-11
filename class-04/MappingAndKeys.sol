// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract MappingAndKeys {
    // Cómo puedo llevar la cuenta de los keys que estoy guardando en el mapping?

    mapping(address => uint256) mappingWalletAge;
    address[] keysAddress;

    mapping(uint256 => uint256) mappingUintToUint;
    uint256[] keysUint;

    function set(address _wallet, uint256 _age) public {
        mappingWalletAge[_wallet] = _age;
        keysAddress.push(_wallet);
    }

    // function iterateMapping() public {
    //     for (uint256 i; i < keysAddress.length; i++) {
    //         mappingWalletAge[keysAddress[i]];
    //     }
    // }
}
