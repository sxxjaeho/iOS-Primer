import UIKit

/*
 题目：翻转一棵二叉树。
 
 输入：
      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 
 输出：
      4
    /   \
   7     2
  / \   / \
 9   6 3   1
 
 时间复杂度：O(n) 空间复杂度：O(n)
 */

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
 

 

 
