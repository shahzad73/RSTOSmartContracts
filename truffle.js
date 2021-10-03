var HDWalletProvider = require("truffle-hdwallet-provider");

var mnemonic = "slender always eager impact tackle border exile lava clutch real skirt office";

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
        host: "127.0.0.1",
        port: 7545,
        network_id: "*"      // Match any network id
    },
    /*online: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://kovan.infura.io/v3/fe41724da6f24b76a782f376b2698ee8")
      },
      network_id: 42
    }*/	  
  }

};
