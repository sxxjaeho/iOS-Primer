import UIKit

/*
 题目：输入一个链表，输出该链表中倒数第k个结点。
 
 示例：
 输入：1,{1,2,3,4,5}
 输出：{5}
 
 时间复杂度：O(n) 空间复杂度：O(n)
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

func FindKthToTail ( _ k: Int,  _ head: ListNode?) -> ListNode? {
    let dummy = ListNode.init(0)
    dummy.next = head
    
    var slow = dummy
    var fast = dummy
    for _ in 0..<k {
        if fast.next != nil {
            fast = fast.next!
        } else {
            return nil
        }
    }
    while fast.next != nil {
        slow = slow.next!
        fast = fast.next!
    }
    return slow.next
}

let head = ListNode(1)
let node1 = ListNode(2)
let node2 = ListNode(3)
let node3 = ListNode(4)
let node4 = ListNode(5)
head.next = node1
node1.next = node2
node2.next = node3
node3.next = node4

if let node = FindKthToTail(2, head) {
    print(node.val)
}

//
// 1 -> 2 -> 3 -> 4 -> 5

// slow/fast
//   0      -> 1 -> 2 -> 3 -> 4 -> 5

// slow       fast
//   0 -> 1 -> 2 -> 3 -> 4 -> 5

//       slow      fast
//   0 -> 1 -> 2 -> 3 -> 4 -> 5

//            slow      fast
//   0 -> 1 -> 2 -> 3 -> 4 -> 5

//                 slow     fast
//   0 -> 1 -> 2 -> 3 -> 4 -> 5
