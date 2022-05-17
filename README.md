# Description

Example implementation of ERC20 token airdrop using merkle tree.

Unlike the traditional approach of passing all eligible address to the contract, this approach allows passing just one value (the merkle tree root), making it far more cheaper in comparison.

# Install

```
npm i
```

# Test

```
npm test
```

Test result:

```
  Contract: MyToken
    ✔ claims the airdrop to an eligible address (60ms)
    ✔ fails to claim the airdrop to a non-eligible address (59ms)
    ✔ cannot claim multiple times (72ms)


  3 passing (645ms)
```
