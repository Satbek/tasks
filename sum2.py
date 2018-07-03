#!/usr/bin/python3
class Solution:
	def twoSum(self, numbers, target):
		"""
		:type numbers: List[int]
		:type target: int
		:rtype: List[int]
		"""
		i = 0
		j = len(numbers) - 1
		res = []
		for i in range(len(numbers)):
			first = numbers[i]
			find = target - first
			i_bin = i + 1
			j_bin = len(numbers) - 1
			while (i_bin <= j_bin):
				center = i_bin + (j_bin - i_bin) // 2
				if (numbers[center] == find):
					return [i + 1, center + 1]
				elif (numbers[center] < find):
					i_bin = center + 1
				elif (numbers[center] > find):
					j_bin = center - 1
				print(i_bin,find, numbers[center],j_bin)


s = Solution()
print(s.twoSum([2,3,4],6))