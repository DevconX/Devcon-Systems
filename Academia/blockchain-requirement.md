# Devcon Blockchain Session:

In this session we will be talking about the blockchain technology and aspects in general, Then our focus will be directed on how to integrate the blockchain into a real project (if worth it) and for that we will use the NEM blockchain.

# NEM Blockchain

NEM blockchain leverages a rest API to the developers to make it easier for them to use and communicate with the blockchain.

Thus any language that supports HTTP requests can be used

It is worth noting that in this session we will be focusing on JavaScript.. but the participant are free to join and use any language they are good at

## Requirements:

- code editor of your choice
- that's it
here is a list of wrappers or packages for every language please download the one you want to use:
### java:
- [NEM core](http://github.com/nemproject/nem.core)
### javascript:
- [NEM SDK](https://github.com/QuantumMechanics/NEM-sdk)
### Typescript:
- [NEM library](https://github.com/aleixmorgadas/nem-library-ts)
### C#:
- [CSharp2NEM](https://github.com/NemProject/csharp2nem)
### Ruby:
- [nis ruby](https://github.com/44uk/nis-ruby)
### PHP:
- [NEM api library](https://github.com/namuyan/NEM-Api-Library)

### Other dev resources:
Check thi out: [NEM resources](https://github.com/Xpedite/NEM-Resources/blob/master/DEV_Resources.md)

## Setting up NanoWallet

1. Download and extract [NanoWallet](https://github.com/NemProject/NanoWallet/releases/download/1.4.13/NanoWallet-1.4.13.zip)
2. In the extracted folder, open **start.html**. Click **Sign Up**
3.  In the **Simple wallet** tab, fill in the form as below. Use any name and password, but make sure **Testnet** is selected. Then click **Create simple wallet**

 ![nw1](https://i.imgur.com/kijOlmQ.png)
4. Ensure the .wlt file is downloaded, check both boxes and click **I agree**
 ![nw2](https://i.imgur.com/zeVbkqO.png)
5. Select your new wallet in the drop-down, enter your password and Sign In  
6. Navigate to **Send** > **Receive**. The long random alphanumeric string is your testnet address.  
7. Copy your address and paste it in the D2-Blockchain telegram group. A telegram bot will send 100 testnet XEMs to each address.  

 ![nw3](https://i.imgur.com/KMiz5HD.png)

NanoWallet is the official wallet app for the NEM cryptocurrency, called XEM. Any action that writes data to the NEM blockchain requires a small amount of XEM network fee. This fee is paid to a random NEM harvester that secures the peer-to-peer network.

Since XEM has a monetary value (1 XEM = RM0.80 at current market price), we will be using testnet XEM. Testnet is a blockchain network created for developer testing, so test XEMs do not have any Ringgit value.

## NEM API documentation

- https://bob.nem.ninja/docs/
- Javascript SDK: https://github.com/QuantumMechanics/NEM-sdk
