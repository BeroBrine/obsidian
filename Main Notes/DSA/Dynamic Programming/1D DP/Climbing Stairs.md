*08-06-2025 17:07*

*Status*:

*Tags*: [[dsa]] [[dp]] [[medium question]]

# Climbing Stairs

##### Problem Statement
You are climbing a staircase. It takes n steps to reach the top.
Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

󰛨 Example 1:
│ Input: n = 2
│ Output: 2
│ Explanation: There are two ways to climb to the top.
│ 1. 1 step + 1 step
│ 2. 2 steps
##### Solution
- Classic example of DP. 
	- How did we know it's a question of DP?
		- It asks to find all the ways to reach the stairs
- We will be taking top down approach
	- That is starting from the nth and going back to 0th case
 - We know that for each recursion call , it can jump either 1 or 2.
	- Edge case here is if it's at 1 and it tries to jump 2 steps , it can go into negative which is out of bounds.

- Memoize it by using dp arr.

##### Handwritten Notes
![[Climbing stairs.pdf]]
##### Code
```cpp
class Solution {
public:
  int climbStairs(int n) {
    vector<int> dp(n + 1, -1);
    return countSteps(n, n, dp) + 1;
  }

  int countSteps(int ind, int n, vector<int> &dp) {
    if (ind == 0)
      return 0;
    if (ind == 1)
      return 0;
    if (dp[ind] != -1)
      return dp[ind];

    return dp[ind] =
               1 + countSteps(ind - 1, n, dp) + countSteps(ind - 2, n, dp);
  }
};

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/dynamic-programming-climbing-stairs/)
- [leetcode question link](https://leetcode.com/problems/climbing-stairs/)
- ![yt video link](https://www.youtube.com/watch?v=mLfjzJsN8us&feature=youtu.be)