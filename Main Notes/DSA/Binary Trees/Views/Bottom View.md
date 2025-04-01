
*01-04-2025 18:29*

*Status*:

*Tags*: [[dsa]] [[views]] [[trees]]
# Bottom View
- The bottom view of a tree is defined as.
	![[Bottom View 2025-04-01 18.30.26.excalidraw]]- 

## Algo [My Approach]
- Just like the algo used in [[Top View]].
	- Except checking if the map has encountered the level and not changing it.
	- We replace the node value for each level , so that when the iteration ends , the last node is stored for each level in the map. 


```cpp
class Solution {
  public:
    vector <int> bottomView(Node *root) {
        vector<int> vec;
        map<int , int> map;
        queue<pair<Node* , int>> q;
        q.push({root , 0});
        
        while(!q.empty()) {
            auto top = q.front();
            q.pop();
            auto node = top.first;
            int level = top.second;
            
            map[level] = node->data;
            if(node->left != nullptr) {
                q.push({node->left , level - 1});
            }
            if(node -> right != nullptr) {
                q.push({node -> right , level + 1});
            }
        }
        for(auto i : map) {
            vec.push_back(i.second);
        }
        return vec;
    }
};
```



## References
- [striver sheet link](https://takeuforward.org/data-structure/right-left-view-of-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=0FtVY6I4pB8&feature=youtu.be)
- [GFG question link](https://www.geeksforgeeks.org/problems/bottom-view-of-binary-tree/1)