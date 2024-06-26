<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>후기 글 모음</title>
    <link rel="stylesheet"  href="..css/main.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        .pagination-button {
            background-color: #bbb4ff;
            border: none;
            color: #fff;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 4px;
            margin-right: 5px;
        }

        .pagination-button.active {
            background-color: #6a5acd;
        }

        .reviews-container {
            display: flex;
            flex-direction: column;
            margin: 100px auto;
            justify-content: center; /* 가로 중앙 정렬 */
            width: 70%;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .post {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .post-title {
            flex-grow: 1;
        }

        .post-likes{
            margin-left: 10px;
            color: #888;
        }

        .input-group {
            font-size: 16px; /* 텍스트 크기 */
            display: flex; /* 부모 요소를 Flexbox로 설정 */
            align-items: center;
        }

        .input-group-append .btn {
            font-size: 16px; /* 텍스트 크기 */
            line-height: normal; /* 텍스트 줄 높이를 자동으로 설정 */
            height: auto; /* 높이 자동 조정 */
        }

        .input-group .form-control {
            display: inline-block; /* 입력 필드를 인라인 요소로 설정 */
            flex: 1; /* 입력 필드가 남은 공간을 모두 차지하도록 설정 */
            margin-right: 10px; /* 입력 필드와 버튼 사이의 간격 조정 */
        }

        .input-group-append {
            display: inline-block; /* 그룹 된 요소를 인라인 요소로 설정 */
            vertical-align: middle; /* 수직으로 정렬 */
        }

    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <!-- 로고 이미지 추가 -->
            <div class="logo">
                <img src="${pageContext.request.contextPath}/imgs/mmm_logo2.png" alt="MMM">
            </div>
        </div>
    </div>
    <!-- 사이드바 -->
<%@ include file="../sidebar.jsp" %>
    <div class="reviews-container">
        <div class="row">
            <!-- 검색창 -->
            <div class="col-md-6">
                <div class="input-group">
                    <input type="text" class="form-control" id="search-input" placeholder="지역을 검색하세요">
                    <div class="input-group-append">
                        <button class="btn search-btn" type="button">검색</button>
                    </div>
                </div>
            </div>
            <!-- 후기글 목록 표시 영역 -->
            <div class="reviews-list" id="reviews-list">
                <!-- 후기글이 여기에 동적으로 추가될 것입니다. -->
            </div>
            <!-- 페이징 버튼 영역 -->
            <div class="pagination" id="pagination">
                <!-- 페이징 버튼이 여기에 동적으로 추가될 것입니다. -->
            </div>
        </div>
    </div>
    <div class="menu-toggle">&#9776;</div>
</div>
</body>
<script src="../js/main.js"></script>
<script>
    const postsPerPage = 5; // 페이지당 보여줄 최신글 수
    const latestPostsContainer = document.getElementById('reviews-list');
    const paginationContainer = document.getElementById('pagination');
    const totalPosts = 30; // 전체 최신글 수 (예시로 30으로 설정)

    function renderLatestPosts(page) {
        // 페이지 번호에 따라 보여줄 최신글 목록을 계산
        const startIndex = (page - 1) * postsPerPage;
        const endIndex = Math.min(startIndex + postsPerPage, totalPosts);

        // 최신글 목록 초기화
        latestPostsContainer.innerHTML = '';

        // 최신글 목록 렌더링
        for (let i = startIndex; i < endIndex; i++) {
            const post = document.createElement('div');
            post.classList.add('post');
            post.innerHTML = `
                    <div class="post-title">후기글 제목 ${i + 1}</div>
                    <div class="post-likes">♡ ${i + 1}</div>
                `;
            latestPostsContainer.appendChild(post);
        }

        // 페이징 버튼 렌더링
        renderPaginationButtons(page);
    }

    function renderPaginationButtons(currentPage) {
        // 페이징 버튼 초기화
        paginationContainer.innerHTML = '';

        // 총 페이지 수 계산
        const totalPages = Math.ceil(totalPosts / postsPerPage);

        // 현재 페이지 그룹 계산
        const currentPageGroup = Math.ceil(currentPage / 5);
        const startPage = (currentPageGroup - 1) * 5 + 1;
        const endPage = Math.min(startPage + 4, totalPages);

        // 이전 페이지 그룹 버튼 생성
        if (currentPageGroup > 1) {
            const prevGroupButton = createPaginationButton('이전', startPage - 1);
            paginationContainer.appendChild(prevGroupButton);
        }

        // 페이지 버튼 생성
        for (let i = startPage; i <= endPage; i++) {
            const pageButton = createPaginationButton(i, i, currentPage === i);
            paginationContainer.appendChild(pageButton);
        }

        // 다음 페이지 그룹 버튼 생성
        if (currentPageGroup < Math.ceil(totalPages / 5)) {
            const nextGroupButton = createPaginationButton('다음', endPage + 1);
            paginationContainer.appendChild(nextGroupButton);
        }
    }

    function createPaginationButton(text, page, isActive = false) {
        const button = document.createElement('button');
        button.innerText = text;
        button.classList.add('pagination-button');
        if (isActive) {
            button.classList.add('active');
        }
        button.addEventListener('click', () => {
            renderLatestPosts(page);
        });
        return button;
    }

    // 초기 최신글 목록 렌더링 (첫 페이지)
    renderLatestPosts(1);
</script>
</html>