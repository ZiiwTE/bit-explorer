package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Blocks
 */
@WebServlet("/Blocks")
public class Blocks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Blocks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("\r\n");
	    response.getWriter().append("<!doctype html>\r\n");
	    response.getWriter().append("<html>\r\n");
	    response.getWriter().append("<head>\r\n");
	    response.getWriter().append("<meta charset=\"utf-8\">\r\n");
	    response.getWriter().append("<title>Blocks</title>\r\n");
	    response.getWriter().append("</head>\r\n");
	    response.getWriter().append("<body>\r\n");
	    response.getWriter().append("Blocks Info\r\n");
	    response.getWriter().append("      <table border=\"0\">\r\n");
	    response.getWriter().append("       <tr>\r\n");
	    response.getWriter().append("        <th>Height</th>\r\n");
	    response.getWriter().append("        <th>Hash</th>\r\n");
	    response.getWriter().append("        <th>Time</th>\r\n");
	    response.getWriter().append("			<th>Size</th>\r\n");
	    response.getWriter().append("			<th>Reward</th>\r\n");
	    response.getWriter().append("       </tr>\r\n");
	    response.getWriter().append("       <tr>\r\n");
	    response.getWriter().append("        <td>A</td>\r\n");
	    response.getWriter().append("        <td>B</td>\r\n");
	    response.getWriter().append("        <td>C</td>\r\n");
	    response.getWriter().append("			<td>D</td>\r\n");
	    response.getWriter().append("			<td>E</td>\r\n");
	    response.getWriter().append("       </tr>\r\n");
	    response.getWriter().append("		");
	    strgen bgen=new strgen();
	    response.getWriter().append(bgen.genblocks());
	    response.getWriter().append("\r\n");
	    response.getWriter().append("      </table>\r\n");
	    response.getWriter().append("</body>\r\n");
	    response.getWriter().append("</html>\r\n");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
