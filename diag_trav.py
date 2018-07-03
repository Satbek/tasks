#!/usr/bin/python
class Solution:
	def diag_down(self, i, j):
		res = []
		res.append(self.matrix[i][j])
		while (i != self.A - 1 and j != 0):
			i = i + 1
			j = j - 1
			res.append(self.matrix[i][j])
		return res

	def findDiagonalOrder(self, matrix):
		"""
		:type matrix: List[List[int]]
		:rtype: List[int]
		"""
		self.matrix = matrix
		if (len(matrix) == 0):
			return matrix
		self.A = len(matrix)
		self.B = len(matrix[0])
		res = []
		flag = True
		for i in range(self.B):
			ans = self.diag_down(0, i);
			if (flag):
				ans = ans[::-1]
				flag = False
			else:
				flag = True
			res += ans
		for i in range(1,self.A):
			ans = self.diag_down(i,self.B - 1)
			if (flag):
				ans = ans[::-1]
				flag = False
			else:
				flag = True
			res += ans
		return res

s = Solution()

print(s.findDiagonalOrder([[2,3]]))