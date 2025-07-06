*14-06-2025 19:31*

*Status*:

*Tags*: [[dsa]] [[dp]]

# Maximum Sum of non-adjacent elements

##### Problem Statement
Given an array arr containing positive integers. Find the maximum sum of any possible subsequence such that no two numbers in the subsequence should be adjacent in array arr.

Examples:

Input: arr[] = [5, 5, 10, 100, 10, 5]
Output: 110
Explanation: If you take indices 0, 3 and 5, then = 5+100+5 = 110.
##### Solution
- This problem is of the type of not pick and pick. 

###### How to build the recurrence relation.
- Base Case
	- If we ever reach index == 0 , we know that we haven't picked up index 1 , as we cannot take  adjacent index , so index == 0 is only possible when we haven't picked index = 1. So the best thing we can do is pick up the arr[0].
	- If index ever reaches negative , we can return 0.
- Pick
	- If we are picking up the element  , we cannot pick up the adjacent element as specified. So we send f(index - 2).
- Not pick
	- If we are not picking this element , then we can check for the adjacent element , so we send f(index - 1).
- For every branch we can check for npick or pick  , which one is giving us the maximum sum.
##### Handwritten Notes
![[Non Adjacent sum.pdf]]
##### Code
```cpp
// User function template for C++
class Solution {
  public:
    // calculate the maximum sum with out adjacent
    int findMaxSum(vector<int>& arr) {
        int n = arr.size();
        if (n == 0) return 0;
        if(n == 1) return arr[0];
        vector<int> dp(n +1 , 0);
        
        int prev1 = arr[0];
        int prev2 = 0;
        for(int i = 1 ; i < n ; i++) {
            
            int take = arr[i] + prev2;
            int ntake = prev1;
            int curr = max(take , ntake);
            
            prev2 = prev1;
            prev1 = curr;
            
            
        }
        return prev1;
        
    }
    
    int helper(int index ,vector<int> &arr , vector<int> &dp) {
        if(index == 0) {
            return arr[index];
        }
        if(index < 0) return 0;
        if(dp[index] != 0) return dp[index];
        int pick = arr[index] + helper(index-2 , arr , dp);
        int npick = helper(index-1 , arr , dp);
        
        return dp[index] = max(pick , npick);
    }
};
```
## References
- [striver sheet link](https://takeuforward.org/data-structure/maximum-sum-of-non-adjacent-elements-dp-5/)
- [GFG question link](https://www.geeksforgeeks.org/problems/max-sum-without-adjacents2430/1)
- ![yt video link](https://www.youtube.com/watch?v=GrMBfJNk_NY)