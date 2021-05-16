import UIKit

/*
 题目：给定一个二叉树，判断其是否是一个有效的二叉搜索树。
 
 假设一个二叉搜索树具有如下特征：
 节点的左子树只包含小于当前节点的数。
 节点的右子树只包含大于当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
 
 示例:

 输入:
    2
   / \
  1   3
 输出: true
 
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

func isValidBST(_ root: BinaryTreeNode?, min : Int?, max : Int?) -> Bool {
    guard let root = root else { return true }
    // 左子树的最大值要小于根节点的值
    if let max = max, root.value >= max  {
        return false
    }
    // 右子树的最小值要大于根节点的值
    if let min = min, root.value <= min {
        return false
    }
    // (当前节点的左节点, 当前节点的值作为最大值) && (当前节点的右节点, 当前节点的值作为最小值)
    // 1.     (1, nil, 2) && (3, 2, nil)
    // 2.     (nil, nil, 1) && (nil, 1, nil)
    // 3.     treue && true
    return isValidBST(root.left, min: min, max: root.value) && isValidBST(root.right, min: root.value, max: max)
}

let root = BinaryTreeNode(value: 2, left: BinaryTreeNode(value: 1, left: nil, right: nil), right: BinaryTreeNode(value: 3, left: nil, right: nil))
print(isValidBST(root, min: nil, max: nil))
