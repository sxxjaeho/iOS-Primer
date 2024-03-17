import UIKit

/*
 题目：
 给你二叉树的根节点 root 和一个表示目标和的整数 targetSum ，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和 targetSum。

 叶子节点 是指没有子节点的节点。

 示例：
 输入：root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
 输出：true
 
      5
     / \
    4   8
   /    /\
  11   13 4
  /\       \
 7  2       1
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
            
            if let leftNode = node.left {
                nodeQueue.append(leftNode)
                sumQueue.append(sum + leftNode.val)
                print(leftNode.val, sumQueue)
            }
            if let rightNode = node.right {
                nodeQueue.append(rightNode)
                sumQueue.append(sum + rightNode.val)
                print(rightNode.val, sumQueue)
            }
            // nodeQueue = [4, 8], sumQueue = [9, 13]
            // nodeQueue = [8, 11], sumQueue = [13, 20]
            // nodeQueue = [11, 13, 4], sumQueue = [20, 26, 17]
            // nodeQueue = [13, 4, 7, 2], sumQueue = [26, 17, 27, 22]
            // nodeQueue = [7, 2, 1], sumQueue = [27, 22, 18]
            // nodeQueue = [2, 1], sumQueue = [22, 18]
        }
    }
    return false
}

let root = TreeNode(val: 5, left: TreeNode(val: 4, left: TreeNode(val: 11, left: TreeNode(val: 7, left: nil, right: nil), right: TreeNode(val: 2, left: nil, right: nil)), right: nil), right: TreeNode(val: 8, left: TreeNode(val: 13, left: nil, right: nil), right: TreeNode(val: 4, left: nil, right: TreeNode(val: 1, left: nil, right: nil))))
print(hasPathSum(root, 22))
