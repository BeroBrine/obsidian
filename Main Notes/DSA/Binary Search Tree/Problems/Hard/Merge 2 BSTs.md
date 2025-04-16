*14-04-2025 19:25*

*Status*: [[revise]] [[quirky]]

*Tags*: [[dsa]] [[trees]] [[bst]] [[hard]]

# Merge 2 BSTs
- *Problem* *Statement*: 
	You are given two binary search trees of integers having ‘N’ and ‘M’ nodes. Return an array that contains elements of both BST in sorted order.
	
	
	A binary search tree (BST) is a binary tree data structure with the following properties.
	
	• The left subtree of a node contains only nodes with data less than the node’s data.
	
	• The right subtree of a node contains only nodes with data greater than the node’s data.
	
	• Both the left and right subtrees must also be binary search trees.
	

### Approach 1 --> O(m+n) and O(m+n)
- In this approach we find the inorder of both the bsts and then merge the inorder of both the bsts to one sorted array and then create the bst using this sorted array.


```cpp
void inorder(TreeNode* root , vector<int> &bst){
    if(root == nullptr) {
        return;
    }
    inorder(root->left , bst);
    bst.push_back(root->data);
    inorder(root->right , bst);
}

vector<int> merge(const vector<int>& bst1, const vector<int>& bst2) {
    int i = 0, j = 0;
    vector<int> ans;
    ans.reserve(bst1.size() + bst2.size()); // Reserve space to avoid reallocations

    while (i < bst1.size() && j < bst2.size()) {
        if (bst1[i] < bst2[j]) {
            ans.push_back(bst1[i++]);
        } else {
            ans.push_back(bst2[j++]);
        }
    }

    // Append remaining elements
    while (i < bst1.size()) {
        ans.push_back(bst1[i++]);
    }
    while (j < bst2.size()) {
        ans.push_back(bst2[j++]);
    }

    return ans;
}

TreeNode* merge(int s , int e , vector<int> &in) {
    if(s>e){
        return nullptr;
    }
    int mid = (s+e)/2;
    TreeNode* root = new TreeNode(in[mid]);
    root->left = merge(s , mid-1 , in);
    root->right = merge(mid+1 , e , in);
    return root;
}

vector<int> mergeBST(TreeNode *root1, TreeNode *root2)
{
    vector<int> bst1 , bst2 ,ans;
    inorder(root1 , bst1);
    inorder(root2 , bst2);
    auto sorted = merge(bst1 , bst2);

    auto root = merge(0 , sorted.size() - 1 , sorted);
    inorder(root , ans);
    return ans;
}
```


### Approach 2 Optimal
- Step 1 - [[Convert BST To Doubly Linked List]]
- Step 2 - [[Merge 2 Sorted Linked List]]
- Step 3 - [[Convert Sorted Linked List to BST]] (Approach 2) 

#### Complete Code
```cpp
void flattenToLinkedList(TreeNode* root , TreeNode* &node){
    if(root == nullptr) {
        return;
    }
    flattenToLinkedList(root->right , node);
    root->right = node;
    if(node) {
        node->left = root;
    }
    node = root;
    flattenToLinkedList(root->left , node);
}

TreeNode* mergeLinkedList(TreeNode* list1 , TreeNode* list2) {
    TreeNode* head = nullptr;
    TreeNode* tail = nullptr;
    while(list1 && list2) {
        if(list1->data < list2->data) {
            if(!head) {
                head = list1;
                tail = list1;
                list1= list1->right;
            } else {
                tail -> right = list1;
                tail = list1;
                list1 = list1 -> right;
            }
        }   
        else {
            if(!head) {
                head = list2;
                tail = list2;
                list2 = list2->right;
            }
            else {
                tail -> right = list2;
                tail = list2;
                list2= list2->right;
            }
        }
    }
    while(list1) {
        tail->right = list1;
        tail = list1;
        list1 = list1->right;
    }
    while(list2) {
        tail->right = list2;
        tail = list2;
        list2 = list2->right;
    }
    return head;
}
int count_nodes(TreeNode* head) {
    int n = 0;
    while(head) {
        n++;
        head = head ->right;
    }
    return n;
}

TreeNode* merge(TreeNode* &head , int n) {
    if(head == nullptr || n <= 0 ) {
        return nullptr;
    }
    TreeNode* left = merge(head , n / 2);
    TreeNode* root = head;

    root->left = left;
    head = head->right;
    root->right = merge(head , n - n / 2  - 1);
    return root;
}

vector<int> inorder(TreeNode* root) {
    vector<int> vec;
    while(root) {
        if(root->left == nullptr) {
            vec.push_back(root->data);
            root = root->right;

        } else {
            TreeNode* prev = root->left;
            while(prev->right && prev->right != root) {
                prev = prev->right;
            }
            if(!prev->right) {
                prev ->right = root;
                root = root->left;
            }
            else {
                vec.push_back(root->data);
                prev->right = nullptr;
                root = root->right;
            }
        }
    }
    return vec;
} 

void inorder2(TreeNode* root , vector<int> &vec) {
    if(root == nullptr) {
        return;
    }
    inorder(root->left);
    vec.push_back(root->data);
    inorder(root->right);
}

vector<int> mergeBST(TreeNode *root1, TreeNode *root2)
{
    TreeNode* h1 = nullptr;
    flattenToLinkedList(root1 , h1);
    h1->left=  nullptr;
    TreeNode* h2 = nullptr;
    flattenToLinkedList(root2 , h2);
    h2->left=  nullptr;

    TreeNode* head = mergeLinkedList(h1 , h2);
    auto itr = head;

    int n = count_nodes(head);

    TreeNode* root = merge(head , n);

    vector<int> vec = inorder(root);

    return vec;


}
```
## References
- striver sheet link N/A
- [yt video link](https://www.youtube.com/watch?v=18w8VduomfI&ab_channel=CodeHelp-byBabbar)
- [coding ninjas question link](https://www.naukri.com/code360/problems/h_920474?leftPanelTab=0&utm_source=youtube&utm_medium=affiliate&utm_campaign=Lovebabbar)