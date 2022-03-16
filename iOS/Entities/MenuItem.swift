//
//  MenuItem.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-04.
//

import UIKit

class MenuItem {
    var image: Data = #imageLiteral(resourceName: "food").jpegData(compressionQuality: 0.5)!
    var title: String = "Title \(Int.random(in: 0...1000))"
    var description: String = "Some description"
    var price: NSDecimalNumber = NSDecimalNumber(mantissa: UInt64.random(in: 500...1000), exponent: -2, isNegative: false)
}
