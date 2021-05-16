import UIKit

/*
 题目：
 给你二叉树的根节点 root 和一个整数目标和 targetSum ，找出所有 从根节点到叶子节点 路径总和等于给定目标和的路径。

 叶子节点 是指没有子节点的节点。

 示例：
 输入：root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 输出：[[5,4,11,2],[5,8,4,5]]
 
 时间复杂度：O(n²) 空间复杂度：O(n)
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

// dfs
var res = [[Int]]()
var path = [Int]()
func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    guard root != nil else {
        return []
    }
    
    dfs(root, targetSum)
    
    return res
}

func dfs(_ root: TreeNode?, _ sum: Int) {
    guard root != nil else {
        return
    }
    
    let targetSum = sum - root!.val
    path.append(root!.val)
    
    if root?.left == nil && root?.right == nil && targetSum == 0 {
        res.append(path)
    } else {
        dfs(root?.left, targetSum)
        dfs(root?.right, targetSum)
    }
    
    path.removeLast()
}

