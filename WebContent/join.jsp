<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/common/head.jsp"></jsp:include>
</head>

<body>
<jsp:include page="/common/menu.jsp"></jsp:include>

<div class="form-group">
    <label for="uiId">Id</label>
    <input type="text" class="form-control" id="uiId">
  </div>
  <div class="form-group">
    <label for="uiPwd">Password</label>
    <input type="password" class="form-control" id="uiPwd">
  </div>
  <div class="form-group">
    <label for="uiName">Name</label>
    <input type="text" class="form-control" id="uiName">
  </div>
  <div class="form-group">
    <label for="uiAge">Age</label>
    <input type="number" class="form-control" id="uiAge">
  </div>
  <div class="form-group">
    <label for="uiBirth">Birth</label>
    <input type="date" class="form-control" id="uiBirth">
  </div>
    <div class="form-group">
    <label for="uiPhone">Phone</label>
    <input type="text" class="form-control" id="uiPhone">
  </div>
  
    <div class="form-group">
    <label for="uiEmail">Email</label>
    <input type="text" class="form-control" id="uiEmail">
     <small id="emailHelp" class="form-text text-muted">-는 생략하고 넣어주세요</small>
  </div>
  
    <div class="form-group">
    <label for="uiNickname">Nickname</label>
    <input type="text" class="form-control" id="uiNickname">
  </div>
  

  <button type="button" class="btn btn-primary" onclick="doJoin()">회원가입</button>
  <a href="/login.jsp"><button type="button" class="btn btn-primary">취소</button></a> 
  
  
  
  <script>
  
  function doJoin(){
	  if($('#uiId').val().trim().length<4){
		  alert('아이디는 4글자 이상');
		  $('#uiId').focus();
		  return;
	  }
	  if($('#uiPwd').val().trim().length<4){
		  alert('비밀번호를 4글자 이상 적어주세요');
		  $('#uiPwd').focus();
		  return;
	  }
	  if($('#uiName').val().trim().length<2){
		  alert('이름을 2글자 이상 적어주세요');
		  $('#uiName').focus();
		  return;
	  }
	  if($('#uiAge').val()<1 || $('#uiAge').val()>150 ){
		  alert('나이를 정확히 적어주세요');
		  $('#uiAge').focus();
		  return;
	  }
	  if(!$('#uiBirth').val()){
		  alert('생일을 정확히 입력해주세요');
		  $('#uiBirth').focus();
		  return;
	  }
	  
	
	  if($('#uiNickname').val().trim().length<3){
			alert('닉네임 정확히 입력해주세요');
			$('#uiNickname').focus();
			return;
		  }
	  
	
	  
	  params = {
			  uiId : $('#uiId').val(),
			  uiPwd : $('#uiPwd').val(),
			  uiName : $('#uiName').val(),
			  uiAge : $('#uiAge').val(),
			  uiBirth : $('#uiBirth').val(),
			  uiPhone : $('#uiPhone').val(),
			  uiEmail : $('#uiEmail').val(),
			  uiNickname : $('#uiNickname').val(),
			
			  
	  }
	  
		$.ajax({
			url : '/ajax/user',
			method:'POST',
			data : JSON.stringify(params),
			contentType : 'application/json;charset=utf-8',
			success : function(res){
				if(res.result==1){
					alert('회원가입완료');
					location.href="/login.jsp";
				}else{
					alert('회원가입 실패');
					
				}
			}
		})
  }
  
  </script>
</body>
</html>