*07-04-2025 22:15*

*Status*:

*Tags*: [[dsa]] [[trees]] [[bst]] 

# Ceil in a BST
- *Problem* *Statement*: 
	Given a BST and a number X, find Ceil of X.
	Note: Ceil(X) is a number that is either equal to X or is immediately greater than X.
	
	If Ceil could not be found, return -1.

```cpp
int findCeil(Node* root, int input) {
    if (root == NULL) return -1;
    int ceil = -1;
    Node* curr = root;
    while(curr != nullptr) {
        if(curr->data == input) {
            ceil = curr->data;
            return ceil;
        }
        else if(input < curr->data) {
            ceil = curr->data;
            curr = curr ->left;
        }
        else {
            curr = curr->right;
        }
    }
    return ceil;
}
```











## References
- [striver sheet link](https://takeuforward.org/binary-search-tree/ceil-in-a-binary-search-tree/)
- [yt video link](https://www.youtube.com/watch?v=KSsk8AhdOZA&feature=youtu.be)
- [GFG question link](https://www.geeksforgeeks.org/problems/implementing-ceil-in-bst/1)