package och02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Num
 */
@WebServlet("/Num")
public class Num extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Num() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	//  HW 2-2
	//  1. Parameter -> num1 , num2
	//    연산결과
	//    덧셈 : 70 + 7 = 77
	//    뺄셈 : 70 - 7 = 63
	//    곱셈 : 70 * 7 = 490
	//    나눗셈 : 70 / 7 = 10.000000
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		float num3 = (float)num1/num2;
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html><body>");
		out.printf("덧셈 : %d+%d=%d<br>",num1,num2, (num1+num2));
		out.printf("뺄셈 : %d-%d=%d<br>",num1,num2, (num1-num2));
		out.printf("겁샘 : %d*%d=%d<br>",num1,num2, (num1*num2));
		out.printf("나눗셈 : %d / %d = %d <br>",num1,num2, num3);
		out.println("</html></body>");
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
