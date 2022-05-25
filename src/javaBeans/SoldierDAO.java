package javaBeans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;



public class SoldierDAO {
	private ConnectionPool pool = null;
	
	public SoldierDAO() {
		try {
			pool = ConnectionPool.getInstance();
		} catch (Exception e) {
			System.out.println("Error : Connection load failed!");
		}
	}
	
	public boolean soldierInsert(SoldierVO sv) {
		boolean bool = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into \"SOLDIER\" values (\"SEQ_SOLDIER\".nextval,?,?,?,?,?,?)";
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sv.getId());
			pstmt.setLong(2, sv.getDivision_code());
			pstmt.setLong(3, sv.getPosition_code());
			pstmt.setObject(4, sv.getIn_day());
			pstmt.setObject(5, sv.getOut_day());
			pstmt.setObject(6, sv.getYear_code());
			int res = pstmt.executeUpdate();
			System.out.println("입력완료");
			bool = true;			
		} catch(Exception e) {
			System.out.println("Exception : " + e);
		} finally {
			if(conn != null) {
				try {
					pool.releaseConnection(conn);
				}catch (SQLException e) {}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {}
			}
		}
		return bool;
	}
	
	public List<SoldierVO> selectAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		List<SoldierVO> ls = new ArrayList<>();	
		String sql = "select \"SD\".\"ID\", \"DS\".\"DIVISION_NAME\", \"PS\".\"POSITION_NAME\", \"SD\".\"INDAY\", \"SD\".\"OUTDAY\", \"YR\".\"YEAR\" "
				+ "from \"SOLDIER\" \"SD\", \"DIVISION\" \"DS\", \"POSITION\" \"PS\", \"YEAR\" \"YR\""
				+ " where \"SD\".\"DIVISION_CODE\" = \"DS\".\"NUMBER\" and \"SD\".\"POSITION_CODE\" = \"PS\".\"NUMBER\" and \"SD\".\"YEAR_CODE\" = \"YR\".\"NUMBER\"";	
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SoldierVO tmp = new SoldierVO(
						rs.getString("ID"),
						rs.getString("DIVISION_NAME"),
						rs.getString("POSITION_NAME"),
						rs.getString("INDAY"),
						rs.getString("OUTDAY"),
						rs.getString("YEAR")
						);
				ls.add(tmp);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					pool.releaseConnection(conn);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return (ls.size() == 0) ? null : ls;
	}
	
	public List<SoldierVO> selectID(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		List<SoldierVO> ls = new ArrayList<>();	
		String sql = "select \"SD\".\"ID\", \"DS\".\"DIVISION_NAME\", \"PS\".\"POSITION_NAME\", \"SD\".\"INDAY\", \"SD\".\"OUTDAY\", \"YR\".\"YEAR\" "
				+ "from \"SOLDIER\" \"SD\", \"DIVISION\" \"DS\", \"POSITION\" \"PS\", \"YEAR\" \"YR\""
				+ " where \"SD\".\"DIVISION_CODE\" = \"DS\".\"NUMBER\" and \"SD\".\"POSITION_CODE\" = \"PS\".\"NUMBER\" and \"SD\".\"YEAR_CODE\" = \"YR\".\"NUMBER\" and \"SD\".\"ID\" = '"+id+"'";	
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SoldierVO tmp = new SoldierVO(
						rs.getString("ID"),
						rs.getString("DIVISION_NAME"),
						rs.getString("POSITION_NAME"),
						rs.getString("INDAY"),
						rs.getString("OUTDAY"),
						rs.getString("YEAR")
						);
				ls.add(tmp);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					pool.releaseConnection(conn);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return (ls.size() == 0) ? null : ls;
	}
	
	public List<SoldierVO> selectDivision(String division) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		List<SoldierVO> ls = new ArrayList<>();	
		String sql = "select \"SD\".\"ID\", \"DS\".\"DIVISION_NAME\", \"PS\".\"POSITION_NAME\", \"SD\".\"INDAY\", \"SD\".\"OUTDAY\", \"YR\".\"YEAR\" "
				+ "from \"SOLDIER\" \"SD\", \"DIVISION\" \"DS\", \"POSITION\" \"PS\", \"YEAR\" \"YR\""
				+ " where \"SD\".\"DIVISION_CODE\" = \"DS\".\"NUMBER\" and \"SD\".\"POSITION_CODE\" = \"PS\".\"NUMBER\" and \"SD\".\"YEAR_CODE\" = \"YR\".\"NUMBER\" and \"DS\".\"DIVISION_NAME\" = '"+division+"'";	
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SoldierVO tmp = new SoldierVO(
						rs.getString("ID"),
						rs.getString("DIVISION_NAME"),
						rs.getString("POSITION_NAME"),
						rs.getString("INDAY"),
						rs.getString("OUTDAY"),
						rs.getString("YEAR")
						);
				ls.add(tmp);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					pool.releaseConnection(conn);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return (ls.size() == 0) ? null : ls;
	}
	
	public List<SoldierVO> selectPosition(String position) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		List<SoldierVO> ls = new ArrayList<>();	
		String sql = "select \"SD\".\"ID\", \"DS\".\"DIVISION_NAME\", \"PS\".\"POSITION_NAME\", \"SD\".\"INDAY\", \"SD\".\"OUTDAY\", \"YR\".\"YEAR\" "
				+ "from \"SOLDIER\" \"SD\", \"DIVISION\" \"DS\", \"POSITION\" \"PS\", \"YEAR\" \"YR\""
				+ " where \"SD\".\"DIVISION_CODE\" = \"DS\".\"NUMBER\" and \"SD\".\"POSITION_CODE\" = \"PS\".\"NUMBER\" and \"SD\".\"YEAR_CODE\" = \"YR\".\"NUMBER\" and \"PS\".\"POSITION_NAME\" = '"+position+"'";	
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SoldierVO tmp = new SoldierVO(
						rs.getString("ID"),
						rs.getString("DIVISION_NAME"),
						rs.getString("POSITION_NAME"),
						rs.getString("INDAY"),
						rs.getString("OUTDAY"),
						rs.getString("YEAR")
						);
				ls.add(tmp);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					pool.releaseConnection(conn);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return (ls.size() == 0) ? null : ls;
	}
	
	public List<SoldierVO> selectYear(String year) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		List<SoldierVO> ls = new ArrayList<>();	
		String sql = "select \"SD\".\"ID\", \"DS\".\"DIVISION_NAME\", \"PS\".\"POSITION_NAME\", \"SD\".\"INDAY\", \"SD\".\"OUTDAY\", \"YR\".\"YEAR\" "
				+ "from \"SOLDIER\" \"SD\", \"DIVISION\" \"DS\", \"POSITION\" \"PS\", \"YEAR\" \"YR\""
				+ " where \"SD\".\"DIVISION_CODE\" = \"DS\".\"NUMBER\" and \"SD\".\"POSITION_CODE\" = \"PS\".\"NUMBER\" and \"SD\".\"YEAR_CODE\" = \"YR\".\"NUMBER\" and \"YR\".\"YEAR\" = '"+year+"'";	
		try {
			conn = pool.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SoldierVO tmp = new SoldierVO(
						rs.getString("ID"),
						rs.getString("DIVISION_NAME"),
						rs.getString("POSITION_NAME"),
						rs.getString("INDAY"),
						rs.getString("OUTDAY"),
						rs.getString("YEAR")
						);
				ls.add(tmp);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					pool.releaseConnection(conn);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return (ls.size() == 0) ? null : ls;
	}
}
