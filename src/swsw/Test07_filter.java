package swsw;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;

@WebFilter("/aaa")
public class Test07_filter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain fChain)
            throws IOException, ServletException {

        System.out.println("before filter");

        response.setCharacterEncoding("UTF-8");
        // 자, 이제 응답의 인코딩은 UTF8이다
        response.setContentType("text/html; charset=UTF-8");
        // 브라우저. 너도 이걸 읽을때 html + UTF-8로 읽도록해

        fChain.doFilter(request, response);// request를 response로 내보낸다.

        System.out.println("after filter");

    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
    }

}

// <filter>
// <filter-name> Test07_filter </filter-name>
// <url-filter> swsw.Test07_filter </url-filter>
// </filter>

// <filter-mapping>
// <filter-name> Test07_filter </filter-name>
// <url-pattern> /* </url-pattern>
// </filter-mapping>