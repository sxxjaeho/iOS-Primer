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

func levelOrderTraversal(_ root: BinaryTreeNode?) -> [[Int]] {
    
    guard let root = root else { return [] }
    
    var queue: [BinaryTreeNode] = [root]
    
    var result: [[Int]] = []
    
    while !queue.isEmpty {
        var currentLevel: [Int] = []
        
        for _ in queue {
            let node = queue.removeFirst()
            currentLevel.append(node.value)
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        result.append(currentLevel)
    }
    return result
}

let root = BinaryTreeNode(value: 3, left: BinaryTreeNode(value: 9, left:  nil, right: nil), right: BinaryTreeNode(value: 20, left:  BinaryTreeNode(value: 15, left: nil, right: nil), right: BinaryTreeNode(value: 7, left: nil, right: nil)))
print(levelOrderTraversal(root))
