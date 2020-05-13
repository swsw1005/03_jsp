package board2;

import java.sql.*;
import java.util.*;

import dbinfo.DBInfo;

public class Board2DAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;

	public Board2DAO() {
		try {
			Class.forName(DBInfo.DRIVER);
			System.out.println("드라이버 로딩 성공");
		} catch (Exception e) {
			System.out.println("!!드라이버 로딩 실패");
			e.getStackTrace();
		}
	} // cons end

	public Connection getCon() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(DBInfo.URL, DBInfo.USER, DBInfo.PWD);
			System.out.println("DB conn YES");
		} catch (Exception e) {
			System.out.println("DB conn NO NO");
			e.getStackTrace();
		}
		return con;
	} // getCon() end

	// ------------------------------------
	public Board2DTO selectDTO(int num) {

		Board2DTO dto = new Board2DTO();

		String sql = "select * from board2 where num = " + num;

		try {
			con = getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs != null) {
				while (rs.next()) {
					dto.setNum(rs.getInt("num"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setName(rs.getString("name"));
				} // while end
			} // if end
		} catch (Exception e) {
			System.out.println("ERROR");
			e.getStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				con.close();
			} catch (Exception e) {
				System.out.println("close ERROR");
				e.getStackTrace();
			}
		}
		return dto;
	} // selectDTO() end

	// ------------------------------------

	public Vector<Board2DTO> selectList() {

		Vector<Board2DTO> list = new Vector<>();

		String sql = "select * from board2 order by num desc";

		try {
			con = getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs != null) {
				while (rs.next()) {
					Board2DTO temp_dto = new Board2DTO();
					temp_dto.setNum(rs.getInt("num"));
					temp_dto.setName(rs.getString("name"));
					temp_dto.setTitle(rs.getString("title"));
					temp_dto.setContent(rs.getString("content"));
					list.add(temp_dto);
				} // while end
			} // if end
		} catch (Exception e) {
			System.out.println("ERROR");
			e.getStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				con.close();
			} catch (Exception e) {
				System.out.println("close ERROR");
				e.getStackTrace();
			}
		}
		return list;
	} // selectDTO() end

	// ------------------------------------

	public void insert(Board2DTO dto) {

		try {
			con = getCon();// DB연결
			String sql = "insert into board2(name, title, content) values(?,?,?)";

			pstmt = con.prepareStatement(sql); // 생성시 인자가 들어간다

			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());

			pstmt.executeUpdate(); // 쿼리 실행 -> 데이터가 DB에 저장된다.

		} catch (SQLException ex3) {
			System.out.println("insertDB() 예외: " + ex3);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception ex7) {

			}
		}
	} // insertDB() end

	// ------------------------------------

}