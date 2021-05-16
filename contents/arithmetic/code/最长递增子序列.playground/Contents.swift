import UIKit

/*
 题目：
 给定数组arr，设长度为n，输出arr的最长递增子序列。（如果有多个答案，请输出其中字典序最小的）
 
 示例：
 输入：[2,1,5,3,6,4,8,9,7]
 输出：[1,3,4,8,9]
 
 时间复杂度：O(nlogn) 空间复杂度：O(n)
 
 */

func LIS ( _ arr: [Int]) -> [Int] {
    let n = arr.count;
    
    var sub = Array(repeating: 0, count: n+1)
    var dp = Array(repeating: 0, count: n)
    
    var len = 1;
    sub[1] = arr[0];
    dp[0] = 1;
    
    // [2, 1, 5, 3, 6, 4, 8, 9, 7]
    // sub = [0, 2, 0, 0, 0, 0, 0, 0, 0, 0]
    for i in 1..<n {
        if (sub[len] < arr[i]) {
            len += 1
            sub[len] = arr[i];
            dp[i] = len;
        } else {
            // [0, 1, 5, 0, 0, 0, 0, 0, 0, 0]
            // l = 0, r = 2, mid = 1
            // sub[mid] = 1, arr[i] = 3
            // l = 2, r = 2, mid = 2
            // sub[mid] = 5, arr[i] = 3
            // l = 2, r = 1
            var l = 0;
            var r = len;
            while (l <= r) {
                let mid = l + (r - l) / 2;
                if (sub[mid] >= arr[i]) {
                    r = mid - 1;
                } else {
                    l = mid + 1;
                }
            }
            sub[l] = arr[i];
            dp[i] = l;
        }
    }
    
    var res = Array(repeating: 0, count: len);
    for i in (0..<n).reversed() {
        if dp[i] == len {
            len -= 1
            res[len] = arr[i];
        }
    }
    return res;
}
print(LIS([2, 1, 5, 3, 6, 4, 8, 9, 7]))
