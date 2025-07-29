*28-07-2025 14:27*

*Status*:

*Tags*: [[dsa]] [[stack and queue]] [[hard]]

# LFU Cache

##### Problem Statement
Design and implement a data structure for a Least Frequently Used (LFU) cache.

Implement the LFUCache class:
	LFUCache(int capacity) Initializes the object with the capacity of the data structure.
	int get(int key) Gets the value of the key if the key exists in the cache. Otherwise, returns -1.
	void put(int key, int value) Update the value of the key if present, or inserts the key if not already present. When the cache reaches its capacity, it should invalidate and remove the least frequently used key before inserting a new item. For this problem, when there is a tie (i.e., two or more keys with the same frequency), the least recently used key would be invalidated.


To determine the least frequently used key, a use counter is maintained for each key in the cache. The key with the smallest use counter is the least frequently used key.

When a key is first inserted into the cache, its use counter is set to 1 (due to the put operation). The use counter for a key in the cache is incremented either a get or put operation is called on it.

The functions get and put must each run in O(1) average time complexity.

 
Example 1:


Input
["LFUCache", "put", "put", "get", "put", "get", "get", "put", "get", "get", "get"]
[[2], [1, 1], [2, 2], [1], [3, 3], [2], [3], [4, 4], [1], [3], [4]]
Output
[null, null, null, 1, null, -1, 3, null, -1, 3, 4]

Explanation
// cnt(x) = the use counter for key x
// cache=[] will show the last used order for tiebreakers (leftmost element is  most recent)
LFUCache lfu = new LFUCache(2);
lfu.put(1, 1);   // cache=[1 , _ ], cnt(1)=1
lfu.put(2, 2);   // cache=[2,1], cnt(2)=1, cnt(1)=1
lfu.get(1);      // return 1
                 // cache=[1,2], cnt(2)=1, cnt(1)=2
lfu.put(3, 3);   // 2 is the LFU key because cnt(2)=1 is the smallest, invalidate 2.
                 // cache=[3,1], cnt(3)=1, cnt(1)=2
lfu.get(2);      // return -1 (not found)
lfu.get(3);      // return 3
                 // cache=[3,1], cnt(3)=2, cnt(1)=2
lfu.put(4, 4);   // Both 1 and 3 have the same cnt, but 1 is LRU, invalidate 1.
                 // cache=[4,3], cnt(4)=1, cnt(3)=2
lfu.get(1);      // return -1 (not found)
lfu.get(3);      // return 3
                 // cache=[3,4], cnt(4)=1, cnt(3)=3
lfu.get(4);      // return 4
                 // cache=[4,3], cnt(4)=2, cnt(3)=3


 
Constraints:
	1 <= capacity <= 104
	0 <= key <= 105
	0 <= value <= 109
	At most 2 * 105 calls will be made to get and put.


##### Solution
- The pre-req for this question is [[LRU Cache]]. 

**Implementation**
- In this cache implementation
	- We will need
		- ListNode
		- List (Doubly Linked List)
		- map which will store freq -> List
		- map which will store key ->  node address
- Each ListNode will also store it's frequency.	
- For each freq , there is a DLL.
	- So the struct List will contain all the methods for it , such as evict last node , insert at head etc.
		- This makes it easier to perform actions on the list

- In this cache , minFreq is very important.
	- Every new node that will be created will be inserted as it's freq being one
	
- Create a class whose members will be
	- freqMap which will store list for each freq
	- nodeAddrMap which will store the node address for each key.
	- maxCap -> max capacity of the cache
	- currCap
	- minFreq. (Imp Variable)

- There are three conditions for the cache
	- If node does not exist
		- Cache is full
		- Cache is not full
	- Node exists
	
- Cache is not full
	- Insert the node in the minFreq list
		- use the methods insert at head for this.
	- insert the node in the nodeAddrMap
	- increase the curr capacity by 1.
- Cache is full
	- evict the last node from the minFreq list.
	- decrease the curr capacity by 1.
	- create a new node and reset the minFreq to 1 as new node are always placed at freq -> 1.
	- Insert the node in the nodeAddrMap.
	- increase the curr capacity by 1.
- Node exists
	- If the node exists already , we need to fetch the list it is in , this can be done by using the node -> freq.
	- Update the node value and frequency.
	- Now remove the node from the old list and put it in the list of the new frequency.
	- **IMP- if after node eviction the list becomes empty and the list corresponded to the minFreq , we need to increment the minFreq now as there is no node inside the previous minFreq.**


##### Handwritten Notes
![[]]
##### Code
```cpp
#include <bits/stdc++.h>
#include <cstdlib>
using namespace std;
// @leet start
class LFUCache {
  struct ListNode {
    ListNode *next;
    ListNode *prev;
    int key;
    int val;
    int freq;

    ListNode(int key = -1, int val = -1) {
      this->next = nullptr;
      this->prev = nullptr;

      this->key = key;
      this->val = val;

      this->freq = 1;
    }
  };

  struct List {
    ListNode *head;
    ListNode *tail;

    List() {
      this->head = new ListNode();
      this->tail = new ListNode();

      this->head->next = tail;
      this->tail->prev = head;
    }

    void insertAtHead(ListNode *node) {
      ListNode *head = this->head;

      ListNode *temp = head->next;
      head->next = node;
      temp->prev = node;
      node->next = temp;
      node->prev = head;
    }

    int evictLastNode() {
      ListNode *tail = this->tail;

      ListNode *evictNode = tail->prev;
      int key = evictNode->key;
      ListNode *tempPrev = evictNode->prev;

      tempPrev->next = tail;
      tail->prev = tempPrev;

      evictNode->next = nullptr;
      evictNode->prev = nullptr;
      delete evictNode;
      return key;
    }

    void removeNodeFromList(ListNode *node) {
      ListNode *tempPrev = node->prev;
      ListNode *tempNext = node->next;

      tempPrev->next = tempNext;
      tempNext->prev = tempPrev;

      node->next = nullptr;
      node->prev = nullptr;
    }

    bool isListEmpty() {
      ListNode *head = this->head;
      ListNode *tail = this->tail;

      if (head->next != tail or tail->prev != head)
        return false;
      return true;
    }
  };

  enum class Conditions {
    NODE_EXISTS,
    NODE_DOES_NOT_EXIST_CAP_REMAINING,
    NODE_DOES_NOT_EXIST_CAP_EXHAUSTED,
    ERROR,
  };

  unordered_map<int, List *> freqListMap;
  unordered_map<int, ListNode *> nodeAddrMap;
  int minFreq;
  int maxCap;
  int currCap;

public:
  LFUCache(int capacity) {
    this->minFreq = 1;
    this->maxCap = capacity;
    this->currCap = 0;
  }

  int get(int key) {
    auto itr = nodeAddrMap.find(key);
    if (itr == nodeAddrMap.end()) {
      return -1;
    }
    ListNode *node = nodeAddrMap[key];
    updateCache(node, node->val);

    return node->val;
  }

  void put(int key, int value) {
    pair<Conditions, ListNode *> cacheState = getCacheState(key);
    Conditions cacheCondition = cacheState.first;
    ListNode *node = cacheState.second;

    switch (cacheCondition) {
    case Conditions::NODE_DOES_NOT_EXIST_CAP_REMAINING: {
      ListNode *node = new ListNode(key, value);
      minFreq = node->freq;
      insertIntoCache(node, minFreq);
      insertIntoNodeAddrMap(key, node);
      currCap += 1;
      break;
    }
    case Conditions::NODE_EXISTS: {
      updateCache(node, value);
      break;
    }
    case Conditions::NODE_DOES_NOT_EXIST_CAP_EXHAUSTED: {
      ListNode *node = new ListNode(key, value);
      evictLastAndInsert(node);
      insertIntoNodeAddrMap(key, node);
      currCap += 1;
      break;
    }
    }
  }

private:
  void evictLastAndInsert(ListNode *node) {
    List *list = freqListMap[minFreq];
    int key = list->evictLastNode();
    nodeAddrMap.erase(key);
    currCap -= 1;

    // New nodes always start with frequency 1
    minFreq = node->freq;
    insertIntoCache(node, node->freq); // node->freq should be 1
  }

  void updateCache(ListNode *node, int value) {
    int freq = node->freq;
    node->val = value;
    node->freq += 1;

    bool isExistingInList = checkIfFreqExists(freq);
    if (!isExistingInList) {
      cout << "ERROR \n";
    }
    List *list = freqListMap[freq];
    list->removeNodeFromList(node);
    insertIntoCache(node, node->freq);
    bool isListEmpty = list->isListEmpty();
    if (isListEmpty && freq == minFreq) {
      minFreq += 1;
    }
  }

  void insertIntoCache(ListNode *node, int freq) {

    bool isFreqExists = checkIfFreqExists(freq);

    if (!isFreqExists) {
      List *list = new List();
      freqListMap[freq] = list;
    }

    List *list = freqListMap[freq];
    list->insertAtHead(node);
    // printLL();
    freqListMap[freq] = list;
  }

  void insertIntoNodeAddrMap(int key, ListNode *node) {
    nodeAddrMap[key] = node;
  }

  bool checkIfFreqExists(int key) {
    auto itr = freqListMap.find(key);
    if (itr == freqListMap.end())
      return false;
    return true;
  }

  void printLL() {
    for (auto it : freqListMap) {

      ListNode *head = it.second->head;
      ListNode *tail = it.second->tail;

      ListNode *itr = head->next;
      while (itr != tail) {
        cout << itr->key << ',' << itr->val << ' ';
        itr = itr->next;
      }
      cout << "------- end ----------- \n";
    }
    cout << "\n";
  }

  pair<Conditions, ListNode *> getCacheState(int key) {
    auto itr = nodeAddrMap.find(key);
    if (itr != nodeAddrMap.end()) {
      return std::make_pair(Conditions::NODE_EXISTS, nodeAddrMap[key]);
    }
    if (itr == nodeAddrMap.end() && currCap < maxCap) {
      return std::make_pair(Conditions::NODE_DOES_NOT_EXIST_CAP_REMAINING,
                            nullptr);
    }
    if (itr == nodeAddrMap.end() && currCap >= maxCap) {
      return std::make_pair(Conditions::NODE_DOES_NOT_EXIST_CAP_EXHAUSTED,
                            nullptr);
    }
    return std::make_pair(Conditions::ERROR, nullptr);
  }
};

/**
 * Your LFUCache object will be instantiated and called as such:
 * LFUCache* obj = new LFUCache(capacity);
 * int param_1 = obj->get(key);
 * obj->put(key,value);
 */
// @leet end

```
## References
- striver sheet link N/A
- [leetcode question link](https://leetcode.com/problems/lfu-cache/)
- ![yt video link](https://www.youtube.com/watch?v=0PSB9y8ehbk&list=PLgUwDviBIf0p4ozDR_kJJkONnb1wdx2Ma&index=80&ab_channel=takeUforward)