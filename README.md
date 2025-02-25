# zkNFT Proof

This project implements a **zero-knowledge proof (ZKP) system** for proving NFT ownership **without revealing** the owner's private key or Ethereum address. Using **ZoKrates**, the proof is computed off-chain and verified on-chain.

## 🚀 Features

- **Zero-Knowledge Proofs (ZK-SNARKs)** to verify NFT ownership privately
- Uses **Poseidon hashing** for privacy-preserving address verification
- **Off-chain proof generation** and **on-chain verification**
- Based on **ZoKrates**, a zk-SNARK framework for Ethereum

---

## Tech Stack 💻

<div align="center">  
    <img src="https://skillicons.dev/icons?i=git,github,vscode,solidity" alt="Tech stack icons"/> <br>
</div>

- **Solidity** for smart contract development
- **ZoKrates** for zero-knowledge proof generation
- **Foundry** and **OpenZeppelin** for smart contract deployment and testing
- **Git** and **GitHub** for version control and collaboration
- **Visual Studio Code** for development and debugging
- **Poseidon hashing** for private address verification
- **Node.js & ethers.js** for off-chain proof generation and on-chain verification

---

## 📦 Installation

Ensure you have **ZoKrates** installed. If not, install it using:

```sh
curl -LSfs get.zokrat.es | sh
```

Then, clone this repository:

```sh
git clone https://github.com/Trong-Tra/zkNFT-Proof.git
cd zkNFT-Proof
```

Install dependencies:

```sh
npm install
```

---

## 🛠 Usage

### **1️⃣ Generate Hash of Address**

Run the script to generate the **hashed address** from your private key:

```sh
node script/getHashedAdr.js <PRIVATE_KEY>
```

Example:

```sh
node script/getHashedAdr.js
```

Output:

```
Pub Key X: 59295962801117472859457908919941473389380284132224861839820747729565200149877
Pub Key Y: 24099691209996290925259367678540227198235484593389470330605641003500238088869
Hashed Address: 12691308985383890722998847445231533223920069114977877244625411989086276600861
Decimal private key: 77814517325470205911140941194401928579557062014761831930645393041380819009408
```

### **2️⃣ Compute Witness**

Run the following command to compute the witness:

```sh
zokrates compute-witness --verbose -i nft_ownership -a <PRIVATE_KEY> <HASHED_ADDRESS> <NFT_ID> <PUB_KEY_X> <PUB_KEY_Y>
```

Example:

```sh
zokrates compute-witness --verbose -i nft_ownership -a 77814517325470205911140941194401928579557062014761831930645393041380819009408 12691308985383890722998847445231533223920069114977877244625411989086276600861 1 59295962801117472859457908919941473389380284132224861839820747729565200149877 24099691209996290925259367678540227198235484593389470330605641003500238088869
```

### **3️⃣ Generate Proof**

Run in prover directory

```sh
zokrates generate-proof -i nft_ownership
```

### **4️⃣ Verify the Proof**

Run in verifier directory

```sh
zokrates verify
```

If successful, you will see:

```
Performing verification...
PASSED
```

---

## 🔒 Security Considerations

- The **private key is never exposed**; only the **hashed address** is public.
- For this repo, I use the based testing key from Foundry itself so I have no worry of exposing this key. If you implemented this is on your project, please consider using dotenv or your preferable method of hidding your private keys, it is a good practice of not exposing your private keys.
- The **Poseidon hash function** ensures one-way encryption, making it **impossible** to derive the private key.
- The proof only shows **correct NFT ownership**, not the actual identity.
- For added privacy, a **random salt** can be introduced in the hashing process. Multiple rounds could increase the confidence level of the zkp.

---

## 📜 License

This project is open-source and licensed under the MIT License.

---
