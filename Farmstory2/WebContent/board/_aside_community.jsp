<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sub" class="community">
    <div>
        <img src="../img/sub_top_tit5.png" alt="COMMUNITY"/>
    </div>
    <section>
        <aside>
            <img src="../img/sub_aside_cate5_tit.png" alt="커뮤니티"/>
            <ul>
                <li class="${cate=='notice'?'on':''}"><a href="/Farmstory2/board/list.do?group=community&cate=notice">공지사항</a></li>
                <li class="${cate=='menu'?'on':''}"><a href="/Farmstory2/board/list.do?group=community&cate=menu">오늘의식단</a></li>
                <li class="${cate=='cheif'?'on' : ''}"><a href="/Farmstory2/board/list.do?group=community&cate=cheif">나도요리사</a></li>
                <li class="${cate=='qna'?'on' : ''}"><a href="/Farmstory2/board/list.do?group=community&cate=qna">고객문의</a></li>
                <li class="${cate == 'fnq' ? 'on' : ''}"><a href="/Farmstory2/board/list.do?group=community&cate=fnq">자주묻는질문</a></li>
            </ul>
        </aside>
        <article>
            <nav>
                <img src="../img/sub_nav_tit_cate5_tit_${cate}.png" alt="이벤트"/>
                <p>
                    HOME > 커뮤니티 >
                    <c:choose>
                    	<c:when test="${cate=='notice'}">
	                     	<span>공지사항</span>
	                    </c:when>
                    	<c:when test="${cate=='menu'}">
	                     	<span>오늘의 식당</span>
	                    </c:when>
                    	<c:when test="${cate=='cheif'}">
	                     	<span>나도요리사</span>
	                    </c:when>
                    	<c:when test="${cate=='qna'}">
	                     	<span>고객문의</span>
	                    </c:when>
                    	<c:when test="${cate=='fnq'}">
	                     	<span>자주묻는질문</span>
	                    </c:when>
                    </c:choose>
                </p>
            </nav>
            <div class="content">
            	<!-- 컨텐츠 내용 시작 -->