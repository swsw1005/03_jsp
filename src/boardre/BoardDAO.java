package boardre;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class BoardDAO {

	// DB 전역 변수
	Connection con = null;
	// Statement stmt = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;

	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static boolean checkDriver = false;
	// true : 드라이버 있다 false 드라이버 없다.
	private static final String URL = "jdbc:mysql://localhost:3306/mydb11";
	private static final String ID = "root";
	private static final String PW = "12345";

	// ----------------------// ----------------------

	// pos증가
	public void upPos() {
		try {
			con = getConnection();
			stmt = con.createStatement();// Statement 생성
			String sql = "update board set pos = pos+1";// 글쓰기,답글쓰기
			stmt.executeUpdate(sql);// Statement는 실행시 인자 들어간다

		} catch (Exception ex) {
			System.out.println("upPos() 예외 :" + ex);
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception ex) {
			}
		} // finally end
	}// pos증가

	// ----------------------// ----------------------

	public void upCount(int num) {
		Connection con = null;
		try {
			con = getConnection();
			String sql = "update board set count=count+1 where num=" + num;
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();

		} catch (Exception ex1) {
			System.out.println("upCount :" + ex1);
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception ex2) {
			}
		} // finally end
	}// upCount() end

	// ----------------------// ----------------------

	public void insertBoard(BoardDTO dto) {
		// sub 수정 위한 void method (ex) 조회수 증가

		System.out.println(dto.toString());
		System.out.println(dto.getName());

		// 전체 pos +1
		upPos();
		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "insert into board(name,email,subject,content,pos,depth,regdate,pass,ip)";
			sql += " values( ? , ? , ? , ? ,  ? , ? , NOW() , ? , ? )";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getPos());
			pstmt.setInt(6, dto.getDepth());
			// 날짜
			pstmt.setString(7, dto.getPass());
			pstmt.setString(8, dto.getIp());
			// 5. 실행
			pstmt.executeUpdate();
			// 6. 표시 > list에 담기
		} catch (Exception e1) {
			e1.getStackTrace();
		} finally {
			try {
				close(con, pstmt, rs);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	// ---------------------- // ----------------------

	public Vector<BoardDTO> getBoardList(String keyField, String keyWord) {
		Vector<BoardDTO> vec = new Vector<>();
		String sql = "";

		try {
			con = getConnection();
			stmt = con.createStatement();// Statement는생성

			if (keyWord.equals(null) || keyWord.equals("")
					|| keyWord.length() < 1) {
				// 전체글
				sql = "select * from board order by pos asc";
			} else {
				// 검색글
				sql = "select * from board where " + keyField + " like '%"
						+ keyWord + "%'";
				sql += " order by pos asc";
			} // else

			rs = stmt.executeQuery(sql);// 쿼리 수행

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();

				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setSubject(rs.getString("subject"));

				dto.setPos(rs.getInt("pos"));
				dto.setDepth(rs.getInt("depth"));

				dto.setRegDate(rs.getString("regdate"));// / *****
				dto.setPass(rs.getString("pass"));

				dto.setCount(rs.getInt("count"));
				dto.setIp(rs.getString("ip"));

				vec.add(dto);
			} // while end

		} catch (Exception ex1) {
			System.out.println("getBoardList() 예외 :" + ex1);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception ex2) {
			}
		} // finally end

		return vec;
	}// 리스트, 검색 리스트

	// ---------------------- // ----------------------

	public BoardDTO getDto(int no) throws Exception {
		// 출력객체
		BoardDTO dto = new BoardDTO();

		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "select * from board where num = " + no;
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시 > list에 담기
			if (rs != null) {
				while (rs.next()) {
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setName(rs.getString("name"));
					dto.setRegDate(rs.getDate("regdate") + "");
					dto.setCount(rs.getInt("count"));
				}
			}
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception("  ");
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception ex2) {
				ex2.getStackTrace();
			}
		}
		return dto;
	} // getDto() end------------

	// ---------------------- // ----------------------

	public void update(BoardDTO dto) throws Exception {
		// sub 수정 위한 void method (ex) 조회수 증가

		try {
			// 1+2
			con = getConnection();
			// 3. sql
			String sql = "update board set subject = ? , content = ? , name = ? where num = ?";
			// 4. 실행객체
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getName());
			pstmt.setInt(4, dto.getNum());
			// 5. 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.getStackTrace();
			throw new Exception("  ");
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (Exception ex2) {
				ex2.getStackTrace();
			}
		}
	} // update() end------------

	// ---------------------- // ---------------------- //
	// ----------------------
	// 기본 생성자 + 드라이버 확인
	public BoardDAO() {
		try {
			// / 1. 드라이버 확인
			Class.forName(DRIVER);
			checkDriver = true;
			System.out.println(" BoardDAO 드라이버 로딩 ok");
		} catch (Exception e) {
			e.getStackTrace();
			checkDriver = false;
			System.out.println("!!! BoardDAO 드라이버 로딩 fail");
		}
	} // BoardDAO 기본 생성자 + connection end

	// getConnection
	static Connection getConnection() throws Exception {
		if (!checkDriver) {
			throw new Exception("드라이버 없음");
		}
		// / 2. 연결
		return DriverManager.getConnection(URL, ID, PW);
	} // getConnection() end .............................

	// close 1
	static final void close(Connection con, PreparedStatement pstmt,
			ResultSet rs) throws Exception {
		close(con, pstmt);
		if (rs != null) {
			rs.close();
		}
	} // close () end

	// close 2
	static final void close(Connection con, PreparedStatement pstmt)
			throws Exception {
		if (con != null) {
			con.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
	} // close () end

	// -----------------------------------------------
	void generateDB(int no) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss:SSS");

		List<String> title_list = new ArrayList<>();
		title_list.add("좋은 아침입니다.");
		title_list.add("나마스떼.");
		title_list.add("스미마셍");
		title_list.add("헬로 월드");
		title_list.add("카페인 중독");
		title_list.add("커피를 마신다");
		title_list.add("코인빨래방");

		List<String> name_list = new ArrayList<>();
		name_list.add("임성우");
		name_list.add("이세진");
		name_list.add("김석근");
		name_list.add("박범수");
		name_list.add("최원용");
		name_list.add("김인규");
		name_list.add("여현욱");

		List<String> content_list = new ArrayList<>();
		content_list.add("김치볶음밥");
		content_list.add("라볶이");
		content_list.add("우동");
		content_list.add("치즈 나초");
		content_list.add("타코");
		content_list.add("콜라");

		Random rand = new Random();

		for (int i = 0; i < no; i++) {
			BoardDTO dto = new BoardDTO();
			Date date = Calendar.getInstance().getTime();
			String dateString = sdf.format(date);

			int a1 = rand.nextInt(title_list.size());
			int a2 = rand.nextInt(name_list.size());
			int b1 = rand.nextInt(content_list.size());
			int b2 = rand.nextInt(content_list.size());
			int b3 = rand.nextInt(content_list.size());

			int ip_1 = rand.nextInt(191) + 1;
			int ip_2 = rand.nextInt(191) + 1;
			int ip_3 = rand.nextInt(191) + 1;
			int ip_4 = rand.nextInt(191) + 1;

			dto.setSubject("제목 : " + i + " -- " + title_list.get(a1));
			dto.setEmail(title_list.get(a1) + "@naver.com");
			dto.setContent(dateString + "내용  <br>" + content_list.get(b1)
					+ "<br>" + content_list.get(b2) + "<br>"
					+ content_list.get(b3) + "<br>");
			dto.setIp(ip_1 + "." + ip_2 + "." + ip_3 + "." + ip_4);
			dto.setName(name_list.get(a2) + i);
			dto.setPass("123");

			insertBoard(dto);
		} // for end()=---------------

	}

	// -----------------------------------------------

	public static void main(String[] args) {
		new BoardDAO().generateDB(300);
	}

}
