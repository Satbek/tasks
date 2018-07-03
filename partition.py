#!/usr/bin/python3
class Solution:
	def arrayPairSum(self, nums):
		"""
		:type nums: List[int]
		:rtype: int
		"""
		return sum(sorted(nums)[0:len(nums) // 2])
		
s = Solution()

print(s.arrayPairSum([1,2,3,4]))




