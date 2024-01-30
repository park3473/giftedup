<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div id="new_ft_area" class="ft_area">
    <div id="new_ft_con" class="ft_con">
        <div class="ft_size nanumbarungothic">
            <nav class="ft_slider_wrap">
                <ul class="ft_slider">
                    <li class="ft_slide"><span><a href="https://www.moe.go.kr/main.do" target="_blank">교육부 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="https://www.kaist.ac.kr/html/kr/index.html" target="_blank">카이스트 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.sen.go.kr/main/services/index/index.action" target="_blank">서울특별시교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.pen.go.kr/index.pen" target="_blank">부산광역시교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.dge.go.kr/" target="_blank">대구광역시교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.ice.go.kr/main.do?s=ice" target="_blank">인천광역시교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.gen.go.kr/main/main.php" target="_blank">광주광역시교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.dje.go.kr/main.do?s=dje" target="_blank">대전광역시교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.use.go.kr/" target="_blank">울산광역시교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.sje.go.kr/" target="_blank">세종특별자치시 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.goe.go.kr/" target="_blank">경기도교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.kwe.go.kr/mbshome/mbs/kr/index.do" target="_blank">강원도교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.cbe.go.kr/home/main.php" target="_blank">충청북도교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.cne.go.kr/cne/main.do" target="_blank">충청남도교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.jbe.go.kr/main/main.jbe" target="_blank">전라북도교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.jne.go.kr/index.jne" target="_blank">전라남도교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.gbe.kr/" target="_blank">경상북도교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.gne.go.kr/" target="_blank">경상남도교육청 <i class="far fa-clone"></i></a></span></li>
                    <li class="ft_slide"><span><a href="http://www.jje.go.kr/" target="_blank">제주특별자치도교육청 <i class="far fa-clone"></i></a></span></li>
                </ul>
            </nav>
            <nav class="ft_menu">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/user/subpage/policy/index.do">개인정보처리방침</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/subpage/individual/index.do">웹접근성정책</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/subpage/email/index.do">이메일무단수집거부</a></li>
                </ul>
            </nav>
            <div class="txt">
                <div class="txt_right">
                    <p><span class="icon_ob"><img src="${pageContext.request.contextPath}/resources/img/adress_icon.png" alt="주소"></span>대전광역시 유성구 문지로 193 KAIST문지캠퍼스 카이스트 과학영재교육연구원(34051)</p>
                    <p><span class="icon_ob"><img src="${pageContext.request.contextPath}/resources/img/phone_icon.png" alt="전화"></span>042-350-6227</p>
                    <p><span class="icon_ob"><img src="${pageContext.request.contextPath}/resources/img/fax_icon.png" alt="팩스"></span>042-350-6224</p>
                    <p><span class="icon_ob"><img src="${pageContext.request.contextPath}/resources/img/mail_icon.png" alt="이메일"></span>giftedup@kaist.ac.kr</p>
                </div>
                <p>Copyright &copy; 2020 영재키움 프로젝트 All Rights Reserved</p>
            </div>
        </div>
        <div id="person_modal">
            <div class="person_modal_area">
                <div class="person_modal_con">
                    <div class="person_title">
                        <h2>영재키움 프로젝트 개인정보 수집동의서[일반용]</h2>
                    </div>
                    <div class="person_content">
                        ${session_infoAgreement}
                        <div class="person_data"><span>${model.DATENOW}</span></div>
                        <div class="person_user">
                            <p>정보 제공자 : <span>${ssion_user.NAME}</span></p>
                        </div>
                    </div>
                    <div class="person_check">
                        <form>
                            <div class="check_box check_01">
                                <input type="radio" name="INFO_AGREEMENT" id="PERSON_1" value="1">
                                <label for="PERSON_1">동의 합니다.</label>
                            </div>
                            <div class="check_box check_02">
                                <input type="radio" name="INFO_AGREEMENT" id="PERSON_2" value="0" onclick="btnAlert()">
                                <label for="PERSON_2">동의 하지 않습니다.</label>
                            </div>
                        </form>
                    </div>
                    <!--
                    <div class="print_btn">
                        <a href="#"> PDF 출력</a>
                    </div>
                    -->
                </div>
            </div>
        </div>
    </div>
</div>