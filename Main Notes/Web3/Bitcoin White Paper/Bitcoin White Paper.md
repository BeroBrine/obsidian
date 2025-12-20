19-12-2025 18:22

Status:

Tags:

## Bitcoin White Paper

### Introduction
- Based on trust system , completely non reversible transactions are not possible.
	- Increases cost etc.
- Trust system between the sender and reciever is the inherent thing that bitcoin tries to recover from.
	- Can be sure once the payment has been recieved it cannot go back.
- Merchants must be wary of their customers (kyc , ledgers) etc.
- No mechanism existed to make payment over digital communication channel that could reverse the 
- Introduces a system without needing a trusted party.
	- Based on cryptographic proof.
- Bitcoin was introduced as a solution to double-spending problem without needing a trusted third party in between the transactions using a peer to peer distributed timestamp server to generate computational proof of the chronological order of transactions. 
- Seller is protected by the irreversible transaction and the buyer is protected by implementing escrow mechanisms. 
	- Escrow is like a dummy account not owned by the seller and the buyer in which the money is transferred , when both the parties agree over the transaction then the seller get's the money. It is irreversible after this step.


### Transactions
- Electronic coin defined as a chain of digital signatures. 
	- Transferring of coin is done by digitally signing the hash of the previous transaction and the public key of the next owner by adding these in the end of the coin.
	![[Pasted image 20251219184333.png]]
	- Hash of the previous transaction that gave us the coin + public key of the next owner , then sign it with it my own private key.
 - But the issue of double spending still exists as owner 1 can sign many other owner's keys and say hey this is your coin.
 - To battle this timestamp server is devised.
	 - Where the first transaction only is valid. 
	 - To accomplish this without a trusted party , transactions must be publically announced , and we need a system for the participants to agree on a single order of history.
	 - The payee needs proof that at the time of each transaction , the majority of the node agreed it was first recieved.
### Timestamp server
- Basically the miner. Works by taking a hash of a block of items to be timestamped and widely publishing the hash. The timestamp proves the data must have existed at the time of hashing , and whatever the data was , it's considered the genesis.
	![[Pasted image 20251220095649.png]]

### Proof of Work
- The proof of work is similar to hashcash. 
- Involves scanning for a value that when hashed , for eg with SHA-256 , yields out certain number of zero bits , the avg time to find this value is exponential to the number of zero bits required.
-  Verifying the proof of work is just taking one hash and verifying if it contains the numbers.
- Also solves the problem of determining representation in majority decision making. 
	- Proof-of-work is essentially one-CPU-one-vote.
- Majority decision is represented by longest chain.
	- As long as majority of the compute power is controlled by the honest nodes , the honest chain will grow and be the source of truth.
	- Attacking this chain will require massive computational power as changing one block will require the attacker to re-mine all the next chained nodes.	
- To compensate for increasing hardware speed and varying interest in running nodes over time.
	- The proof of work difficulty is determined by a moving average targeting an average number of blocks per hour.
	- If they're generated too fast , the difficulty is increased. 
## References
- [Bitcoin white paper](https://bitcoin.org/bitcoin.pdf)
