package och05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Cal
 */
@WebServlet("/Cal")
public class Cal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cal() {
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
		} catch (NumberFormatException e) {
			out.println("연산 결과 NumberFormatException!!!");
		} catch (ArithmeticException e) {
			out.println("연산 결과 ArithmeticException!!!");
			out.println("0으로 나눌 수 없습니다");
		} catch (Exception e) {
			out.println("e.getMessage() ->"+e.getMessage());
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
