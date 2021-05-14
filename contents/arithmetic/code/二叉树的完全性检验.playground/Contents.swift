import UIKit

/*
 题目：
 给定一个二叉树，确定它是否是一个完全二叉树。

 百度百科中对完全二叉树的定义如下：

 若设二叉树的深度为 h，除第 h 层外，其它各层 (1～h-1) 的结点数都达到最大个数，第 h 层所有的结点都连续集中在最左边，这就是完全二叉树。（注：第 h 层可能包含 1~ 2h 个节点。）

 示例：
        1
       / \
      2   3
     / \   \
    4   5   7
 
 输入：[1,2,3,4,5,null,7]
 输出：false
 解释：值为 7 的结点没有尽可能靠向左侧。
 
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
func isCompleteTree(_ root: TreeNode?) -> Bool {
    guard let root = root else { return false }
    
    var queue: [TreeNode?] = [root]
    var prevNode: TreeNode? = root
    
    while !queue.isEmpty {
        for _ in queue {
            let node = queue.removeFirst()
            // 当前节点有值，前一个节点为空
            if prevNode == nil && node != nil {
                return false
            }
            if node != nil {
                queue.append(node?.left)
                queue.append(node?.right)
            }
            
            prevNode = node
        }
    }
    return true
}

let root = TreeNode(val: 1, left: TreeNode(val: 2, left: TreeNode(val: 4, left:  nil, right: nil), right: TreeNode(val: 5, left:  nil, right: nil)), right: TreeNode(val: 3, left: nil, right: TreeNode(val: 7, left: nil, right: nil)))
print(isCompleteTree(root))
