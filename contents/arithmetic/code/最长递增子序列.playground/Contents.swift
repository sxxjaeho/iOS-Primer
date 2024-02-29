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

    var sub = Array(repeating: 0, count: arr.count+1)
    var dp = Array(repeating: 0, count: arr.count)
    
    var len = 1;
    sub[1] = arr[0];
    dp[0] = 1;
    
    // [2, 1, 5, 3, 6, 4, 8, 9, 7]
    // sub = [0, 2, 0, 0, 0, 0, 0, 0, 0, 0]
    // dp = [1, 0, 0, 0, 0, 0, 0, 0, 0]
    for i in 1..<arr.count {
        // 1. 2 < 1
        // 2. 1 < 5
        // 3. 5 < 3
        // 4. 3 < 6
        // 5. 6 < 4
        // 6. 4 < 8
        // 7. 8 < 9
        // 8. 9 < 7
        if (sub[len] < arr[i]) {
            len += 1
            sub[len] = arr[i];
            dp[i] = len;
            // 2. len = 2, sub:[0, 1, 5, 0, 0, 0, 0, 0, 0, 0], dp:[1, 1, 2, 0, 0, 0, 0, 0, 0]
            // 4. len = 3, sub:[0, 1, 3, 6, 0, 0, 0, 0, 0, 0], dp:[1, 1, 2, 2, 3, 0, 0, 0, 0]
            // 6. len = 4, sub:[0, 1, 3, 4, 8, 0, 0, 0, 0, 0], dp:[1, 1, 2, 2, 3, 3, 4, 0, 0]
            // 7. len = 5, sub:[0, 1, 3, 4, 8, 9, 0, 0, 0, 0], dp:[1, 1, 2, 2, 3, 3, 4, 5, 0]
        } else {
            var l = 0;
            var r = len;
            while (l <= r) {
                let mid = l + (r - l) / 2;
                if (sub[mid] >= arr[i]) {
                    // 1.2 l = 1, r = 1, mid = 1, sub[1] = 2, arr[1] = 1, r = 0
                    // 3.2 l = 2, r = 2, mid = 2, sub[2] = 5, arr[3] = 3, r = 1
                    // 5.3 l = 3, r = 3, mid = 3, sub[3] = 6, arr[5] = 4, r = 2
                    // 8.2 l = 3, r = 5, mid = 4, sub[4] = 8, arr[8] = 7, r = 3
                    r = mid - 1;
                } else {
                    // 1.1 l = 0, r = 1, mid = 0, sub[0] = 0, arr[1] = 1, l = 1
                    // 3.1 l = 0, r = 2, mid = 1, sub[1] = 1, arr[3] = 3, l = 2
                    // 5.1 l = 0, r = 3, mid = 1, sub[1] = 1, arr[5] = 4, l = 2
                    // 5.2 l = 2, r = 3, mid = 2, sub[2] = 3, arr[5] = 4, l = 3
                    // 8.1 l = 0, r = 5, mid = 2, sub[2] = 3, arr[8] = 7, l = 3
                    // 8.3 l = 3, r = 3, mid = 3, sub[3] = 4, arr[8] = 7, l = 4
                    l = mid + 1;
                }
            }
            sub[l] = arr[i];
            dp[i] = l;
            // 1. sub:[0, 1, 0, 0, 0, 0, 0, 0, 0, 0], dp:[1, 1, 0, 0, 0, 0, 0, 0, 0]
            // 3. sub:[0, 1, 3, 0, 0, 0, 0, 0, 0, 0], dp:[1, 1, 2, 2, 0, 0, 0, 0, 0]
            // 5. sub:[0, 1, 3, 4, 0, 0, 0, 0, 0, 0], dp:[1, 1, 2, 2, 3, 3, 0, 0, 0]
            // 8. sub:[0, 1, 3, 4, 7, 9, 0, 0, 0, 0], dp:[1, 1, 2, 2, 3, 3, 4, 5, 4]
        }
    }
    
    var res = Array(repeating: 0, count: len);
    for i in (0..<arr.count).reversed() {
        if dp[i] == len {
            len -= 1
            res[len] = arr[i];
        }
    }
    return res;
}
//print(LIS([2, 1, 5, 3, 6, 4, 8, 9, 7]))

// 只需要找到其中最长严格递增子序列的长度
func lengthOfLIS(_ nums: [Int]) -> Int {
    var dp = [Int](repeating: 1, count: nums.count)
    var maxValue = dp[0]
    
    // [2, 1, 5, 3, 6, 4, 8, 9, 7]
    // dp:[1, 1, 1, 1, 1, 1, 1, 1, 1]
    for i in 1..<nums.count {
        for j in 0..<i {
            // 1. 1 > 2
            // 2. 5 > 2, dp:[1, 1, 2, 1, 1, 1, 1, 1, 1]
            // 2. 5 > 1, dp:[1, 1, 2, 1, 1, 1, 1, 1, 1]
            // 3. 3 > 2, dp:[1, 1, 2, 2, 1, 1, 1, 1, 1]
            // 3. 3 > 1, dp:[1, 1, 2, 2, 1, 1, 1, 1, 1]
            // 3. 3 > 2, dp:[1, 1, 2, 2, 1, 1, 1, 1, 1]
            // 3. 3 > 5
            // 4. 6 > 2, dp:[1, 1, 2, 2, 2, 1, 1, 1, 1]
            // 4. 6 > 1, dp:[1, 1, 2, 2, 2, 1, 1, 1, 1]
            // 4. 6 > 5, dp:[1, 1, 2, 2, 3, 1, 1, 1, 1]
            // 4. 6 > 3, dp:[1, 1, 2, 2, 3, 1, 1, 1, 1]
            // 5. 4 > 2, dp:[1, 1, 2, 2, 3, 2, 1, 1, 1]
            // 5. 4 > 1, dp:[1, 1, 2, 2, 3, 2, 1, 1, 1]
            // 5. 4 > 5
            // 5. 4 > 3, dp:[1, 1, 2, 2, 3, 3, 1, 1, 1]
            // 5. 4 > 6
            if nums[i] > nums[j] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
        // 1. max(1, 1)
        // 2. max(1, 2)
        // 2. max(2, 2)
        // 4. max(2, 3)
        // 5. max(3, 3)
        maxValue = max(maxValue, dp[i])
    }
    
    return maxValue
}
print(lengthOfLIS([2, 1, 5, 3, 6, 4, 8, 9, 7]))
