# 算法
[TOC]

## 24.反转链表
[反转链表.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/Swift/Arithmetic/Code/反转链表.playground)
题目：定义一个函数，输入一个链表的头结点，反转该链表并输出反转后链表的头结点。链表节点定义如下：

```
class ListNode {
    var value: Int
    var next: ListNode?
    
    init(_ value: Int) {
        self.value = value
    }
    
    func next(_ value: Int) -> ListNode {
        let node = ListNode(value)
        next = node
        return node
    }
}

func reverseList(_ head: ListNode?) -> ListNode? {
    var reversedHead: ListNode? = nil
    var node: ListNode? = head
    var prev: ListNode? = nil
    while node != nil {
        let next = node?.next
        if next == nil {
            reversedHead = node
        }
        node?.next = prev
        prev = node
        node = next
    }
    return reversedHead
}

func traverseList(_ head : ListNode?) {
    var node = head
    while node != nil {
        print(node?.value ?? 0)
        node = node?.next
    }
}


let head = ListNode(1)
head.next(2).next(3).next(4).next(5)
print("原链表:")
traverseList(head)

let newHead = reverseList(head)
print("反转链表:")
traverseList(newHead)
```   