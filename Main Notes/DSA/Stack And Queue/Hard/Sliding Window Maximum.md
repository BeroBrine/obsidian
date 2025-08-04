*04-08-2025 17:07*

*Status*: [[revise]]

*Tags*: [[dsa]] [[stack and queue]] [[hard]]

# Sliding Window Maximum

##### Problem Statement

You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.

Return the max sliding window.

 
Example 1:
Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
Output: [3,3,5,5,6,7]
Explanation: 
Window position                Max
---------------               -----
[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7


Example 2:

Input: nums = [1], k = 1
Output: [1]
 
Constraints:
	1 <= nums.length <= 105
	-104 <= nums[i] <= 104
	1 <= k <= nums.length


##### Solution
- This solution will use dequeue data structure 
	- Dequeue data structure allows insertion\deletion from both ends.

**Bruteforce**
- Bruteforce solution is to run a loop inside the window that finds the minimum element inside it.
- Goes for O(n * n).

**Optimised -> Elem corresponds to the index** 
- This approach uses the dequeue data structure.
	- In the queue , we check for any element that is now out of the window.
	- For the maximum element , we are creating a sort of monotonic stack inside the queue (as we can push from the back.)
		- This sort of stack will keep elements in decreasing order. 
			- Why decreasing order? because there might be a case where the element in the current window is smallest but is largest in the next window. If we store in maximising way , it may pop out some negative value too which can be greatest in the next window containing all negative.
		- When window gets incremented , we first pop out any element that is out of bounds now , that is we are popping out from the front for any index <= index - k , k being the size of the window
		- Now we need to pop out any index that corresponds to smaller elements than the current one.
			- This makes sure that the largest element in the window is always at the front of the queue.
		- Push the index in the queue at the back.
		- Now before incrementing the window , we need to check if the first window has been exhausted and retrieve the largest element from it.
			- For further windows , as the window is being incremented by one , the next index will be starting index of the window. 
			- If there was a condition for eg the window will step 2 at a time. 
			- Now we need to push the results when the window starting is at even index.
				- (i - (k - 1)) % 2 == 0.




##### Handwritten Notes
![[Sliding window.pdf]]
##### Code
```cpp
#include <bits/stdc++.h>
using namespace std;
// @leet start
class Solution {
public:
  vector<int> maxSlidingWindow(vector<int> &nums, int k) {
    deque<int> dq;
    int n = nums.size();
    vector<int> ans;

    for (int i = 0; i < n; i++) {
      if (!dq.empty() && dq.front() <= i - k) {
        dq.pop_front();
      }

      while (!dq.empty() && nums[dq.back()] < nums[i])
        dq.pop_back();

      dq.push_back(i);
      if (i >= k - 1)
        ans.push_back(nums[dq.front()]);
    }
    return ans;
  }

  vector<int> bruteforce(vector<int> &nums, int k) {

    int n = nums.size();
    vector<int> vec;
    priority_queue<int> pq;

    for (int i = 0; i < n; i++) {
      int j = i;
      int cap = j + k;
      if (cap > n)
        break;
      while (j < cap) {
        pq.push(nums[j]);
        j++;
      }
      vec.push_back(pq.top());
      pq.pop();
    }
    return vec;
  }
};
// @leet end

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/sliding-window-maximum/)
- [leetcode question link](https://leetcode.com/problems/sliding-window-maximum/)
- ![yt video link](https://www.youtube.com/watch?v=NwBvene4Imo&ab_channel=takeUforward)