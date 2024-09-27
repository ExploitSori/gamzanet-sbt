// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {SBT} from "../src/SBT.sol";

contract SBTScript is Script {
    SBT public sbt;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        sbt = new SBT("gamzanet", "GZN");

        vm.stopBroadcast();
    }
}
