package swsw;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet("/hello6")
public class Test06_sign_in extends HttpServlet {

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setCharacterEncoding("UTF-8");
        // 나, servlet은 utf-8이다
        response.setContentType("text/html; charset=UTF-8");
        // 브라우저, 너는 나의 응답을 받아들인다, HTML + UTF-8로서
        PrintWriter out = response.getWriter();
        // out이라는 이름으로, 응답을 출력하는 writer 객체 이용하겠다

        String htmlString = "<!DOCTYPE html> <html>  <head>   <meta charset=\"UTF-8\" />   <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\">   <link rel=\"stylesheet\" href=\"sign_in.css\" />   <title>회원가입</title>  </head> <!--///-->  <body>   <!--내용-->   <div class=\"header\">     <a href=\"#\">회원가입</a>     <a href=\"#\">로그인</a>     <a href=\"#\">질문</a>   </div>   <!-- ----------------- -->   <div class=\"text_center\">     <div class=\"head_label\">       <h1>회원가입</h1>     </div>   </div>   <script type=\"text/javascript\" src=\"../0318/form01.js\"></script>    <form name=\"form11\" class=\"form\" action=\"aa.jsp\" method=\"POST\" onsubmit=\"return submit_check()\">     <div class=\"flex_out_box1\">       <!-- ----------------- -->       <div class=\"flex_box\">         <div class=\"label\">이름</div>         <div class=\"text_center\">           <input type=\"text\" name=\"hw_name\" placeholder=\"이 름\" />         </div>       </div>       <!-- ----------------- -->       <div class=\"flex_box\">         <a class=\"label\"><strong>이메일</strong></a>         <div class=\"text_center\">           <input type=\"email\" name=\"hw_email\" placeholder=\"예) kildong@gmail.com\" />         </div>         <div class=\"text_right\">           <input style=\"float: right;\" type=\"button\" name=\"hw_email_check\" value=\"중복확인\" />         </div>       </div>       <!-- ----------------- -->       <div class=\"flex_box\">         <div class=\"label\"><strong>비밀번호</strong></div>         <div class=\"text_center\">           <input type=\"password\" name=\"hw_pw\" value=\"\" placeholder=\"4 ~ 12자리\" />         </div>         <div class=\"label\">confirm 비밀번호</div>         <div class=\"text_center\">           <input type=\"password\" name=\"hw_pw_confirm\" value=\"\" placeholder=\"4 ~ 12자리\" />         </div>       </div>       <!-- ----------------- -->       <div class=\"flex_box\">         <a class=\"label\"><strong>주소</strong></a>          <div class=\"text_left\">           <a class=\"label\">우편번호</a>           <input type=\"num\" name=\"hw_post_1\" value=\"\" style=\"width: 3em;\" />           <input type=\"num\" name=\"hw_post_2\" value=\"\" style=\"width: 3em;\" />           <input style=\"float: right;\" type=\"button\" name=\"hw_post_search\" value=\"우편번호\" />         </div>         <div class=\"text_center\">           <input type=\"text\" name=\"hw_post_num\" value=\"\" />         </div>         <div class=\"text_center\">           <input type=\"text\" name=\"hw_address\" value=\"\" />         </div>       </div>       <!-- ----------------- -->       <div class=\"flex_box\">         <a class=\"label\"><strong>전화번호</strong></a>          <div class=\"text_center\">           <select class=\"select_num\" name=\"hw_tel_1\">             <option value=\"0\">010</option>             <option value=\"1\">011</option>             <option value=\"2\">016</option>             <option value=\"3\">017</option>             <option value=\"4\">019</option>           </select>           <input type=\"num\" name=\"hw_tel_2\" value=\"\" style=\"width: 60px;\" />           <input type=\"num\" name=\"hw_tel_3\" value=\"\" style=\"width: 60px;\" />           <input style=\"float: right;\" type=\"button\" name=\"hw_tel_check\" value=\"인증번호 전송\" />         </div>         <div class=\"text_left\">           <a class=\"label\">인증번호</a>           <input type=\"num\" name=\"hw_tel_check_num\" value=\"\" style=\"width: 8em;\" />         </div>        </div>       <!-- ----------------- -->     </div>     <!-- ----------------- -->     <div class=\"flex_out_box1\">       <div class=\"bar\"></div>       <div class=\"flex_box\">         <div class=\"text_center\">           <input type=\"submit\" name=\"hw_join\" value=\"JOIN\" style=\"width: 100px;\" />           <input type=\"button\" name=\"hw_LogIn\" value=\"Log In\" style=\"width: 100px;\" />         </div>       </div>     </div>     <!-- ----------------- -->   </form>   <!-- ----------------- --> </body>  </html> <!--///-->";

        out.println(htmlString);
    }

}