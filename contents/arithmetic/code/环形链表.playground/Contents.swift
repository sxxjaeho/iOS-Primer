import UIKit

// 题目：给定一个链表，判断链表中是否有环。
// 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
/*
示例 1：

输入：head = [3,2,0,-4], pos = 1
输出：true
解释：链表中有一个环，其尾部连接到第二个节点。

示例 2：
输入：head = [1,2], pos = 0
输出：true
解释：链表中有一个环，其尾部连接到第一个节点。

示例 3：
输入：head = [1], pos = -1
输出：false
解释：链表中没有环。
**/

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

func hasCycle(_ head: ListNode?) -> Bool {
    if (head == nil || head?.next == nil) {
        return false
    }
    // 慢指针
    var slow = head
    // 快指针
    var fast = head?.next
    while(slow !== fast) { // 快慢指针未相遇(比较其内存地址可采用"===")
        if (fast ==  nil || fast?.next == nil) {
           return false
        }
        slow = slow?.next
        fast = fast?.next?.next
    }
    return true
}

let head = ListNode(3)
let node1 = ListNode(2)
let node2 = ListNode(0)
let node3 = ListNode(-4)
head.next = node1
node1.next = node2
node2.next = node3
node3.next = node1

//let head = ListNode(1)
//let node1 = ListNode(2)
//head.next = node1
//node1.next = head

//let head = ListNode(1)

print(hasCycle(head))
