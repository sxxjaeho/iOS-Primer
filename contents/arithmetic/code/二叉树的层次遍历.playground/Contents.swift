import UIKit

/*
 题目：给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。

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
    [9,20],
    [15,7]
 ]
 
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

// bfs
func levelOrderTraversal(_ root: BinaryTreeNode?) -> [[Int]] {
    
    guard let root = root else { return [] }
    
    var queue: [BinaryTreeNode] = [root]
    
    var result: [[Int]] = []
    
    // 1.     queue: [3]  result: [[]]
    while !queue.isEmpty {
        var currentLevel: [Int] = []
        
        for _ in queue {
            let node = queue.removeFirst()
            currentLevel.append(node.value)
            // 2.     currentLevel: [3]
            // 5.     currentLevel: [9]
            // 7.     currentLevel: [9, 20]
            // 10.     currentLevel: [15]
            // 12.     currentLevel: [15, 7]
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
            // 3.     queue: [9, 20]
            // 6.     queue: [20]
            // 8.     queue: [15, 7]
            // 11.     queue: [7]
            // 13.     queue: []
        }
        result.append(currentLevel)
        // 4.     result: [[3]]
        // 9.     result: [[3], [9, 20]]
        // 14.     result: [[3], [9, 20], [15, 7]]
    }
    return result
}

let root = BinaryTreeNode(value: 3, left: BinaryTreeNode(value: 9, left:  nil, right: nil), right: BinaryTreeNode(value: 20, left:  BinaryTreeNode(value: 15, left: nil, right: nil), right: BinaryTreeNode(value: 7, left: nil, right: nil)))
print(levelOrderTraversal(root))

// 二叉树前序遍历
func preorderTraversal(_ root: BinaryTreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var res: [Int] = []
    res.append(root.value)
    res += preorderTraversal(root.left)
    res += preorderTraversal(root.right)
    
    return res
}

// 二叉树中序遍历
func inorderTraversal(_ root: BinaryTreeNode?) -> [Int] {
    guard let root = root else { return [] }

    var res: [Int] = []
    res += inorderTraversal(root.left)
    res.append(root.value)
    res += inorderTraversal(root.right)
    
    return res
}

// 二叉树后序遍历
func postorderTraversal(_ root: BinaryTreeNode?) -> [Int] {
    guard let root = root else { return [] }
    
    var res: [Int] = []
    res += postorderTraversal(root.left)
    res += postorderTraversal(root.right)
    res.append(root.value)
    
    return res
}
