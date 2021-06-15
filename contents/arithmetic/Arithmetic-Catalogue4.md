
   * [牛客题霸-客户端爱考](#牛客题霸-客户端爱考)
      * [NC40.两个链表相加生成相加链表](#NC40两个链表相加生成相加链表)
      * [NC41.最长无重复子数组](#NC41最长无重复子数组)
      * [NC69.链表中倒数第k个结点](#NC69链表中倒数第k个结点)
      * [NC88.寻找第K大](#NC88寻找第K大)
      * [NC127.最长公共子串](#NC127最长公共子串)

# 牛客题霸-客户端爱考
[牛客题霸-客户端爱考](https://www.nowcoder.com/activity/oj)

## NC40.两个链表相加生成相加链表
[两个链表相加生成相加链表.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/两个链表相加生成相加链表.playground)

[题目](https://www.nowcoder.com/practice/c56f6c70fb3f4849bc56e33ff2a50b6b)：假设链表中每一个节点的值都在 0 - 9 之间，那么链表整体就可以代表一个整数。
给定两个这种链表，请生成代表两个整数相加值的结果链表。

示例：

```
输入：[9,3,7],[6,3]
数出：{1,0,0,0}
解释：链表 1 为 9->3->7，链表 2 为 6->3，最后生成新的结果链表为 1->0->0->0
```

```
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
```

**时间复杂度：O(max(n, m))
空间复杂度：O(1)**

***

## NC41.最长无重复子数组
[最长无重复子数组.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/最长无重复子数组.playground)

[题目](https://www.nowcoder.com/practice/b56799ebfd684fb394bd315e89324fb4)：给定一个数组arr，返回arr的最长无重复元素子数组的长度，无重复指的是所有数字都不相同。
子数组是连续的，比如[1,2,3,4,5]的子数组有[1,2]，[2,3,4]等等，但是[1,3,4]不是子数组

示例：

```
输入：[2,3,4,5]
输出：4
```

```
func maxLength ( _ arr: [Int]) -> Int {
    guard arr.count > 0 else {
        return 0
    }
    
    var dic = [Int : Int]()
    var start = 0, length = 0;
    
    for end in 0..<arr.count {
        let num = arr[end]
        if let dummy = dic[num] {
            start = max(dummy, start)
        }
        length = max(end - start + 1, length)
        
        dic[num] = end + 1
    }
    return length
}
```

**时间复杂度：O(n) 空间复杂度：O(n)**

***

## NC69.链表中倒数第k个结点

[链表中倒数第k个结点.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/链表中倒数第k个结点.playground)

[题目](https://www.nowcoder.com/practice/529d3ae5a407492994ad2a246518148a)：输入一个链表，输出该链表中倒数第k个结点。

示例：

```
输入：1,{1,2,3,4,5}
输出：{5}
```

```
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
```

**时间复杂度：O(L)，其中 L 是链表的长度
空间复杂度：O(1)**

***

## NC88.寻找第K大

[寻找第K大.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/寻找第K大.playground)

[题目](https://www.nowcoder.com/practice/529d3ae5a407492994ad2a246518148a)有一个整数数组，请你根据快速排序的思路，找出数组中第K大的数。
给定一个整数数组a,同时给定它的大小n和要找的K(K在1到n之间)，请返回第K大的数，保证答案存在。

示例：

```
输入：[1,3,5,2,2],5,3
输出：2
```

```
func findKth ( _ a: [Int],  _ n: Int,  _ K: Int) -> Int {
    let sorted = a.sorted()
    return sorted[n-K]
}
```

**时间复杂度：O(nlogn)) 空间复杂度：O(logn)**

***

## NC127.最长公共子串

[最长公共子串.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/最长公共子串.playground)

[题目](https://www.nowcoder.com/practice/f33f5adc55f444baa0e0ca87ad8a6aac)：给定两个字符串str1和str2,输出两个字符串的最长公共子串
题目保证str1和str2的最长公共子串存在且唯一。

示例：

```
输入: "1AB2345CD","12345EF"
输出: "2345"
```

```
func LCS ( _ str1: String,  _ str2: String) -> String {
    let char1 = Array(str1)
    let char2 = Array(str2)
    
    var dp = Array(repeating: Array(repeating: 0, count: char2.count+1), count: char1.count+1)
    
    var resLen = 0
    var endIndex = 0
    for i in 1...str1.count {
        for j in 1...str2.count {
            if char1[i-1] == char2[j-1] {
                dp[i][j] = dp[i-1][j-1] + 1
                if dp[i][j] > resLen {
                    resLen = dp[i][j]
                    endIndex = j - 1
                }
            } else {
                dp[i][j] = 0
            }
        }
    }
    return String(char2[endIndex-resLen+1...endIndex])
}
```

**时间复杂度：O(N x M) 空间复杂度：O(N x M)**

***