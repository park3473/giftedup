<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../../include/head.jsp" %>
</head>
<script>
    AOS.init({
        easing:'ease-out-back',
        duration:1000,
		 once: true
    }); 
    
</script>  

<style>
	.tabs .tab-contents ul li{
    	white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    display: block;
    }

</style>
<body>
    
	<a href="#" class="openMenu pos_a"><i class="las la-bars"></i></a>
		 <div class="menu_overlay"></div>
		<div class="layout">
	    <!-- 왼쪽 -->
	    	<%@ include file="../../include/menu.jsp" %>

    <!-- 본문 -->
<div class="content">
    <div class="sub_cont_wrap">

        <!-- 타이틀 -->
        <div class="font_noto all_tit_30">발명 및 특허교육 소개</div>
        <div class="t_pad_15">
            <span class="all_tit_sub">영재키움프로젝트는 환경에 상관없이 영재교육 대상자를 선발하여 맞춤형 교육을 지원합니다.</span>
            <span class="all_sort">학생프로그램<i class="las la-angle-right"></i>체험진로탐색프로그램<i class="las la-angle-right"></i><b class="blue_01">발명및특허교육소개</b></span>
        </div>
        <div class="line_gab_15"></div>
        <!-- 타이틀끝 -->

        <!-- 운영방안 -->
        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>명칭</div>
        <div class="garo_li txt_just">
            <div class="le">개요</div>
            <div class="ri">KAIST 과학영재교육연구원에서는 특허청과 발명진흥회의 지원으로 KAIST IP영재기업인교육원을 운영하고 있습니다. 청소년 기업가정신 교육 확산과 창의적 아이디어로 미래의 고부가가치를 창출할 수 있는 우수인재양성을 위하여 KAIST IP-CEO e-ship 교육을 운영하고 있습니다.</div>
            <div class="le">IP-CEO</div>
            <div class="ri">남들과 다르게 생각하며 도전을 통해 혁신을 이루고 가치를 창출하는 사람. 사전적 의미로는 IP는 ‘지식재산(Intellectual Property)’을 의미하고 CEO는 ‘최고경영자’를 의미하나, 조금 더 광의의 개념으로 IP는 지식재산을 포괄하는 ‘창의적 역량’을 의미하며 나아가 ‘남들과 다르게 생각할 줄 아는 사람(creator)’을 뜻함. CEO는 단순 최고경영자의 의미 뿐 아니라, ‘기업가정신으로 끊임없이 도전을 통하여 혁신을 이루고 가치를 창출하는 혁신자(innovator)’의 개념을 포함하고 있습니다.</div>
            <div class="le">e-ship</div>
            <div class="ri">‘기업가정신(Entrepreneurship)’의 줄임말로, 온라인교육과정을 뜻하기도 합니다.</div>
        </div>
        <!-- 운영방안 끝-->

        <div class="line_gab_30"></div>
        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>KAIST IP-CEO e-ship 과정</div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>운영 개요</div>
        미래영재기업인으로 성장하기 위하여 과제를 해결하면서 전문 조교의 평가와 피드백 제공, 이수증 발급 등의 혜택이 주어지는 온라인교육과정을 다음과 같이 운영합니다.
        <div class="pad_15"></div>

        <table class="table table-bordered">
        <thead>
        <tr class="align_c cell_bg">
            <th style="width:17%">구분</th>
            <th>내용</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>교육대상</td>
            <td>- 전국 중·고등학생(영재키움 프로젝트 참가학생 포함)</td>
        </tr>
        <tr>
            <td>신청인원</td>
            <td>- 00명 내외</td>
        </tr>
        <tr>
            <td>교육기간</td>
            <td>- 추후 안내될 예정입니다.</td>
        </tr>
        <tr>
            <td>개설강좌 및 교육과목</td>
            <td>- 2과목: 기업가정신, 미래사회</td>
        </tr>
        <tr>
            <td>교육이수</td>
            <td>
                - 온라인 이수기준에 부합되는 학생에 한하여 온라인 교육<br>
                - 이수증 발급
            </td>
        </tr>
        <tr>
            <td>교육혜택</td>
            <td>
                - 제출 과제에 대한 전문조교의 평가 및 피드백<br>
                - 이수 기준 충족 시 이수증 발급
            </td>
        </tr>
        </tbody>
        </table>

        <div class="pad_10"></div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>개설 강좌</div>
        <div class="pad_10"></div>
        <table class="table table-bordered">
        <thead>
        <tr class="align_c cell_bg">
            <th>일정</th>
            <th>과목명</th>
            <th>강좌수</th>
            <th>개 요</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td rowspan="2" class="align_c">
                하반기<br>
                (9월 ~ 12월)
            </td>
            <td>기업가정신</td>
            <td>10차시</td>
            <td>- 기업가 정신과 창업, 기회의 포착과 검증, 비즈니스 모델링, 플랫폼 비즈니스 등</td>
        </tr>
        <tr>
            <td>미래사회</td>
            <td>10차시</td>
            <td>- 미래 예측, 분석방법, 미래 경제사회, 미래 일자리 등</td>
        </tr>
        </tbody>
        </table>

        <div class="pad_10"></div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>수강절차</div>
        <div class="pad_10"></div>
        <div class="row pos_r">
            <div class="pos_a pos_c txt_24"><i class="las la-angle-right"></i></div>
            <div class="col-sm-6">
                <table class="table table-bordered">
                <thead>
                <tr class="align_c cell_bg">
                    <th>교육 시스템 가입</th>
                </tr>
                <tr>
                    <td class="align_lt">
                        <p><b>사업 담당자가 명단을 취함하여 교육 대상자에게 통보</b></p>
                        - 수업 홈페이지 주소 안내<br>
                        - 부여받은 아이디 및 비밀번호 안내(아이디 및 비번은 일괄 생성 후 개별 안내)
                    </td>
                </tr>
                </tbody>
                </table>
            </div>
            <div class="col-sm-6">
                <table class="table table-bordered">
                <thead>
                <tr class="align_c cell_bg">
                    <th>온라인 강의 수강 및 과제 제출</th>
                </tr>
                <tr>
                    <td> 
                    	<b>안내받은 홈페이지 접속 정보를 이용하여 강좌 수강</b>
                        - 홈페이지에 접속하여 수강/과제물 제출<br>
                        - 강좌수강 완료후 이수증 발급(교육과정에서 요구하는 교육수준을 충족한 자에 한함)
                    </td>
                </tr>
                </tbody>
                </table>
            </div>
        </div>

        <div class="line_gab_30"></div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>KAIST IP-CEO e-ship과정 참여 혜택</div>
        - 제출과제에 대한 조교의 1:1 평가와 피드백 제공<br>
        - 이수기준 충족 시, 이수증 발급
        <div class="pad_15"></div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>평가방침</div>
        - 학습자의 온라인 과제 제출 내용에 대한 담당 조교의 평가결과 종합<br>
        - 평가기준 : 제출과제의 구성, 논리 적합성, 근거 명확성, 독창성/ 창의성 등
        <div class="pad_15"></div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>신청</div>
        - 신청 방법: 이메일 신청(giftedup@kaist.ac.kr), 학생 성명 및 멘토교사 성명 기입후 이메일 제출, 별도 서식 없음<br>
        - 신청 기간: 추후 안내<br>
        - 신청 관련 문의: 042-350-6223 / 6227
        <div class="pad_15"></div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>프로그램 관련문의</div>
        - 이메일: cce@kaist.ac.kr, 메일 제목을 ‘공개과정 문의’로 통일 부탁드립니다.<br>
        - 연락처: 042-350-6213/ 6216

        <div class="line_gab_30"></div>

        <div class="font_noto all_tit_22"><span class="cont_blit_01"></span>KAIST IP-CEO e-ship 교육 내용</div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>기업가 정신</div>
        <div class="pad_10"></div>
        <table class="table table-bordered">
        <thead>
        <tr class="align_c cell_bg">
            <th style="width:12%">과정</th>
            <th style="width:12%">구분</th>
            <th style="width:10%">차시</th>
            <th>수업명</th>
        </tr>
        <tr>
            <td rowspan="10" class="align_c">기본과정</td>
            <td rowspan="10" class="align_c">온라인학습</td>
            <td class="align_c">1</td>
            <td>왜 기업가정신인가?</td>
        </tr>
        <tr>
            <td class="align_c">2</td>
            <td>왜 창업인가?</td>
        </tr>
        <tr>
            <td class="align_c">3</td>
            <td>창업방정식 1. 기회의 포착</td>
        </tr>
        <tr>
            <td class="align_c">4</td>
            <td>창업방정식 2. 기회의 검증</td>
        </tr>
        <tr>
            <td class="align_c">5</td>
            <td>창업방정식 3. 마케팅</td>
        </tr>
        <tr>
            <td class="align_c">6</td>
            <td>창업방정식 4. 사업계획</td>
        </tr>
        <tr>
            <td class="align_c">7</td>
            <td>창업방정식 5. 비즈니스모델링</td>
        </tr>
        <tr>
            <td class="align_c">8</td>
            <td>기술트랜드: 플랫폼 비즈니스</td>
        </tr>
        <tr>
            <td class="align_c">9</td>
            <td>핀테크 플랫폼비즈니스 1: - 대출과 송금 비즈니스 현황</td>
        </tr>
        <tr>
            <td class="align_c">10</td>
            <td>핀테크 플랫폼 비즈니스#2 - 결제와 펀딩 비즈니스 현황</td>
        </tr>
        </tbody>
        </table>

        <div class="pad_10"></div>
        <div class="b_pad_5 all_tit_18 green_02"><span class="cont_blit_02"></span>미래사회</div>
        <div class="pad_10"></div>
        <table class="table table-bordered">
        <thead>
        <tr class="align_c cell_bg">
            <th style="width:12%">과정</th>
            <th style="width:12%">구분</th>
            <th style="width:10%">차시</th>
            <th>수업명</th>
        </tr>
        <tr>
            <td rowspan="10" class="align_c">기본과정</td>
            <td rowspan="10" class="align_c">온라인학습</td>
            <td class="align_c">1</td>
            <td>미래 예측</td>
        </tr>
        <tr>
            <td class="align_c">2</td>
            <td>분석 방법</td>
        </tr>
        <tr>
            <td class="align_c">3</td>
            <td>미래 예측(2)</td>
        </tr>
        <tr>
            <td class="align_c">4</td>
            <td>미래 경제사회</td>
        </tr>
        <tr>
            <td class="align_c">5</td>
            <td>호모 모빌리언스</td>
        </tr>
        <tr>
            <td class="align_c">6</td>
            <td>미래 일자리 진화</td>
        </tr>
        <tr>
            <td class="align_c">7</td>
            <td>미래 인재상과 교육</td>
        </tr>
        <tr>
            <td class="align_c">8</td>
            <td>미래 에너지와 환경</td>
        </tr>
        <tr>
            <td class="align_c">9</td>
            <td>공유경제와 플랫폼의 이해</td>
        </tr>
        <tr>
            <td class="align_c">10</td>
            <td>미래사회 정리</td>
        </tr>
        </tbody>
        </table>

        <div class="t_pad_15"></div>
        ※ 교육 내용은 여건에 따라 일부 변동될 수 있습니다.<br>
        ※ 이 프로그램은 중학생이상 수강하는 것을 권장합니다.
    </div>
</div>
<!-- 본문 끝 -->
    
    <!-- 오른쪽 시작 -->
		<%@ include file="../../include/right.jsp" %>
	<!--  오른쪽 끝 -->
	<!-- 하단 -->
		<div class="footer">
		    <div class="container">
		        <div class="link">
		            <span><a href="">센터소개</a></span><span class="gab">ㅣ</span>
		            <span><a href="">이용약관</a></span><span class="gab">ㅣ</span>
		            <span><a href="">개인정보처리방침</a></span><span class="gab">ㅣ</span>
		            <span><a href="">이메일무단수집거부</a></span>
		        </div>
		        <div class="all_copy">
		            <span>주소 : 대전광역시 유성구 문지로 193 KAIST문지캠퍼스 카이스트 과학영재교육연구원(34051)</span><span class="gab">ㅣ</span>
		            <span>TEL : 042-350-6227</span><span class="gab">ㅣ</span>
		            <span>FAX : 042-350-6224</span><span class="gab">ㅣ</span>
		            <span>E-MAIL : giftedup@kaist.ac.kr</span>
		        </div>
		        <div class="copy">
		            <span>Copyright © 2020 영재키움 프로젝트 All Rights Reserved</span>
		        </div>
		    </div>
		</div>
		<!-- 하단 --> 
    </div>
    <!--본문 end-->
    
</body>
</html>
