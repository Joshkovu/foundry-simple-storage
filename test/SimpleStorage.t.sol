// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";
import {DeploySimpleStorage} from "../script/DeploySimpleStorage.s.sol";

contract SimpleStorageTest is Test {
    DeploySimpleStorage deployer;
    SimpleStorage simpleStorage;

    function setUp() public {
        deployer = new DeploySimpleStorage();
        simpleStorage = deployer.run();
    }

    function testStoreNumberAndReceiveFunctionalityIsCorrect() public {
        uint256 expected = 7;
        simpleStorage.store(expected);
        uint256 actual = simpleStorage.retrieve();
        assertEq(expected, actual);
    }

    function testAddPersonAndGetFavoriteNumberIsCorrect() public {
        string memory expectedName = "Alice";
        uint256 expectedFavoriteNumber = 42;
        simpleStorage.addPerson(expectedName, expectedFavoriteNumber);
        uint256 actualFavoriteNumber = simpleStorage.nameToFavoriteNumber(
            expectedName
        );
        assertEq(expectedFavoriteNumber, actualFavoriteNumber);
    }
}
