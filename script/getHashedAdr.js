const circomlibjs = require("circomlibjs");
const { Wallet, SigningKey } = require("ethers");

async function main() {
    const privateKey = "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80";
    const wallet = new Wallet(privateKey);
    
    // Get the uncompressed public key
    const publicKey = SigningKey.computePublicKey(wallet.privateKey, false);
    
    // Extract X and Y coordinates
    const pubKeyX = BigInt("0x" + publicKey.slice(4, 68));  // First 64 chars = X
    const pubKeyY = BigInt("0x" + publicKey.slice(68, 132)); // Last 64 chars = Y
    
    // Initialize poseidon
    const poseidon = await circomlibjs.buildPoseidon();
    const hashedAddress = poseidon([pubKeyX, pubKeyY]);
    
    console.log("Pub Key X:", pubKeyX.toString());
    console.log("Pub Key Y:", pubKeyY.toString());
    console.log("Hashed Address:", poseidon.F.toString(hashedAddress));
    console.log("Decimal private key:", BigInt(privateKey).toString());
}

main().catch(console.error);