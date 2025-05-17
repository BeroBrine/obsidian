*17-05-2025 22:18*

*Status*:

*Tags*: [[dsa]] [[graph]] [[medium question]]

# Network Delay Time
- *Problem* *Statement*: 
	You are given a network of n nodes, labeled from 1 to n. You are also given times, a list of travel times as directed edges times[i] = (ui, vi, wi), where ui is the source node, vi is the target node, and wi is the time it takes for a signal to travel from source to target.
	
	We will send a signal from a given node k. Return the minimum time it takes for all the n nodes to receive the signal. If it is impossible for all the n nodes to receive the signal, return -1.



#### Solution
- This was a simple implementation of [[Dijkstra's Algorithm]] just the edge weight is the time.
	- The only cavaet is the min time is asked to reach all of the nodes.
	- The minimum time is the maximum time in the time array after dijkstra has ended
	- If dijkstra has ended and there is still a node who has 1e9 as it's time then it's unreachable.


```cpp
using namespace std;

// @leet start
class Solution {
public:
  int networkDelayTime(vector<vector<int>> &times, int n, int k) {

    vector<vector<pair<int, int>>> adj(n + 1);
    convert(times, adj);
    vector<int> time(n + 1, 1e9);
    priority_queue<pair<int, int>, vector<pair<int, int>>,
                   greater<pair<int, int>>>
        pq;
    pq.push({0, k});
    time[k] = 0;
    while (!pq.empty()) {
      auto front = pq.top();
      pq.pop();
      int tme = front.first;
      int node = front.second;
      for (auto it : adj[node]) {
        int neighbor = it.first;
        int edgeTime = it.second;
        if (edgeTime + tme < time[neighbor]) {
          time[neighbor] = edgeTime + tme;
          pq.push({time[neighbor], neighbor});
        }
      }
    }
    int ans = INT_MIN;
    for (int i = 1; i <= n; i++) {
      int it = time[i];
      if (it == 1e9)
        return -1;

      ans = max(it, ans);
    }

    return ans;
  }
  void convert(vector<vector<int>> &times,
               vector<vector<pair<int, int>>> &adj) {
    for (auto it : times) {
      int u = it[0];
      int v = it[1];
      int time = it[2];
      adj[u].push_back({v, time});
    }
  }
};
// @leet end

```

## References
- [leetcode question link](https://leetcode.com/problems/network-delay-time/)
### Unavailable
- [striver sheet link]()
- ![yt video link]()