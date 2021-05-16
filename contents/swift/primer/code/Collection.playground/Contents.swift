import UIKit

var str = "Hello, playground"


// MARK: - 数组


// MARK: - 创建数组
//// 1.字面量创建
//var array = [1,2,3,4]
//print(array)
//array = []
//print(array)
//
//// 2.初始化器
//var array2 = [String]()
//var array3 = Array<String>()
//
//// 3.其他
//var array4:Array<Int> = [1,2,3,4]
//var array5:Array<Int> = []
//
//// 数组中重复
//let fiveS = Array(repeating: "zzz", count: 5)
//print(fiveS)
//
//// 用字符串初始化数组
//let chars = Array("Hello")
//print(chars)
//
//// 序列初始化数组区间
//let numbers = Array(1...9)
//let numbers2 = [Int](0...7)
//print(numbers)
//print(numbers2)
//
//// 初始化器参数
//let persons = ["zhangsan":12, "lisi":13, "wangwu":14]
//let names = Array(persons.keys)
//print(names)


// MARK: - 数组遍历
//// forEach内不能用break
//let numbers = Array(2...7)
//numbers.forEach { (num) in
//    if num == 3 {
//        return
//    }
//    print(num)
//}
//
//for (index, num) in numbers.enumerated() {
//    print("第\(index)个是\(num)")
//}
//for i in 0..<numbers.count{
//    print("第\(i)个是\(numbers[i])")
//}
//
//// it.next()返回下一个值是不是空
//var it = numbers.makeIterator()
//while let num = it.next(){
//    print(num)
//}
//
//// 使用索引区间遍历
//for i in numbers.indices{
//    print("第\(i)个是\(numbers[i])")
//}


// MARK: - 数组的查找操作
//// 判断是否包含指定元素
//// 判断数组是否包含给定元素
//let array = [20, 45, 30, 98, 101, 30, 4]
//print(array.contains(30))
//// 判断数组是否包含符合给定条件的元素
//print(array.contains(where: {$0 > 10}))
//print(array.contains(where: {$0 < 3}))
//
//// 判断所有元素符合某个条件
//// 判断数组的每一个元素都符合给定的条件,返回 true
//print(array.allSatisfy({$0 > 10}))
//
//// 查找元素
//print(array.first!)
//print(array.last!)
//print(array.first(where: {$0 > 25})!)
//print(array.last(where: {$0 > 25})!)
//
//// 查找索引
//print(array.firstIndex(of: 9) as Any)
//print(array.firstIndex(of: 30)!)
//print(array.firstIndex(where : {$0 > 25}) ?? 0)
//print(array.lastIndex(where : {$0 > 25}) as Any)
//
//// 查找最大最小元素
//print(array.min() as Any)
//print(array.max() as Any)
//
//let error = [(12, "error12"), (13, "error13"), (45, "error45")]
//print(error.min(by: { (a, b) -> Bool in
//    a.0 < b.0
//}) as Any)
//
//let error2 = [(12, "error12"), (13, "error13"), (45, "error45")]
//print(error.max(by: { (a, b) -> Bool in
//    a.0 < b.0
//}) as Any)


// MARK: - 数组添加和删除
//// 在末尾添加
//var numbers = [Int](2...7)
//numbers.append(100)
//print(numbers)
//numbers.append(contentsOf: 200...203)
//print(numbers)
//numbers.append(contentsOf: [204,205])
//print(numbers)
//
//// 在任意位置插入
//numbers.insert(-1, at: 1)
//print(numbers)
//numbers.insert(contentsOf: [-2, -1], at: 3)
//print(numbers )
//
//// 移除单个元素
//// 移除并返回指定位置的一个元素
//let removeNum = numbers.remove(at: 1)
//print(removeNum)
//print(numbers)
//// 移除并返回数组的第一个元素
//numbers.removeFirst()
//print(numbers)
//// 移除并返回数组的最后一个元素
//numbers.removeLast()
//print(numbers)
//// 移除并返回数组的最后一个元素（optional），如果数组为空返回nil，建议使用
//numbers.popLast()
//
//// 移除多个元素
//// 移除数组中给定范围的元素
//numbers.removeSubrange(1...3)
//print(numbers)
//// 移除数组所有元素，保留数组容量
//numbers.removeAll(keepingCapacity: true)
//print(numbers)
//print(numbers.capacity)
//// 移除数组前面多个元素
//numbers.removeFirst(2)
//print(numbers)
//// 移除数组后面多个元素
//numbers.removeLast(2)
//print(numbers)


// MARK: - ArraySlice 数组切片
//// 通过 Drop 得到 ArraySlice
//// “移除”原数组前面指定个数的元素得到一个 ArraySlice
//var numbers = [2, 10, 15, 25, 100, 46, 99]
//var slice = numbers.dropFirst()
//print(slice)
//// “移除”原数组符合指定条件的元素得到一个 ArraySlice
//var slice = numbers.drop(while: {$0 < 15})
//print(slice)
//
//// 通过 preﬁx 得到 ArraySlice
//// 获取数组到指定位置（不包含指定位置）前面的元素组成的 ArraySlice
//var slice = numbers.prefix(upTo:4)
//print(slice)
//// 获取数组到指定位置（包含指定位置）前面的元素组成的 ArraySlice
//var slice = numbers.prefix(through: 4)
//print(slice)
//// 获取数组前面符合条件的元素（到第一个不符合条件的元素截止）组成的 ArraySlice
//var slice = numbers.prefix(while: {$0 < 15})
//print(slice)
//
//// 通过 suﬃx 得到 ArraySlice
//// 获取数组后面指定个数的元素组成的 ArraySlice
//var slice = numbers.suffix(3)
//print(slice)
//
//// ArraySlice 转为 Array,ArraySlice 和原 Array 相互独立
//var slice = numbers[...]
//print(slice)
//var numbers2 = Array(slice)
//print(numbers2)


// MARK: - 重排操作
//// 数组元素的随机化
//// 在原数组上将数组元素打乱，只能作用在数组变量上
//var array = [Int](1...8)
//array.shuffle()
//print(array)
//// 返回原数组的随机化数组，可以作用在数组变量和常量上
//var array2 = array.shuffled()
//print(array)
//print(array2)
//
//// 数组的逆序
//// 在原数组上将数组逆序，只能作用在数组变量上
//array.reverse()
//print(array)
//// 返回原数组的逆序“集合表示”，可以作用在数组变量和常量上，该方法不会分配新内存空间，原数组共享内存
//var reversedArray = array.reversed()
//print(reversedArray)
//
//// 数组的分组
//// 根据条件将数组重新整理(不稳定)
//// 将数组以某个条件分组，数组前半部分都是不符合条件的元素，数组后半部分都是符合条件的元素
//// 可以返回一个index分界点
//var numbers = [35, 2, 25, 30, 46, 57, 101, 30, 70]
//numbers.partition(by: {$0 > 30})
//print(numbers)
//var index = numbers.partition(by: {$0 > 30})
//print(index)
//let num1 = numbers[..<index]
//let num2 = numbers[index...]
//print(numbers)
//print(num1)
//print(num2)
//
//// 数组的排序(不稳定)
//numbers.sort()
//print(numbers)
//let numbers2 = numbers.sorted()
//
//// 交换数组两个元素
//numbers.swapAt(numbers.startIndex, numbers.endIndex - 1)


// MARK: - 拼接操作
//// 字符串数组拼接
//let array = ["Hello", "world"]
//print(array.joined())
//print(array.joined(separator: ","))
//
//// 元素为 Sequence 数组的拼接
//let ranges = [0...3, 5...7, 10...16]
//for range in ranges{
//    print(range)
//}
//for i in ranges.joined(){
//    print(i)
//}
//
//let array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
//let result = array.joined(separator: [-1 ,-2])
//print(result)
//print(Array(result))


// MARK: - 实现栈和队列
//// Stack
//struct Stack<T> {
//    private var elements = [T]()
//
//    var count: Int {
//        return elements.count
//    }
//
//    var isEmpty: Bool {
//        return elements.isEmpty
//    }
//
//    var peek: T? {
//        return elements.last
//    }
//
//    mutating func push(_ element: T) {
//        elements.append(element)
//    }
//
//    mutating func pop() -> T? {
//        return elements.popLast()
//    }
//}
//
//var stack = Stack<Int>()
//stack.push(1)
//stack.push(6)
//stack.push(8)
//print(stack.count)
//// ?? 合并空值运算符
//print(stack.pop() ?? 0)
//print(stack.count
//)

//// Queue
//struct Queue<T> {
//    private var elements: [T] = []
//
//    var count: Int {
//        return elements.count;
//    }
//
//    var isEmpty: Bool {
//        return elements.isEmpty;
//    }
//
//    var peek: T? {
//        return elements.first
//    }
//
//    mutating func enqueue(_ element: T) {
//        elements.append(element)
//    }
//
//    mutating func dequeue() -> T? {
//        return isEmpty ? nil : elements.removeFirst()
//    }
//}
//
//var queue = Queue<Int>()
//queue.enqueue(1)
//queue.enqueue(6)
//queue.enqueue(8)
//print(queue.count)
//print(queue.dequeue() ?? 0)
//print(queue.count)


// MARK: - Set


// MARK: - 创建 Set
//// 1.使用初始化器语法来创建一个确定类型的空 Set
//var letters = Set<Character>()
//letters.insert("c")
//print(letters)
//
//// 2.使用数组字面量创建 Set
//var course: Set<String> = ["Math", "English", "History"]
//course.insert("History")
//print(course)
//
//// Set 类型的哈希值
//// 为了能让类型储存在 Set 当中，它必须是可哈希的——就是说类型必须提供计算它自身哈希值的方法
//struct Person {
//    var name: String
//    var age: Int
//}
//
//extension Person: Hashable {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//        hasher.combine(age)
//    }
//}
//
//var personSet = Set<Person>()
//var personSet: Set<Person> = [Person(name: "lisi", age: 18)]
//personSet.insert(Person(name: "zhangsan", age: 20))


// MARK: - 访问和修改 Set
//// 遍历 Set
//let courses: Set = ["Math", "English", "History"]
//for course in courses {
//    print(course)
//}
//print("-----------")
//for course in courses.sorted() {
//    print(course)
//}
//
//// 访问 Set
//print(courses.count)
//print(courses.isEmpty)
//
//// 添加元素
//struct Person {
//    var name: String
//    var age: Int
//}
//
//extension Person: Hashable {
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(name)
//    }
//}
//
//extension Person: Equatable {
//    static func == (lhs: Person, rhs: Person) -> Bool {
//        return lhs.name == rhs.name
//    }
//}
//
//var personSet: Set<Person> = [Person(name: "zhangsan", age: 20), Person(name: "lisi", age: 29)]
//// 添加一个元素到 Set,如果有相等的元素则不插入
//// personSet.insert(Person(name: "zhangsan", age: 35))
//// 如果已经有相等的元素，替换为新元素。如果 Set 中没有，则插入
//personSet.update(with: Person(name: "zhangsan", age: 35))
//personSet.update(with: Person(name: "wangwu", age: 18))
//print(personSet)
//
//// 移除元素
//// 移除 Set 的第一个元素，因为 Set 是无序的，所以第一个元素并不是放入的第一个元素，而是哈希值计算出来的第一个元素
////let person = personSet.removeFirst()
////print(person)
//
//// 从 Set 当中移除一个元素，如果元素是 Set 的成员就移除它，并且返回移除的 值，如果合集没有这个成员就返回 nil
//let person = personSet.remove(Person(name: "zhangsan", age: 35))
//print(personSet)
//
//// 过滤元素,返回一个新的 Set，新 Set 的元素是原始 Set 符合条件的元素
//print(personSet.filter({ $0.age > 20}))


// MARK: - 执行 Set 操作
//// 基本 Set 操作
//let set: Set<Character> = ["A", "B", "C"]
//let set2: Set<Character> = ["B", "E", "F", "G"]
//// 交集，由属于A且属于B的相同元素组成的集合，记作A∩B（或B∩A）
//print(set.intersection(set2))//["B"]
//// 并集，由所有属于集合A或属于集合B的元素所组成的集合，记作A∪B（或B∪A）
//print(set.union(set2))//["A", "B", "C", "E", "F", "G"]
//// 对称差集，集合A与集合B的对称差集定义为集合A与集合B中所有不属于A∩B的元素的集合。
//print(set.symmetricDifference(set2))//["A", "C", "E", "F", "G"]
//// 相对补集，由属于A而不属于B的元素组成的集合，称为B关于A的相对补集，记 作A-B或A\B。
//print(set.subtracting(set2))//["A", "C"]
//
//// Set 判断方法
//let smallSet: Set = [1, 2, 3]
//let bigSet: Set = [1, 2, 3, 4]
//// 判断是否是另一个 Set 或者 Sequence 的子集
//print(smallSet.isSubset(of: bigSet))//true
//// 判断是否是另一个 Set 或者 Sequence 的超集
//print(bigSet.isSuperset(of: smallSet))//true
//// 判断是否是另一个 Set 的子集或者超集，但是 又不等于另一个 Set
//print(smallSet.isStrictSubset(of: bigSet))//true
//print(bigSet.isStrictSuperset(of: smallSet))//true
//// 判断两个 Set 是否有公共元素，如果没有返回 true，如果有返回 false
//print(smallSet.isDisjoint(with: bigSet))//flase


// MARK: - Set 算法
//// 题目:给定一个集合，返回这个集合所有的子集
//// 位
//func getSubsets<T>(_ set: Set<T>) -> Array<Set<T>> {
//    // 1 << set.count 相当于 2^n
//    let count = 1 << set.count
//    let elements = Array(set)
//    var subsets = [Set<T>]()
//    for i in 0..<count {
//        var subset = Set<T>()
//        for j in 0..<elements.count {
//            // i = 5, j = 0 时  101 >> 0  =>  101 & 001  =>  001 满足
//            // i = 5, j = 1 时  101 >> 1  =>  010 & 001  =>  000 不满足
//            // i = 5, j = 2 时  101 >> 2  =>  001 & 001  =>  001 满足
//            if ((i >> j) & 1) == 1 {
//                subset.insert(elements[j])
////                print(i, j, i>>j, subset)
//            }
//
//        }
//        subsets.append(subset)
////        print("subsets:\(subsets)")
//    }
//    return subsets
//}
//let set: Set = ["A", "B", "C"]
//print(getSubsets(set))
//
//// 递归
//func getSubsets2<T>(set: Set<T>) -> Array<Set<T>> {
//    let elements = Array(set)
//    return getSubsets3(elements: elements, index: elements.count - 1, count: elements.count)
//}
//
//func getSubsets3<T>(elements: Array<T>, index: Int, count: Int) -> Array<Set<T>> {
//    var subSets = Array<Set<T>>()
//    if index == 0 {
//        subSets.append(Set<T>())
//        var subSet = Set<T>()
//        subSet.insert(elements[0])
//        subSets.append(subSet)
//        return subSets
//    }
//    subSets = getSubsets3(elements: elements, index: index - 1, count: count)
//    for subSet in subSets {
//        var subSetWithCurrent = subSet
//        subSetWithCurrent.insert(elements[index])
//        subSets.append(subSetWithCurrent)
//    }
//    return subSets
//}
//let set2: Set = ["A", "B", "C"]
//print(getSubsets2(set: set2))


// MARK: - Dictionary


// MARK: - 创建空字典
//// 1.初始器方式
//var dict1 = Dictionary<String, Int>()
//// 2.简写方式
//var dict2 = [String: Int]()
//// 3.字面量方式
//var dict3: Dictionary<String, Int> = [:]
//var dict4 = ["zhangsan": 18, "lisi": 19, "wangwu":20]

//// 遍历字典
//// 1.For-in 循环
//let dict = ["zhangsan": 18, "lisi": 19, "wangwu":20]
//for (key, value) in dict {
//    print("name:\(key), age:\(value)")
//}
//
//// 2.可以通过访问字典的 keys 和 values 属性来取回可遍历的字典的键或值的集合
//for key in dict.keys.sorted() {
//    print("name:\(key), age:\(dict[key] ?? 0)")
//}


// MARK: - 字典常用操作
//// 添加或更新元素
//var personDict = ["zhangsan": 18, "lisi": 19, "wangwu":20]
//personDict["zhaoliu"] = 33
//print(personDict)
//
//var personDict2 = [Person(name: "zhangsan", age: 18): 3000, Person(name: "lisi", age: 25): 8000]
//personDict2.updateValue(5000, forKey: Person(name: "zhangsan", age: 23))
//print(personDict2)
//
//// 移除元素
//personDict["zhaoliu"] = nil
//print(personDict)
//
//// 合并两个字典
//var dictionary = ["a": 1, "b": 2]
//dictionary.merge(["a": 3, "c": 4]) { (key, _) -> Int in key}
//print(dictionary)
//
//dictionary.merge(["a": 5, "d": 6]) { (_, value) -> Int in value}
//print(dictionary)
//
//let index = dictionary.firstIndex { (_, value) -> Bool in
//    value == 1
//}
//print(index!)
//
//dictionary["c"] = 6
////dictionary["d"] = 6
////dictionary["e"] = 6
////dictionary["f"] = 6
////dictionary["g"] = 6
////dictionary["h"] = 6
//
//if let i = index {
//    print(dictionary[i].value)
//}
//
//let kvs: KeyValuePairs = ["a": 1, "b":2, "c":3]
//print(kvs)






