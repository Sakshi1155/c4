// test/DegenToken.test.js
const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('DegenToken', function () {
  let owner, addr1, addr2;
  let token;

  beforeEach(async function () {
    [owner, addr1, addr2] = await ethers.getSigners();

    const Token = await ethers.getContractFactory('DegenToken');
    token = await Token.deploy();
    await token.deployed();
  });

  it('Should have correct name, symbol, and initial supply', async function () {
    expect(await token.name()).to.equal('Degen');
    expect(await token.symbol()).to.equal('DGN');
    expect(await token.totalSupply()).to.equal(1000000 * 10 ** 18);
  });

  it('Should transfer tokens between accounts', async function () {
    await token.transfer(addr1.address, 100);
    expect(await token.balanceOf(addr1.address)).to.equal(100);

    await token.connect(addr1).transfer(addr2.address, 50);
    expect(await token.balanceOf(addr2.address)).to.equal(50);
  });

  it('Should allow owner to mint tokens', async function () {
    await token.connect(owner).mint(addr1.address, 100);
    expect(await token.balanceOf(addr1.address)).to.equal(100);
  });

  it('Should burn tokens from owner', async function () {
    await token.transfer(addr1.address, 100);
    await token.connect(addr1).burn(50);
    expect(await token.balanceOf(addr1.address)).to.equal(50);
  });

  it('Should allow address to redeem tokens', async function () {
    await token.transfer(addr1.address, 100);
    await token.connect(addr1).redeem(50);
    expect(await token.balanceOf(addr1.address)).to.equal(50);
  });
});
