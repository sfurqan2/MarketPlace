// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract MarketPlace{

    struct Item {
        string name;
        uint price;
        address owner;
    }

    Item[] public items;

    mapping (uint => bool) public sellRequest;
    
    function createSellRequest(string memory name, uint price) public {
        Item memory item = Item(name, price, msg.sender);
        items.push(item);
        uint id = items.length - 1;
        sellRequest[id] = true;
    }

    function createBuyRequest(string memory name, uint price) public payable {
        require(msg.value == price, "Invalid transaction price greater than transaction amount!");
        for( uint i = 0; i < items.length; i++){
            if(keccak256(bytes(items[i].name)) == keccak256(bytes(name)) && items[i].price == price){
                require(sellRequest[i], "Product has already been sold!");
                sellRequest[i] = false;
            }
        }
    }
}