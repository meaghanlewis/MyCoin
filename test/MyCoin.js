const MyCoin = artifacts.require("MyCoin");
const truffleAssert = require("truffle-assertions");

contract('MyCoin', (accounts) => {
    it('should mint and send coins', async() => {
        let c = await MyCoin.deployed();
        await c.mint(accounts[0], 1000);
        let result = await c.send(accounts[1], 200);
        truffleAssert.eventEmitted(result, 'Sent');
    });
});