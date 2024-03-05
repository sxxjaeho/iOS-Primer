import UIKit

/*
 题目：给你一个二叉树的根节点 root ，树中每个节点都存放有一个 0 到 9 之间的数字。
 每条从根节点到叶节点的路径都代表一个数字：

 例如，从根节点到叶节点的路径 1 -> 2 -> 3 表示数字 123 。
 计算从根节点到叶节点生成的所有数字之和。

 叶节点是指没有子节点的节点。

 示例：
 输入：root = [1,2,3]
 输出：25
 解释：
 从根到叶子节点路径 1->2 代表数字 12
 从根到叶子节点路径 1->3 代表数字 13
 因此，数字总和 = 12 + 13 = 25

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

// dfs
func sumNumbers(_ root: TreeNode?) -> Int {
    return dfs(root, 0)
}

func dfs(_ root: TreeNode?, _ prevSum: Int) -> Int {
    if root == nil {
        return 0;
    }
    let sum = prevSum * 10 + root!.val
    if root?.left == nil && root?.right == nil {
        return sum
    } else {
        return dfs(root?.left, sum) + dfs(root?.right, sum)
    }
}
