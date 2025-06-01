*01-06-2025 18:39*

*Status*: [[revise]]

*Tags*: [[dsa]] [[graph]] [[medium question]]

# Most Stones Removed With Same Column or Row
- *Problem* *Statement*: 
	On a 2D plane, we place n stones at some integer coordinate points. Each coordinate point may have at most one stone.
	
	A stone can be removed if it shares either the same row or the same column as another stone that has not been removed.
	
	Given an array stones of length n where stones[i] = [x_i, y_i] represents the location of the i^th stone, return the largest possible number of stones that can be removed.
	│ Input: stones = [[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]
	│ Output: 5
	│ Explanation: One way to remove 5 stones is as follows:
	│ 1. Remove stone [2,2] because it shares the same row as [2,1].
	│ 2. Remove stone [2,1] because it shares the same column as [0,1].
	│ 3. Remove stone [1,2] because it shares the same row as [1,0].
	│ 4. Remove stone [1,0] because it shares the same column as [0,0].
	│ 5. Remove stone [0,1] because it shares the same row as [0,0].
	│ Stone [0,0] cannot be removed since it does not share a row/column with another stone still on the plane.

### Solution
##### See the handwritten notes for better explanation
- We will utilise [[Disjoint Set Union By Rank And Size]] for this.
	- How? What are the nodes and stuff.
		- The nodes are the row and col that house the nodes.
			- How do we convert this to a grid like?
				- By using maxRow and maxCol , we can track the stones in a gridlike fashion

- The max number of stones that can be removed can be derived as n - no of components
	![[FT_2025-06-01 20:05:21.499.png]]	
- So what we need to do is find valid number of components in the disjoint set.
	- The nodes are represented as row number and column being offset by col + maxRow + 1.
		- For this grid
			![[FT_2025-06-01 20:07:53.213.png]]
		- The mappings are 	
			![[FT_2025-06-01 20:07:11.847.png]]

- How do we find the number of valid components?
	- It can be done by counting unique number of parents.
		- Using parents array for this will skew the results as there are some stones pending after removing all which will have the parents as themselves.
		- To counter this , we create a map which will store the stoneNode , eg 0 , 7 
			- *The values which we sent to the disjoint set*
- Using this map , check the unique number of parents 
	- the answer will be n - number of components



##### Handwritten Notes
![[Stones.pdf]]
##### Code
```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
class Solution {
  vector<int> rank, parent;

public:
  int removeStones(vector<vector<int>> &stones) {
    int n = stones.size();
    int maxRow = 0;
    int maxCol = 0;
    for (auto it : stones) {
      maxRow = max(maxRow, it[0]);
      maxCol = max(maxCol, it[1]);
    }
    rank.resize(maxRow + maxCol + 2, 0);
    parent.resize(maxRow + maxCol + 2, 0);
    for (int i = 0; i < maxRow + maxCol + 2; i++) {
      parent[i] = i;
    }

    unordered_map<int, int> stoneNodes;
    for (auto it : stones) {
      int row = it[0];
      int col = it[1] + maxRow + 1;
      unionByRank(row, col);
      stoneNodes[row] = 1;
      stoneNodes[col] = 1;
    }

    int cnt = 0;
    for (auto it : stoneNodes) {
      if (findUltParent(it.first) == it.first) {
        cnt++;
      }
    }
    return n - cnt;
  }

  int findUltParent(int node) {
    if (node == parent[node])
      return node;
    return parent[node] = findUltParent(parent[node]);
  }
  void unionByRank(int u, int v) {
    int ult_u = findUltParent(u);
    int ult_v = findUltParent(v);
    if (ult_u == ult_v)
      return;
    if (rank[ult_v] < rank[ult_u]) {
      parent[ult_v] = ult_u;
    } else if (rank[ult_u] < rank[ult_v]) {
      parent[ult_u] = ult_v;
    } else {
      parent[ult_u] = ult_v;
      rank[ult_v]++;
    }
  }
};
// @leet end

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/most-stones-removed-with-same-row-or-column-dsu-g-53/)
- [leetcode question link](https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/)
- ![yt video link](https://www.youtube.com/watch?v=OwMNX8SPavM&feature=youtu.be)