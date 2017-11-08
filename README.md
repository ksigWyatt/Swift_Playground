# Swift Playground
Learning Advanced Features &amp; Algorithms in Swift. 
Projects that are useful for learning how Advanced swift performs are placed here too, instead of creating a whole new repo for them.

## Projcts 
### iManage Inventory
Application demonstrating a number of skills pertaining to iOS development
- Data Persistence: `Structs`
- UI Design: Rapid Prototyping using given `Main.storyboard`
- Updating Items: Using the `UUID` of the `Item` it's possible to replace the item at that `id` using the following shorthanded argument reference within the closure `{$0.id == id}`
- iOS Structures: `UITableView` (Main Interface), `UIAlert` (Stock Quantity input)

**Requirements:**
- Track a list of inventory which contains the following: *Part #, Description of Item, Comments, In-Stock Quantity*
- Must be able to create a new item
- Must be able to increase or decrease *In-Stock Quantity* via "Recieving" or "Consuming" stock
- Make changes via updates to existing Stock items

**Legacy:**
- Add Error Checking for all numbers to prevent letters and decimals to be entered
- Use Cloud storage for Inventory items, so items are saved following app closure
- *Swipe-to-delete* items easily
- `resignFirstResponder` issues with *Comments, Description and Part #* 

**Screenshots**
![Screenshot](https://i.imgur.com/UG0KUh9.png)
![Screenshot](https://i.imgur.com/bnhKXbx.png)


### Auto Layout
Application demonstrating Programmatic UI using Auto Layout in Swift 4 
- Using `safeAreaLayoutGuide` for perfect indents
- Optimized for iPhone X
- Supports Landscape &amp; Portrait orientation
- `UICollectionView` &amp; `UIStackView` Controllers help to layer each view 
- Structured using Model View Controller
- Private Closures for each element on screen

**Screenshots**
![Screenshot](https://i.imgur.com/lO9uATG.png)
