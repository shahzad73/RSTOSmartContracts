/**
   Copyright (c) 2017 Harbor Platform, Inc.

   Licensed under the Apache License, Version 2.0 (the “License”);
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an “AS IS” BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

const ServiceRegistry = artifacts.require("./ServiceRegistry.sol");
const RRegulatedService = artifacts.require("./RRegulatedService.sol");
const RRegulatedToken = artifacts.require("./RRegulatedToken.sol");

module.exports = async function(deployer) {

  const log = deployer.logger.log;
  try {
    await deployer.deploy(RRegulatedService);
    const regulator = await RRegulatedService.deployed();

    await deployer.deploy(ServiceRegistry, regulator.address);
    const registry = await ServiceRegistry.deployed();

    await deployer.deploy(RRegulatedToken, registry.address);
	const token = await RRegulatedToken.deployed();
    
	log('stoToken.address -- ' + token.address);

  }
  catch (e) {
    log(e);
  }

};
