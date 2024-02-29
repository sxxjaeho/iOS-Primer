import UIKit

/*
 题目：给定一个二叉树，判断它是否是高度平衡的二叉树。
 
 本题中，一棵高度平衡二叉树定义为：

 一个二叉树每个节点的左右两个子树的高度差的绝对值不超过 1 。

 示例：
    3
   / \
  9  20
     / \
    15  7
 
 输入：root = [3,9,20,null,null,15,7]
 输出：true
 
 时间复杂度：O(n) 空间复杂度：O(n)
 */

class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var val: Int
    
    init(val: Int, left: TreeNode?, right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func isBalanced(_ root: TreeNode?) -> Bool {
    return treeDepth(root) >= 0
}

func treeDepth(_ node: TreeNode?) -> Int {
    guard node != nil else {
        return 0
    }
    let leftHeight = treeDepth(node?.left)
    let rightHeight = treeDepth(node?.right)
    if leftHeight == -1 || rightHeight == -1 || abs(leftHeight - rightHeight) > 1 {
        return -1
    } else {
        return max(leftHeight, rightHeight) + 1
    }
}

let root = TreeNode(val: 1, left:TreeNode(val: 2, left:TreeNode(val: 3, left:TreeNode(val: 4, left:nil, right:nil), right:TreeNode(val: 4, left:nil, right:nil)), right:TreeNode(val: 3, left:nil, right:nil)), right:TreeNode(val: 2, left:nil, right:nil))
print(isBalanced(root))
