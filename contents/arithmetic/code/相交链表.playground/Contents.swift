import UIKit

/*
 题目：编写一个程序，找到两个单链表相交的起始节点。
 
 示例：输入：intersectVal = 8, listA = [4,1,8,4,5], listB = [5,0,1,8,4,5], skipA = 2, skipB = 3
 输出：Reference of the node with value = 8
 输入解释：相交节点的值为 8 （注意，如果两个链表相交则不能为 0）。从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,0,1,8,4,5]。在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。
 
 时间复杂度：O(m+n) 空间复杂度：O(1)
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

//func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
//    var set = Set<ListNode>()
//    var node = headA
//    while node != nil {
//        set.insert(node!)
//        node = node?.next
//    }
//    node = headB
//
//    while node != nil {
//        if set.contains(node!) {
//            break
//        }
//        node = node?.next
//    }
//    return node
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


//     4 → 1 ↘
//            8 → 4 → 5
// 5 → 0 → 1 ↗

// ↓   →                                  ↓
// 4 → 1 → 8 → 4 → 5        → 5 → 0 → 1 → 8 → 4 → 5

// ↓   →                              ↓
// 5 → 0 → 1 → 8 → 4 → 5    → 4 → 1 → 8 → 4 → 5

// 快慢指针
func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var node1 = headA
    var node2 = headB
    while node1 !== node2 {
        node1 = (node1 != nil) ? node1?.next : headB
        node2 = (node2 != nil) ? node2?.next : headA
    }
    return node1
}

let headA = ListNode(4)
let node1 = ListNode(1)
let node2 = ListNode(8)
let node3 = ListNode(4)
let node4 = ListNode(5)
headA.next = node1
node1.next = node2
node2.next = node3
node3.next = node4

let headB = ListNode(5)
let node5 = ListNode(0)
let node6 = ListNode(1)
headB.next = node5
node5.next = node6
node6.next = node2
node2.next = node3
node3.next = node4

if let res = getIntersectionNode(headA, headB) {
    print(res.val)
}
