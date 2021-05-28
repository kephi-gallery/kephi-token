const BN = require('bn.js');

require('dotenv').config();

const KPHI = artifacts.require("KPHI");
const {
    TOKEN_OWNER
} = process.env;

const debug = "true";

const ZERO = new BN(0);
const ONE = new BN(1);
const TWO = new BN(2);
const THREE = new BN(3);

const ZERO_ADDRESS = "0x0000000000000000000000000000000000000000";

module.exports = async function (deployer, network) {
    if (network == "test" || network == "development")
        return;

    await deployer.deploy(
        KPHI,
        TOKEN_OWNER
    );
    let KPHIInst = await KPHI.deployed();

    console.log("KPHI =", KPHIInst.address);
};