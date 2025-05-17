*17-05-2025 19:46*

*Status*:

*Tags*: [[dsa]] [[graph]] [[medium question]]

# Minimum Effort Path
- *Problem* *Statement*: 
	You are a hiker preparing for an upcoming hike. You are given heights, a 2D array of size rows x columns, where heights[row][col] represents the height of cell (row, col). You are situated in the top-left cell, (0, 0), and you hope to travel to the bottom-right cell, (rows-1, columns-1) (i.e., 0-indexed). You can move up, down, left, or right, and you wish to find a route that requires the minimum effort.
	
	A route's effort is the maximum absolute difference in heights between two consecutive cells of the route.
	
	Return the minimum effort required to travel from the top-left cell to the bottom-right cell.


#### Soltution
- The intuition in this question is to apply [[Dijkstra's Algorithm]] but with modified cost calculation equation.
- For each node it will calculate what's the maximum effort till now?
- If the maximum effort from that node is less than that of effort another node took to reach it. Update the dist(effort array).


#### Full Code
```cpp
#include <bits/stdc++.h>
using namespace std;
// @leet start
class Solution {
public:
  int minimumEffortPath(vector<vector<int>> &heights) {
    int m = heights.size();
    int n = heights[0].size();
    vector<vector<int>> dist(m, vector<int>(n, 1e9));
    set<pair<int, pair<int, int>>> set;
    set.insert({0, {0, 0}});
    dist[0][0] = 0;
    int rowDir[] = {-1, 0, 1, 0};
    int colDir[] = {0, -1, 0, 1};
    while (!set.empty()) {
      auto front = *(set.begin());
      set.erase(front);
      int dis = front.first;
      auto dimensionInfo = front.second;
      int row = dimensionInfo.first;
      int col = dimensionInfo.second;
      if (row == m - 1 and col == n - 1) {
        return dis;
      }
      for (int i = 0; i < 4; i++) {
        int drow = rowDir[i];
        int dcol = colDir[i];
        int nrow = row + drow;
        int ncol = col + dcol;
        if (nrow >= 0 and ncol >= 0 and nrow < m and ncol < n) {
          int absDiff = abs(heights[nrow][ncol] - heights[row][col]);
          int maxEffort = max(absDiff, dis);
          if (dist[nrow][ncol] > maxEffort) {
            set.erase({dist[nrow][ncol], {nrow, ncol}});
            dist[nrow][ncol] = maxEffort;
            set.insert({dist[nrow][ncol], {nrow, ncol}});
          }
        }
      }
    }
    return 0;
  }
};
// @leet end


```







## References
- [striver sheet link](https://takeuforward.org/data-structure/g-37-path-with-minimum-effort/)
- [leetcode question link](https://leetcode.com/problems/path-with-minimum-effort/description/)
- ![yt video link](https://www.youtube.com/watch?v=0ytpZyiZFhA&feature=youtu.be)