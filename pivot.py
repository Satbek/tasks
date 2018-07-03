#!/usr/bin/python3
nums = [0,1]
class Solution:
    def pivotIndex(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        if (len(nums) == 0):
            return -1
        pivot = 0
        sum_left = 0
        sum_right = sum(nums[1:])
        while(sum_left != sum_right):
            if (pivot + 1 > len(nums) - 1):
                break
            sum_left += nums[pivot]
            sum_right -= nums[pivot + 1]
            pivot = pivot + 1

        if (sum_right != sum_left):
            pivot = -1
        return pivot 

p = Solution()
print (p.pivotIndex(nums))
