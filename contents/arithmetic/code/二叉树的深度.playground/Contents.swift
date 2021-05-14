import UIKit

/*
 题目：输入一棵二叉树的根结点，求该树的深度。从根结点到叶结点依次经过的结点（含根、叶结点）形成树的一条路径，最长路径的长度为树的深度。
 
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

// dfs
func treeDepth(_ root: BinaryTreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    let left = treeDepth(root?.left)
    let right = treeDepth(root?.right)
    return max(left, right) + 1
}

let root = BinaryTreeNode(value: 1, left: BinaryTreeNode(value: 2, left: BinaryTreeNode(value: 4, left: nil, right: nil)
    , right: BinaryTreeNode(value: 5, left: BinaryTreeNode(value: 7, left: nil, right: nil), right: nil)), right: BinaryTreeNode(value: 3, left: nil, right: BinaryTreeNode(value: 6, left: nil, right: nil)))
print(treeDepth(root))
