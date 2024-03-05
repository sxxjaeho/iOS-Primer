import UIKit

/*
 题目：
 给你二叉树的根节点 root 和一个表示目标和的整数 targetSum ，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和 targetSum。

 叶子节点 是指没有子节点的节点。

 示例：
 输入：root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
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

// bfs
func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    guard let root = root else { return false }
    
    var nodeQueue = [TreeNode]()
    var sumQueue = [Int]()
    nodeQueue.append(root)
    sumQueue.append(root.val)
    while !nodeQueue.isEmpty {
        for _ in nodeQueue {
            let node = nodeQueue.removeFirst();
            let sum = sumQueue.removeFirst()
            
            if node.left == nil && node.right == nil && sum == targetSum {
                return true
            }
            
            if let rightNode = node.right {
                nodeQueue.append(rightNode)
                sumQueue.append(sum + rightNode.val)
            }
            if let leftNode = node.left {
                nodeQueue.append(leftNode)
                sumQueue.append(sum + leftNode.val)
            }
        }
    }
    return false
}
