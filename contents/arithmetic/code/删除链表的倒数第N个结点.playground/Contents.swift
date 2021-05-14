import UIKit

/*
 题目：给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
 
 进阶：你能尝试使用一趟扫描实现吗？
 
 示例：
 输入：head = [1,2,3,4,5], n = 2
 输出：[1,2,3,5]
 
 时间复杂度：O(L)，其中 L 是链表的长度 空间复杂度：O(1)
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

// 快慢指针
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy = ListNode.init(0)
    dummy.next = head
    
    var fast = dummy
    var slow = dummy
    for _ in 0..<n {
        fast = fast.next!
    }
    while fast.next != nil {
        fast = fast.next!
        slow = slow.next!
    }
    slow.next = slow.next!.next
    return dummy.next
}

//1.     1->2->3->4->5
//2.  0->1->2->3->4->5

// slow/fast
//    |
//3.  0->1->2->3->4->5

//  slow   fast
//    |     |
//4.  0->1->2->3->4->5

//     slow   fast
//       |     |
//5.  0->1->2->3->4->5

//        slow   fast
//          |     |
//6.  0->1->2->3->4->5

//            slow  fast
//             |     |
//6.  0->1->2->3->4->5->nil

func traverseList(_ head: ListNode?) {
    var node = head
    while node != nil {
        print(node?.val ?? 0)
        node = node?.next
    }
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

if let node = removeNthFromEnd(head, 2) {
    traverseList(node)
}

