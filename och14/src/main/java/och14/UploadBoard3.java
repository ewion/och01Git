package och14;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UploadBoard3
 */
@WebServlet("/UploadBoard3")
public class UploadBoard3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadBoard3() {
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
		System.out.println("UploadBoard3 doPost Start...");
		String serverSaveFilename = "";
		String upLoadFilename ="";
		request.setCharacterEncoding("utf-8");
		int maxSize = 5*1024*1024; //5M
		String fileSave = "/fileSave";
		String realPath = getServletContext().getRealPath(fileSave);
		System.out.println("realPath -> "+realPath);
		
		//Upload
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8",new DefaultFileRenamePolicy());
		
		
		Enumeration en = multi.getFileNames();
		while (en.hasMoreElements()) {
			//input태그의 속성이 file인 태그의 name속성값: 파라미터이름m
			String parameterName = (String)en.nextElement();
			
			//서버에 저장된 파일 이름
			serverSaveFilename = multi.getFilesystemName(parameterName);
			
			//전송 전 원래 파일이름
			String original = multi.getOriginalFileName(parameterName);
			
			//전송된 파일의 내용 타입
			String type = multi.getContentType(parameterName);
			
			//전송된 파일속성이 file인 태그의 name 속성값을 이용해 파일객체 생성
			File file = multi.getFile(parameterName);
			System.out.println("realPath -> "+realPath);
			System.out.println("파라미터 이름 -> "+parameterName);
			System.out.println("실제 파일 이름 -> "+original);
			System.out.println("저장된 파일 이름 -> "+serverSaveFilename);
			System.out.println("파일 타입 -> "+type);
			if (file != null) {
				System.out.println("크기 -> "+file.length());
				//out.println("크기 -> "+file.length()+"<br>");
			}
		}
		
		//request가 아닌 multi객체의 getParameter메소드로 정보 가져온다
		String name = multi.getParameter("name");
		String title = multi.getParameter("title");
		System.out.println("name -> "+name);
		System.out.println("title -> "+title);
		
		upLoadFilename = realPath + "\\"+ serverSaveFilename;
		System.out.println("전달 upLoadFilename -> "+upLoadFilename);
		
		request.setAttribute("filename", "fileSave\\"+serverSaveFilename);
		request.setAttribute("upLoadFilename", upLoadFilename);
		request.setAttribute("title", title);
		
		RequestDispatcher rd = request.getRequestDispatcher("02uploadBoardResult.jsp");
		rd.forward(request, response);
	}

}
