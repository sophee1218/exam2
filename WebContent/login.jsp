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
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">아이디 저장</label>
  </div>
  <button type="button" class="btn btn-primary" onclick="doLogin()">로그인</button>
  <a href="/join.jsp"><button type="button" class="btn btn-primary">회원가입</button></a> 
  
  
  <script>
  		
  function doLogin(){
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
	  
	  
	  params = {
			  
			  uiId : $('#uiId').val(),
			  uiPwd : $('#uiPwd').val()
			
			  
	  }
	  $.ajax({
		
		  url : '/ajax/user',
		  data : JSON.stringify(params),
		  contentType : 'application/json',
		  method : 'POST',
		  success : function(res){
			  if(res.result!=null){
				  alert('로그인 성공 환영합니다');
				  location.href='/';
			  }else{
				  alert('로그인 실패');
				  location.href='/login.jsp';
			  }
		  }
	  })
  }

  
  </script>
</body>
</html>