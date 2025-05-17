*17-05-2025 19:50*

*Status*:

*Tags*: [[dsa]] [[graph]] [[hard]]

# Cheapest Flights Within K Stops
- *Problem* *Statement*: 
	There are n cities connected by some number of flights. You are given an array flights where flights[i] = [fromi, toi, pricei] indicates that there is a flight from city fromi to city toi with cost pricei.
	
	You are also given three integers src, dst, and k, return the cheapest price from src to dst with at most k stops. If there is no such route, return -1.
	
#### Solution
- This uses slight modified version of [[Dijkstra's Algorithm]]. 
	- Instead of priotorising distance in this. 
		- We prioritise number of stops.
	- Why?
		- Suppose number of stops that can be taken is 3. But if there is a path on which a node value becomes less but the number of stops is invalid on that path. Dijkstra will not let the node distance be updated even if it lies on the shortest path with correct number of steps. 
		- That's why number of stops is the judging factor to check.
	- Why do we not need a priority queue in this?
		- Because the number of stops are being increased by unity , so no matter what the next iteration will always bring the shortest stop.


```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
class Solution {
  struct Info {
    int steps;
    int node;
    int dist;
  };

public:
  int findCheapestPrice(int n, vector<vector<int>> &flights, int src, int dst,
                        int k) {

    queue<Info> q;
    vector<int> dist(n, 1e9);
    vector<vector<pair<int, int>>> adj(n);
    convert(flights, adj);
    q.push({0, src, 0});
    while (!q.empty()) {
      auto front = q.front();
      q.pop();
      int steps = front.steps;
      int node = front.node;
      int dis = front.dist;
      if (steps > k) {
        break;
      }
      for (auto it : adj[node]) {
        int neighbor = it.first;
        int cost = it.second;
        if (cost + dis < dist[neighbor]) {
          dist[neighbor] = cost + dis;
          q.push({steps + 1, neighbor, dist[neighbor]});
        }
      }
    }

    return dist[dst] == 1e9 ? -1 : dist[dst];
  }

  void convert(vector<vector<int>> &flights,
               vector<vector<pair<int, int>>> &adj) {
    for (auto flight : flights) {
      int from = flight[0];
      int to = flight[1];
      int cost = flight[2];
      adj[from].push_back({to, cost});
    }
  }
};
// @leet end

```







## References
- [striver sheet link]()
- [leetcode question link]()
- ![yt video link]()