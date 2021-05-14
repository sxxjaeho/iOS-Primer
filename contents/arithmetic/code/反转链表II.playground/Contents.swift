import UIKit

/*
 题目：给你单链表的头指针 head 和两个整数 left 和 right ，其中 left <= right 。请你反转从位置 left 到位置 right 的链表节点，返回 反转后的链表 。

 示例：
 输入：head = [1,2,3,4,5], left = 2, right = 4
 输出：[1,4,3,2,5]
 
 时间复杂度：O(n) 空间复杂度：O(n)
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

func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
    guard head != nil else {
        return nil
    }
    
    let reversedHead = ListNode.init(0)
    reversedHead.next = head!
    
    var prevNode = reversedHead
    for _ in 1..<left {
        prevNode = prevNode.next!
    }
    // 1->2->3->4->5
    let curNode = prevNode.next
    // curNode=2 next=3
    // 1->2->4->5  // 3前后断环
    // 3->2->4->5
    // 1->3
    
    // 1->3->2->4->5
    for _ in left..<right {
        let next = curNode?.next
        curNode?.next = next?.next
        
        next?.next = prevNode.next
        prevNode.next = next
    }
    
    return reversedHead.next
}
