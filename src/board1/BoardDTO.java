package board1;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDTO {

    private int num;
    private String name;
    private String title;
    private String content;
    private Date regdate;
    private int readcount;
}