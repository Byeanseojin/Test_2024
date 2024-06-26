<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet"  href="..css/main.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 부트스트랩 CDN 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>내 글 관리</title>
    <style>
        /*.container{*/
        /*    display: flex;*/
        /*    justify-content: center; !* 수평 중앙 정렬 *!*/
        /*    align-items: center;*/
        /*    height: 100vh;*/
        /*}*/
        .MyPost {
            display: block;
            margin-top: 200px;
            margin-right:25% ;
            width: 50%;
            height: 80vh;
            float: right;
        }

        .deleteButtonContainer {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
            flex-direction: row;
            padding: 10px;
        }

        #selectAll, #deletePost {
            background-color: #bbb4ff;
            width: auto;
        }

        #postList {
            list-style: none;
        }

        #MyPost {
            text-align: center;
            margin: 15px;
        }

        .pagination-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .pagination {
            display: flex;
            justify-content: center;
        }

        .pagination button {
            margin: 0 5px;
            padding: 5px 10px;
            background-color: #bbb4ff;
        }

        .pagination button.active {
            background-color: #555;
            color: white;
        }

        #prevGroupButton, #nextGroupButton {
            padding: 5px 0px;
            background-color: #ffffff;
            width: 50px;
            color: black;
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
    <!-- 토글 버튼 -->
    <div class="menu-toggle">&#9776;</div>
</div>
<div class="MyPost">
    <h2 id="MyPost">내가 쓴 글</h2>
    <div class="row">
        <div class="col text-end"> <!-- 오른쪽 정렬 -->
            <a href="#">게시글</a>
            <a href="#">댓글</a>
        </div>
    </div>

    <ul id="postList">
    </ul>
    <div class="pagination-container">
        <button id="prevGroupButton">&lt;</button>
        <div class="pagination">
            <!-- 페이지 버튼들이 여기에 추가될 것입니다. -->
        </div>
        <button id="nextGroupButton">&gt;</button>
    </div>
    <div class="deleteButtonContainer">
        <button type="button" id="selectAll">모두 선택</button>
        <button type="button" id="deletePost">선택된 글 삭제</button>
    </div>
</div>
<script src="../js/toggle.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const selectAllButton = document.getElementById('selectAll'); // 모두 선택 버튼

        // 글 삭제 버튼 클릭 시 선택된 글 삭제
        const deletePostButton = document.getElementById('deletePost');
        deletePostButton.addEventListener('click', function () {
            const postCheckboxes = document.querySelectorAll('.postCheckbox'); // postCheckboxes 변수 정의
            postCheckboxes.forEach((checkbox, index) => {
                if (checkbox.checked) {
                    const listItem = checkbox.parentElement;
                    listItem.remove();
                }
            });
        });

        // 모두 선택 버튼 클릭 시 모든 체크박스 선택 또는 해제
        selectAllButton.addEventListener('click', function () {
            const postCheckboxes = document.querySelectorAll('.postCheckbox');
            let allChecked = true; // 전체 선택 상태 변수
            postCheckboxes.forEach((checkbox) => {
                if (!checkbox.checked) {
                    allChecked = false;
                }
            });
            // 전체 선택 상태에 따라 토글
            postCheckboxes.forEach((checkbox) => {
                checkbox.checked = !allChecked;
            });
        });
    });

</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const posts = [
            "글 1", "글 2", "글 3", "글 4", "글 5", "글 6", "글 7", "글 8", "글 9", "글 10",
            "글 11", "글 12", "글 13", "글 14", "글 15", "글 16", "글 17", "글 18", "글 19", "글 20",
            "글 1", "글 2", "글 3", "글 4", "글 5", "글 6", "글 7", "글 8", "글 9", "글 10",
            "글 11", "글 12", "글 13", "글 14", "글 15", "글 16", "글 17", "글 18", "글 19", "글 20",
            "글 1", "글 2", "글 3", "글 4", "글 5", "글 6", "글 7", "글 8", "글 9", "글 10",
            "글 11", "글 12", "글 13", "글 14", "글 15", "글 16", "글 17", "글 18", "글 19", "글 20",
            // 추가적인 글들...
        ];

        const postsPerPage = 10; // 페이지 당 글의 수
        const pagesPerGroup = 5; // 그룹 당 페이지 수
        let currentPage = 1; // 현재 페이지

        // 페이지 수 계산
        const totalPages = Math.ceil(posts.length / postsPerPage);
        const totalGroups = Math.ceil(totalPages / pagesPerGroup);
        let currentGroup = Math.ceil(currentPage / pagesPerGroup);

        // 페이지 버튼을 생성하는 함수
        function createPaginationButtons() {
            const paginationContainer = document.querySelector('.pagination');
            paginationContainer.innerHTML = ''; // 버튼들을 초기화

            const startPage = (currentGroup - 1) * pagesPerGroup + 1;
            const endPage = Math.min(startPage + pagesPerGroup - 1, totalPages);

            for (let i = startPage; i <= endPage; i++) {
                const button = document.createElement('button');
                button.textContent = i;
                if (i === currentPage) {
                    button.classList.add('active');
                }
                button.addEventListener('click', function () {
                    currentPage = i;
                    currentGroup = Math.ceil(currentPage / pagesPerGroup);
                    displayPosts();
                    createPaginationButtons();
                });
                paginationContainer.appendChild(button);
            }
        }

        // 현재 페이지에 해당하는 글을 표시하는 함수
        function displayPosts() {
            const postList = document.getElementById('postList');
            postList.innerHTML = ''; // 글 목록 초기화

            const startIndex = (currentPage - 1) * postsPerPage;
            const endIndex = startIndex + postsPerPage;
            const currentPosts = posts.slice(startIndex, endIndex);

            currentPosts.forEach(post => {
                const listItem = document.createElement('li');
                listItem.innerHTML = `<input type="checkbox" class="postCheckbox" name="pck"> ${post}`;
                postList.appendChild(listItem);
                const hr = document.createElement('hr');
                postList.appendChild(hr);
            });
        }

        // 초기화: 첫 페이지의 글을 표시하고 페이지 버튼 생성
        displayPosts();
        createPaginationButtons();

        // 페이지 버튼 그룹 이동 기능 구현
        const prevGroupButton = document.getElementById('prevGroupButton');
        const nextGroupButton = document.getElementById('nextGroupButton');

        prevGroupButton.addEventListener('click', function () {
            if (currentGroup > 1) {
                currentGroup--;
                currentPage = (currentGroup - 1) * pagesPerGroup + 1;
                displayPosts();
                createPaginationButtons();
            }
        });

        nextGroupButton.addEventListener('click', function () {
            if (currentGroup < totalGroups) {
                currentGroup++;
                currentPage = (currentGroup - 1) * pagesPerGroup + 1;
                displayPosts();
                createPaginationButtons();
            }
        });
    });


</script>

</body>
</html>