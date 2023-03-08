package och01;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Add3
 */
@WebServlet("/Add3") //add3호출
public class Add3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add3() { //생성자
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //get으로 호출하는 경우 실행, get이 디폴트
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//목표 1부터 누적값 전달, 파라미터가 리퀘스트에 묻어옴
		int num = Integer.parseInt(request.getParameter("num")); //파라미터를 호출하고 int로 변환하여 저장 
		String loc = request.getParameter("loc");
		System.out.println("Add3 num -> "+num);
		int sum =0;
		for (int i = 0; i <=num; i++) {
			sum += i;
		}
		System.out.println("Add3 sum -> "+sum);
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf=8");
		//공식, 사용자 브라우저에 보여주는 객체 복붙해둘것 sevlet방식
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.printf("<h1>1부터 %d까지의 합계", num);
		out.printf("<h4>LOC --> %s</h4>",loc);
		out.println(sum);
		out.println("</body></html>");
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
