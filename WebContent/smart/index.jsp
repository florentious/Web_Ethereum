<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

	<div class="col-sm-10">
		<h1>Greeter Smart Contract</h1>
		<div class="row">
		
		  <div class="col col-md-8">
		  	<a href="javascript:getMessage();" class="btn btn-primary" id="getMessage">getMessage()<i class="fa fa-check spaceLeft"></i></a>
		  	<a href="javascript:setMessage();" class="btn btn-success" id="setMessage">setMessage()<i class="fa fa-check spaceLeft"></i></a>
		  </div>
		  <div class="col col-md-4" id="msg">
				
		  	</div>
		</div>
		<div class="row">
			<div id="filter">Filter</div>
		</div>
	</div>
	<!-- modal start -->
	<div class="modal fade" id="accountPwdModal" tabindex="-1" role="dialog" aria-labelledby="accountPwdModalLabel" aria-hidden="true">
  		<div class="modal-dialog" role="document">
    			<div class="modal-content">
		    		<div class="modal-header">
		        		<h5 class="modal-title" id="accountPwdModalLabel">Account (<span id="modalAddress"><%="0x5fdddad50a43e4a3a6ccdb4290a102b3661e7db7" %></span>)</h5>
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          	<span aria-hidden="true">&times;</span>
		        		</button>
		      </div>
	      		<div class="modal-body">
			     	
			          <div class="form-group">
			            <label for="account_pwd" class="form-control-label">비밀번호 :</label>
			            <input type="password" class="form-control" id="account_pwd" name="account_pwd">
			          </div>
			        
	      		</div>
			    <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary" id="addBtn">Send</button>
			    </div>
    			</div>
  		</div>
	</div>
	<!-- modal end -->
	<input type="hidden" id="userAddress" value="<%="0x5fdddad50a43e4a3a6ccdb4290a102b3661e7db7"%>"/>
	
	<script src="smart.js"></script>
<%@ include file="../inc/footer.jsp"%>