*17-05-2025 23:18*

*Status*:

*Tags*: [[dsa]] [[graph]] [[medium question]]

# Number Of Ways To Arrive At a Destination
- *Problem* *Statement*: 
	You are in a city that consists of n intersections numbered from 0 to n - 1 with bi-directional roads between some intersections. The inputs are generated such that you can reach any intersection from any other intersection and that there is at most one road between any two intersections.
	
	You are given an integer n and a 2D integer array roads where roads[i] = [ui, vi, timei] means that there is a road between intersections ui and vi that takes timei minutes to travel. You want to know in how many ways you can travel from intersection 0 to intersection n - 1 in the shortest amount of time.
	
	Return the number of ways you can arrive at your destination in the shortest amount of time. Since the answer may be large, return it modulo 109 + 7.
	![[Pasted image 20250517232012.png]]

#### Solution
- The first intuition of counting the number of times a path has touched root node just by counting when least distance path has touched it is wrong. 
	- Because imagine there is a node which is previous from the end node , but there are 3 paths from it which make least distance , but the above method will count it only as one path
- To tackle this a ways array is prepared , which keeps track of how many times a node has appeared on a path which is least.
- The algorithm applied is [[Dijkstra's Algorithm]].
	- But if the node is touched for the first time or new route has been found with least distance , the number of ways that we can arrive at adjacent node is the same as we can arrive on the current node.
		- How? Because number of ways count the least path , if there is a new least path , the adj node is a part of it , starting from the first node in the path ,  what are the ways to arrive at it?
			- The number of ways we arrived at the current node
	- But if the distance in the array is same as of edWt + distance it took to reach here , the node is sure that someone has already touched this node with least distance. 
		- So what are the ways to arrive at this location? Number of ways till now + number of ways it was already being reached by other nodes	


##### Due to the question constraint's use long long in this question.
#### Full Code
```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
class Solution {
public:
  int countPaths(int n, vector<vector<int>> &roads) {
    set<pair<long long, int>> st;
    vector<vector<pair<long long, int>>> adj(n);
    vector<long long> dist(n, LONG_MIN);
    vector<long long> ways(n, 0);
    dist[0] = 0;
    ways[0] = 1;
    long long mod = (int)1e9 + 7;
    for (auto it : roads) {
      long long u = it[0];
      long long v = it[1];
      long long cost = it[2];
      adj[u].emplace_back(v, cost);
      adj[v].emplace_back(u, cost);
    }
    st.insert({0, 0});
    while (!st.empty()) {
      auto top = *st.begin();
      st.erase(top);
      long long dis = top.first;
      long long node = top.second;
      for (auto it : adj[node]) {
        long long neighbor = it.first;
        long long edgeWt = it.second;
        if (edgeWt + dis < dist[neighbor]) {
          dist[neighbor] = edgeWt + dis;
          st.insert({dist[neighbor], neighbor});
          ways[neighbor] = ways[node];
        } else if (edgeWt + dis == dist[neighbor]) {
          ways[neighbor] = (ways[neighbor] + ways[node]) % mod;
        }
      }
    }
    return ways[n - 1] % mod;
  }
};
// @leet end

```


## References
- [striver sheet link](https://takeuforward.org/data-structure/g-40-number-of-ways-to-arrive-at-destination/)
- [leetcode question link](https://leetcode.com/problems/number-of-ways-to-arrive-at-destination/)
- ![yt video link](https://www.youtube.com/watch?v=_-0mx0SmYxA&feature=youtu.be)