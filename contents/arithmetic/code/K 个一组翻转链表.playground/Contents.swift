import UIKit

/* 题目：给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
 
 k 是一个正整数，它的值小于或等于链表的长度。
 
 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。
 
 进阶：
 
 你可以设计一个只使用常数额外空间的算法来解决此问题吗？
 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
 
 示例：
 输入：head = [1,2,3,4,5], k = 2
 输出：[2,1,4,3,5]
 
 **时间复杂度：O(n) 空间复杂度：O(1)**
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

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    let dummy: ListNode = ListNode(0)
    dummy.next = head
    
    var pre: ListNode? = dummy   // pre 0
    var tail: ListNode? = dummy  // tail 0
    
    while tail != nil {
        for _ in 1...k {
            if tail == nil { break }
            tail = tail?.next             // tail 2
        }
        if tail == nil { break }
        
        let head: ListNode? = pre?.next   // head 1
        let next: ListNode? = tail?.next  // next 3
        
        tail?.next = nil                  // 尾部断链
        pre?.next = reverse(head)         // 反转后的头部
        head?.next = next                 // 尾部连链
        
        pre = head                        // pre 1
        tail = head                       // tail 1
    }
    return dummy.next
}

// 1,2
func reverse(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    let temp = reverse(head?.next) // temp 2
    head?.next?.next = head        // 1->2  =>  1->2->1  =>  1 2->1
    head?.next = nil
    return temp
}

//func reverseKGroup1(_ head: ListNode?, _ k: Int) -> ListNode? {
//    let dummy: ListNode? = ListNode(0)
//    dummy?.next = head
//    var prev = dummy
//
//    for _ in 1...k {
//        if prev?.next != nil {
//            prev = prev?.next
//        } else {
//            return head
//        }
//    }
//
//    prev = reverseKGroup1(prev?.next, k)
//
//    for _ in 1...k {
//        let tmp = dummy?.next?.next       // 145
//        dummy?.next?.next = prev          // 2145
//        prev = dummy?.next                // 32145
//        dummy?.next = tmp
//    }
//    return prev
//}

func traverseList(_ head : ListNode?) {
    var node = head
    while node != nil {
        print(node?.value ?? 0)
        node = node?.next
    }
}

let head = ListNode(1)
head.next(2).next(3).next(4).next(5)
if let result = reverseKGroup(head, 2) {
    traverseList(result)
}
