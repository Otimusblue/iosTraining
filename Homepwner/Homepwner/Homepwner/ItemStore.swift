//
//  ItemStore.swift
//  Homepwner
//
//  Created by Macintosh HD on 3/26/18.
//  Copyright © 2018 google. All rights reserved.
//

import UIKit

class ItemStore{
      var allItems = [Item]()
    func filterItemsBy(_ price: Int = 50) -> [[Item]] {
        var filteredItems = [[Item](), [Item]()]
        for item in allItems {
            if item.valueInDollars > price {
                filteredItems[0].append(item)
            } else {
                filteredItems[1].append(item)
            }
        }
        return filteredItems
    }
      init(){
        for _ in 0..<5{
               createItem()
        }
    
      }
    
    
    // create newItem
       @discardableResult func createItem() -> Item{
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
        }
}
