import UIKit

/*
 题目：给定两个二叉树，编写一个函数来检验它们是否相同。
 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。
 
 示例：
 输入：
            1         1
           / \       / \
          2   3     2   3

         [1,2,3],   [1,2,3]

 输出：true
 
 时间复杂度：O(min(m, n)) 空间复杂度：O(min(m, n))
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


