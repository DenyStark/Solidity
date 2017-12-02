// Read existing contract

var my_address = "0xe0968ff0d16680bab00a390ba4edabbe1ab9c523";

personal.unlockAccount(my_address, "password");

var contract_address = "0x8296ba00fd600ff600fae0eab66b270e444fbd54";
var abi = [{"constant":false,"inputs":[{"name":"newWord","type":"string"}],"name":"setWord","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"getWord","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"}];

var contract_ = web3.eth.contract(abi);

var contr = contract_.at(contract_address);
console.log(contr.getNumber())

personal.unlockAccount(my_address, "password")
var new_address = contr.setNumber(7, {from: my_address});
console.log(new_address);

// Changed after adding to the block (about 15 seconds)
//console.log(contr.getNumber());