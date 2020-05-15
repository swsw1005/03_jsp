package boardre;

import lombok.*;

@Getter
@Setter
@ToString
public class BoardDTO {
    private int num; // 글 번호 primary key
    private String name;// 작성자
    private String email;// 이메일
    private String subject; // 제목
    private String content; // 내용
    private int pos; // 글 순서
    private int depth; // 글 깊이
    private String regDate; // 작성일
    private String pass; // 암호
    private int count; // 조회수
    private String ip; // ip
}