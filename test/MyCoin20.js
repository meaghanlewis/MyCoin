const MyCoin20 = artifacts.require("MyCoin20");
const {
    constants, // Common constants, like the zero address and largest integers
    expectEvent, // Assertions for emitted events
    expectRevert, // Assertions for transactions that should fail
} = require('@openzeppelin/test-helpers');

contract('MyCoin20', (accounts) => {
    it('should mint and send coins successfully', async () => {
        let c = await MyCoin20.deployed();
        await c.mint(accounts[1], 1000);
        let value = 200;
        let result = await c.send(accounts[2], value);
        expectEvent(result, 'Sent');
    });
    it('should revert when sending coins to the zero address', async () => {
        let c = await MyCoin20.deployed();
        await expectRevert(c.send(constants.ZERO_ADDRESS, 200), 'ERC20: transfer to the zero address');
    });
});