package och05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class cal2
 */
@WebServlet("/Cal2")
public class Cal2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cal2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); //한글출력X경우 필요X
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		try {
			int num1 = Integer.parseInt(request.getParameter("num1"));
			int num2 = Integer.parseInt(request.getParameter("num2"));
			out.printf("%d+%d=%d<p>",num1,num2,(num1+num2));
			out.printf("%d-%d=%d<p>",num1,num2,(num1-num2));
			out.printf("%d*%d=%d<p>",num1,num2,(num1*num2));
			out.printf("%d/%d=%d<p>",num1,num2,(num1/num2));
		} catch (Exception e) {
			//out.println("e.getMessage() ->"+e.getMessage());
			//이동할 Error페이지 선언
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			//실질적 Error페이지 이동
			rd.forward(request, response);
		}
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
