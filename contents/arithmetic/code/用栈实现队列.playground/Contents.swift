import UIKit

/*
 题目：请你仅使用两个栈实现先入先出队列。队列应当支持一般队列支持的所有操作（push、pop、peek、empty）：

 实现 MyQueue 类：

 void push(int x) 将元素 x 推到队列的末尾
 int pop() 从队列的开头移除并返回元素
 int peek() 返回队列开头的元素
 boolean empty() 如果队列为空，返回 true ；否则，返回 false

 示例：
 输入：
 ["MyQueue", "push", "push", "peek", "pop", "empty"]
 [[], [1], [2], [], [], []]
 输出：
 [null, null, null, 1, 1, false]
 
 时间复杂度：O(1) 空间复杂度：O(n)
 */

class MyQueue {
    
    var addStack:Array<Int>
    var removeStack:Array<Int>
    
    init() {
        addStack = Array.init()
        removeStack = Array.init()
    }
    
    func push(_ x: Int) {
        addStack.append(x)
    }
    
    func pop() -> Int {
        if removeStack.isEmpty {
            addStack = addStack.reversed()
            removeStack = addStack
            addStack.removeAll()
        }
        return removeStack.popLast() ?? -1
    }
    
    func peek() -> Int {
        if removeStack.isEmpty {
            addStack = addStack.reversed()
            removeStack = addStack
            addStack.removeAll()
        }
        return removeStack.last ?? -1
    }
    
    func empty() -> Bool {
        return addStack.isEmpty && removeStack.isEmpty
    }
}

