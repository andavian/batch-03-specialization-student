// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Events {
    event Uno(address indexed wallet, uint256 indexed age, string name);
    event Dos(uint256 indexed year, uint256 indexed month);

    function fireUno(
        address _wallet,
        uint256 _age,
        string memory _name
    ) public {
        emit Uno(_wallet, _age, _name);
    }

    function fireDos(uint256 _year, uint256 _month) public {
        emit Dos(_year, _month);
    }
}
