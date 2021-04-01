import UIKit

/*
 题目：给你一个二叉树的根节点 root ，返回其 最大路径和 。
 
 示例：
        -10
        / \
       9  20
         /  \
        15   7
 
 输入：root = [-10,9,20,null,null,15,7]
 输出：42
 解释：最优路径是 15 -> 20 -> 7 ，路径和为 15 + 20 + 7 = 42
 */

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(val: Int, left: TreeNode?, right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

var maxSum = Int.min
func maxPathSum(_ root: TreeNode?) -> Int {
    _ = maxGain(root);                                       // maxGain(-10)
    return maxSum;                                           // leftGain = 9, rightGain = maxGain(20) = 35  ←－
}                                                            // maxSum = max(-10 + 9 + 35 = 34, 42)           |
                                                             // return -10 + 35 = 25                          |
func maxGain(_ node :TreeNode?) -> Int {                     //                                               |
    guard let node = node else { return 0 }                  // maxGain(20)                                   |
                                                             // leftGain = 15, rightGain = 7                  |
    let leftGain = max(maxGain(node.left), 0);               // maxSum = max(20 + 15 + 7 = 42, Int.min)       |
    let rightGain = max(maxGain(node.right), 0);             // return 20 + 15 = 35                           |
 
    let priceNewpath = node.val + leftGain + rightGain;
    
    maxSum = max(maxSum, priceNewpath);
    
    return node.val + max(leftGain, rightGain);
}
