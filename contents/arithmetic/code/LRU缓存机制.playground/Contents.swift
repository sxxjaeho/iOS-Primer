import UIKit

/*
 题目：运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。
 
 获取数据 get(key)
 - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
 写入数据 put(key, value)
 - 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最近最少使用的数据值，从而为新的数据值留出空间。
 
 时间复杂度：对于 put 和 get 都是 O(1)
 空间复杂度：O(capacity)，因为哈希表和双向链表最多存储 capacity + 1 个元素
 */

class DLinkedNode {
    var key: Int?
    var value: Int?
    var next: DLinkedNode?
    var prev: DLinkedNode?
    
    init(key: Int? = nil, value: Int? = nil) {
        self.key = key
        self.value = value
    }
}

//class Solution {
//    func LRU ( _ operators: [[Int]],  _ k: Int) -> [Int] {
//        let cache = LRUCache(k)
//        var res = [Int]()
//
//        for op in operators {
//            if op.count < 2 {
//                return res
//            }
//            if op[0] == 1 {
//                cache.put(op[1], op[2])
//            } else {
//                res.append(cache.get(op[1]))
//            }
//        }
//        return res
//    }
//}

class LRUCache {

    var capacity = 0
    let head = DLinkedNode()
    let tail = DLinkedNode()
    
    init(_ capacity: Int) {
        self.capacity = capacity
        
        head.next = tail
        tail.prev = head
    }
    
    func addNode(_ node: DLinkedNode) {
        node.prev = head
        node.next = head.next

        head.next!.prev = node
        head.next = node
    }
    
    func removeNode(_ node: DLinkedNode) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
    func moveToHead(_ node: DLinkedNode) {
        removeNode(node)
        addNode(node)
    }
    
    func popTail() -> DLinkedNode? {
        let res = tail.prev!
        if res.value != nil {
            removeNode(res)
            return res
        } else {
            return nil
        }
    }
    
    var count = 0
    // 用哈希表，辅以双向链表记录键值对的信息
    var cache = Dictionary<Int, DLinkedNode>()
    
    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            // 5.     <->head<->1<->2<->tail
            moveToHead(node)
            return node.value!
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            node.value = value
            moveToHead(node)
        } else {
            let newNode = DLinkedNode(key: key, value: value)
            
            // 1.     {1 : 1}
            // 3.     {1 : 1, 2 : 2}
            // 6.     {1 : 1, 2 : 2, 3 : 3}
            cache[key] = newNode
            count += 1

            if count > capacity {
                // 7.     <->head<->1<->tail
                let tail = popTail()!
                // 8.     <->head<->3<->1<->tail
                addNode(newNode)
                // * 通过末尾节点的 key,移除字典d中该节点的记录
                // 9.     {1 : 1, 3 : 3}
                cache.removeValue(forKey: tail.key!)
                count -= 1
            } else {
                // 2.     <->head<->1<->tail
                // 4.     <->head<->2<->1<->tail
                addNode(newNode)
            }
        }
    }
}

var cache = LRUCache(2 /* 缓存容量 */ )
cache.put(1, 1);
cache.put(2, 2);
print(cache.get(1));       // 返回  1
cache.put(3, 3);    // 该操作会使得密钥 2 作废
print(cache.get(2));       // 返回 -1 (未找到)
cache.put(4, 4);    // 该操作会使得密钥 1 作废
print(cache.get(1));       // 返回 -1 (未找到)
print(cache.get(3));       // 返回  3
print(cache.get(4));       // 返回  4

//var solution = Solution()
//print(solution.LRU([[1,1,1],[1,2,2],[1,3,2],[2,1],[1,4,4],[2,2],[1,5,5]], 3))
