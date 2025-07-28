*28-07-2025 03:04*

*Status*: [[quirky]] [[revise]]

*Tags*: [[dsa]] [[stack and queue]] [[hard]]
# LRU Cache

##### Problem Statement
Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.

Implement the LRUCache class:
	LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
	int get(int key) Return the value of the key if the key exists, otherwise return -1.
	void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.


The functions get and put must each run in O(1) average time complexity.

 
Example 1:


Input
["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
Output
[null, null, null, 1, null, -1, null, -1, 3, 4]

Explanation
LRUCache lRUCache = new LRUCache(2);
lRUCache.put(1, 1); // cache is {1=1}
lRUCache.put(2, 2); // cache is {1=1, 2=2}
lRUCache.get(1);    // return 1
lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
lRUCache.get(2);    // returns -1 (not found)
lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
lRUCache.get(1);    // return -1 (not found)
lRUCache.get(3);    // return 3
lRUCache.get(4);    // return 4

Constraints:
	1 <= capacity <= 3000
	0 <= key <= 104
	0 <= value <= 105
	At most 2 * 105 calls will be made to get and put.

##### Solution
- To implement LRU cache , we will use two data structures. 
	- DLL (Doubly Linked List)
	- HashMap (map< int , Node* >)
- The DLL will link the cache nodes together 
- The hashmap will store the input key as the key to the address of the node. This data structure is being used to avoid traversal of the linked list as all the operations must be performed in O(1) time complexity in LRU cache.

**LRU means least recently used , any node that is used or updated must be placed at the front of the head.**
- Steps
	-  Initialize the head and tail of the cache
		- head -> next = tail;
		- tail -> prev = head;
		- Keep in mind to first init the tail and head ptrs with new LinkedList();
		- Their values would be -1 , -1 , (key , value)

- **Keeping track of current capacity is very important** 
	-  The currCap should never exceed maxCap.
- Now there are three cases
	- When the node that is to be inserted does not already exist , i.e , it's key is not found in the hashmap and the curr capacity < maxCapacity.
		- So we just put the nodes in front of the head.
		- Insert the node in the hashmap.
			- It's key will be mapped to it's address.
	- When the node to be inserted already exists in the DLL. 
		- We will fetch the address of the node from the hashmap.
			- Update the node value to be the new value
		- After this we delete the node from the DLL , keep in mind **we do not create a new node**.
			- we need to keep the address of the node in the hashmap the same , so we just delete the next , prev pointers and rearrange it's next , prev nodes to point to each other
			- Now that the node is freed from it's previous place in the DLL , insert it into the front of the head of DLL.

	- When the node to be inserted does not already exist and the maxCap is reached for the LRU.
		- What we need to do is delete the node from the last  , i.e tail -> prev;
		- Insert the new node in front of the head of the DLL.
		- Insert the node in the hashmap.

	- When the get function is called , if the node does not exist return -1 else return the value.
		- Keep in mind , if get function is called , whatever node was called it will be placed in the front of the head of DLL.

**IMP: do not implement if a node exists in the hashmap or not just by doing hashmap[key].
	-  This will create an empty entry with the key and will point to nullptr.
		- essentially meaning replacing a node with the key as a nullptr.***

##### Handwritten Notes
![[Lru cache.pdf]]
##### Code
```cpp
#include <bits/stdc++.h>
using namespace std;

// @leet start
//
struct DLLNode {
  int key;
  int val;
  DLLNode *prev;
  DLLNode *next;
  DLLNode(int key, int val) {
    this->key = key;
    this->val = val;
    this->prev = nullptr;
    this->next = nullptr;
  }

  DLLNode() {
    this->key = -1;
    this->val = -1;
    this->prev = nullptr;
    this->next = nullptr;
  }
};

enum class Conditions {
  NODE_DOES_NOT_EXIST_CAP_REMAINING,
  NODE_DOES_NOT_EXIST_CAP_EXHAUSTED,
  NODE_EXISTS,
  ERROR,
};
class LRUCache {
  DLLNode *head;
  DLLNode *tail;
  unordered_map<int, DLLNode *> addressMap;
  int currCap;
  int maxCap;

public:
  LRUCache(int capacity) {
    tail = new DLLNode();
    head = new DLLNode();
    this->maxCap = capacity;
    this->currCap = 0;
    this->head->next = tail;
    this->tail->prev = head;
  }

  int get(int key) {
    auto it = this->addressMap.find(key);
    if (it == this->addressMap.end())
      return -1;

    DLLNode *node = this->addressMap[key];
    deleteFromDLL(node);
    insertAtHead(node);
    return node->val;
  }

  DLLNode *test(DLLNode *node) {
    DLLNode *prev = node->prev;
    DLLNode *next = node->next;
    prev->next = next;
    next->prev = prev;
    node->prev = nullptr;
    node->next = nullptr;
    return node;
  }

  void put(int key, int value) {
    pair<Conditions, DLLNode *> state = getCacheState(key);
    Conditions cacheCondition = state.first;
    DLLNode *node = state.second;

    if (cacheCondition == Conditions::NODE_EXISTS) {
      updateDLL(node, value);
      insertAtHead(node);
      return;
    }

    if (cacheCondition == Conditions::NODE_DOES_NOT_EXIST_CAP_REMAINING) {
      DLLNode *insertedNode = insertInDLL(key, value);
      putIntoMap(key, insertedNode);
      return;
    }

    if (cacheCondition == Conditions::NODE_DOES_NOT_EXIST_CAP_EXHAUSTED) {
      evictLastNode();
      DLLNode *insertedNode = insertInDLL(key, value);
      putIntoMap(key, insertedNode);
      return;
    }
  }

  // condtion and the node ptr from map

  pair<Conditions, DLLNode *> getCacheState(int key) {
    DLLNode *node = getNodeFromMap(key);

    if (!node && this->currCap < this->maxCap) {
      return std::make_pair(Conditions::NODE_DOES_NOT_EXIST_CAP_REMAINING,
                            node);
    } else if (node) {
      return std::make_pair(Conditions::NODE_EXISTS, node);
    } else if (!node && this->currCap >= this->maxCap) {
      return std::make_pair(Conditions::NODE_DOES_NOT_EXIST_CAP_EXHAUSTED,
                            node);
    } else {
      return std::make_pair(Conditions::ERROR, nullptr);
    }
  }

  void updateDLL(DLLNode *node, int value) {
    node->val = value;
    deleteFromDLL(node);
  }

  void evictLastNode() {
    DLLNode *evictionNode = this->tail->prev;
    DLLNode *tempPrev = evictionNode->prev;
    if (evictionNode == this->head)
      return;
    tempPrev->next = this->tail;
    this->tail->prev = tempPrev;
    this->addressMap.erase(evictionNode->key);
    this->currCap -= 1;
    delete evictionNode;
  }

  void deleteFromDLL(DLLNode *&node) {
    DLLNode *nextTemp = node->next;
    DLLNode *prevNode = node->prev;
    prevNode->next = nextTemp;
    nextTemp->prev = prevNode;
    node->next = nullptr;
    node->prev = nullptr;
  }

  DLLNode *insertInDLL(int key, int val) {
    DLLNode *temp = new DLLNode(key, val);
    insertAtHead(temp);

    this->currCap += 1;

    return temp;
  }
  void insertAtHead(DLLNode *temp) {
    DLLNode *headNext = this->head->next;
    this->head->next = temp;
    headNext->prev = temp;
    temp->next = headNext;
    temp->prev = this->head;
  }

  void putIntoMap(int key, DLLNode *node) { this->addressMap[key] = node; }

  DLLNode *getNodeFromMap(int key) {
    auto it = this->addressMap.find(key);
    if (it == this->addressMap.end())
      return nullptr;
    return it->second;
  }
};
/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache* obj = new LRUCache(capacity);
 * int param_1 = obj->get(key);
 * obj->put(key,value);
 */
// @leet end

```
## References
- [striver sheet link](https://takeuforward.org/data-structure/implement-lru-cache/)
- [leetcode question link](https://leetcode.com/problems/lru-cache/)
- ![yt video link](https://www.youtube.com/watch?si=IUo_d35rXBD0CBAF&v=z9bJUPxzFOw&feature=youtu.be)