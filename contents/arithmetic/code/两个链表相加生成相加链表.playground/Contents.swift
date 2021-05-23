import UIKit

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

// 个位排在链表首部:
// 7->1->6
// 5->9->2

// 0      -> nil
// result -> nil

// reuslt -> 2
// 0      -> 2
//           result

//           reuslt -> 1
// 0      -> 2      -> 1
//                     result
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var head1 = l1, head2 = l2
    let dummy = ListNode(0)
    
    var result = dummy
    
    var sum = 0
    var carry = 0
    
    while head1 != nil || head2 != nil {
        sum = (head1?.val ?? 0) + (head2?.val ?? 0) + carry
        carry = sum / 10
        
        head1 = head1?.next
        head2 = head2?.next
        
        result.next = ListNode(sum % 10)
        result = result.next!
    }
    
    if carry > 0 {
        result.next = ListNode(carry)
        result = result.next!
    }
    return dummy.next
}

let head1 = ListNode(7)
head1.next(1).next(6)

let head2 = ListNode(5)
head2.next(9).next(2)

if let result = addTwoNumbers(head1, head2) {
    print("head1+head2")
    traverseList(result)
}

// 个位排在链表首部:
// 9<-3<-7
//    6<-3

// result
// 0       -> result
// result  -> nil

// 0       -> 0
// result

// 0       -> 0 -> 0
// result

// 1       -> 0 -> 0 -> 0
// result
func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var head1 = reverseList(l1), head2 = reverseList(l2)
    var result: ListNode? = nil
    
    var sum = 0
    var carry = 0
    
    while head1 != nil || head2 != nil {
        sum = (head1?.val ?? 0) + (head2?.val ?? 0) + carry
        carry = sum / 10
        
        head1 = head1?.next
        head2 = head2?.next
        
        let temp = ListNode(sum % 10)
        temp.next = result
        result = temp
    }
    
    if carry > 0 {
        let temp = ListNode(carry)
        temp.next = result
        result = temp
    }
    return result
}

let head3 = ListNode(9)
head3.next(3).next(7)

let head4 = ListNode(6)
head4.next(3)

if let result = addTwoNumbers2(head3, head4) {
    print("head3+head4")
    traverseList(result)
}

func reverseList(_ head: ListNode?) -> ListNode? {
    var reversedHead: ListNode? = nil
    var node: ListNode? = head
    var prev: ListNode? = nil
    while node != nil {
        let next = node?.next
        if next == nil {
            reversedHead = node
        }
        node?.next = prev
        prev = node
        node = next
    }
    return reversedHead
}

func traverseList(_ head: ListNode?) {
    var node = head
    while node != nil {
        print(node?.val ?? 0)
        node = node?.next
    }
}
