package och06;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Greet
 */
@WebServlet("/Greet")
public class Greet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//멤버변수 선언O
	PrintWriter log;
	
    public Greet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		//Servlet이 태어날 때
		
		try {
			System.out.println("Init Start");
			//객체에 파일경로등을 매개값으로 갖는 경우 파일이없을수도있기때문에 예외처리가 반드시 필요하다
			log = new PrintWriter(new FileWriter("c:/log/log.txt",true));
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("헉븜");
		}
	}
	public void destroy() {
		System.out.println("destroy start...");
		//로그 커밋과 유사
		log.flush();
		if(log != null) log.close();
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("do get Start...");
		String name = request.getParameter("name");
		String msg = name+ "님 반가워\r\n";
		GregorianCalendar gc = new GregorianCalendar();
		String date = String.format("%TF %TT\r\n", gc , gc);
		
		//file출력
		log.print(date + msg);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 화면 출력
		out.println("<html><body><h2>인사</h2>"+msg);
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
