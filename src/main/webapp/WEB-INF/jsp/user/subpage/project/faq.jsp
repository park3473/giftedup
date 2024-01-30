<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!--  JQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!--부트스트랩 css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css" type="text/css">

    <!--JQuery-UI-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.css" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>

    <!--css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fontawesome/all.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick-theme.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sub_01.css">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
    <title>영재키움프로젝트</title>
</head>

<body>
    <header id="new_hd" class="hd_wrap">
        <%@ include file="../../include/header.jsp" %>
        <!-- 중단메뉴시작 -->
        <section id="new_sub_hd" class="sub_hd_wrap nanumgothic">
            <%@ include file="./menu_sub.jsp" %>
        </section>
        <!-- 중단메뉴종료 -->
    </header>


    <!-- 본문 -->
    <section id="new_sub" class="sub_wrap">
        <div id="new_sub_area" class="sub_area">
            <div id="new_sub_con" class="sub_con">
                <div class="sub_size">

                    <!-- 메뉴바 -->
                    <nav class="right_nav_wrap">
                        <div class="title">
                            <h2>영재키움 프로젝트</h2>
                        </div>
                        <ul class="right_nav_area">
                            <li><a href="${pageContext.request.contextPath}/user/subpage/project/base/index.do">프로젝트 기본방향 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                            <li><a href="${pageContext.request.contextPath}/user/subpage/project/program/index.do">주요 프로그램 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                            <li><a href="${pageContext.request.contextPath}/user/subpage/project/project/index.do">사업추친 체계 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                            <li><a href="${pageContext.request.contextPath}/user/subpage/project/faq/index.do">FAQ <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                            <li><a href="${pageContext.request.contextPath}/user/subpage/project/map/index.do">오시는길 <span><img src="${pageContext.request.contextPath}/resources/img/sub/down_arrow.png" alt="화살표"></span></a></li>
                        </ul>
                    </nav>
                    <!-- 메뉴바  end-->


                    <nav class="sub_min_size">
                        <ul class="faq_wrap">
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q1. 영재키움 프로젝트에 지원하고 싶은데 <span style="color:#009dc4;">반드시 소외계층</span>이어야 하나요?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        네, 영재키움 프로젝트는 소외계층을 대상으로 하는 교육 프로그램으로 <span style="color:#009dc4;">필수조건이 소외계층</span>이어야 합니다. 지원자격 조건을 꼭! 확인해주시기 바랍니다.
                                    </p>
                                </div>
                            </li>
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q2. 영재키움 프로젝트에 처음 지원하는데, 멘토교사가 아직 결정되지 않았어요. 어떻게 하면 좋을까요?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        네, 우선적으로는 영재키움 프로젝트 지원 전에 멘토교사가 결정이 되어 신청하여야 하지만, 멘토교사가 아직 결정되지 않아도 지원이 가능합니다. 단, 온라인 지원서 작성시 ‘멘토교사 미확정’란에 반드시 표시(V)해주시기 바랍니다.<br>
                                        <span class="relate_c" style="font-size: 0.9rem;margin-top: 10px;display: block;">멘토교사가 미확정인 경우, KAIST에서 지원학생의 담임 선생님께 연락하여 멘토교사 활동을 요청할 예정입니다.</span>
                                    </p>
                                </div>
                            </li>
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q3. 2019년에 참가했던 멘토교사입니다. 담당 학생은 2020년에 참가하지 않게 되면 교사도 참가하지 않게 되나요?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        아니요. 그렇지는 않습니다. 멘토교사는 지속적으로 2020년에도 참여를 희망할 경우에는 지역별 추가 선발 인원을 참고하여 학생을 추천해서 함께 다시 지원하실 수 있습니다. 단, 이럴 경우에는 학생관련 지원서류만 제출하시면 됩니다.
                                    </p>
                                </div>
                            </li>
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q4. 2019년에 참가했던 학생입니다. 담당 멘토 선생님께서 2020년에 참가하지 않게 되면 학생도 참가하지 않게 되나요?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        아니요. 그렇지는 않습니다. 3번과 같이 학생은 지속적으로 2020년에도 참여를 희망할 경우, ‘20년 4월 현재 담임 선생님이나 기존 담임 선생님께 멘토교사 활동을 요청하시어, 멘토교사만 ’멘토교사 지원서‘를 제출하시면 됩니다.
                                    </p>
                                </div>
                            </li>
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q5. 선발에서 심사 방법은 어떻게 진행됩니까? 면접 평가도 있나요?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        심사방법은 <span style="color:#009dc4;">서류평가로만 이루어지며, 면접평가는 없습니다.</span> 또한 모든 심사과정은 <span style="color:#009dc4;">비공개</span>로 진행됩니다.
                                    </p>
                                </div>
                            </li>
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q6. 지원서류는 어디에서 다운로드 받을 수 있나요?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        지원서류는 영재키움 프로젝트 홈페이지 공지사항이나 ‘신입생 지원 모집’에서 다운로드 받을 수 있습니다.
                                    </p>
                                </div>
                            </li>
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q7. 지원자격에 대한 증빙서류는 어디에서 발급받을 수 있나요?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        증빙서류는 ‘정부민원포털 민원 24(www.minwon.go.kr)’에서 인터넷으로 발급받거나, 주민센터에서 발급받을 수 있습니다. 학교장 추천의 경우에는 해당 학교에서 확인서를 발급받아야 합니다.
                                    </p>
                                </div>
                            </li>
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q8. 지원서류와 증빙서류를 KAIST 과학영재교육연구원에 제출하고자 하는데, 어떻게 제출하면 되나요?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        제출하는 방법은 2가지가 있습니다. 이메일 제출과 우편제출입니다. 이메일 제출은 모든 파일을 하나의 pdf 변환 또는 zip파일로 만들어서 영재키움 프로젝트 대표 메일주소인 giftedup@kaist.ac.kr로 제출하시면 됩니다. 우편 제출은 모든 지원서류를 대봉투에 넣어 아래 주소로 6.19(금)소인까지 보내주시면 됩니다. (34051) 대전광역시 유성구 문지로 193 KAIST문지캠퍼스 학부동 F618호 과학영재교육연구원 영재키움 프로젝트 담당자 앞
                                    </p>
                                </div>
                            </li>
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q9. 영재키움 프로젝트에 참가하는 비용은 있나요?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        아니오, 영재키움 프로젝트는 국고를 받아 지원하는 사업으로 프로그램 참여비는 무료입니다. 다만, 프로그램의 성격에 따라 최소한의 교통비 및 식비 등은 본인이 부담할 수 있습니다.
                                    </p>
                                </div>
                            </li>
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q10. 영재키움 프로젝트에 참가활동 이력은 ‘영재교육 진흥법’에 정하는 영재교육 시수로 인정되나요?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        아니오, 영재키움 프로젝트 정식 승인된 영재교육 프로그램이 아니어서 영재교육 참여 시수로 인정되지 않으며, 생활기록부에 기록되지 않습니다.
                                    </p>
                                </div>
                            </li>
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q11. 영재키움 프로젝트에 한번 선정되면 계속 프로그램에 참여할 수 있나요?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        최소 3년간 프로그램을 지원할 예정입니다. 다만, 불성실한 참여 등으로 프로그램 지원을 계속할 수 없다고 판단되는 경우 참가 자격을 잃게 됩니다.
                                    </p>
                                </div>
                            </li>
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q12. 영재키움 프로젝트에 다자녀 가정도 지원 자격에 해당되나요?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        아니오, 영재키움 프로젝트는 다자녀 가정은 지원자격에 해당되지 않습니다. 다만, 영재키움 프로젝트 지원 자격에 해당되는 경우에는 신청이 가능합니다.
                                    </p>
                                </div>
                            </li>
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q13. 멘토교사의 역할은 무엇입니까?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        멘토교사는 참여 학생의 재능을 고려한 교육지원 뿐만 아니라 진로 및 정서 상담 등을 지원하게 됩니다. 장기적인 멘토링을 권장하나 인사이동, 학생의 학교급 변경 등으로 멘토교사의 교체가 불가피하다고 판단되는 경우, KAIST에서 해당 교사를 대체하여 학생을 지원할 멘토교사를 추천하도록 할 예정입니다.
                                    </p>
                                </div>
                            </li>
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q14. 매년 학생을 선발하나요?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        2018년도에 초4~고1까지 400명을 선발하고 2019년 부터는 초4학생의 신규인원 및 자격변동에 따른 추가선발을 하고 있습니다. 단, 추가선발의 경우에는 초4~고1까지 해당되며 학교급과 학년에 상관없이 선발합니다.
                                    </p>
                                </div>
                            </li>
                            <li class="q_area">
                                <div class="title">
                                    <span><img src="${pageContext.request.contextPath}/resources/img/sub/sub_icon_bars.png" alt="점" /></span>
                                    <p>Q15. 영재키움 프로젝트에 대해 궁금한 사항이 있으면 어디에 연락하면 되나요?</p>
                                </div>
                                <div class="txt">
                                    <p class="nanumbarungothic">
                                        전화 042-350-6227(근무시간, 09:00~18:00, 점심시간 12:00~13:00)으로 연락하시면 되고, 이메일은 <span style="color:#009dc4;">giftedup@kaist.ac.kr</span> 입니다. 또한, 카카오톡 채널 ‘영재키움 프로젝트’로 연락하시면 됩니다.
                                    </p>
                                </div>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <footer id="new_ft" class="ft_wrap">
        <%@ include file="../../include/footer.jsp" %>
    </footer>
    <%@ include file="../../include/footerJs.jsp" %>

</body>

</html>