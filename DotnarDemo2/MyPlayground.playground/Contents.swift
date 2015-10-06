//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func test(a:Int)(b:Int) -> Bool{
    print(a)
    print(b)
    return a > b
}


let test1 = (1...7).flatMap{print("结果\($0)")}