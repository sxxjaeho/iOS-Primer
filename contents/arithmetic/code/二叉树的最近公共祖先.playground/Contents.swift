import UIKit

/*
 题目：给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”
 例如，给定如下二叉树:  root = [3,5,1,6,2,0,8,null,null,7,4]
 
 
 示例：
 输入: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 输出: 3
 解释: 节点 5 和节点 1 的最近公共祖先是节点 3。
 
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
// 1.     (3, 5, 1)
func lowestCommonAncestor(_ root: BinaryTreeNode?, _ node1: BinaryTreeNode?, _ node2: BinaryTreeNode?) -> BinaryTreeNode? {
    if root == nil || root?.value == node1?.value || root?.value == node2?.value {
        return root
    }
    // 2.     left = (5, 5, 1) -> 5 回朔到步骤1
    let left = lowestCommonAncestor(root?.left, node1, node2)
    // 3.     right = (1, 5, 1) -> 1 回朔到步骤1
    let right = lowestCommonAncestor(root?.right, node1, node2)
    return left == nil ? right : (right == nil ? left : root)
}

let root = BinaryTreeNode(value: 3, left: BinaryTreeNode(value: 5, left: BinaryTreeNode(value: 6, left: nil, right: nil), right: BinaryTreeNode(value: 2, left: BinaryTreeNode(value: 7, left: nil, right: nil), right: BinaryTreeNode(value: 4, left: nil, right: nil))), right: BinaryTreeNode(value: 1, left: BinaryTreeNode(value: 0, left: nil, right: nil), right: BinaryTreeNode(value: 8, left: nil, right: nil)))

let node = lowestCommonAncestor(root, BinaryTreeNode(value: 5, left: BinaryTreeNode(value: 6, left: nil, right: nil), right: BinaryTreeNode(value: 2, left: BinaryTreeNode(value: 7, left: nil, right: nil), right: BinaryTreeNode(value: 4, left: nil, right: nil))), BinaryTreeNode(value: 1, left: BinaryTreeNode(value: 0, left: nil, right: nil), right: BinaryTreeNode(value: 8, left: nil, right: nil)))


if let node = node {
    print(node.value)
}


