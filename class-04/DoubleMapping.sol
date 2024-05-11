// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract DoubleMapping {
    // | ------------- | -------- | ------ | ---------- | --------- |
    // |   address     | Historia | Lengua | Matematica | Geografia | <- string
    // | Juan (0x01)   | 20       | 20     | 20         | 20        |
    // | Maria (0x02)  | 20       | 20     | 20         | 20        | <- uint256
    // | Carlos (0x03) | 20       | 20     | 20         | 20        |
    // | Sara (0x04)   | 20       | 20     | 20         | 20        |

    //           key 1                    key 2            value
    mapping(address => mapping(string => uint256)) notasPorAlumno;

    function setGradeForStudentAndCourse(
        address _wallet,
        string calldata _course,
        uint256 _grade
    ) public {
        notasPorAlumno[_wallet][_course] = _grade;
    }

    // uint256 num = 123;
    // mapping(num => uint256) mappingNum;
}
