*04-04-2025 02:24*

*Status*: [[quirky]] [[revise]]

*Tags*: [[dsa]] [[hard]] [[trees]]

# Minimum Time To Burn A Tree
- *Problem* *Statement*: 
	Given a binary tree and a node data called target. Find the minimum time required to burn the complete binary tree if the target is set on fire. It is known that in 1 second all nodes connected to a given node get burned. That is its left child, right child, and parent.
![[Pasted image 20250404022637.png]]


### Solution
- This question follows the same logic as [[Node At A Distance K]].
	- But the thing to remember here is that
		- We need to find the node because it's address is not give to us already.
		- We are keeping a track of burned variable.
			- Because for example , we push the nodes 4 or 7. They have no node to burn further because they are leaf node.
			- So if we do not keep track if there's any node burnt , we will get erraneous times.

#### Remember
- [[revisit]] the function to find the node. idk how i poofed over this (i thought out the iterative version but poofed in recursive one lmao) 


```cpp
Node* findNode(Node* root , int target) {
	if(root == nullptr) return nullptr;
	
	if(root->data == target) return root; 
	
	Node* ls = findNode(root->left , target);
	if(ls) return ls;
	return findNode(root->right , target);
	
}
```





```cpp
class Solution {
  public:
    int minTime(Node* root, int target) {
        map<Node* , Node*> parent_map;
        map<Node* , bool> visited;
        queue<Node*> q;

        Node* node = findNode(root , target);
        
        if(!node) return 0;
        q.push(node);
        
        int time = 0;
        
        createParentHash(parent_map , root);
        
        while(!q.empty()) {
            int size = q.size();
            bool burned = false;
            for(int i = 0 ; i < size ; ++i) {
                auto node = q.front();
                q.pop();
                visited[node] = true;
                Node* parent = parent_map[node];
                Node* lc = node->left;
                Node* rc = node->right;
                
                cout << "for the node " << node -> data << endl;
                if(lc != nullptr && !visited[lc]) {
                    cout << "burnt left child  node " << lc ->data << endl;
                    visited[lc] = true;
                    q.push(lc);
                    burned = true;
                }
                if(parent != nullptr && !visited[parent]) {
                     cout << "burnt parent  node " << parent ->data << endl;
                    visited[parent] = true;
                    q.push(parent);
                    burned = true;
                }
                if(rc != nullptr && !visited[rc]) {
                     cout << "burnt right child  node " << rc ->data << endl;
                    visited[rc] = true;
                    q.push(rc);
                    burned = true;
                }
            }
            time++;
        }
        return time;
        
    }
    
    Node* findNode(Node* root , int target) {
        if(root == nullptr) return nullptr;
        
        if(root->data == target) return root; 
        
        Node* ls = findNode(root->left , target);
        if(ls) return ls;

        return findNode(root->right , target);
        
    }
    
    void createParentHash(map<Node* , Node*> &parent_map , Node* root) {
        queue<Node*> q;
        q.push(root);
        
        while(!q.empty()) {
            int size = q.size();
            for(int i = 0 ; i < size ; ++i) {
                auto node = q.front();
                q.pop();
                if(node->left != nullptr) {
                    q.push(node->left);
                    parent_map[node->left] = node;
                } 
                if(node->right != nullptr) {
                    q.push(node->right);
                    parent_map[node->right] = node;
                }
            }
        }
    }
};
```








## References
- striver sheet link N/A
- [yt video link](https://www.youtube.com/watch?v=2r5wLmQfD6g&feature=youtu.be)
- [GFG question link](https://www.geeksforgeeks.org/problems/burning-tree/1?utm_source=youtube&utm_medium=collab_striver_ytdescription&utm_campaign=burning-tree)