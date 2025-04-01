*27-03-2025 20:26*

*Status*: [[revise]] [[pending]]

*Tags*: [[dsa]]
## Boundary Traversal
- Boundary traversal depicted below. 
	![[Boundary Traversal 2025-03-27 20.33.55.excalidraw]]

### O(n) approach
- In this , we push the left boundary node until we encounter a leaf node. 
	- One question i had is why we are not doing (node->left != nullptr) node = node ->left; (node->right != nullptr) node = node -> right;
	- Because we are pushing the left boundary , but if there's a node in left which has no left child but has a right child. We will have to move to that node to still track boundary.

  #### Right Boundary Function
```cpp

void leftBoundary(Node* node , vector<int> &vec) {

	while(node != nullptr) {
		if(!isLeaf(node)) vec.push_back(node->data);
		if (node -> left != nullptr) node = node->left;
		else node = node->right;
	}

}
```
 
 - Then we , push all of the leave nodes , using [[Inorder]] traversal.
#### Leaf Node Function
 ```cpp
void leafNode(Node* node , vector<int> &vec) {
	if(node == nullptr) {
		return;
	}
	
	leafNode(node->left , vec);
	
	if(isLeaf(node)) {
		vec.push_back(node->data);
	}
	
	leafNode(node->right , vec);
}
```

- Then we push the right boundary nodes till we encounter leaf node.
	- But before pushing the node to ans vec , we need to reverse the array.
#### Right Boundary Function
```cpp

void rightBoundary(Node* node , vector<int> &vec) {
	while(node != nullptr) {
		if(!isLeaf(node)) vec.push_back(node->data);
		if(node->right != nullptr) node = node -> right;
		else node = node -> left;
	}
	reverse(vec.begin() , vec.end());
}

	
```


##### Edge Case 
- If the root node itself is a leaf node.
	- There was a quirk here , because of inorder traversal the root node , if a leaf node , will be pushed to leaf_node array , and in the main func i am also pushing the root node. 
	- So , to handle this case , check if the root node itself is a leaf node , if it is then return the vec right there.

### Complete Code
```cpp
class Solution {
  public:
    vector<int> boundaryTraversal(Node *root) {
        // code here
        vector<int> left , leaf , right;
        vector<int> ans;
        ans.push_back(root->data);
        if(isLeaf(root)) {
            return ans;
        }
        leftBoundary(root->left , left);
        leafNode(root , leaf);
        rightBoundary(root->right , right);
        for (int i : left) {
            ans.push_back(i);
        }
        for(int i : leaf) {
            ans.push_back(i);
        }
        for(int i : right) {
            ans.push_back(i);
        }
        return ans;
        
    }
    
    bool isLeaf(Node* node) {
        if(node -> left == nullptr && node->right == nullptr) {
            return true;
        }
        return false;
    }
    
    void leftBoundary(Node* node , vector<int> &vec) {

        while(node != nullptr) {
            if(!isLeaf(node)) vec.push_back(node->data);
            if (node -> left != nullptr) node = node->left;
            else node = node->right;
        }

    }
    void leafNode(Node* node , vector<int> &vec) {
        if(node == nullptr) {
            return;
        }
        
        leafNode(node->left , vec);
        
        if(isLeaf(node)) {
            vec.push_back(node->data);
        }
        
        leafNode(node->right , vec);
    }
    void rightBoundary(Node* node , vector<int> &vec) {
        while(node != nullptr) {
            if(!isLeaf(node)) vec.push_back(node->data);
            if(node->right != nullptr) node = node -> right;
            else node = node -> left;
        }
        reverse(vec.begin() , vec.end());
    }
};
```



## References
- [striver sheet link](https://takeuforward.org/data-structure/boundary-traversal-of-a-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=0ca1nvR0be4&ab_channel=takeUforward)
- [gfg question link](https://www.geeksforgeeks.org/problems/boundary-traversal-of-binary-tree/1?itm_source=geeksforgeeks&itm_medium=article&itm_campaign=practice_card)


## Footnote
- Check about the morris order traversal for this question.