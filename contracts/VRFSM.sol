// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import {LinkTokenInterface} from "@chainlink/contracts/src/v0.8/interfaces/LinkTokenInterface.sol";
import {VRFCoordinatorV2Interface} from "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import {VRFConsumerBaseV2} from "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract VRFSM is VRFConsumerBaseV2, Ownable {
    // rinkeby
    address private constant _VRF_COORDINATOR_V2 =
        0x6168499c0cFfCaCD319c818142124B7A15E857ab;

    // rinkeby
    address private constant _LINK_TOKEN =
        0x01BE23585060835E02B77ef475b0Cc51aA1e0709;

    // rinkeby
    uint64 private _subscriptionId = 8005;

    uint256 public randomWord;

    constructor() VRFConsumerBaseV2(_VRF_COORDINATOR_V2) {}

    function setup() public {
        _requestRandomWords();
    }

    function _requestRandomWords() internal {
        VRFCoordinatorV2Interface(_VRF_COORDINATOR_V2).requestRandomWords(
            // rinkeby
            0xd89b2bf150e3b9e13446986e571fb9cab24b13cea0a43ea20a6049a85cc807cc,
            _subscriptionId,
            3,
            100000,
            1
        );
    }

    function fulfillRandomWords(
        uint256, /* requestId */
        uint256[] memory _randomWords
    ) internal override {
        randomWord = _randomWords[0];
    }
}
