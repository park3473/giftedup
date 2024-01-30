 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/head.jsp" %> 
</head>

    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ztree/css/metroStyle/metroStyle.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/ztree/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/ztree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/ztree/js/jquery.ztree.excheck.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/ztree/js/jquery.ztree.exedit.js"></script>
    <SCRIPT type="text/javascript">
       
        var setting = {
            view: {
                addHoverDom: addHoverDom,
                removeHoverDom: removeHoverDom,
                selectedMulti: false
            },
            check: {
                enable: false
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            edit: {
                enable: true,
                showRemoveBtn: false
            },
            callback: {
                onRename: onRename,
	           },
        };

        var zNodes = ${model.ZTREE.json};

        $(document).ready(function(){
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        });

        function onRename(e, treeId, treeNode, isCancel) {
        	console.log("onRename treeNode.pId : null " + treeNode.pId + " type : " + treeNode.type);
        	
        	if(treeNode.pId == null)
	         {
	               updateAccessClicked(treeNode.IDX, treeNode.name, treeNode.type);
	         }else
	         {
	                
	               updateAccessClicked(treeNode.IDX, treeNode.name, treeNode.type);
	         }
        }
        
        var newCount = 1;
        function addHoverDom(treeId, treeNode) {
        	//console.log(treeNode);
        	var sObj = $("#" + treeNode.tId + "_span");
        	if(treeNode.add == '5')
        	{
        		
                if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
                var addStr = "<span class='button add' id='addBtn_" + treeNode.tId  + "' title='add node' onfocus='this.blur();'></span>";
                sObj.after(addStr);
                
                var btn = $("#addBtn_"+treeNode.tId);
                if (btn) btn.bind("click", function(){
                    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                    
                    insertAccessClicked(treeNode.id, treeNode.type);
                    
                    
                    //zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
                    return false;
                });	
        	}
        	if(treeNode.del == '1')
        	{
        		  if (treeNode.editNameFlag || $("#removeBtn_"+treeNode.tId).length>0) return;
            	  var deleteStr = "<span class='button remove' id='removeBtn_" + treeNode.tId + "' title='remove node' onfocus='this.blur();'></span>";
                  sObj.after(deleteStr);
                  
                  
            	 var btn = $("#removeBtn_"+treeNode.tId);
                 if (btn) btn.bind("click", function(){
                 	console.log('delete :' + treeNode.id);
                 	
                 	//deleteAccessClicked(treeNode.id);
                 	
    				var formData = "IDX=" + treeNode.IDX;
    				formData = formData +  "&csrf=${CSRF_TOKEN}";
    				formData = formData +  "&TYPE="+treeNode.type;
    				//console.log("onRename treeNode.pId : null " + treeNode.pId + " type : " + treeNode.type);
    				var URL = "./ajaxdelete.do";
    				submit(URL, formData);
                    return false;
                 });
        	}
        };
        
        function removeHoverDom(treeId, treeNode) {
        	$("#addBtn_"+treeNode.tId).unbind().remove();
        	$("#removeBtn_"+treeNode.tId).unbind().remove();
        };
       
    </SCRIPT>
<body>
    <!--헤더-->
	<%@ include file="../include/header.jsp" %>
    <!--헤더 end-->

    <!--본문-->
    <section id="adm_sc">
        <div id="adm_sc_area">
            <div id="adm_sc_con">
                <div class="adm_sc_size">
                    <!--본문 내용-->
                    <section class="adm_sc_txt">
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                
	           					<span>
	                                <c:if test="${model.CODE != 'survey'}">전수 조사 관리</c:if>
	                                <c:if test="${model.CODE == 'survey'}">설문 조사 관리</c:if>
                                </span>
                            </div>
                            
                            <form action="./insert.do?" method="post" name="updateform" id="updateform">
                            <div class="page_seach">
						                                <div class="adm_btn_wrap stats_btn_area">
						                                    <ul>
						                                      <li class="delete" id="saveBtn">
						                                        <a href="javascript:insertAccess()">저장</a>
						                                      </li>
						                                      <li class="delete">
						                                        <a href="javascript:questionAdd()">추가</a>
						                                      </li>
						                                      <li class="delete">
						                                        <a href="../list.do">목록</a>
						                                      </li>
						                                </ul>
						                                </div>
						                            </div>
                            <div class="table_wrap">
								<table >
									
									<tbody>
										<tr>
											<td style="width:50%">
											
											 <ul id="treeDemo" class="ztree"></ul>
											</td>
											<td>
													<div class="table_wrap">
														<table >
															<tbody id="questionList">
										                    </tbody>
						                                </table>
						                            </div>
						                             <!--관리자 버튼-->
						                            									
											</td>
										</tr>
				                    </tbody>
                                </table>
                            </div>
                            </form>
                            
                        </div>
                    </section>
                    <!--본문 내용 end-->
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

    <!--푸터-->
    <footer>
	<%@ include file="../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->


    <!--  JQuery  -->
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/starts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin/admin.js"></script>

</body></html>



<script>

function deleteAccessClicked(idx)
{

	console.log(idx);
	var formData = "IDX=" + idx;
	formData = formData +  "&csrf=${CSRF_TOKEN}";
	
	var URL = "./delete.do";
	submit(URL, formData);
	return false;
}
function insertAccessClicked(idx, type)
{
	
	
	var formData = "PARENT_IDX=" + idx;
	formData = formData +  "&NAME=newNode";
	formData = formData +  "&csrf=${CSRF_TOKEN}";
	
	if(type == 1)
	{
		//select 추가
	}
	if(type == 3)
	{
		//Question 추가	
	}
	var URL = './'+type+'/insert.do';

	submit(URL, formData);	
		
}

function submit(URL, formData)
{
	console.log(URL);
	console.log(formData);
	$.ajax({
		type : "POST",
		url : URL,
		cache : false,
		data : formData,
		success: function(result)
		{
			if(result.indexOf("true") > -1)
			{
				alert('성공');
				window.location.reload(); 
			}else
			{
				alert('실패');
			}
		}
	});
}

function updateAccessClicked(idx, NAME, TYPE)
{

	var URL = './ajaxupdate.do?';

	console.log(idx);
	var formData = "IDX=" + idx;
	formData = formData +  "&NAME=" + encodeURIComponent(NAME);
	formData = formData +  "&csrf=${CSRF_TOKEN}";
	formData = formData +  "&TYPE=" + TYPE;
	submit(URL, formData);
	
}

function insertAccess()
{
	$('#updateform').submit();
}
function selectboxChanged(jqueryId)
{
	$('#'+jqueryId).html("")
}
function question_selectDelete(jqueryId)
{
	$('#'+jqueryId).remove();
}

var selection_cnt = 0;
function question_selectAdd(jqueryId, cnt)
{
	if($('#'+jqueryId+"_type").val() == "")
	{
		alert('선택지를 선택 하여 주세요.');
		return;
	}
	if($('#'+jqueryId+"_type").val() == "TEXT")
	{
		alert('TEXT 는 추가 할 수 없습니다.');
		return;
	}
	
	var html = "<li ID='question1_select"+selection_cnt+"'><input class='input_size' type='text' NAME=\"list["+cnt+"].QUESTION_SELECT\"><a href='javascript:question_selectDelete(\"question1_select"+selection_cnt+"\")' >삭제</a></li>"
	selection_cnt = selection_cnt + 1;
	$('#'+jqueryId).append(html);
}
var question_cnt = 0;
function questionAdd()
{
	$('#saveBtn').show();
	
var html = "<tr>";
	html +=" <table>";
	html +="	<tr>";
	html +="		<td>";
	html +="    		<input class='question_txt' type='text' ID='question"+question_cnt+"' NAME='list["+question_cnt+"].QUESTION'>";
	html +="    	    <select ID=\"question_select_list"+question_cnt+"_type\" NAME=\"list["+question_cnt+"].TYPE\""; 
	html +="        	    onchange=\"selectboxChanged('question_select_list"+question_cnt+"')\">";
	html +="					   <option value=\"\">선택하세요</option>";
	html +="					   <option value=\"TEXT\">TEXT</option>";
	html +="                       <option value=\"RADIO\">RADIO</option>";
	html +="                       <option value=\"CHECKBOX\">CHECKBOX</option>";
	html +="                </select>";
	html +="                <a href=\"javascript:question_selectAdd('question_select_list"+question_cnt+"','"+question_cnt+"')\" >추가</a>";	
	html +="        </td>";
	html +="	</tr>";
	html +="	<tr>";
	html +="    		<td class='question_sele' id=\"question_select_list"+question_cnt+"\">";
	html +="            </td>";
	html +="	</tr>";
	html +="	</table>";
	html +="</tr>";
	
	//$('#questionListTr').append(html);
	$(html).appendTo("#questionList");
	question_cnt = question_cnt + 1;

}
//questionAdd();
</script>