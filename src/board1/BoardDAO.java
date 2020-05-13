package board1;

import java.sql.*;
import java.util.*;

import dbinfo.DBInfo;
import lombok.Getter;

@Getter
public class BoardDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;

	public BoardDAO() {
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

	public void insertDB(BoardDTO dto) {

		try {
			con = getCon();// DB연결
			String sql = "insert into board1(name,title,content,regdate) values(?,?,?,NOW())";

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

	public Vector<BoardDTO> getList() {

		Vector<BoardDTO> temp_vec = new Vector<>();
		String sql = "select * from board1";

		try {

			con = getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs != null) {
				while (rs.next()) {

					BoardDTO dto = new BoardDTO();
					dto.setNum(rs.getInt("num"));
					dto.setTitle(rs.getString("title"));
					dto.setName(rs.getString("name"));
					dto.setContent(rs.getString("content"));
					dto.setRegdate(rs.getDate("regdate"));
					dto.setReadcount(rs.getInt("readcount"));
					temp_vec.add(dto);

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
		System.out.println(temp_vec.size());
		return temp_vec;
	} // getList() end

	// ------------------------------------
	public int count_(int no) {
		String sql = "update board1 set readcount = (readcount+1) where num = " + no;

		int temp = 0;
		try {
			con = getCon();
			stmt = con.createStatement();
			temp = stmt.executeUpdate(sql);

		} catch (Exception e) {
			System.out.println("ERROR");
			temp = 0;
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
		return temp;
	} // count_(int no) end

	// ------------------------------------
	// 글 조회수 증가
	public void setHit(int num) {

		try {
			con = getCon(); // DB연결
			stmt = con.createStatement(); // Statement 생성
			String sql = "update board1 set readcount=readcount+1 where num=" + num;
			stmt.executeUpdate(sql);
		} catch (Exception ex1) {
			System.out.println("setHit() 예외발생 : " + ex1);
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception ex2) {
			}
		}
	}// setHit() end

	// ------------------------------------

	public BoardDTO getContent(int no) {
		BoardDTO dto = new BoardDTO();

		String sql = "select * from board1 where num = " + no;

		try {
			con = getCon();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs != null) {
				while (rs.next()) {
					dto.setNum(rs.getInt("num"));
					dto.setTitle(rs.getString("title"));
					dto.setName(rs.getString("name"));
					dto.setContent(rs.getString("content"));
					dto.setRegdate(rs.getDate("regdate"));
					dto.setReadcount(rs.getInt("readcount"));
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
	} // getContent(int no) end

	// ------------------------------------
	public void updateDB(BoardDTO dto) {

		try {
			con = getCon();// DB연결
			String sql = "update  board1 set title= ?, content= ? where num= ?";

			pstmt = con.prepareStatement(sql); // 생성시 인자가 들어간다

			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());

			pstmt.executeUpdate(); // 쿼리 실행 -> 데이터가 DB에 저장된다.

		} catch (SQLException ex3) {
			System.out.println("updateDB() 예외: " + ex3);
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
	} // updateDB() end

	// ------------------------------------
	public void deleteDB(int num) {

		try {
			con = getCon();// DB연결
			String sql = "delete from board1 where num= ?";

			pstmt = con.prepareStatement(sql); // 생성시 인자가 들어간다

			pstmt.setInt(1, num);

			pstmt.executeUpdate(); // 쿼리 실행 -> 데이터가 DB에 저장된다.

		} catch (SQLException ex3) {
			System.out.println("updateDB() 예외: " + ex3);
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
	} // updateDB() end

	// ------------------------------------

	public static void main(String[] args) {
	}

}