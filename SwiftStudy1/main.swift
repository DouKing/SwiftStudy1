//
//  main.swift
//  SwiftStudy1
//
//  Created by Paney on 14-6-7.
//  Copyright (c) 2014年 secoo. All rights reserved.
//

import Foundation

//定义一个函数
func sayHello (name: String)-> String {
    return "hello " + name
}
println(sayHello("zhangsan"))

var funcType: ((String)-> String) = sayHello

println(funcType("lisi"))

func sayGoodBye(name: String)-> String {
    return "GoodBye " + name
}

funcType = sayGoodBye

println(funcType("lisi"))

//没有返回值的函数不用写，void 空的元组
func hello(name: String) {
    
}
//多返回值  返回元组
func countHH(name: String)-> (vowels: Int, consonants: Int) {
    var vowels = 0, consonants = 0
    for character in name {
        var string: String = String(character).lowercaseString
        switch string {
            case "a","e","i","o","u":
                vowels++
            case "b","c","d","f","g","h":
                consonants++
            default:
                println("非字母")
        }
    }
    return(vowels, consonants)
}

let acceptCount = countHH("just a test string")
println("vowels = \(acceptCount.0), consonants = \(acceptCount.1)")
println("vowels = \(acceptCount.vowels), consonants = \(acceptCount.consonants)");

//局部参数名称和外部参数名
//#号表示即可内部，也可外部
func join(# string1: String, # string2: String, # joiner: String)-> String {
    return string1 + string2
}
println(join(string1:"Hello", string2:"Lanlan", joiner:" "))

//参数默认值
func join2(# string1: String, # string2: String, _ joiner: String = "-")-> String {
    return string1 + joiner + string2  //有默认值的参数只能放最后, 并且会自动创建外部参数
    //如果不需要Swift自动提供的外部名称，可以在前面加 _
}
println(join2(string1:"Hello", string2:"Lanlan", "="))
println(join2(string1:"Hello", string2:"LanLan"))


func caculateMeal(numbers: Double ...)-> Double {
    var sum = 0.0
    for number in numbers { //获取每一个参数的值
        sum += number
    }
    return sum/Double(numbers.count)
}
println("meal = \(caculateMeal(1.0, 2.0, 3.00))")


func incream(var a:Int, b:Int) {
    a++
}

var increanNumber = 5
incream(increanNumber, 3)
println("increanNumber = \(increanNumber)")

func swapTwoInt(inout a:Int, inout b:Int) {  //声明为inout可以改变参数的值
    var temp = a
    a = b
    b = temp
}
var swapValueA = 3, swapValueB = 5
swapTwoInt(&swapValueA, &swapValueB)  //取地址符
println("swapValueA = \(swapValueA), swapValueB = \(swapValueB)")
                //swapValueA = 5, swapValueB = 3


//函数嵌套

                                        // 返回一个函数类型
func changeValue(isStepBackward:Bool)-> (Int)-> Int {
    func stepBackward(number:Int)-> Int {
        return number - 1
    }
    
    func stepForward(number:Int)-> Int {
        return number + 1
    }
    
    return isStepBackward ? stepBackward : stepForward
}

var changeValueFunc: (Int)-> Int = changeValue(false)

var changedValue = 3
println("after changed: changedValue = \(changeValueFunc(changedValue))")


/*       闭包    (block)   */
//{(parameters)-> return type in
//    statement
//}

var names = ["zhangsan","lisi","wangwu","sunliu"]

var sortedNames = sorted(names, {
    (string1:String, string2:String)-> Bool in //可以省掉 类型 和 小括号
        return string1 > string2//降序
    })
        //{string1, string2 -> Bool in string1 > string2}    只有一个返回表达式也可以省掉return
        //{$0 > $1}                                           简化
        // >                                                  简化
//var sortedNames4 = sorted(names, { $0 ＞ $1 })

var sortedNames5 = sorted(names, > )


var sortedNames2 = sorted(names){
        (string1:String, string2:String)-> Bool in //可以省掉 类型 和 小括号
        return string1 > string2//降序
    }
//var sortedNames3 = sorted(names){ $0 > $1 }

println("sortedNames = \(sortedNames)")




