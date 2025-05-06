*18-04-2025 01:03*

*Status*:

*Tags*: [[dsa]] [[medium question]] [[graph]] 

# Number Of Provinces
- *Problem* *Statement*: 
	There are n cities. Some of them are connected, while some are not. If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c.
	
	A province is a group of directly or indirectly connected cities and no other cities outside of the group.
	
	You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the i^th city and the j^th city are directly connected, and isConnected[i][j] = 0 otherwise.
	
	Return the total number of provinces.
	
#### Solution
- In this problem , first of all convert the given adjacency matrix to list with the convert function
	- *Keep in mind the loop variables*

```cpp
void convert(vector<vector<int>> &adj_matrix, vector<vector<int>> &list) {
        int n = adj_matrix.size();
        for (int i = 0; i < n; ++i) {
            for (int j = i + 1; j < n; ++j) {  // avoid duplicates
                if (adj_matrix[i][j] == 1) {
                    list[i].push_back(j);
                    list[j].push_back(i);
                }
            }
        }
    }

```

- Now , we perform [[DFS]] traversal for each node. Why?
	- Because performing DFS for one node will mark all the nodes visited that are connected to it.
	- But it cannot mark those nodes which are not connected to it.
	- So performing dfs for each node and counting the number of dfs done tells us how many provinces we have.
	- Because doing for one node will mark all nodes visited that are connected to it. The dfs in the parent function will only occurr for those nodes that were not marked visited by the children call . 
	
```cpp
class Solution {
public:
  int findCircleNum(vector<vector<int>> &isConnected) {
    int n = isConnected.size();
    vector<vector<int>> list(n);
    convert(isConnected, list);
    int cnt = 0;
    vector<int> vis(n, 0);
    int ind = 0;

    for (int i = 0; i < n; ++i) {
      if (!vis[i]) {
        cnt++;
        dfs(i, list, vis);
      }
    }
    return cnt;
  }

  void convert(vector<vector<int>> &adj_matrix, vector<vector<int>> &list) {
    for (int i = 0; i < adj_matrix.size(); i++) {
      for (int j = i + 1; j < adj_matrix.size(); j++) {
        if (adj_matrix[i][j] == 1) {
          list[i].push_back(j);
          list[j].push_back(i);
        }
      }
    }
    cout << "here" << endl;
  }
  void dfs(int node, vector<vector<int>> &nodes, vector<int> &vis) {
    vis[node] = 1;
    for (int i : nodes[node]) {
      if (!vis[i]) {

        dfs(i, nodes, vis);
      }
    }
  }
};

```





## References
- [striver sheet link](https://takeuforward.org/data-structure/number-of-provinces/)
- [yt video link](https://www.youtube.com/watch?v=ACzkVtewUYA&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/number-of-provinces/)