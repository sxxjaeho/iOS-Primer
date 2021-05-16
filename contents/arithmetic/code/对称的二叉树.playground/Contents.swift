import UIKit

/*
 题目：请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。
 
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

func isSymmetrical(_ root: BinaryTreeNode?) -> Bool{
    return isSymmetrical(root, root)
}

func isSymmetrical(_ node1: BinaryTreeNode?, _ node2: BinaryTreeNode?) -> Bool {
    if node1 == nil && node2 == nil {
        return true
    }
    if node1 == nil || node2 == nil {
        return false
    }
    if node1?.value != node2?.value {
        return false
    }
    
    return isSymmetrical(node1?.left, node2?.right) &&
            isSymmetrical(node1?.right, node2?.left)
}

let root = BinaryTreeNode(value: 8, left: BinaryTreeNode(value: 6, left: BinaryTreeNode(value: 5, left: nil, right: nil), right: BinaryTreeNode(value: 7, left: nil, right: nil)), right: BinaryTreeNode(value: 6, left: BinaryTreeNode(value: 7, left: nil, right: nil), right: BinaryTreeNode(value: 5, left: nil, right: nil)))
let root1 = BinaryTreeNode(value: 7, left: BinaryTreeNode(value: 7, left: BinaryTreeNode(value: 7, left: nil, right: nil), right: BinaryTreeNode(value: 7, left: nil, right: nil)), right: BinaryTreeNode(value: 7, left: BinaryTreeNode(value: 7, left: nil, right: nil), right: nil))
print(isSymmetrical(root))
print(isSymmetrical(root1))



