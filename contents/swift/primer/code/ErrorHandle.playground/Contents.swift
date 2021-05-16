import UIKit

//// MARK: - 错误处理
//enum VendingMachineError: Error {
//    case invalidSelection
//    case insufficientFunds(coinsNeeded: Int)
//    case outOfStock
//}
//
//struct Item {
//    var price: Int
//    var count: Int
//}
//
//class VendingMachine {
//    var inventory = [
//        "Candy bar" : Item(price: 6, count: 8),
//        "Chips" : Item(price: 10, count: 9),
//        "Bread" : Item(price: 15, count: 5)
//    ]
//
//    var coinsDesposited = 0
//
//    func vend(itemNamed name: String) throws {
//        // defer 关键字：defer block 里的代码会在函数 return 之前执行，无论函数是从哪个分支 return 的，还是有 throw，还是自然而然走到最后一行
//        defer {
//            print("退出清理")
//        }
//
//        print("开始售卖")
//
//        guard let item = inventory[name] else {
//            throw VendingMachineError.invalidSelection
//        }
//
//        guard item.count > 0 else {
//            throw VendingMachineError.outOfStock
//        }
//
//        guard item.price <= coinsDesposited else {
//            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDesposited)
//        }
//
//        coinsDesposited -= item.price
//
//        var newItem = item
//        newItem.count -= 1
//        inventory[name] = newItem
//
//        print("Dispending \(name)")
//
//        print("售卖成功")
//    }
//}
//
//var machine = VendingMachine()
//machine.coinsDesposited = 5
//
//do {
//    try machine.vend(itemNamed: "Chips")
//} catch VendingMachineError.invalidSelection {
//    print("no such thing")
//} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
//    print("you need more coins: \(coinsNeeded)")
//} catch VendingMachineError.outOfStock {
//    print("out of stock")
//} catch {
//    print("unexpcted error")
//}


// MARK: - 权限控制
