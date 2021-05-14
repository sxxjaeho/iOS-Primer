import UIKit

/*
 题目：给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
 
 示例：
 输入：head = [1,2,3,4,5]
 输出：[5,4,3,2,1]
 
 时间复杂度：O(n) 空间复杂度：O(1)
 */

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

func traverseList(_ head: ListNode?) {
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

