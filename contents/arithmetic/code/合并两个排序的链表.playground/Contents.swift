import UIKit

/*
 题目：输入两个递增排序的链表，合并这两个链表并使新链表中的结点仍然是按照递增排序的。例如输入如下链表1和链表2，则合并之后的升序链表如链3所示。链表节点定义如下：
 链表1：1 -> 3 -> 5 -> 7
 链表2：2 -> 4 -> 6 -> 8
 链表3：1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7 -> 8
 
 时间复杂度：O(M+N)，M，N 分别为链表l1，l2的长度，合并操作需遍历两链表。
 空间复杂度：O(1)
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

func merge(_ head1: ListNode?, _ head2: ListNode?) -> ListNode? {
    if head1 == nil {
        return head2
    } else if head2 == nil {
        return head1
    }
    var newHead: ListNode? = nil
    if head1!.value < head2!.value {
        newHead = head1
        newHead?.next = merge(head1?.next, head2)
    } else {
        newHead = head2
        newHead?.next = merge(head1, head2?.next)
    }
    return newHead
}

func traverseList(_ head : ListNode?) {
    var node = head
    while node != nil {
        print(node?.value ?? 0)
        node = node?.next
    }
}

print("链表1:")
let head1 = ListNode(1)
head1.next(3).next(5).next(7)
traverseList(head1)

print("链表2:")
let head2 = ListNode(2)
head2.next(4).next(6).next(8)
traverseList(head2)

let newHead = merge(head1, head2)
print("合并链表:")
traverseList(newHead)

