# DegenToken ERC20 Token

## Overview
The `DegenToken` is an ERC20 token implemented using Solidity. It provides functionalities for minting tokens, transferring tokens, redeeming tokens, and burning tokens. The contract also includes ownership management through the use of OpenZeppelin's `Ownable` pattern.

## Contract Details
- **Token Name**: Degen
- **Token Symbol**: DGN
- **Decimals**: 18

## Functions

### Constructor
The constructor initializes the token with an initial supply of 1,000,000 DGN tokens minted to the contract deployer.

### 1. `mint`
**Functionality**: Mints new tokens and assigns them to a specified address.

**Parameters**:
- `to`: Address to which tokens will be minted.
- `amount`: Number of tokens to mint.

**Access**: Only the contract owner can call this function (`onlyOwner` modifier).

### 2. `transfer`
**Functionality**: Transfers tokens from the caller's account to another address.

**Parameters**:
- `recipient`: Address to receive the tokens.
- `amount`: Number of tokens to transfer.

### 3. `redeem`
**Functionality**: Redeems tokens by burning them from the caller's account. This function can include additional logic for redeeming items in an in-game store.

**Parameters**:
- `amount`: Number of tokens to redeem.

**Access**: Any account can call this function, provided they have enough tokens in their balance.

### 4. `burn`
**Functionality**: Burns (destroys) tokens from the caller's account.

**Parameters**:
- `amount`: Number of tokens to burn.

**Access**: Removes tokens from the caller's account by burning them.

## Usage

### Interacting with the Contract

#### Deploy the Contract
Deploy the contract on a compatible Ethereum development environment like Remix.

#### Mint Tokens
As the contract owner, call the `mint` function to create new tokens and assign them to specific addresses.

#### Transfer Tokens
Use the `transfer` function to transfer tokens to another address.

#### Redeem Tokens
Call the `redeem` function to redeem tokens, which may include additional logic for redeeming items in an in-game store.

#### Burn Tokens
Any token holder can burn their own tokens by calling the `burn` function.

## Error Handling
- **Insufficient Balance**: When trying to redeem tokens (`redeem` function), an error will occur if the caller does not have enough tokens in their balance.

## Deployment
- Ensure Solidity version `^0.8.0` is used for contract compilation.
- Deploy the completed contract on a network that supports Ethereum. Adjust gas limits and transaction costs according to the network conditions.

## License
This contract is licensed under the MIT License.

