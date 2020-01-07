	Web3 = require('web3');
	var	web3 = new Web3();
	web3.setProvider(new Web3.providers.HttpProvider('http://localhost:8545')); //access geth node
	var abi = JSON.parse('[{"constant":false,"inputs":[{"name":"newMessage","type":"string"}],"name":"setMessage","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"msg","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"constant":true,"inputs":[],"name":"getMessage","outputs":[{"name":"msg","type":"string"}],"payable":false,"stateMutability":"view","type":"function"}]');
	var greeterContract = web3.eth.contract(abi);
	var contractAddress = "0x8879Cc7f1c6E129fE87c5EEfb3B18Ca430F10643";
	var greeterInstance = greeterContract.at(contractAddress);//contract address
	var userAddress = $("#userAddress").val();
	var greeting = null;
	getMessage = function (){
		$('#msg').empty();
		greeterInstance.getMessage(function(err, result){
			$('#msg').text(result);
		});
	}
	setMessage = function (){
		greeting = prompt("매개변수를 입력하세요.", "");
		$("#account_pwd").val('');
		if (greeting != null) {
			$('#accountPwdModal').modal({show:true,backdrop:'static',keyboard:false});
		}
	}
	
	$("#addBtn").bind('click',function(e){
			var pwd = $("#account_pwd").val();
			if(pwd==""){
				alert('비밀호를 입력하세요');
				$("#account_pwd").focus();
			}else{
				web3.personal.unlockAccount(userAddress,pwd, function(e1,success){
				
				if(!e1){
					$('#filter').empty();
					$("#filter").append('Authentication : '+success+' <br>');
					
					greeterInstance.setMessage(greeting,{from:userAddress},function(e2, txHash){ 
						if(!e2){
							$("#filter").append('Smart Contract Transation ID  : <span style="background:#C0FFFF;">'+txHash +' </span><br>');
							$('#accountPwdModal').modal('hide');
							var blockFilter = web3.eth.filter('latest');
							$("#filter").append('Transaction Start <br>');
							blockFilter.watch(function(e3, blockHash) {
							    web3.eth.getBlock(blockHash, function(e3,block){
								    $("#filter").append('New Block('+block.number+')['+block.hash+'] / ' + block.transactions.length + ' TXs <br>');
								    for(var i=0;i<block.transactions.length;i++){
								    		if(txHash==block.transactions[i]){	
								    			$("#filter").append('<span style="background:#C0FFFF;">['+block.transactions[i]+"] -- checked</span><br>");
									    		greeterInstance.getMessage(function(e4,msg){
									    			$('#msg').text(msg);
									    		});
									    		$("#filter").append('Transaction End <br>');
									    		blockFilter.stopWatching(function(e5,log){
				    				    			console.log(log);
				    				    		});
									    	}else{
									    		$("#filter").append('['+block.transactions[i]+"] <br>")
									    	}
								    	}//end for
							    });//end getBlock()
							});//end watch
						}else{
							$("#filter").append(e2);
							$('#accountPwdModal').modal('hide');
						}
					});//end setGreeting
				}else{
					$("#filter").append(e1);
					$('#accountPwdModal').modal('hide');
				}
			});//end unlockAccount
		}// end pwd
	});//end event