*01-06-2025 20:22*

*Status*: [[revise]] 

*Tags*: [[dsa]] [[graph]] [[hard]]

# Accounts Merge
- *Problem* *Statement*: 
	Given a list of accounts where each element accounts[i] is a list of strings, where the first element accounts[i][0] is a name, and the rest of the elements are emails representing emails of the account.
	
	Now, we would like to merge these accounts. Two accounts definitely belong to the same person if there is some common email to both accounts. Note that even if two accounts have the same name, they may belong to different people as people could have the same name. A person can have any number of accounts initially, but all of their accounts definitely have the same name.
	
	After merging the accounts, return the accounts in the following format: the first element of each account is the name, and the rest of the elements are emails in sorted order. The accounts themselves can be returned in any order.
	
	󰛨 Example 1:
	
	│ Input: accounts = [["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
	│ Output: [["John","john00@mail.com","john_newyork@mail.com","johnsmith@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]]
	│ Explanation:
	│ The first and second John's are the same person as they have the common email "johnsmith@mail.com".
	│ The third John and Mary are different people as none of their email addresses are used by other accounts.
	│ We could return these lists in any order, for example the answer [['Mary', 'mary@mail.com'], ['John', 'johnnybravo@mail.com'], 
	│ ['John', 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com']] would still be accepted.

##### Solution
- This question uses [[Disjoint Set Union By Rank And Size]].

 - The intuition to use disjoint is because we can see that if email repeats it's  "owner is to be changed" and the remaining emails are to be appended to the new owner.
   - What will the nodes will be then? 
	   - The index in the array
	- What we will do is assign the owners to each email in an map , *Map<email , owner>.* 
		- When we see an email is repeating  , we know we need to change it's owner to the stored owner in the hashmap.
			- We perform union by rank on it. 
		- If the email does not exist already , it's added to the map with it's owner set to the index. 
			- Eg , 3 index contained 2 emails , one is unique but one is duplicate and 1 is the owner, the hasmap will store the unique email as 3 , as the ultimate parent of 3 will be 1 so this will be handled later
- Now traverse on the map , and for each node find it's ultimate parent and add the email to the ultimate parents node. 
	- For this vector<string\> mails[n] is utilised. 
		- This means mails(i) contains a vector of string.
			- This is not 2d array. 
				![[FT_2025-06-01 22:12:14.730.png]]

- For each owner it will contain the mails that are merged.
- The final answer can be created with this code
```cpp
vector<vector<string>> ans;
for (int i = 0; i < n; i++) {
  if (mails[i].empty())
	continue;
  sort(mails[i].begin(), mails[i].end());
  vector<string> temp;
  temp.push_back(accounts[i][0]);
  for (auto it : mails[i]) {
	temp.push_back(it);
  }
  ans.push_back(temp);
}
```

- We skip over empty index , and then sort the list.
- A temp is created which first takes the name of merged accounts.
	- It can be found out by using the index , as this index is the owner of the list , so every merged email owner name will be accounts(i)(0).
- Then just iterate over the mails and push them into the temp and then push the temp into ans vec.
##### Handwritten Notes
![[Accounts merge.pdf]]

##### Code
```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
class Solution {
  vector<int> rank, parent;

public:
  vector<vector<string>> accountsMerge(vector<vector<string>> &accounts) {
    int n = accounts.size();

    rank.resize(n, 0);
    parent.resize(n, 0);
    for (int i = 0; i < n; i++) {
      parent[i] = i;
    }
    unordered_map<string, int> map;
    for (int i = 0; i < n; i++) {
      int node = i;
      auto it = accounts[i];
      for (int j = 1; j < it.size(); j++) {
        string email = it[j];
        if (map.find(email) != map.end()) {
          int ownerNode = map[email];
          unionByRank(ownerNode, node);
        } else {
          map[email] = node;
        }
      }
    }
    vector<string> mails[n];
    for (auto it : map) {
      string email = it.first;
      int node = it.second;
      int ownerNode = findUltiParent(node);
      mails[ownerNode].push_back(email);
    }
    vector<vector<string>> ans;
    for (int i = 0; i < n; i++) {
      if (mails[i].empty())
        continue;
      sort(mails[i].begin(), mails[i].end());
      vector<string> temp;
      temp.push_back(accounts[i][0]);
      for (auto it : mails[i]) {
        temp.push_back(it);
      }
      ans.push_back(temp);
    }

    return ans;
  }

  int findUltiParent(int node) {
    if (node == parent[node])
      return node;
    return parent[node] = findUltiParent(parent[node]);
  }

  void unionByRank(int u, int v) {
    int ult_u = findUltiParent(u);
    int ult_v = findUltiParent(v);
    if (rank[ult_v] < rank[ult_u]) {
      parent[ult_v] = ult_u;
    } else if (rank[ult_v] > rank[ult_u]) {
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
- [striver sheet link](https://takeuforward.org/data-structure/accounts-merge-dsu-g-50/)
- [leetcode question link](https://leetcode.com/problems/accounts-merge/)
- ![yt video link](https://www.youtube.com/watch?v=FMwpt_aQOGw&ab_channel=takeUforward)