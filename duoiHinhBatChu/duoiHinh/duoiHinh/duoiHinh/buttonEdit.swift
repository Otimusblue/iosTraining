//
//  buttonEdit.swift
//  duoiHinh
//
//  Created by Macintosh HD on 3/17/18.
//  Copyright © 2018 google. All rights reserved.
//

import Foundation


// them ki tu ngau nhien(khac mang) vao mang :) 
func addRandomCharacter(array: [String],index: Int) -> [String] {
     var newArray : [String] = array
     var newIndex : Int = index
     while(newIndex > 0){
     let a: String = randomizeAvailabelLetters()
     if (!array.contains(a)){
            newArray.append(a)
            newIndex -= 1
        }
    
    }
    return newArray
}


//them ki tu bat ky vao mang
func randomizeAvailabelLetters() -> String {
    let alphabet : [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let rand =  Int(arc4random_uniform(26))
    return alphabet[rand]
}

// dao cac ki tu trong mang
extension Array{
      public mutating func shuffle(){
        var temp = [Element]()
        while !isEmpty{
            let i = Int(arc4random_uniform(UInt32(count)))
         let obj = remove(at: i)
            temp.append(obj)
        }
        self = temp
    }

}


