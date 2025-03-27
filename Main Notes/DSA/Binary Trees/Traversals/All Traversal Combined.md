*2025-03-26 11:51*

Status:

Tags: [[traversals]] [[dsa]] [[trees]]

## All Traversal Combined

- In this One stack is used , which contains a tuple
	- The Tuple is (node , num)
- The num here is important
	- If num == 1  --> push in preorder
		node = st.top()
		preorder.push(st.top())
		st.push((node  , ++num))
		push the left child of the node
	- if num == 2 --> push in inorder
		node = st.top()
		inorder.push(st.top())
		st.push((node  , ++num))
		push the right child of the node
	- if num == 3 --> push in postorder	
		preorder.push(st.top())


```cpp
class Solution{
    
    public:
    vector<int> postOrder(Node* node) {
        vector<int> preorder;
        vector<int> inorder;
        vector<int> postorder;
        if(node == nullptr) {
            return postorder;
        }
        stack<pair<Node*  , int >> st;
        st.push({node , 1});
        
        
        while(!st.empty()) {
            auto top = st.top();
            st.pop();
            if (top.second == 1) {
                preorder.push_back(top.first->data);
                st.push({top.first , ++top.second});
                if(top.first -> left != nullptr) {
                    st.push({top.first-> left , 1});
                }
            }
            else if (top.second == 2) {
                inorder.push_back(top.first->data);
                st.push({top.first , ++top.second});
                if(top.first -> right != nullptr) {
                    st.push({top.first->right , 1});
                }
            }
            else {
                postorder.push_back(top.first -> data);
            }
        }
        return postorder;  // question demand
    }
};
```


## References
- [striver sde sheet link](https://takeuforward.org/data-structure/preorder-inorder-postorder-traversals-in-one-traversal/)
- [yt link](https://www.youtube.com/watch?v=ySp2epYvgTE&feature=youtu.be)

## FootNotes
- Do not use if statements. because they need to be mutually exclusive.

    After the first if condition (top_pair.second == 1) is true, top_pair.second++ increments the value to 2.

    Then the second if condition (top_pair.second == 2) will also evaluate as true, since it is now 2.

    Finally, the third if (top_pair.second != 1 && top_pair.second != 2) might also run if top_pair.second has been incremented further.
	
- If using if statements add continue after every if statement so that the conditions beneath do not get evaluated.

