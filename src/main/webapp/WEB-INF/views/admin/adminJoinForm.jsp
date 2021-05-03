<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin_regist</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- lyj_style -->
    <link rel="stylesheet" type="text/css" href="/resources/css/lyj_css.css">
</head>
<body>
    <div id="body_content">
        <div class="flex_box">
            <h2>중간관리자관리</h2>
            <span>등록</span>
        </div>
        <form action="/admin/joinAdmin" method="POST" onsubmit="return check()">
            <table id="admin_table">
                <tr>
                    <th>ID</th>
                    <td>
                        <input type="text" id="admin_id" placeholder="아이디"
                            name="admin_id"/>
                    </td>
                </tr>
                <tr>
                    <th>PW</th>
                    <td>
                        <input type="password" id="admin_pw" placeholder="비밀번호"
                            name="admin_pw"/>
                    </td>
                </tr>
                <tr>
                    <th colspan="2" id="btn_area">
                        <button class="btn">등록</button>
                    </th>
                </tr>
                <tr>
                    <td colspan="2" id="notice_area">
                        <b>※ Notice ※</b><br/>
                        <p>아이디에는 공백 없이 'admin'이 포함되어 있어야 합니다.</p>
                        <p>비밀번호는 공백 없이 5 자 이상, 영문, 숫자, 특수문자 @$!%*_#?& 만 허용됩니다.</p>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
<script>
    /*form submit 제어*/
    function check(){ //입력란 검사
        var Id = $('#admin_id');
        var Pw = $('#admin_pw');

        if(Id.val().trim()==""){//아이디입력여부
            alert("아이디을 입력하세요!");
            Id.focus();
            return false;
        } else if(Id.val().indexOf('admin')==-1){//아이디 admin 포함 여부
            alert("아이디에 admin을 포함해주세요!");
            Id.focus();
            return false;
        } else if(Id.val().length <= 5){//아이디 6자 이상
            alert("아이디를 6 자 이상 입력해주세요!");
            Id.focus();
            return false;
        } else if(Pw.val().trim()==""){ //비밀번호입력여부
            alert("비밀번호를 입력하세요!");
            Pw.focus();
            return false;
        }
        return true;
    }
    /*글자수제한*/
    $('#admin_id').on('keyup', function() {//아이디
        checkLength($(this), 50);
    });
    $('#admin_pw').on('keyup', function() {//비밀번호
        checkLength($(this), 200);
    });
    function checkLength(obj,len){
        if(obj.val().length > len){
            obj.val(obj.val().substring(0, len));
            alert(len+" 자 이상 입력불가");
        }
    }
    /*아이디 공백 불가*/
    $('#admin_id').on('keyup',function(){
        var checkId = /\s/; //공백체크
        var id = $(this);
        if(checkId.exec(id.val())){
            alert("아이디에는 공백을 사용할 수 없습니다.");
            id.focus();
            id.val(id.val().replace(' ',''));//공백제거
            return false;
        }
    });
    /*비밀번호 유효성 체크*/
    $("#admin_pw").on('change',function(){
        chkPw($(this).val());
    });
    function chkPw(Pw){
        var checkPass = /^[A-Za-z\d$@$!%*_#?&]{5,}$/;
        if(!checkPass.test(Pw)){
            alert('비밀번호는 공백없이 5자이상, 영문,숫자,특수문자@$!%*_#?&만 허용됩니다.');
            $('#admin_pw').val('').focus();
            return false;
        }
        return true;
    }
    /*msg*/
    var msg = '${msg}';
    if(msg!=""){
    	alert(msg);
    	msg="";
    }
</script>