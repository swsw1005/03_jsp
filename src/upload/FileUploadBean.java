package upload;

import java.io.*;
import javax.servlet.http.*;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

public class FileUploadBean {

    public String upload(HttpServletRequest request) {
        String reply = "";

        try {
            String path = "C:/DOWNLOAD/";
            int size = 1024 * 1024 * 20; // 20MB크기 제한
            MultipartRequest mm = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
        } catch (Exception e) {
            reply = "업로드 실패";
        }
        return reply;
    }

}