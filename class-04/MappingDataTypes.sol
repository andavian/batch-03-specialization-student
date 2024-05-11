// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

contract MappingDataTypes {
    mapping(bool => uint256) boolUint256;
    mapping(string => address) stringAddress;
    mapping(uint256 => string) uint256String;

    // Lo que no puede recibir como key
    // mapping(mapping() => string) no es factible
    mapping(address => mapping(uint256 => string)) dobleMapping;

    mapping(address => uint256[]) addressArrayUint256;
}
