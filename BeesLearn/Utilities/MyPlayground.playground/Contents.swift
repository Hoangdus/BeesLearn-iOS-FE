import UIKit
import SwiftUI

var greeting = "Hello, playground"

var total = 10

let firstHalf = floor(Double(total) * 0.6)
let secondHalf = Double(total) - firstHalf
let excess = Double(total) - (firstHalf + (floor(secondHalf / 2)*2))

let grammarAmount = firstHalf + excess
let wordAmount = floor(secondHalf / 2)
let truefalseAmount = floor(secondHalf / 2)
