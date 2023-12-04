<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!-- 세션에 유저객체 존재여부에 따라 바뀌는 설정 -->
<c:set var="loginId" value="${empty sessionScope.user ? '' : sessionScope.user.id}"/>
<c:set var="loginOutText" value="${empty loginId ? 'Login' : 'LogOut' }"/>
<c:set var="loginOutLink" value="${empty loginId ? '/login/getLogin' : '/login/logout'  }"/>
<c:set var="registerText" value="${empty loginId ? 'Register' : 'MyPage' }"/>
<c:set var="registerLink" value="${empty loginId ? '/register/getRegister' : '' }"/>
<c:set var="CartLink" value="${empty loginId ?  '' : '/cart/getCart'  }"/>
<c:set var="CartText" value="${empty loginId ?  '' : 'Cart'  }"/>
<c:set var="AdminText" value="${sessionScope.user.admincheck == 1 ? 'Register Product' : '' }"/>
<c:set var="AdminLink" value="${sessionScope.user.admincheck == 1 ? '/admin/registerProductForm' : '' }"/>
<c:set var="OrderInfoText" value="${sessionScope.user.admincheck == 1 ? 'OrderInfo Manage' : '' }"/>
<c:set var="OrderInfoLink" value="${sessionScope.user.admincheck == 1 ? '/admin/getOrderList' : '' }"/>



<%-- <%@ page session="false" %> --%>
<html>
<head>
	<title>메인 페이지</title>
	    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>    		
</head>
<body>
<div id="main">
	<ul>
	    <li id="logo">shop main</li>
   		<li class="m1"><a href="<c:url value='/product/categorySet?category_code=1&viewName=top'/>">Top</a>
   			<ul class="m2">
   				<li class="clothes_cate">
   					<a href="<c:url value='/product/categorySet?category_code=11&viewName=top&detail=shirt'/>">
   					셔츠
   					</a>
   				</li>
   				<li class="clothes_cate">
   					<a href="<c:url value='/product/categorySet?category_code=13&viewName=top&detail=t-shirt'/>">
   					티셔츠
   					</a>
   				</li>
   			</ul>
   		</li>
    	<li class="m1"><a href="<c:url value='/product/categorySet?category_code=2&viewName=bottom'/>">Bottom</a>
    		<ul class="m2">
   				<li class="clothes_cate">
   					<a href="<c:url value='/product/categorySet?category_code=23&viewName=bottom&detail=shorts'/>">
   					반바지
   					</a>
   				</li>
   				<li class="clothes_cate">
   					<a href="<c:url value='/product/categorySet?category_code=22&viewName=bottom&detail=jeans'/>">
   					청바지
   					</a>
   				</li>
   			</ul>
    	</li>
    	<li class="m1"><a href="<c:url value='/product/categorySet?category_code=3&viewName=shoes'/>">Shoes</a>
    		<ul class="m2">
   				<li class="clothes_cate">
   					<a href="<c:url value='/product/categorySet?category_code=34&viewName=shoes&detail=sneakers'/>">
   						스니커즈
   					</a>
   				</li>
   				<li class="clothes_cate">
   					<a href="<c:url value='/product/categorySet?category_code=33&viewName=shoes&detail=shoes'/>">
   						구두
   					</a>
   				</li>
   			</ul>
    	</li>
    	<li class="m1"><a href="<c:url value='/product/categorySet?category_code=4&viewName=accessory'/>">Acc</a>
    		<ul class="m2">
    			<li class="clothes_cate">
   					<a href="<c:url value='/product/categorySet?category_code=43&viewName=accessory&detail=earrings'/>">
   						귀걸이
   					</a>
   				</li>
   				<li class="clothes_cate">
   					<a href="<c:url value='/product/categorySet?category_code=44&viewName=accessory&detail=ring'/>">
   						반지
   					</a>
   				</li>  				
   			</ul>
    	</li>
    	<li><a href="<c:url value='${OrderInfoLink}'/>">${OrderInfoText}</a></li>
	    <li><a href="<c:url value='${AdminLink}'/>">${AdminText}</a></li> 
	    <li><a href="<c:url value='${CartLink}'/>">${CartText}</a></li>
	    <li><a href="<c:url value='/'/>">Home</a></li>
	    <li><a href="<c:url value='${loginOutLink}'/>">${loginOutText}</a></li>    
	    <li><a href="<c:url value='${registerLink}'/>">${registerText}</a></li>
	    <li><a href="<c:url value='/product/productList'/>">Product List</a></li>
	</ul> 
</div>
<script>
	/*  주문 처리 후 나타나는 메세지*/
	let msg = "${msg}";
	
	if(msg == "ORDER_SUCCESS"){
		alert("주문이 성공적으로 처리됐습니다!");
	}else if(msg == "ORDER_FAILED"){
		alert("주문 처리 중 오류가 발생했습니다!");
	}
</script>
<!-- for commit22   -->
</body>
</html>
