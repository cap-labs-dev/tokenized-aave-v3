// SPDX-License-Identifier: AGPL-3.0
pragma solidity >=0.8.18;

import "forge-std/Script.sol";
import {AaveV3LenderFactory} from "../src/AaveV3LenderFactory.sol";

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();

        AaveV3LenderFactory factory = new AaveV3LenderFactory(
            0xb8FC49402dF3ee4f8587268FB89fda4d621a8793,
            0xb8FC49402dF3ee4f8587268FB89fda4d621a8793,
            0xc1ab57b4cd6Db9bE5E0788Ed037887bF52d12a80,
            0xc1ab57b4cd6Db9bE5E0788Ed037887bF52d12a80,
            0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2,
            0xE592427A0AEce92De3Edee1F18E0157C05861564,
            0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2,
            0xfcD78c11720d3eF09a567E51D87d338f98fA2a89
        );

        console.log("Factory deployed at", address(factory));

        address usdcLender = factory.newAaveV3Lender(
            0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48,
            0x0000000000000000000000000000000000000000
        );
        console.log("USDC Lender deployed at", usdcLender);

        address usdtLender = factory.newAaveV3Lender(
            0xdAC17F958D2ee523a2206206994597C13D831ec7,
            0x0000000000000000000000000000000000000000
        );
        console.log("USDT Lender deployed at", usdtLender);

        vm.stopBroadcast();
    }
}
