import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//// MARK: - Thread
//// 快捷方式创建
//for i in  0..<10 {
//    Thread.detachNewThread {
//        print(i)
//    }
//}
//
//// 初始化器
//class ObjectForThread {
//    func threadTest() {
//        let thread = Thread(target: self, selector: #selector(threadWorker), object: nil)
//        thread.start()
//        print("threadTest")
//    }
//    @objc func threadWorker() {
//        print("threadWorker")
//    }
//}
//
//let obj = ObjectForThread()
//obj.threadTest()


//// MARK: - Operation + OperationQueue
//// BlockOperation
//class ObjectOperation {
//    func test () {
//        let operation = BlockOperation { [weak self] in
//            self?.threadWorker()
//        }
//        let queue = OperationQueue()
//        queue.addOperation(operation)
//    }
//    @objc func threadWorker() {
//        sleep(1)
//        print("threadWorker")
//    }
//}
//
////let obj = ObjectOperation()
////obj.test()
////print("after invoke test")
//
//// 继承Operation
//class ObjectOperation1 {
//    func test () {
//        let operation = MyOperation()
//        // Operation 完成的回调
//        operation.completionBlock = { () -> Void in
//            print("completionBlock")
//        }
//        let queue = OperationQueue()
//        queue.addOperation(operation)
//    }
//    @objc func threadWorker() {
//        sleep(1)
//        print("threadWorker")
//    }
//}
//
//
//class MyOperation: Operation {
//    override func main() {
//        sleep(1)
//        print("in MyOperation main")
//    }
//}
//let obj1 = ObjectOperation1()
//obj1.test()
//print("after invoke test")


//// MARK: - GCD
//let queue = DispatchQueue(label: "myQueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
//
//// GCD-sync
////queue.sync {
////    sleep(1)
////    print("in queue sync")
////}
////print("after invoke queue method")
//
//// GCD-async
////queue.async {
////    sleep(1)
////    print("in queue sync")
////}
////print("after invoke queue method")
//
//// GCD-asyncAfter
//queue.asyncAfter(deadline: .now() + 1) {
//    print("in asyncAfter")
//}
//print("after invoke queue method")


// MARK: - GCD 高级特性
// DispatchGroup
// DispatchGroup-wait
//let workingGroup = DispatchGroup()
//let workingQueue = DispatchQueue(label: "request_queue")
//
//workingGroup.enter()
//workingQueue.async {
//    Thread.sleep(forTimeInterval: 1)
//    print("接口 A 数据请求完成")
//    workingGroup.leave()
//}
//
//workingGroup.enter()
//workingQueue.async {
//    Thread.sleep(forTimeInterval: 1)
//    print("接口 B 数据请求完成")
//    workingGroup.leave()
//}
//
//print("我是最开始执行的,异步操作里的打印后执行")
//
//workingGroup.wait()
//print("接口 A 和接口 B 的数据请求都已完毕!开始合并两个接口的数据")

//// DispatchGroup-notify
//let workingGroup = DispatchGroup()
//let workingQueue = DispatchQueue(label: "request_queue")
//
//workingGroup.enter()
//workingQueue.async {
//    Thread.sleep(forTimeInterval: 1)
//    print("接口 A 数据请求完成")
//    workingGroup.leave()
//}
//
//workingGroup.enter()
//workingQueue.async {
//    Thread.sleep(forTimeInterval: 1)
//    print("接口 B 数据请求完成")
//    workingGroup.leave()
//}
//
//print("我是最开始执行的,异步操作里的打印后执行")
//
//workingGroup.notify(queue: workingQueue) {
//    print("接口 A 和接口 B 的数据请求都已完毕!开始合并两个接口的数据")
//}
//
//print("验证不堵塞")

//// DispatchSource
//var seconds = 10
//let timer: DispatchSourceTimer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
//timer.schedule(deadline: .now(), repeating: 1.0)
//timer.setEventHandler {
//    seconds -= 1
//    if seconds < 0 {
//        timer.cancel()
//    } else {
//        print(seconds)
//    }
//}
//timer.resume()


//// MARK: - 多线程典型场景
//// 实现一个线程安全的Array的读和写。
//let queue1 = DispatchQueue(label: "myQueue1", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
//let queue2 = DispatchQueue(label: "myQueue2", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
//
//var array = Array(1...100)
//
////func getLastItem() -> Int? {
////    var temp: Int? = nil
////    if array.count > 0 {
////        temp = array[array.count - 1]
////    }
////    return temp
////}
////
////func removeLastItem() {
////    array.removeLast()
////}
//
//
//// 加锁
////let lock = NSLock()
////
////func getLastItem() -> Int? {
////    lock.lock()
////    var temp: Int? = nil
////    if array.count > 0 {
////        temp = array[array.count - 1]
////    }
////    lock.unlock()
////    return temp
////}
////
////func removeLastItem() {
////    lock.lock()
////    array.removeLast()
////    lock.unlock()
////}
//
//// 改进
//let arrayQueue = DispatchQueue(label: "myQueue3", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
//
//func getLastItem() -> Int? {
//    return arrayQueue.sync { () -> Int in
//        if array.count > 0 {
//            return array[array.count - 1]
//        }
//        return 0
//    }
//}
//
//func removeLastItem() {
//    let workItem = DispatchWorkItem(qos: DispatchQoS.default, flags: DispatchWorkItemFlags.barrier) {
//        array.removeLast()
//    }
//    arrayQueue.async(execute: workItem)
//}
//
//queue1.async {
//    for _ in 0..<100 {
//        removeLastItem()
//    }
//}
//
//queue2.async {
//    for _ in 0..<100 {
//        if let item = getLastItem() {
//            print(item)
//        }
//    }
//}

