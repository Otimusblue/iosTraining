//
//  Item.swift
//  Homepwner
//
//  Created by Macintosh HD on 3/26/18.
//  Copyright © 2018 google. All rights reserved.
//

import UIKit

class Item: NSObject{
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    
    init(name: String,serialNumber: String?,valueInDollars: Int){
          self.name = name
          self.serialNumber = serialNumber
          self.valueInDollars = valueInDollars
          self.dateCreated = Date()
    }
    convenience init(random: Bool = true){
    if random{
        let adjectives = ["Fluffy","Rusty","Shiny"]
        let nouns = ["Bear","Spork","Mac"]
        // random adjectives
        var idx = arc4random_uniform(UInt32(adjectives.count))
        var randomAdjectives = adjectives[Int(idx)]
        
        // random nouns
        idx = arc4random_uniform(UInt32(nouns.count))
        var randomNoun = nouns[Int(idx)]
        
        //combination
        let randomName = "\(randomAdjectives) \(randomNoun)"
        let randomValue = Int(arc4random_uniform(100))
        let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
        
        // convenience init
        self.init(name: randomName,
                  serialNumber: randomSerialNumber,
                  valueInDollars: randomValue)
        }
    else {
        self.init(name:"",serialNumber: nil,valueInDollars:0)
    }
    }
}
