# What this repo does

This repo is used to demonstrate how to take [Solidity](https://solidity.readthedocs.io/) contracts and integrate them with [OpenZeppelin](https://openzeppelin.com/).

### Get started
- Run `npm install` from terminal to install dependencies
- Use openzeppelin CLI to compile and deploy the contracts
  - run `npx oz compile`
  - run `npx oz deploy`
  
### Run tests

- First, you'll need to make sure that you have [Truffle](https://www.trufflesuite.com/truffle) installed. If you don't you can type: `npm install truffle -g`
- And then, I use [Ganache CLI](https://github.com/trufflesuite/ganache-cli) as the blockchain development server. To install that run: `npm install -g ganache-cli`
- After those tools are installed, in your terminal, start-up ganache: `ganache-cli`
- Then in another terminal window run the tests with: `truffle test`
