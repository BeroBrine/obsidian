*06-05-2025 08:38*

*Status*:

*Tags*: [[dsa]] [[graph]] [[hard]] [[Tags/topo sort|topo sort]]  

# Course Schedule - 1 , 2
- *Problem* *Statement*: 
	There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [a_i, b_i] indicates that you must take course b_i first if you want to take course a_i.
	* For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
	Return true if you can finish all courses. Otherwise, return false.


##### Solution
- We will use [[Kahn's Algorithm]] in this.
- Suppose there is a course 1 , 2 | 2 , 4 | , 4 , 3 | 3 , 4.
	 - This states that 4 must be done before 3 and 3 must be done before 4.
	 - If we trace out this dependencies , we can see that 3 and 4 has cyclic dependency.
- So , we can apply Kahn's Algo to check whether the graph contains cyclic dependency. 
- We can convert the pre-requisite 2D array to adj list just like changing the GFG's edge array to adj list.
- Now , apply [[Cycle Detection In Directed Graph Using BFS]]
```cpp
class Solution {
public:
  bool canFinish(int numCourses, vector<vector<int>> &prerequisites) {
    vector<vector<int>> adj(numCourses);
    vector<int> indegree(numCourses);
    vector<int> topo;
    convert(prerequisites, adj);
    createIndegree(numCourses, adj, indegree);
    queue<int> q;
    for (int i = 0; i < numCourses; i++) {
      if (indegree[i] == 0) {
        q.push(i);
      }
    }
    while (!q.empty()) {
      int node = q.front();
      q.pop();
      topo.push_back(node);
      for (int neighor : adj[node]) {
        indegree[neighor] -= 1;
        if (indegree[neighor] == 0) {
          q.push(neighor);
        }
      }
    }
    if (topo.size() < numCourses) {
      return false;
    }
    return true;
  }

  void convert(vector<vector<int>> &edges, vector<vector<int>> &adj) {
    for (auto edge : edges) {
      int u = edge[0];
      int v = edge[1];
      adj[u].push_back(v);
    }
  }

  void createIndegree(int V, vector<vector<int>> &adj, vector<int> &indegree) {
    for (int i = 0; i < V; i++) {
      for (int neighbor : adj[i]) {
        indegree[neighbor] += 1;
      }
    }
  }
};

```

#### Course Schedule - 2
- It's the same as the first one you just have to return the topo sort of the courses if it's possible
- Remember in this question the edge are reversed

```cpp
class Solution {
public:
  vector<int> findOrder(int numCourses, vector<vector<int>> &prerequisites) {
    vector<vector<int>> adj(numCourses);
    vector<int> indegree(numCourses);
    vector<int> topo;
    convert(prerequisites, adj);
    createIndegree(numCourses, adj, indegree);
    queue<int> q;
    for (int i = 0; i < numCourses; i++) {
      if (indegree[i] == 0) {
        q.push(i);
      }
    }
    while (!q.empty()) {
      int node = q.front();
      q.pop();
      topo.push_back(node);
      for (int neighbor : adj[node]) {
        indegree[neighbor] -= 1;
        if (indegree[neighbor] == 0) {
          q.push(neighbor);
        }
      }
    }
    vector<int> emptyVec;
    return topo.size() == numCourses ? topo : emptyVec;
  }
  void convert(vector<vector<int>> &edges, vector<vector<int>> &adj) {
    for (auto edge : edges) {
      int u = edge[0];
      int v = edge[1];
      adj[v].push_back(u);
    }
  }

  void createIndegree(int V, vector<vector<int>> &adj, vector<int> &indegree) {
    for (int i = 0; i < V; i++) {
      for (int neighbor : adj[i]) {
        indegree[neighbor] += 1;
      }
    }
  }
};


```


## References
- [striver sheet link](https://takeuforward.org/data-structure/course-schedule-i-and-ii-pre-requisite-tasks-topological-sort-g-24/)
- [yt video link](https://www.youtube.com/watch?v=WAOfKpxYHR8&ab_channel=takeUforward)
- [leetcode question link CS-1](https://leetcode.com/problems/course-schedule/)
- [leetcode question link CS-2](https://leetcode.com/problems/course-schedule-ii/)
