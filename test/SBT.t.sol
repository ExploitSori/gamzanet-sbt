// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {SBT} from "../src/SBT.sol";
import {console} from "forge-std/console.sol";
contract SBTTEST is Test {
    SBT public sbt;

    function setUp() public {
        sbt = new SBT("gamzanet", "GZN");
        sbt.mint(address(0x1));
    }

    function test_mint() public {

        uint balance = sbt.balanceOf(address(0x1));
        console.log(balance);
        require(balance == 1, "err");

        vm.expectRevert();
        sbt.mint(address(0x1)); // 중복발행 못하게
        balance = sbt.balanceOf(address(0x1));
        console.log(balance);

        require(balance == 1, "err");
        
        vm.startPrank(address(0x1));
        {
            vm.expectRevert();
            sbt.mint(address(0x2)); // 다른사람이 발행 못하게
        }
        vm.stopPrank();

    }
    function testFail_approve() public{
        vm.startPrank(address(0x1));
        {
            sbt.approve(address(0x2), 1);
        }
        vm.stopPrank();
    }
    function testFail_transferFrom() public{
        vm.startPrank(address(0x1));
        {
            sbt.transferFrom(address(0x1), address(0x2), 1);
        }
        vm.stopPrank();
    }
}
