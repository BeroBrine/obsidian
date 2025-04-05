*05-04-2025 14:53*

*Status*: [[revise]]

*Tags*: [[dsa]] [[trees]] [[hard]]

# Serialize And Deseriliaze A Binary Tree
- *Problem* *Statement*: 
	Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

###### What is Serialization And Deserliazation.
- Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
- Deserilization is the process of converting serialized sequence of bits into original data structure.


## Solution
#### Serilization
- First we serialize the tree using the [[Level Order Traversal]].
	- For this , if there is a null node push "#," to the string and if not push it's value + "," to the string. 
	- Push it's left child and right child into the queue
```cpp
string serialize(TreeNode *root) {
	string ans = "";
	if (root == nullptr) {
	  return ans;
	}
	queue<TreeNode *> q;
	q.push(root);
	while (!q.empty()) {
	  auto node = q.front();
	  q.pop();
	  if (node) {
		ans += to_string(node->val) + ',';
		q.push(node->left);
		q.push(node->right);
	  } else {
		ans += "#,";
	  }
}
```



#### Deserilization --> IMP
- For deserilization , we need to keep in mind three things
	- stringstream -> used to read strings from std::cin or std::stringstream
	- getline() function
	- stoi()

- Remember to keep a queue in which the left and right child are being pushed.
	- This is to correctly keep track of nodes to make their left and right nodes for.
	- Just like I read any leetcode tree array


```cpp
TreeNode *deserialize(string data) {
    if (data.empty()) {
      return nullptr;
    }
    stringstream ss(data);
    string token;
    getline(ss, token, ',');
    queue<TreeNode *> q;
    TreeNode *root = new TreeNode(stoi(token));
    q.push(root);
    while (!q.empty() && ptr < data.length()) {
      auto node = q.front();
      q.pop();
      TreeNode *left_child = nullptr;
      TreeNode *right_child = nullptr;
      if (!getline(ss, token, ','))
        break;
      if (token != "#") {
        left_child = new TreeNode(stoi(token));
        node->left = left_child;
        q.push(node->left);
      }

      if (!getline(ss, token, ','))
        break;
      if (token != "#") {
        right_child = new TreeNode(stoi(token));
        node->right = right_child;
        q.push(node->right);
      }
    }
    return root;
  }
};



```



##### stringstream
- converting the string into stringstream by
- this is done so that reading of the line is clean.
```cpp
stringstream ss = ss(data); 
```

##### getline()
- this function is get back a token specified with a delimiter.
```cpp
getline(stringstream , destination_string , delimiter);
```
- eg -> 1,2,3,#,2
- Delimiter being ',' , this function will return 
	- 1
	- 2
	- 3
	- #\
	- 2 

##### stoi() 
- Used to convert string to integer -> as token is a string.




#### Remember this.
- Do not push the nodes like this
- left_child being init to nullptr and then being pushed regardless of being assigned a value or not
- because the constructor already initializes the values of left and right ptrs to null.
- so leaf nodes always have nullptrs
```cpp
node->left = left_child;
node->right = right_child;
q.push(node->left);
q.push(node->right);

```

## References
- [striver sheet link](https://takeuforward.org/data-structure/serialize-and-deserialize-a-binary-tree/)
- [yt video link](https://www.youtube.com/watch?v=-YbXySKJsX8&feature=youtu.be)
- [leetcode question link](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/)