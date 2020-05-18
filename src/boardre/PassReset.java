package boardre;

public class PassReset {
    public static void main(String[] args) {

        BoardDAO dao = new BoardDAO();

        dao.resetPass(123);

        BoardDTO dto = new BoardDTO();

        dto.setNum(1);

    }
}