// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract NftMarketPlace is ERC721Enumerable {
    // array to store NFT's
    string[] public nftMarketPlace;

    mapping(string => bool) _nftMarketPlaceExists;

    function mint(string memory _nftMarketPlace) public {
        require(
            !_nftMarketPlaceExists[_nftMarketPlace],
            "Error: NftMarketPlace already exists"
        );

        nftMarketPlace.push(_nftMarketPlace);
        uint256 _id = nftMarketPlace.length - 1;

        _mint(msg.sender, _id);

        _nftMarketPlaceExists[_nftMarketPlace] = true;
    }

    constructor() ERC721("NftMarketPlace", "STEINFT") {}
}
