# MarketPlace

## Selling

- I created a struct with two properties name and price.
- When a sell request is generated we create an item from the structure and store the item in an array.
- Then I used mapping for the selling requests which maps the boolean value onto the index of item in array.
- The boolean value is supposed to indicate the item has is available to be sold or not (Basically acting as a soft delete).

## Buying

- When a buyer tries to buy an item, we first require that the ether sent as a payment is greater than or equal the price of the item
- Then we search the item using its name and price in the items array (where we store all the items)
- Once we find the item we check in the mapping if the item hasn't been sold.
- Then once the check passes we mark the mapping to false showing that the item has been sold!