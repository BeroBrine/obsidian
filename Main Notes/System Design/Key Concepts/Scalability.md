*19-04-2025 01:28*


*Tags*: [[Tags/system design|system design]]

# Scalability

#### Definition
- It is the property of system to support growing amount of load by adding more resources. 

##### How can a system grow?
- User Base -> More users are added.
- Data -> More data is being added.
- Complexity -> The system is growing by adding various other things.
- Geographical -> The system is now supporting multiple geographical locations. 

#### How to scale a system?


##### Vertical / Horizontal Scaling
- Vertical Scaling means addition of resources such as ram , storage , cpu power in a single machine.
- Horizontal refers to distributing load among multiple servers.

##### Load Balancers
- This acts as a middleman between the user and the server and routes request based on load balancing algorithms to different different servers.

##### CDNs
- Content Delivery Networks are used to distribute content over the globe.
	- Nearest CDN is used to respond to the user request.

##### Caching
- Caching is used to store frequently accessed data inside the memory. 
	- Retrieval from memory is faster as that of IO.


##### Sharding/Replication
- In this , the database is broken into smaller pieces and distributed (Sharding). 
	- Replication is replacting the database over multiple servers to make read queries faster.

##### Auto Balancing Groups.
- A different system based on a specified parameters adds more or removes server based on the


##### Multi Region Deployment
- The system is deployed onto multiple regions


##### Async Communication
- In this , long tasks or heavy computational tasks are delegated to a background system and when they are done , they are retrived.
	- Until then , the main flow does not get blocked.


##### Microservices
- The different components that make up the whole system are made independent and they communicate with each other with various protocols.


## References
- [AlgoMaster Link]() 
- [Ashish's Github Repo](https://github.com/ashishps1/awesome-system-design-resources)