*03-04-2025 20:26*

*Status*:

*Tags*: [[dsa]] [[trees]] [[hard]]

# Check For Children Sum Property
- *Problem* *Statement*: 
	Given a binary tree having n nodes. Check whether all of its nodes have a value equal to the sum of their child nodes. Return 1 if all the nodes in the tree satisfy the given properties, else it returns 0. For every node, the data value must be equal to the sum of the data values in the left and right children. Consider the data value 0 for a NULL child. Also, leaves are considered to follow the property.
	![[Check For Children Sum Property 2025-04-03 20.59.20.excalidraw]]
	-
### Algo [My Approach]
- For each node. 
	- Check it it's a root node. If it is , return 1. This is due to the recursion we will be following
	- Get the sum of the node's children with the following function.
		- The initial check is for if the parent node is leaf node. Leaf node are already considered to follow the property so we are returning 1.
	- Now if the sum is 1 , that mean we can recurse further for both the left node and right node. *&& is to verify that both of the root node must produce 1  , if one of them produces 0 all of the recursion will be 0 which we want as the answer.* As we are yet to find any node which does not follow the property.
	- If the sum is 0 , that means there is one node which does not follow the property and we can stop here and return 0;
	- If we hit the null node , i.e after the leaf node ,  we are satisfied that uptil now the property holds. so we return 1. 
##### Children Sum 
```cpp

int sum(Node* node) {
	if(node->right == nullptr && node->left == nullptr) {
		return 1;
	}
	int lc = 0;
	//cout << "the node is " << node->data << endl;
	if(node->left != nullptr) {

		lc = node->left->data;
	}
	//cout << "lc is " << lc << endl;
	int rc = 0;
	if(node->right != nullptr) {
		rc = node->right->data;
	}
	// cout << "rc is " << rc << endl;
	int sum = lc + rc;
	// cout << "the sum for node " << node->data << " is " << sum << endl;
	if(sum == node->data) {
		return 1;
	}
	return 0;
	
}

```

### Complete Code
```cpp
class Solution{
    public:
    //Function to check whether all nodes of a tree have the value 
    //equal to the sum of their child nodes.
    int isSumProperty(Node *root)
    {
        
        return check(root);
    }
    
    int check(Node* node) {
 
        if(node == nullptr) {
            return 1;
        }
        int sm = sum(node);
        if(sm == 1) {
            return check(node->left) && check(node->right);
        }
        else return 0;
        
        
    }
    int sum(Node* node) {
        if(node->right == nullptr && node->left == nullptr) {
            return 1;
        }
        int lc = 0;
        //cout << "the node is " << node->data << endl;
        if(node->left != nullptr) {

            lc = node->left->data;
        }
        //cout << "lc is " << lc << endl;
        int rc = 0;
        if(node->right != nullptr) {
            rc = node->right->data;
        }
        // cout << "rc is " << rc << endl;
        int sum = lc + rc;
        // cout << "the sum for node " << node->data << " is " << sum << endl;
        if(sum == node->data) {
            return 1;
        }
        return 0;
        
    }

};

```

- We can remove the check for leaf node in the sum function and then put it in the test function. This will make a better sense but i am lazy af so i will leave it as it is.


## References
- [striver sheet link](https://takeuforward.org/data-structure/check-for-children-sum-property-in-a-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=fnmisPM6cVo&ab_channel=takeUforward)
- [GFG question link](https://www.geeksforgeeks.org/problems/children-sum-parent/1?utm_source=youtube&utm_medium=collab_striver_ytdescription&utm_campaign=hildren-sum-parent)