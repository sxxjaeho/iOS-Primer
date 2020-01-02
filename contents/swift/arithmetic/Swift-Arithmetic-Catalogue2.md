
   * [LeetCode-部分算法题解](#LeetCode-部分算法题解)
      * [236.二叉树的最近公共祖先](#236二叉树的最近公共祖先)

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

