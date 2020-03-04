import UIKit

/*
题目：运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。

获取数据 get(key)
 - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
写入数据 put(key, value)
 - 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最近最少使用的数据值，从而为新的数据值留出空间。
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
        let prev = node.prev
        let new = node.next

        prev?.next = new
        new?.prev = prev
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
    var cache = Dictionary<Int, DLinkedNode>()
    
    func get(_ key: Int) -> Int {
        if let node = cache[key] {
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
            
            cache[key] = newNode
            count += 1

            if count > capacity {
                let tail = popTail()!
                cache.removeValue(forKey: tail.key!)
                addNode(newNode)
                
                count -= 1
            } else {
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


