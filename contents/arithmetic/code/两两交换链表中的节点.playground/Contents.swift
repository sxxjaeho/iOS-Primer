import UIKit


/*
 题目：给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 
 示例:
 给定 1->2->3->4, 你应该返回 2->1->4->3.
 
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

func swapPairs(_ head: ListNode?) -> ListNode? {
    let dumb = ListNode(0)
    dumb.next = head
    // 交换两个节点前的前一个节点 = 空节点
    var prev = dumb
    while prev.next != nil && prev.next?.next != nil {
        // 1
        let a = prev.next!
        // 2
        let b = a.next!
        // 空节点->2
        prev.next = b
        // 1->3
        a.next = b.next
        // 2->1
        b.next = a
        // 交换两个节点前的前一个节点 = 2
        prev = a
    }
    return dumb.next
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
if let result = swapPairs(head) {
    traverseList(result)
}
