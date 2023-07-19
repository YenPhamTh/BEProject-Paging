package project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.model.PProduct;
import project.util.DbUtil;

public class PProductDAO {
	// function: public [dataType] [functionName](parameters){}
	public List<PProduct> getAllProducts() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<PProduct> list = new ArrayList<PProduct>();
		try {
			conn = DbUtil.makeConnection();

			ps = conn.prepareStatement("Select * from product");
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new PProduct(rs.getInt(1), rs.getString(2), rs.getBoolean(3), rs.getDouble(4), rs.getDouble(5),
						rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getString(9)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return list;
	}

	public List<PProduct> getProductsByCate(int categoryId) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<PProduct> list = new ArrayList<PProduct>();
		try {
			conn = DbUtil.makeConnection();

			ps = conn.prepareStatement("Select * from product where categoryId = ?");
			ps.setInt(1, categoryId);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new PProduct(rs.getInt(1), rs.getString(2), rs.getBoolean(3), rs.getDouble(4), rs.getDouble(5),
						rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getString(9)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return list;
	}

	public List<PProduct> getProductsByText(String text) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<PProduct> list = new ArrayList<PProduct>();
		try {
			conn = DbUtil.makeConnection();

			ps = conn.prepareStatement("Select * from product where title like ?");
			ps.setString(1, "%" + text + "%");
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new PProduct(rs.getInt(1), rs.getString(2), rs.getBoolean(3), rs.getDouble(4), rs.getDouble(5),
						rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getString(9)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return list;
	}

	public PProduct getProductsById(int productId) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		PProduct product = null;
		try {
			conn = DbUtil.makeConnection();

			ps = conn.prepareStatement("Select * from product where id = ?");
			ps.setInt(1, productId);
			rs = ps.executeQuery();

			while (rs.next()) {
				product = new PProduct(rs.getInt(1), rs.getString(2), rs.getBoolean(3), rs.getDouble(4),
						rs.getDouble(5), rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getString(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return product;
	}

	public List<PProduct> paginationProduct(int pageIndex, int pageSize) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<PProduct> list = new ArrayList<PProduct>();
		try {
			conn = DbUtil.makeConnection();
			String sql = "SELECT * FROM product ORDER BY id LIMIT ? OFFSET ?;";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pageSize);
			ps.setInt(2, (pageIndex - 1) * pageSize);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new PProduct(rs.getInt(1), rs.getString(2), rs.getBoolean(3), rs.getDouble(4), rs.getDouble(5),
						rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getString(9)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return list;
	}
}
