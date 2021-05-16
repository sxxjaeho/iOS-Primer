import UIKit

/*
 题目：给定一个二叉树，返回其节点值的锯齿形层序遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
 返回其层次遍历结果：

 [
    [3],
    [20,9],
    [15,7]
 ]
 
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
func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }
    
    var queue: [TreeNode] = [root]
    
    var result: [[Int]] = []
    
    var levelNum = 0
    
    while !queue.isEmpty {
        var currentLevel: [Int] = []
        
        for _ in queue {
            let node = queue.removeFirst()
            currentLevel.append(node.val)
            
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        
        levelNum += 1
        
        if levelNum % 2 == 0 {
            currentLevel.reverse()
        }
        result.append(currentLevel)
    }
    return result
}

let root = TreeNode(val: 3, left: TreeNode(val: 9, left:  nil, right: nil), right: TreeNode(val: 20, left:  TreeNode(val: 15, left: nil, right: nil), right: TreeNode(val: 7, left: nil, right: nil)))
print(zigzagLevelOrder(root))
