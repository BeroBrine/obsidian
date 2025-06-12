*11-06-2025 22:11*

*Status*: 

*Tags*: [[dsa]] [[graph]] [[medium question]]

# Frog Jump

##### Problem Statement
- Given an integer array height[] where height[i] represents the height of the i-th stair, a frog starts from the first stair and wants to reach the top. From any stair i, the frog has two options: it can either jump to the (i+1)th stair or the (i+2)th stair. The cost of a jump is the absolute difference in height between the two stairs. Determine the minimum total cost required for the frog to reach the top.
##### Solution
-  




##### Handwritten Notes
![[]]
##### Code

##### Memoized
```cpp
class Solution {
  public:
    int minCost(vector<int>& height) {
        int n = height.size();
        vector<int> dp(n + 1 , 0);
        f(n , height , dp);
        return dp[n-1];
        
    }
    
    int f(int index , vector<int> &heights , vector<int> &dp) {
        if(index == 0) return 0;
        if(dp[index] != 0) return dp[index];
        
        int lr = abs(heights[index] - heights[index-1]) + f(index-1 , heights , dp);
        int rr = INT_MAX;
        if(index > 1) {
            rr = abs(heights[index] - heights[index - 2]) + f(index - 2 , heights , dp);
        }
        return dp[index] = min(lr , rr);
    }
    
 };
```

##### Tabulated
```cpp
class Solution {
  public:
    int minCost(vector<int>& height) {
        // Code here
        int n = height.size();
        vector<int> dp(n+1 , 0);
        
        dp[0] = 0;
        
        for(int i= 1 ; i < n ; i++) {
            int ls = dp[i-1] + abs(height[i] - height[i-1]);
            int rs = INT_MAX;
            if(i > 1) {
                rs = dp[i-2] + abs(height[i] - height[i-2]);
            }
            dp[i] = min(ls , rs);
        }
        
        return dp[n-1];
    }
};
```



## References
- [striver sheet link](https://takeuforward.org/data-structure/dynamic-programming-frog-jump-dp-3/)
- [leetcode question link]()
- ![yt video link](https://www.youtube.com/watch?v=EgG3jsGoPvQ)