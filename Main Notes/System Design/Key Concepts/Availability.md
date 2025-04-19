*19-04-2025 01:51*


*Tags*: [[Tags/system design|system design]]

# Availability


#### Definition
- Availability is the proportion of time a system is functional and responds to queries.
- Availability = uptime/uptime + downtime. 
- Usually in percentage.

##### Measure
- It is measured in 'nines'.
	- Two Nine = 99% Availability.
	- Three Nine = 99.9% availability.
	- Four Nine = 99.99% availability.
	- Five Nine = 99.999% availability.
	- Six Nine = 99.9999% availability.



##### How To Improve Availability
- Redundancy
	- Multiple backup components that take over when primary one fails.
		- Server Redundancy-> Multiple servers are running ensuring that one takes over if one fails.
		- Database Redundancy -> Multiple replicas of database are available.
		- Geographical Redundancy -> The service is hosted on multiple region server to mitigate regional failures.
		
- Load Balancers
	- Acts as a middleman which mitigates requests to different server ensuring that one server does not become a bottleneck.
		- Hardware Load Balancer -> Physical devices that distribute requests based on some pre defined set of rules.
		- Software Load Balancers -> Software solutions that manage traffic distribution.

- Fallover mechanism
	- Set of devices or implementations over which a service fall backs to on failure.
		- Active-Active -> All components are active and share the load. 
		- Active-Passive -> Set of backups attached to each component which become active on failure.

- Data Replication 
	- Replicating data across multiple backups 
		- Synchronous -> Data is replicated in real time.
		- Asynchronous -> Data is replicated after a delay. Causes data inconsistency issues.


- Health Monitoring and Alerts





## References
- [AlgoMaster Link](https://blog.algomaster.io/p/system-design-what-is-availability) 
- [Ashish's Github Repo](https://github.com/ashishps1/awesome-system-design-resources)