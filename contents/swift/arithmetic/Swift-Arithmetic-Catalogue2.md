
   * [LeetCode-部分算法题解](#LeetCode-部分算法题解)
      * [100.相同的树](#100相同的树)
      * [141.环形链表](#141环形链表)
      * [226.翻转二叉树](#226翻转二叉树)
      * [236.二叉树的最近公共祖先](#236二叉树的最近公共祖先)
      * [480.滑动窗口中位数](#480滑动窗口中位数)

# LeetCode-部分算法题解

## 100.相同的树

[相同的树.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/swift/arithmetic/code/相同的树.playground)

题目：给定两个二叉树，编写一个函数来检验它们是否相同。

如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。

示例 1:

```
输入:       1         1
          / \       / \
         2   3     2   3

        [1,2,3],   [1,2,3]

输出: true
```

示例 2:

```
输入:      1          1
          /           \
         2             2

        [1,2],     [1,null,2]

输出: false
```

示例 3:

```
输入:       1         1
          / \       / \
         2   1     1   2

        [1,2,1],   [1,1,2]

输出: false
```

```
class BinaryTreeNode {
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    var value: Int
    
    init(value: Int, left: BinaryTreeNode?, right: BinaryTreeNode?) {
        self.value = value
        self.left = left
        self.right = right
    }
}

func isSameTree(_ node1: BinaryTreeNode?, _ node2: BinaryTreeNode?) -> Bool {
    if node1 == nil && node2 == nil {
        return true
    }
    if node1 == nil || node2 == nil {
        return false
    }
    if node1!.value != node2!.value {
        return false
    }
    return isSameTree(node1!.left, node2!.left) && isSameTree(node1!.right, node2!.right)
}

let node1 = BinaryTreeNode(value: 1, left: BinaryTreeNode(value: 2, left: nil, right: nil), right: BinaryTreeNode(value: 3, left: nil, right: nil))
let node2 = BinaryTreeNode(value: 1, left: BinaryTreeNode(value: 2, left: nil, right: nil), right: BinaryTreeNode(value: 3, left: nil, right: nil))
let node3 = BinaryTreeNode(value: 1, left: BinaryTreeNode(value: 2, left: nil, right: nil), right: nil)
let node4 = BinaryTreeNode(value: 1, left: nil, right: BinaryTreeNode(value: 3, left: nil, right: nil))
let node5 = BinaryTreeNode(value: 1, left: BinaryTreeNode(value: 2, left: nil, right: nil), right: BinaryTreeNode(value: 1, left: nil, right: nil))
let node6 = BinaryTreeNode(value: 1, left: BinaryTreeNode(value: 1, left: nil, right: nil), right: BinaryTreeNode(value: 3, left: nil, right: nil))

print(isSameTree(node1, node2))
print(isSameTree(node3, node4))
print(isSameTree(node5, node6))
```

***

## 141.环形链表

[环形链表.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/swift/arithmetic/code/环形链表.playground)

题目：给定一个链表，判断链表中是否有环。

为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。

示例 1：

```
输入：head = [3,2,0,-4], pos = 1
输出：true
解释：链表中有一个环，其尾部连接到第二个节点。
```

示例 2：

```
输入：head = [1,2], pos = 0
输出：true
解释：链表中有一个环，其尾部连接到第一个节点。
```

示例 3：

```
输入：head = [1], pos = -1
输出：false
解释：链表中没有环。
```

```
// 双指针解法
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
    var slow = head
    var fast = head?.next
    while(slow !== fast) {
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

print(hasCycle(head))
```

***

## 226.翻转二叉树

[翻转二叉树.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/swift/arithmetic/code/翻转二叉树.playground)

题目：翻转一棵二叉树。
输入：

```
     4
   /   \
  2     7
 / \   / \
1   3 6   9
```

输出：

```
     4
   /   \
  7     2
 / \   / \
9   6 3   1
```

```
class BinaryTreeNode {
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    var value: Int
    
    init(value: Int, left: BinaryTreeNode?, right: BinaryTreeNode?) {
        self.value = value
        self.left = left
        self.right = right
    }
}

func invertTree(_ root: BinaryTreeNode?) -> BinaryTreeNode? {
    if root == nil {
        return nil
    }
    
    let temp = root!.left
    root!.left = root!.right
    root!.right = temp
    
    invertTree(root?.left)
    invertTree(root?.right)
    
    return root
}

// 二叉树前序遍历
func preorderTraversal(_ root: BinaryTreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var res: [Int] = []
    res.append(root.value)
    res += preorderTraversal(root.left)
    res += preorderTraversal(root.right)
    
    return res
}

let root = BinaryTreeNode(value: 4, left: BinaryTreeNode(value: 2, left:  BinaryTreeNode(value: 1, left: nil, right: nil), right: BinaryTreeNode(value: 3, left: nil, right: nil)), right: BinaryTreeNode(value: 7, left:  BinaryTreeNode(value: 6, left: nil, right: nil), right: BinaryTreeNode(value: 9, left: nil, right: nil)))
print(preorderTraversal(root))

let invertRoot = invertTree(root)
print(preorderTraversal(invertRoot))

// 二叉树中序遍历
func inorderTraversal(_ root: BinaryTreeNode?) -> [Int] {
    guard let root = root else { return [] }

    var res: [Int] = []
    res += inorderTraversal(root.left)
    res.append(root.value)
    res += inorderTraversal(root.right)
    
    return res
}

// 二叉树后序遍历
func postorderTraversal(_ root: BinaryTreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var res: [Int] = []
    res += postorderTraversal(root.left)
    res += postorderTraversal(root.right)
    res.append(root.value)
    
    return res
}
 
```

***

## 236.二叉树的最近公共祖先

[二叉树的最近公共祖先.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/swift/arithmetic/code/二叉树的最近公共祖先.playground)

题目：给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]

![二叉树的最近公共祖先](media/Swift-Arithmetic-Catalogue2/二叉树的最近公共祖先.png)

```
class BinaryTreeNode {
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    var value: Int
    
    init(value: Int, left: BinaryTreeNode?, right: BinaryTreeNode?) {
        self.value = value
        self.left = left
        self.right = right
    }
}

var lowestCommonAncestor: BinaryTreeNode?

func recurseTree(_ root: BinaryTreeNode?, _ node1: BinaryTreeNode?, _ node2: BinaryTreeNode?) -> Bool {
    
    guard root != nil else {
       return false
    }

    let left = recurseTree(root?.left, node1, node2) ? 1 : 0

    let right = recurseTree(root?.right, node1, node2) ? 1 : 0

    let mid = (root?.value == node1?.value || root?.value == node2?.value) ? 1 : 0
    
    if mid + left + right >= 2 {
        lowestCommonAncestor = root
    }

    return (mid + left + right > 0)
}

func lowestCommonAncestor(_ root: BinaryTreeNode?, _ node1: BinaryTreeNode?, _ node2: BinaryTreeNode?) {
    recurseTree(root, node1, node2)
}

let root = BinaryTreeNode(value: 3, left: BinaryTreeNode(value: 5, left: BinaryTreeNode(value: 6, left: nil, right: nil), right: BinaryTreeNode(value: 2, left: BinaryTreeNode(value: 7, left: nil, right: nil), right: BinaryTreeNode(value: 4, left: nil, right: nil))), right: BinaryTreeNode(value: 1, left: BinaryTreeNode(value: 0, left: nil, right: nil), right: BinaryTreeNode(value: 8, left: nil, right: nil)))

lowestCommonAncestor(root, BinaryTreeNode(value: 5, left: BinaryTreeNode(value: 6, left: nil, right: nil), right: BinaryTreeNode(value: 2, left: BinaryTreeNode(value: 7, left: nil, right: nil), right: BinaryTreeNode(value: 4, left: nil, right: nil))), BinaryTreeNode(value: 1, left: BinaryTreeNode(value: 0, left: nil, right: nil), right: BinaryTreeNode(value: 8, left: nil, right: nil)))

print(lowestCommonAncestor?.value ?? 0)
```

***

## 443.压缩字符串

[压缩字符串.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/swift/arithmetic/code/压缩字符串.playground)

题目：给定一组字符，使用原地算法将其压缩。
压缩后的长度必须始终小于或等于原数组长度。
数组的每个元素应该是长度为1 的字符（不是 int 整数类型）。
在完成原地修改输入数组后，返回数组的新长度。

示例 1：

```
输入：
["a","a","b","b","c","c","c"]

输出：
返回6，输入数组的前6个字符应该是：["a","2","b","2","c","3"]

说明：
"aa"被"a2"替代。"bb"被"b2"替代。"ccc"被"c3"替代。
```

```
func compress(_ chars: inout[Character]) {
    if chars.isEmpty { return }
    var length = 0, count = 1
    for i in 0..<chars.count {
        if i == chars.count - 1 || chars[i] != chars[i+1] {
            chars[length] = chars[i]
            length += 1
            if count > 1 {
                for char in String(count) {
                    chars[length] = char
                    length += 1
                }
                count = 1
            }
        } else {
           count += 1
        }
    }
    chars = Array(chars.prefix(upTo: length))
}

var chars = Array("aaabbccc")
compress(&chars)
print(String(chars))
```

***

## 480.滑动窗口中位数

[滑动窗口中位数.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/swift/arithmetic/code/滑动窗口中位数.playground)

题目：中位数是有序序列最中间的那个数。如果序列的大小是偶数，则没有最中间的数；此时中位数是最中间的两个数的平均数。

例如：
[2,3,4]，中位数是 3
[2,3]，中位数是 (2 + 3) / 2 = 2.5

给出一个数组 nums，有一个大小为 k 的窗口从最左端滑动到最右端。窗口中有 k 个数，每次窗口移动 1 位。你的任务是找出每次窗口移动后得到的新窗口中元素的中位数，并输出由它们组成的数组。

例如：
给出 nums = [1,3,-1,-3,5,3,6,7]，以及 k = 3。

```
窗口位置                       中位数
---------------------------   -----
[1  3  -1] -3  5  3  6  7       1
 1 [3  -1  -3] 5  3  6  7      -1
 1  3 [-1  -3  5] 3  6  7      -1
 1  3  -1 [-3  5  3] 6  7       3
 1  3  -1  -3 [5  3  6] 7       5
 1  3  -1  -3  5 [3  6  7]      6
```
因此，返回该滑动窗口的中位数数组 [1,-1,-1,3,5,6]。

```
var max = Heap<Int>(sort: >)
var min = Heap<Int>(sort: <)

func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double]? {
    if nums.count == 0 { return nil }
    
    var res = [Double]()
    
    for (index, value) in nums.enumerated() {
        if max.isEmpty || value <= max.peek()! {
            max.insert(value)
        } else {
            min.insert(value)
        }
        
        balance()
        
        let removeIndex = index - k
        if removeIndex >= 0 {
            if nums[removeIndex] > max.peek()! {
                min.remove(node: nums[removeIndex])
            } else {
                max.remove(node: nums[removeIndex])
            }
        }
        
        balance()
        
        if index >= k - 1 {
            if k % 2 == 0 {
                res.append(Double((min.peek()! + max.peek()!)) / 2)
            } else {
                res.append(Double(min.peek()!))
            }
        }
    }
    
    return res
}

func balance() {
    if max.count < min.count - 1 {
        max.insert(min.remove()!)
    }
    if min.count < max.count {
        min.insert(max.remove()!)
    }
}

let array = [1, 3, -1, -3, 5, 3, 6, 7]
print(medianSlidingWindow(array, 3) ?? [])
```

***

## 704.二分查找

[二分查找.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/swift/arithmetic/code/二分查找.playground)

题目：给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。

示例 1:

```
输入: nums = [-1,0,3,5,9,12], target = 9
输出: 4
解释: 9 出现在 nums 中并且下标为 4
```

```
func search(_ nums: [Int], _ target: Int) -> Int? {
    guard nums.count != 1 else {
        return 0
    }
    
    var lo = 0, hi = nums.count - 1
    while lo <= hi {
        let mid = lo + (hi - lo) / 2
        if nums[mid] == target {
            return mid
        } else if nums[mid] < target {
            lo = mid + 1
        } else {
            hi = mid - 1
        }
    }
    return nil
}

let nums = [-1, 0, 3, 5, 9, 12]
print(search(nums, 9) as Any)
```

***

## 912.排序数组

[排序数组.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/swift/arithmetic/code/排序数组.playground)

题目：给定一个整数数组 nums，将该数组升序排列。

示例 1：

```
输入：[5,2,3,1]
输出：[1,2,3,5]
```

```
//// 冒泡排序
//func sortArray(_ nums: inout [Int]) {
//    guard nums.count > 1 else {
//        return
//    }
//    for i in 0..<nums.count - 1 {
//        for j in 0..<nums.count - i - 1 {
//            if nums[j] > nums[j+1] {
//                nums.swapAt(j, j+1)
//            }
//        }
//    }
//}

// 选择排序
func sortArray(_ nums: inout [Int]) {
    guard nums.count > 1 else {
        return
    }
    for i in 0..<nums.count - 1 {
        for j in i+1..<nums.count {
            if nums[i] > nums[j] {
                nums.swapAt(i, j)
            }
        }
    }
}

//// 快速排序
//func sortArray(_ nums: [Int]) -> [Int] {
//    guard nums.count > 1 else {
//        return nums
//    }
//    let pivot = nums[nums.count / 2]
//    let left = nums.filter { $0 < pivot}
//    let middle = nums.filter { $0 == pivot}
//    let right = nums.filter { $0 > pivot}
//    return sortArray(left) + middle + sortArray(right)
//}

var nums = [5, 2, 3, 1]
sortArray(&nums)
print(nums)

```

***

