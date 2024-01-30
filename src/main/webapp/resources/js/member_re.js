function MemberReCheckForm(){
    	
    	Swal.fire({
  		  title: '지원서 확인',
  		  html: `
  			<div class="swal2-html-container" id="swal2-html-container" style="display: block;">유형1,3경우 멘토 이름,생년월일</div>
  			<div class="swal2-html-container" id="swal2-html-container" style="display: block;">유형2경우 학생 이름,생년월일</div>
  		  	<label class="swal2-input-label">유형</label>
  		  	<select class="swal2-select TYPE" id="TYPE" style="height:50px;"><option value="">유형을 선택해주세요.</option><option value="1">1</option><option value="2">2</option><option value="3">3</option></select>
  		  <label class="swal2-input-label">이름</label>
  		  	<input type="text" id="NAME" name="NAME" class="swal2-input NAME" placeholder="이름을 입력하여주세요">
  		  <label class="swal2-input-label">생년월일</label>
  			<input type="date" id="BIRTH" name="BIRTH" class="swal2-input BIRTH swal2-date" placeholder="생년월일을 입력하여주세요." required>`,
  		  confirmButtonText: '확인',
  		  focusConfirm: false,
  		  preConfirm: () => {
  			const TYPE = Swal.getPopup().querySelector('#TYPE').value
  		    const NAME = Swal.getPopup().querySelector('#NAME').value
  		    const BIRTH = Swal.getPopup().querySelector('#BIRTH').value
  		    if (!NAME || !BIRTH || !TYPE || TYPE == '' || NAME == '' || BIRTH == '') {
  		      Swal.showValidationMessage(`유형 또는 이름 혹은 생년월일을 입력하여주세요.`)
  		    }
  		    return { NAME: NAME, BIRTH: BIRTH , TYPE: TYPE}
  		  },
  		}).then((result) => {
  			console.log('go');
  		    var BIRTH = Swal.getPopup().querySelector('#BIRTH').value;
  		    var NAME = Swal.getPopup().querySelector('#NAME').value;
  		    var TYPE = Swal.getPopup().querySelector('#TYPE').value;
  			console.log(BIRTH.value);
              console.log(NAME.value);
              console.log(TYPE.value);
              BIRTH = BIRTH.toString();
              console.log(BIRTH.value);
			BIRTH = BIRTH.replace(/-/gi,'.');
			if(NAME.value != '' && BIRTH.value != '' && TYPE.value != ''){
				location.href='/user/member_re/view.do?NAME='+NAME+'&BIRTH='+BIRTH+'&TYPE='+TYPE+'';	
			}
  			
  			
  		})
    		
    	
    }
    
    
    function MemberRePassCheck(){
    	Swal.fire({
    		  title: '지원서 확인',
    		  html: `
    		  <label class="swal2-input-label">이름</label>
    		  	<input type="text" id="NAME" name="NAME" class="swal2-input NAME" placeholder="이름을 입력하여주세요">
    		  <label class="swal2-input-label">생년월일</label>
    			<input type="date" id="BIRTH" name="BIRTH" class="swal2-input BIRTH swal2-date" placeholder="생년월일을 입력하여주세요." required>`,
    		  confirmButtonText: '확인',
    		  focusConfirm: false,
    		  preConfirm: () => {
    		    const NAME = Swal.getPopup().querySelector('#NAME').value
    		    const BIRTH = Swal.getPopup().querySelector('#BIRTH').value
    		    if (!NAME || !BIRTH || NAME == '' || BIRTH == '') {
    		      Swal.showValidationMessage(`이름 혹은 생년월일을 입력하여주세요.`)
    		    }
    		    return { NAME: NAME, BIRTH: BIRTH}
    		  },
    		}).then((result) => {
    			
              console.log('go');
    		    var BIRTH = Swal.getPopup().querySelector('#BIRTH').value;
    		    var NAME = Swal.getPopup().querySelector('#NAME').value;
    			
              if(BIRTH != '' || NAME != '' ){
                   console.log(BIRTH);
                    console.log(NAME);
                    BIRTH = BIRTH.toString();
                    console.log(BIRTH);
                  BIRTH = BIRTH.replace(/-/gi,'.');
                  if(NAME.value != '' && BIRTH.value != ''){
                      $.ajax({
  		type : 'POST',
                            url : '/user/member_re/pass_view.do',
  		 cache : false,
                            data : ({
                                NAME : NAME,
                                BIRTH : BIRTH
                            }),
			  				dataType : 'json',
			                            success : function(xhr , status , result){
			                              console.log(result.responseJSON);
			                                if(result.responseJSON != 'FALSE'){
			                                  Swal.fire('합격 입니다.\n 아이디 발급은 다음주 월요일날 진행될 예정입니다.');
			                                    
			                                }else if(result.responseJSON == 'FALSE'){
			                                    Swal.fire('불합격입니다.')
			                                }
			                            },
			                            error : function(xhr , status , error){
			                              console.log('error')
			                            }
			                        })
			                  }   
			              }else{
			                  location.reload();
			              }
			    })
    }