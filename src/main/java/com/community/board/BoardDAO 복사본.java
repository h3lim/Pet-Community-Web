//package com.community.board;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.time.LocalDateTime;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.naming.InitialContext;
//import javax.naming.NamingException;
//import javax.sql.DataSource;
//
//import com.community.common.PageVO;
//import com.community.users.UserVO;
//
//public class BoardDAO implements IBoardDAO {
//
//	private DataSource ds;
//
//	private BoardDAO() {
//		try {
//			InitialContext ct = new InitialContext();
//			ds = (DataSource) ct.lookup("java:comp/env/jdbc/myOracle"); 
//																		
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//	}
//	
//	private static BoardDAO dao = new BoardDAO();
//
//	public static BoardDAO getInstance() {  //외부에서 요구할 떄, 객체 생성 없이 사용할 수 있게 주는 방법 
//		if (dao == null) {
//			dao = new BoardDAO();
//		}
//		return dao;
//	}
//	
//	
//	
//
//	
//	
//	
//	@Override
//	public void regist(String writer, String title, String content) {
//		String sql = "INSERT INTO my_board (board_id, writer, title, content) VALUES(board_seq.NEXTVAL, ?, ?, ?)";
//		try (Connection conn = ds.getConnection(); 
//				PreparedStatement pstmt = conn.prepareStatement(sql)) {
//			pstmt.setString(1, writer);
//			pstmt.setString(2, title);
//			pstmt.setString(3, content);
//			pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	
//	
//	@Override
//	public List<BoardVO> listBoard(PageVO paging) { //!!!!!!!!원래는 ()로, 비어 있었는데, 이제 listboard pageVO를 매개값으로 받겠다는 것이다. 오버라이딩 메서드에 틀을 마음대로 바꾸면 안되니, 인터페이스에 추상메서드 선언도 바꿔주자
//		
//		List<BoardVO> articles = new ArrayList<>(); //포장해서 List에 차곡차곡포장~
//		String sql = "SELECT * FROM"
//				+ "      ("
//				+ "      SELECT ROWNUM AS rn, tbl.* FROM"
//				+ "         ("
//				+ "          SELECT * FROM my_board"
//				+ "          ORDER BY board_id DESC"
//				+ "         ) tbl"
//				+ "      )"
//				+ "WHERE rn > " + (paging.getPage()-1) * paging.getCpp()
//				+ " AND rn <= " + paging.getPage() * paging.getCpp();
//		
//		
//		
//		//String sql = "SELECT * FROM my_board ORDER BY board_id DESC"; //물음표채울거없고 List로 리턴하는 거니까 List를 하나 선언하자(한줄위에서)      >   그러나 페이징 처리를 위해 이거 주석하고 위에서 SQL문 다시 적어주자
//
//		
//		
//		try(Connection conn = ds.getConnection();  //물음표 채울꺼없으니 ResultSet까지 한번에 뽑자
//				PreparedStatement pstmt = conn.prepareStatement(sql);
//				ResultSet rs = pstmt.executeQuery()){ //sql 결과를 rs가 갖고있겠지. 조회 결과는 전체글목록(여러개니까) 한행씩 가져오는 것을 해야하니 반복문열자
//			while(rs.next()) { //rs.next를 부르면 조회할 데이터가있으면 트루, 없으면 폴스를 주지?
//				BoardVO vo = new BoardVO(
//						rs.getInt("board_id"),
//						rs.getString("writer"),
//						rs.getString("title"),
//						rs.getString("content"),
//						rs.getTimestamp("reg_date").toLocalDateTime(),
//						rs.getInt("hit")
//						);
//				articles.add(vo);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return articles;
//	}
//
//	
//	@Override
//	public BoardVO contentBoard(int bId) {
//		BoardVO vo = null;
//		String sql = "SELECT * FROM my_board WHERE board_id=" + bId; //이러면 물음표 안채워도가능하겠지. + bId까지붙여주면.
//		try(Connection conn = ds.getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql);
//				ResultSet rs = pstmt.executeQuery()){
//			if(rs.next()) { 
//				vo = new BoardVO(
//						rs.getInt("board_id"),
//						rs.getString("writer"),
//						rs.getString("title"),
//						rs.getString("content"),
//						rs.getTimestamp("reg_date").toLocalDateTime(),
//						rs.getInt("hit")
//						);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return vo;
//	}
//	
//	
//	
//	
//
//	@Override
//	public void updateBoard(String title, String content, int bId) {
//		String sql = "UPDATE my_board SET title=?, content=? WHERE board_id = ?";
//		try(Connection conn = ds.getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql)){
//			pstmt.setString(1, title);
//			pstmt.setString(2, content);
//			pstmt.setInt(3, bId);
//			pstmt.executeUpdate(); 
//	} catch (SQLException e) {
//	 	e.printStackTrace();
//	}
//}
//				
//				
//	@Override
//	public void deleteBoard(int bId) {
//		String sql = "DELETE FROM my_board WHERE board_id=?";
//		try(Connection conn = ds.getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql)){
//			pstmt.setInt(1, bId);
//			pstmt.executeUpdate(); 
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	
//	
//	
//	
//	@Override
//	public List<BoardVO> searchBoard(String keyword, String category) {
//		List<BoardVO> searchList = new ArrayList<>();
//		String sql = "SELECT * FROM my_board WHERE " + category + " LIKE ?";
//		try(Connection conn = ds.getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql)){
//			pstmt.setString(1, "%" +keyword + "%");
//			ResultSet rs = pstmt.executeQuery();
//			while(rs.next()) {
//				BoardVO vo = new BoardVO(
//						rs.getInt("board_id"),
//						rs.getString("writer"),
//						rs.getString("title"),
//						rs.getString("content"),
//						rs.getTimestamp("reg_date").toLocalDateTime(),
//						rs.getInt("hit")
//						);
//				searchList.add(vo);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		return searchList;
//	}
//	
//	
//	
//	@Override
//	public void upHit(int bId) {
//		String sql = "UPDATE my_board SET hit=hit+1 WHERE board_id=?";
//		try(Connection conn = ds.getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql)){
//					pstmt.setInt(1, bId);
//					pstmt.executeUpdate();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//	}
//	
//	
//	
//	
//	
//	@Override
//	public int countArticles() {  
//		int count = 0;  //트라이캐치열려고 변수 선언한거임~
//		
//		String sql = "SELECT COUNT(*) FROM my_board";
//		try(Connection conn = ds.getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql); 
//				ResultSet rs = pstmt.executeQuery()){
//					if(rs.next()) {
//						count = rs.getInt("count(*)");
//					}
//				
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return count;    //test.jsp가서 출력문써주고 실행해보자~
//}
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	
//}
