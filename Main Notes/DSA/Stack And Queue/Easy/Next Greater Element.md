*26-07-2025 19:47*

*Status*:

*Tags*: [[dsa]] [[stack and queue]]

# Next Greater Element

##### Problem Statement
The next greater element of some element x in an array is the first greater element that is to the right of x in the same array.

You are given two distinct 0-indexed integer arrays nums1 and nums2, where nums1 is a subset of nums2.

For each 0 <= i < nums1.length, find the index j such that nums1[i] == nums2[j] and determine the next greater element of nums2[j] in nums2. If there is no next greater element, then the answer for this query is -1.

Return an array ans of length nums1.length such that ans[i] is the next greater element as described above.

Example 1:


Input: nums1 = [4,1,2], nums2 = [1,3,4,2]
Output: [-1,3,-1]
Explanation: The next greater element for each value of nums1 is as follows:
- 4 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
- 1 is underlined in nums2 = [1,3,4,2]. The next greater element is 3.
- 2 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.


Example 2:


Input: nums1 = [2,4], nums2 = [1,2,3,4]
Output: [3,-1]
Explanation: The next greater element for each value of nums1 is as follows:
- 2 is underlined in nums2 = [1,2,3,4]. The next greater element is 3.
- 4 is underlined in nums2 = [1,2,3,4]. There is no next greater element, so the answer is -1.

Constraints:
	1 <= nums1.length <= nums2.length <= 1000
	0 <= nums1[i], nums2[i] <= 104
	All integers in nums1 and nums2 are unique.
	All the integers of nums1 also appear in nums2.

##### Solution
- This question needs a monotonic stack to solve 
	- A monotonic stack is a stack that stores element in a specified order , be it increasing , decreasing or custom
- For finding the next greater element for a given index in an array , we need to know the right elements for it.
	- How will we know what are the right elements?
		- Using stack
	- For a number on a given index , call it standing , we need to find it's nge
	- If the top of the stack is greater than the number we are on , it is it's nge
		- But if not , we empty the stack until we find any number greater than the standing one
			- Will this exhaust any potential answer for element on the left of the standing one?
			- No , as for any element on the left of standing , if it's smaller than the standing , it's nge is the standing element itself , if it's larger than standing , then it will pop out the standing one and find it's nge	
	- After this , we push the element to the stack
	- This question requires mapping number to nge as there is a given array nums1 which asks us to find the nge of the given numbers in the array.


##### Handwritten Notes
![[Next greater element.pdf]]
##### Code
```cpp
#include <bits/stdc++.h>
using namespace std;
// @leet start
class Solution {
public:
  vector<int> nextGreaterElement(vector<int> &nums1, vector<int> &nums2) {
    stack<int> st;
    int size = nums2.size();
    vector<int> ans;
    unordered_map<int, int> ngeMap;

    for (int i = size - 1; i >= 0; i--) {
      int standing = nums2[i];
      while (!st.empty() && st.top() <= standing) {
        st.pop();
      }
      if (st.empty())
        ngeMap[standing] = -1;
      else
        ngeMap[standing] = st.top();
      st.push(standing);
    }

    for (auto i : nums1) {
      ans.push_back(ngeMap[i]);
    }

    return ans;
  }
};
// @leet end

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/next-greater-element-using-stack/)
- [leetcode question link](https://leetcode.com/problems/next-greater-element-i/)
- ![yt video link](https://www.youtube.com/watch?v=e7XQLtOQM3I&ab_channel=takeUforward)