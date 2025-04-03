*03-04-2025 20:26*

*Status*:

*Tags*: [[dsa]] [[trees]] [[hard]]

# Check For Children Sum Property
- *Problem* *Statement*: 
	Given a binary tree having n nodes. Check whether all of its nodes have a value equal to the sum of their child nodes. Return 1 if all the nodes in the tree satisfy the given properties, else it returns 0. For every node, the data value must be equal to the sum of the data values in the left and right children. Consider the data value 0 for a NULL child. Also, leaves are considered to follow the property.


![[Check For Children Sum Property 2025-04-03 20.59.20.excalidraw]]










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





## References
- [striver sheet link](https://takeuforward.org/data-structure/check-for-children-sum-property-in-a-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=fnmisPM6cVo&ab_channel=takeUforward)
- [GFG question link](https://www.geeksforgeeks.org/problems/children-sum-parent/1?utm_source=youtube&utm_medium=collab_striver_ytdescription&utm_campaign=hildren-sum-parent)