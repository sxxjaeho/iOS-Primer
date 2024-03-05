import UIKit

/*
 题目：给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
 
 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。注意，pos 仅仅是用于标识环的情况，并不会作为参数传递到函数中。

 说明：不允许修改给定的链表。

 进阶：

 你是否可以使用 O(1) 空间解决此题？
 
 示例：
 输入：head = [3,2,0,-4], pos = 1
 输出：返回索引为 1 的链表节点
 解释：链表中有一个环，其尾部连接到第二个节点。
 
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

//func detectCycle(_ head: ListNode?) -> ListNode? {
//    if (head == nil || head?.next == nil) {
//        return nil
//    }
//    var dummy = head
//    var set = Set<ListNode>()
//    while dummy != nil {
//        if set.contains(dummy!) {
//            return dummy
//        }
//        set.insert(dummy!)
//        dummy = dummy!.next
//    }
//    return nil
//}
//
//extension ListNode: Hashable {
//    public func hash(into hasher: inout Hasher) {
//        hasher.combine(ObjectIdentifier(self))
//    }
//}
//
//extension ListNode: Equatable {
//    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
//        return lhs === rhs
//    }
//}


// a = 起始节点 - 入环节点的距离
// b = 入环节点 - 快慢指针相遇节点的距离
// c = 快慢指针相遇节点 - 入环节点的距离
// 慢指针走过的距离 a + n(b+c) + b  =  a + (n+1)b + nc
// 快指针走过的距离 2(a+b)
// a + (n+1)b + nc = 2(a+b)
// a = nb + nc - b
// a = nb + nc - b - c + c
// a = c + (n-1)(b+c)
// 所以慢指针从快慢指针相遇节点起到入环节点的距离 = 新指针从头节点到入环节点的距离

func detectCycle(_ head: ListNode?) -> ListNode? {
    if (head == nil || head?.next == nil) {
        return nil
    }
    var slow = head
    var fast = head
    while (fast != nil && fast?.next != nil) {
        slow = slow?.next
        fast = fast?.next?.next
        if (fast === slow) {
            var ptr = head
            while ptr !== slow {
                ptr = ptr?.next
                slow = slow?.next
            }
            return ptr
        }
    }
    return nil
}

let head = ListNode(3)
let node1 = ListNode(2)
let node2 = ListNode(0)
let node3 = ListNode(-4)

head.next = node1
node1.next = node2
node2.next = node3
node3.next = node1

if let node = detectCycle(head) {
    print(node.value)
}
