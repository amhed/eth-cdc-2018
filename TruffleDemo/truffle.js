module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  networks: {
    development: {
      host: "localhost",
      port: 7545,
      network_id: "*", // Match any network id
      gas: 6721974,
      gasPrice: 8984407996,
    },
    kovan: {
      host: "localhost",
      port: 8545,
      from: "0x...", //Put your wallet address here
      network_id: 42,
      gas: 8000000,
      gasPrice: 8984407996,
    }
  }
};
