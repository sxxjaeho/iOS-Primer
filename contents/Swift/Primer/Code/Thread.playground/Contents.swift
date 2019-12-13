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
