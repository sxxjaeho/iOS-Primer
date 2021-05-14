import UIKit

/*
 题目：给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
 
 说明: 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。

 示例：

 输入：
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 输出：[1,2,2,3,5,6]
 
 时间复杂度：O(n+m) 空间复杂度：O(1)
 */

// 双指针 / 从后往前
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    // i = 2, j = 2
    var i = m - 1, j = n - 1
    if i < 0 {
        nums1 = nums2
    } else if j < 0 {
    } else {
        while i >= 0 || j >= 0 { // 数组1或者数组2其中有一个数组没有遍历完
            if j < 0 || (i >= 0 && j >= 0 && nums1[i] > nums2[j]) { // 数组2遍历完 或者 数组1和数组2都没有遍历完且数组1当前遍历的数大于数组2当前遍历的数
                nums1[i + j + 1] = nums1[i]
                i -= 1
                // 3.     [1, 2, 3, 3, 5, 6]     i = 1, j = 0
                // 5.     [1, 2, 3, 3, 5, 6]     i = 0, j = -1
                // 6.     [1, 2, 3, 3, 5, 6]     i = -1, j = -1
            } else { // 数组1和数组2都没有遍历完且数组1当前遍历的数小于或者等于数组2当前遍历的数
                nums1[i + j + 1] = nums2[j]
                j -= 1
                // 1.     [1, 2, 3, 0, 0, 6]     i = 2, j = 1
                // 2.     [1, 2, 3, 0, 5, 6]     i = 2, j = 0
                // 4.     [1, 2, 2, 3, 5, 6]     i = 1, j = -1
            }
        }
    }
}

var nums1 = [1, 2, 3, 0, 0, 0]
var nums2 = [2, 5, 6]
merge(&nums1, 3, nums2, 3)
print(nums1)

//void merge(int* A, int ALen, int m, int* B, int BLen, int n) {
//    int i = ALen - 1;
//    int j = BLen - 1;
//    if (i < 0) {
//        for(; n>=0; n--)
//            A[n-1] = B[n-1];
//    } else if (j < 0) {
//    } else {
//        while (i >= 0 || j >= 0) {
//            if (j < 0 || (i >= 0 && j >= 0 && A[i] > B[j])) {
//                A[i + j + 1] = A[i];
//                i -= 1;
//            } else {
//                A[i + j + 1] = B[j];
//                j -= 1;
//            }
//        }
//    }
//}
