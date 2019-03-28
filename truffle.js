var HDWalletProvider = require("truffle-hdwallet-provider");

var mnemonic = "lounge index indoor side awful focus aisle orient century gossip alarm average";

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Match any network id
    }//,
    /*online: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/fe41724da6f24b76a782f376b2698ee8")
      },
      network_id: 3
    }*/	  
  }

};
