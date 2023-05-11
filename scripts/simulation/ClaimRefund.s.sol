// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// Scripting tool
import {Script} from "../../lib/forge-std/src/Script.sol";
import "forge-std/console2.sol";
import {SimulationBase} from "./SimulationBase.sol";

// Core contracts
import {IRaffle} from "../../contracts/interfaces/IRaffle.sol";

contract ClaimRefund is Script, SimulationBase {
    error ChainIdInvalid(uint256 chainId);

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("TESTNET_KEY");

        vm.startBroadcast(deployerPrivateKey);

        IRaffle raffle = getRaffle(block.chainid);

        uint256[] memory raffleIds = new uint256[](2);
        raffleIds[0] = 2;
        raffleIds[1] = 3;
        raffle.claimRefund(raffleIds);

        // bytes memory data = abi.encodeCall(IRaffle.claimRefund, raffleIds);
        // console2.logBytes(data);

        vm.stopBroadcast();
    }
}
