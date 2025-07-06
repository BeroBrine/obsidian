*06-07-2025 18:22*

*Status*:

*Tags*: [[dsa]] [[dp]]
# Maximum Product Subarray
##### Problem Statement
Given an integer array nums, find a subarray that has the largest product, and return the product.

The test cases are generated so that the answer will fit in a 32-bit integer.

 Example 1:
│ Input: nums = [2,3,-2,4]
│ Output: 6
│ Explanation: [2,3] has the largest product 6.

 Example 2:
│ Input: nums = [-2,0,-1]
│ Output: 0
│ Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
##### Solution
- This question is solved based on observations 
	- Observations 
		- if all elements are positive , just multiply them.
		- If even number of negatives , multiply all because it will give positives at the end.
		- If odd number of negatives
			- We cannot include one negative in the subarray and the negative will be the best case for eg (-1 , -6 , -4 -> ignoring -1 will be best as -6 * -4 will yield a bigger number in the subarray.)
			- So what we can do is keep a prefix that will calculate the product before the negative and a suffix that will calculate the product after the negatives. 
			- Maximum of both will be the answer
		- Zero in the array
			- Including zero will make the whole product zero. 
				- To counter this whenever the prefix and suffix becomes 0 , just reinit them with 1.


##### Handwritten Notes
![[Max subarr product.pdf]]
##### Code
```cpp
#include <bits/stdc++.h>
#include <cstdint>
using namespace std;

// @leet start
class Solution {
public:
  int maxProduct(vector<int> &nums) {
    double prefix = 1;
    double suffix = 1;

    double n = nums.size();

    double maxi = INT32_MIN;

    for (int i = 0; i < n; i++) {
      if (prefix == 0)
        prefix = 1;
      if (suffix == 0)
        suffix = 1;

      prefix = prefix * nums[i];
      suffix = suffix * nums[n - i - 1];
      maxi = max(maxi, max(prefix, suffix));
    }
    return maxi;
  }
};
// @leet end

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/maximum-product-subarray-in-an-array/)
- [leetcode question link](https://leetcode.com/problems/maximum-product-subarray/)
- ![yt video link](https://youtu.be/hnswaLJvr6g?si=WlRBgs85oRl6i9dH)