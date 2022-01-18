package com;

import java.sql.ResultSet;
import java.sql.SQLException;

public class strgen {
	public String genblocks()
	{
		DBOperation get=new DBOperation();
		ResultSet blocks=get.getblocks();
		String out=new String("");
		try {
			while(blocks.next())
 			{
 				out=out+"<tr>";
 				out=out+"<td>"+blocks.getString(1)+"</td>";
 				out=out+"<td>"+blocks.getString(2)+"</td>";
 				out=out+"<td>"+blocks.getString(3)+"</td>";
 				out=out+"<td>"+blocks.getString(4)+"</td>";
 				out=out+"<td>"+blocks.getString(5)+"</td>";
 				out=out+"</tr>";
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}
		get.closeAll();
		return out;
	}
}
