
*01-04-2025 17:59*

*Status*:

*Tags*: [[dsa]] [[trees]] [[views]]
## Top View
- Top View of a tree is defined as 
	-![[Top View 2025-04-01 18.18.49.excalidraw]] 
## Algo [My Approach]
- This is somewhat a modified version of [[Vertical Traversal]]
	- Instead of checking if the key (vertical_level) exists and then adding to the data structure to store all the nodes.
	- We just need to check if the map has seen vertical level before , if it has , just continue as we do not want to change the value. If not , we set the first node as the value of this level.
	- We just need to add the keys to the vec for each key , as map stores the keys in sorted order.

## Code 
```cpp
class Solution {
  public:
    // Function to return a list of nodes visible from the top view
    // from left to right in Binary Tree.
    vector<int> topView(Node *root) {
        map<int , int> map;
        vector<int> vec;
        queue<pair<Node* , int>> q;
        q.push({root , 0});
        while(!q.empty()) {
            auto top = q.front();
            q.pop();
            auto node = top.first;
            auto vert_level = top.second;
            
            if(map.find(vert_level) == map.end()) {
                map[vert_level] = node->data;
            }
            if(node->left != nullptr) {
                q.push({node->left , vert_level - 1});
            }
            if(node->right != nullptr) {
                q.push({node->right , vert_level + 1});
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
- [striver sheet link](https://takeuforward.org/data-structure/top-view-of-a-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=Et9OCDNvJ78&ab_channel=takeUforward)
- [GFG question link](https://www.geeksforgeeks.org/problems/top-view-of-binary-tree/1)