package och02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Person
 */
@WebServlet("/Person")
public class Person extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Person() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String gender = request.getParameter("gender"); 
		String[] notice = request.getParameterValues("notice");
		String job = request.getParameter("job");
		
		out.println("<html><body><h1>개인정보</h1>");
		out.printf("이름 : "+name+"<p>");
		out.printf("id : "+id+"<p>");
		out.printf("pw : "+pw+"<p>");
		out.printf("수신메일 : ");
		if (notice != null) {
			for (int i = 0; i < notice.length; i++) {
				out.println(notice[i]+" ");
			}
		} else out.println("없음");
		out.printf("<p>gender : "+gender+"<p>");
		out.printf("job : "+job+"<p>");
		out.println("</html></body>");
		out.close();
	}

}
