*24-05-2025 17:31*

*Status*:

*Tags*: [[dsa]] [[hard]] [[graph]]
# Find The City With The Smallest Number Of Neighbors In A Threshold Distance
- *Problem* *Statement*: 
	There are n cities numbered from 0 to n-1. Given the array edges where edges[i] = [from_i, to_i, weight_i] represents a bidirectional and weighted edge between cities from_i and to_i, and given the integer distanceThreshold.
	
	Return the city with the smallest number of cities that are reachable through some path and whose distance is at most distanceThreshold, If there are multiple such cities, return the city with the greatest number.
	
	Notice that the distance of a path connecting cities i and j is equal to the sum of the edges' weights along that path.

#### Solution
- This question can be done with both [[Dijkstra's Algorithm]] as well as [[Floyd Warshall Algorithm]].
	- What we need to do this is apply floyd and find all the minimum distance 2d array. 
	- From there we can iterate for each city , what are the cities that are reachable from it and are under the threshold distance.
	- To count this we keep a cnt var which counts these , and a countMax to which we compare the cnt to.
	- For every city , increase cnt if we encounter a city with it's min distance is less than the threshold.
	- if the cnt is less than the cntMax , it means this city has less number of cities under threshold distance , update the cntMax to max and set the cityNo to the parent city.

#### Full Code
```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
class Solution {
public:
  int findTheCity(int n, vector<vector<int>> &edges, int distanceThreshold) {

    int cntMax = n + 1;
    int city = -1;
    vector<vector<int>> cost(n, vector<int>(n, 1e8));

    convert(n, cost, edges);
    for (int i = 0; i < n; i++)
      cost[i][i] = 0;
    for (int via = 0; via < n; via++) {
      int cnt = 0;
      for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
          if (cost[i][via] != 1e8 and cost[via][j] != 1e8) {
            cost[i][j] = min(cost[i][j], cost[i][via] + cost[via][j]);
          }
        }
      }
    }

    for (int via = 0; via < n; via++) {
      int cnt = 0;
      for (int i = 0; i < n; i++) {
        if (cost[via][i] <= distanceThreshold) {
          cnt++;
        }
      }

      if (cnt <= cntMax) {
        cntMax = cnt;
        city = via;
      }
    }
    return city;
  }

  void convert(int n, vector<vector<int>> &cost, vector<vector<int>> &edges) {
    for (auto vec : edges) {
      int u = vec[0];
      int v = vec[1];
      int cs = vec[2];
      cost[u][v] = cs;
      cost[v][u] = cs;
    }
  }
};
// @leet end

```










## References
- [striver sheet link](https://takeuforward.org/data-structure/find-the-city-with-the-smallest-number-of-neighbours-at-a-threshold-distance-g-43/)
- [leetcode question link](https://leetcode.com/problems/find-the-city-with-the-smallest-number-of-neighbors-at-a-threshold-distance/)
- ![yt video link](https://www.youtube.com/watch?v=9XybHVqTHcQ&feature=youtu.be)