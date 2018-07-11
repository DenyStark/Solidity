pragma solidity ^0.4.18;

/**
 * @title Limited
 * Implementation of the certificates in the digital form of limited products.
 */

contract Limited {
    
    // Sneakers characteristics
    uint256 public numOfItems;
    uint256[] itemSize;
    uint256[] itemYear;
    uint256[] itemBeliveryVolume;
    uint256[] itemPrice;
    string[] itemName;
    string[] itemColor;
    string[] itemDescription;
    
    // Dictionary of sneakers id - certificate's owner
    mapping (uint256 => address) public owners;

    /**
     * @dev Check is sneakers id in range of number of sneakers
     * @param id uint256 Id of the item.
     */
    modifier isInRange(uint256 id) {
        require(id >= 0 && id < numOfItems);
        _;
    }
    
    /**
     * @dev Constructor to set all sneakers characteristics.
     */
    function Limited() public {
        // Set number of items
        numOfItems = 3;
        
        // For every item set it's owner to contract creator
        for (uint256 i = 0; i < numOfItems; i++) {
            owners[i] = msg.sender;
        }
        
        itemName = ["Adidas Yeezy Boost 350", "Adidas NMD", "Air Jordan 11"];
        itemSize = [38, 44, 45];
        itemColor = ["#BBBBBB", "#F1CD43", "#8F9294"];
        itemDescription = ["The official collaboration sneaker by Kanye West and Adidas.",
            "The NMD, adidas Originals’ new kid on the block, has quickly gained a very solid footing in the sneaker world.",
            "Air Jordan is a brand of basketball footwear and athletic clothing produced by Nike."];
        itemYear = [2017, 2018, 2016];
        itemBeliveryVolume = [200, 300, 100];
        itemPrice = [1000, 1200, 1500];
    }
    
    /**
     * @dev Get item name.
     * @param item uint256 item id.
     * @return string Name of the item.
     */
    function getItemName(uint256 item) constant public isInRange(item) returns(string) {
        return itemName[item];
    }
    
    /**
     * @dev Get item size.
     * @param item uint256 item id.
     * @return uint256 Size of the item.
     */
    function getItemSize(uint256 item) constant public isInRange(item) returns(uint256) {
        return itemSize[item];
    }
    
    /**
     * @dev Get item color.
     * @param item uint256 item id.
     * @return string Hex value of color of the item.
     */
    function getItemColor(uint256 item) constant public isInRange(item) returns(string) {
        return itemColor[item];
    }
    
    /**
     * @dev Get item description.
     * @param item uint256 item id.
     * @return string Full description of the item.
     */
    function getItemDescription(uint256 item) constant public isInRange(item) returns(string) {
        return itemDescription[item];
    }
    
    /**
     * @dev Get item year.
     * @param item uint256 item id.
     * @return uint256 Sneakers year.
     */
    function getItemYear(uint256 item) constant public isInRange(item) returns(uint256) {
        return itemYear[item];
    }
    
    /**
     * @dev Get item belivery volume.
     * @param item uint256 item id.
     * @return uint256 Volume of the snekers issue.
     */
    function getItemBeliveryVolume(uint256 item) constant public isInRange(item) returns(uint256) {
        return itemBeliveryVolume[item];
    }
    
    /**
     * @dev Get item price.
     * @param item uint256 item id.
     * @return uint256 Price of the snekers.
     */
    function getItemPrice(uint256 item) constant public isInRange(item) returns(uint256) {
        return itemPrice[item];
    }
    
    /**
     * @dev Get all snekers id, which address has.
     * @param ownerAddress address owner of the snekers.
     * @return uint256[] id's snekers, which owns the owner.
     */
    function getItemsOfAddress(address ownerAddress) constant public returns(uint256[]) {
        uint256[] myItems;
        
        for (uint256 i = 0; i < numOfItems; i++) {
            if (owners[i] == ownerAddress) {
                myItems.push(i);
            }
        }
        
        return myItems;
    }
    
    /**
     * @dev Transfer of rights to crossovers to another account
     * if your are the owner of account from which to send.
     * @param newOwner address of the new owner.
     * @param item uint256 item id.
     * @return bool Status of the transfer.
     */
    function transferRights(address newOwner, uint256 item) public returns(bool) {
        if (owners[item] == msg.sender) {
            owners[item] = newOwner;
            return true;
        }
        
        return false;
    }
    
}