*30-07-2025 09:23*

*Status*: [[quirky]] [[revise]]

*Tags*: [[dsa]] [[stack and queue]] [[hard]]

# Largest Rectangle in a Histogram

##### Problem Statement

Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.

 
Example 1:


Input: heights = [2,1,5,6,2,3]
Output: 10
Explanation: The above is a histogram where width of each bar is 1.
The largest rectangle is shown in the red area, which has an area = 10 units.


Example 2:


Input: heights = [2,4]
Output: 4


 
Constraints:
	1 <= heights.length <= 105
	0 <= heights[i] <= 104


##### Solution
- This question makes use of [[Next Greater Element]] | next smaller element. 

**Bruteforce Solution**
- The bruteforce solution makes use of nse , pse array. **The nse , pse will store index instead of height itself to correctly calculate the width , and if there is no nse , the index will be n , and if there is no pse , the index will be -1**
	- For any given bar , the area of maximum rectangle will be equal to height[i] * (nse[i] - pse[i] - 1). 
- But this will give TLE as we first need to create pse , nse array and then iterate over the whole histogram again


**Optimised Solution**
- We still need the concept of NSE , PSE. PSE can be calculated on the fly as we are iterating in that direction , but how will NSE be NSE wibe calculated?.
	- This is where stack will come into picture.
		- Push each index of the height into the stack in increasing order , when we encounter a height which does not follow this increasing trend
			- We know that this element is the NSE for all of the elements in the stack that are greater than the element itself.
			- What about the PSE , for each element in the stack , the pse for it is the number beneath this and if there is none the the pse is -1.
			- So when we are popping the element out from the stack , we take the nse as the current index , and pse as the index just below in the stack. 
		- Still after the whole traversal , there may be some elements left into the stack that have no pse or nse.
			- So for them the pse is n (length of the height arr) and nse is -1.


##### Handwritten Notes
![[Histogram rect.pdf]]
##### Code
```cpp
#include <bits/stdc++.h>
using namespace std;
// @leet start
class Solution {
public:
  int largestRectangleArea(vector<int> &heights) {
    return optimisedApproach(heights);
  }

  int optimisedApproach(vector<int> &heights) {
    int n = heights.size();
    stack<int> st;

    int max_area = 0;

    for (int i = 0; i < n; i++) {
      int curr = heights[i];

      while (!st.empty() && curr < heights[st.top()]) {
        int elem = st.top();
        st.pop();
        int nse = i;
        int pse = !st.empty() ? st.top() : -1;
        int area = heights[elem] * (nse - pse - 1);
        max_area = max(area, max_area);
      }
      st.push(i);
    }
    if (st.empty())
      return max_area;
    while (!st.empty()) {
      int elem = st.top();
      st.pop();
      int nse = n;
      int pse = !st.empty() ? st.top() : -1;
      int area = heights[elem] * (nse - pse - 1);
      max_area = max(area, max_area);
    }
    return max_area;
  }

  int bruteforce(vector<int> &heights) {

    int n = heights.size();
    vector<int> nse(n, -1);
    vector<int> pse(n, -1);

    createNSEarr(nse, heights);
    createPSEarr(pse, heights);

    int max_area = 0;
    for (int i = 0; i < n; i++) {
      cout << " at index " << i << " height nse pse is " << heights[i] << ' '
           << nse[i] << ' ' << pse[i] << '\n';
      int area = heights[i] * (nse[i] - pse[i] - 1);
      max_area = max(area, max_area);
    }

    cout << "nse\n";
    for (auto i : nse)
      cout << i << ' ';

    cout << "pse\n";
    for (auto i : pse)
      cout << i << ' ';

    return max_area;
  }

  void createNSEarr(vector<int> &nse, vector<int> &heights) {
    stack<int> st; // store indices
    int n = heights.size();

    for (int i = n - 1; i >= 0; --i) {
      while (!st.empty() && heights[st.top()] >= heights[i]) {
        st.pop();
      }

      if (st.empty()) {
        nse[i] = n;
      } else {
        nse[i] = st.top();
      }

      st.push(i);
    }
  }

  void createPSEarr(vector<int> &pse, vector<int> &heights) {
    stack<int> st; // store indices
    int n = heights.size();

    for (int i = 0; i < n; i++) {
      while (!st.empty() && heights[st.top()] >= heights[i]) {
        st.pop();
      }

      if (st.empty()) {
        pse[i] = -1;
      } else {
        pse[i] = st.top();
      }

      st.push(i);
    }
  }
};
// @leet end

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/area-of-largest-rectangle-in-histogram/)
- [leetcode question link](https://leetcode.com/problems/largest-rectangle-in-histogram/description/)
- ![yt video link](https://www.youtube.com/watch?v=Bzat9vgD0fs&ab_channel=takeUforward)