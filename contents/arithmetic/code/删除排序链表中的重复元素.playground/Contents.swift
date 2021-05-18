import UIKit

/*
 题目：
 存在一个按升序排列的链表，给你这个链表的头节点 head ，请你删除所有重复的元素，使每个元素 只出现一次 。
 
 返回同样按升序排列的结果链表。
 
 示例：
 输入：head = [1,1,2]
 输出：[1,2]
 
 时间复杂度：O(n) 空间复杂度：O(1)
 */

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
    }
    
    func next(_ val: Int) -> ListNode {
        let node = ListNode(val)
        next = node
        return node
    }
}

func deleteDuplicates(_ head: ListNode?) -> ListNode? {
    guard head != nil else {
        return nil
    }
    var cur = head
    while cur?.next != nil {
        if cur?.val == cur?.next?.val {
            cur?.next = cur?.next?.next
        } else {
            cur = cur?.next
        }
    }
    return head
}

