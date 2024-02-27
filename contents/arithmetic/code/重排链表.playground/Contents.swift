import UIKit

/*
 给定一个单链表 L 的头节点 head ，单链表 L 表示为：
 
 L0 → L1 → … → Ln - 1 → Ln
 请将其重新排列后变为：
 
 L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
 不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 
 示例 1：
 输入：head = [1,2,3,4]
 输出：[1,4,2,3]
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

func traverseList(_ head : ListNode?) {
    var node = head
    while node != nil {
        print(node?.value ?? 0)
        node = node?.next
    }
}

// 线性表:利用线性表存储该链表，然后利用线性表可以下标访问的特点，直接按顺序访问指定元素，重建该链表即可
// 时间复杂度：O(N)，空间复杂度：O(N)
func reorderList(_ head: ListNode?) {
    var list = [ListNode]()
    var node = head
    
    while node != nil {
        list.append(node!)
        node = node!.next
    }
    
    // list:[1,2,3,4]
    var left = 0
    var right = list.count - 1
    var current:ListNode? = nil
    
    while left <= right {
        // 1. nil -> 1
        // 2. nil -> 1 -> 4 -> 2
        current?.next = list[left]
        current = list[left]
        
        // 1. nil -> 1 -> 4
        // 2. nil -> 1 -> 4 -> 2 -> 3
        current?.next = list[right]
        current = list[right]
        left += 1
        right -= 1
    }
    current?.next = nil
}

let head = ListNode(1)
head.next(2).next(3).next(4)
reorderList(head)
traverseList(head)

// 寻找链表中点 + 链表逆序 + 合并链表
// 时间复杂度：O(N)，空间复杂度：O(1)
func reorderList1(_ head: ListNode?) {
    guard let head = head else {
        return
    }
    let mid = middleNode(head)!
    // mid:2
    var l1 = head
    var l2 = mid.next
    mid.next = nil
    l2 = reverseList(l2)
    // l2:4->3
    mergeList(l1, l2)
    // 1->4->2->3
}

// 链表的中间结点
func middleNode(_ head: ListNode?) -> ListNode? {
    guard let head = head else {
        return nil
    }
    var slow = head
    var fast = head
    while fast.next != nil && fast.next!.next != nil {
        slow = slow.next!
        fast = fast.next!.next!
    }
    return slow
}

// 反转链表
func reverseList(_ head: ListNode?) -> ListNode? {
    guard let head = head else {
        return nil
    }
    
    var prev:ListNode? = nil
    var curr:ListNode? = head
    while curr != nil {
        let nextTemp = curr!.next
        curr!.next = prev
        prev = curr
        curr = nextTemp
    }
    return prev
}
// 合并链表
func mergeList(_ l1:ListNode?, _ l2:ListNode?) {
    var l1 = l1
    var l2 = l2
    var l1_tmp :ListNode? = nil
    var l2_tmp :ListNode? = nil
    
    while l1 != nil && l2 != nil {
        l1_tmp = l1!.next
        l2_tmp = l2!.next
        
        l1!.next = l2
        l1 = l1_tmp
        
        l2!.next = l1
        l2 = l2_tmp
    }
}

let head1 = ListNode(1)
head1.next(2).next(3).next(4)
reorderList1(head1)
traverseList(head1)
