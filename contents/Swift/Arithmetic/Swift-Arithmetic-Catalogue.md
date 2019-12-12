
[TOC]

# 算法
## 1.赋值运算符函数


## 2.实现 Singleton 模式


## 3.数组中重复的数字


## 4.二维数组中的查找


## 5.替换空格


## 6.从尾到头打印链表


## 7.重建二叉树


## 8.二叉树的下一个节点


## 9.用两个栈实现队列


## 10.斐波那契函数


## 11.旋转数组的最小数字


## 12.矩阵中的路径


## 13.机器人的运动范围


## 14.剪绳子


## 15.二进制中 1 的个数


## 16.数值的整数次方


## 17.打印从 1 到最大的 n 位数


## 18.删除链表的节点


## 19.正则表达式匹配


## 20.表示数值的字符串


## 21.调整数组顺序使奇数位于偶数前面


## 22.链表中倒数第 k 个节点


## 23.链表中环的入口节点


## 24.反转链表

[反转链表.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/Swift/Arithmetic/Code/反转链表.playground)

题目：定义一个函数，输入一个链表的头结点，反转该链表并输出反转后链表的头结点。链表节点定义如下：

```

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

func traverseList(_ head : ListNode?) {
    var node = head
    while node != nil {
        print(node?.value ?? 0)
        node = node?.next
    }
}


let head = ListNode(1).next(2).next(3).next(4).next(5)
print("原链表:")
traverseList(head)

let newHead = reverseList(head)
print("反转链表:")
traverseList(newHead)

```   

***

## 25.合并两个排序的链表

[合并两个排序的链表.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/Swift/Arithmetic/Code/合并两个排序的链表.playground)

题目：输入两个递增排序的链表，合并这两个链表并使新链表中的结点仍然是按照递增排序的。例如输入如下链表1和链表2，则合并之后的升序链表如链3所示。链表节点定义如下：
链表1：1 -> 3 -> 5 -> 7
链表2：2 -> 4 -> 6 -> 8
链表3：1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7 -> 8

```

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
let head1 = ListNode(1).next(3).next(5).next(7)
traverseList(head1)

print("链表2:")
let head2 = ListNode(2).next(4).next(6).next(8)
traverseList(head2)

let newHead = merge(head1, head2)
print("合并链表:")
traverseList(newHead)

```

***

## 26.树的子结构


## 27.二叉树的镜像


## 28.对称的二叉树


## 29.顺时针打印矩阵


## 30.包含 min 函数的栈


## 31.栈的压入、弹出序列


## 32.从上到下打印二叉树


## 33.二叉搜索树的后续遍历序列


## 34.二叉树中和为某一值的路径


## 35.复杂链表的复制


## 36.二叉搜索树与双向链表


## 37.序列化二叉树


## 38.字符串的排列


## 39.数组中出现次数超过一半的数字


## 40.最小的 k 个数


## 41.数据流中的中位数


## 42.连续子数组的最大和


## 43.1 ~ n 整数中 1 出现的次数


## 44.数字序列中某一位的数字


## 45.把数组排成最小的数


## 46.把数字翻译成字符串


## 47.礼物的最大价值


## 48.最长不含重复字符的子字符串


## 49.丑数


## 50.第一个只出现一次的字符


## 51.数组中的逆序对


## 52.两个链表的第一个公共节点


## 53.在排序数组中查找数字


## 54.二叉搜索树的第 k 大节点


## 55.二叉树深度


## 56.数组中数字出现的次数


## 57.和为 s 的数字


## 58.翻转字符串

[翻转字符串.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/Swift/Arithmetic/Code/翻转字符串.playground)

题目：输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student."，则输出"student. a am I"。

```

func reverse<T> (_ chars: inout Array<T>, _ begin: Int, _ end: Int) {
    var begin = begin
    var end = end
    
    while begin < end {
        chars.swapAt(begin, end)
        begin += 1
        end -= 1
    }
}

func reverseSentence(_ sentence: String?) -> String? {
    guard let sentence = sentence else {
        return nil
    }
    var chars = Array(sentence)
    var start = 0
    reverse(&chars, 0, chars.count - 1)
    for i in 0..<chars.count {
        if i == chars.count - 1 || chars[i + 1] == " " {
            print(i)
            reverse(&chars, start, i)
            start = i + 2
        }
    }
    return String(chars)
}

print(reverseSentence("I am a student.") ?? "")

```

***

## 59.队列的最大值


## 60.n 个骰子的点数


## 61.扑克牌中的顺子


## 62.圆圈中最后剩下的数字


## 63.股票的最大利润


## 64.求 1+2+...+n


## 65.不用加减乘除做加法


## 66.构建乘积数组


## 67.把字符串转换成整数


## 68.树中两个节点的最低公共祖先


