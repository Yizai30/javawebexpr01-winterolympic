package winterolympic.servlet;

import winterolympic.factory.DAOFactory;
import winterolympic.vo.Usr;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class LoginServlet extends HttpServlet {

    /**
     * Constructor of the object.
     */
    public LoginServlet() {
        super();
    }

    /**
     * Destruction of the servlet. <br>
     */
    public void destroy() {
        super.destroy(); // Just puts "destroy" string in log
        // Put your code here
    }

    /**
     * The doGet method of the servlet. <br>
     *
     * This method is called when a form has its tag value method equals to get.
     *
     * @param request the request send by the client to the server
     * @param response the response send by the server to the client
     * @throws ServletException if an error occurred
     * @throws IOException if an error occurred
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.doPost(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String successpath = "home.jsp";
        String failurepath = "login.jsp";
        String uid = request.getParameter("uid");
        String passwd = request.getParameter("passwd");

        List<String> info = new ArrayList<String>();    // 收集错误
        Usr usr = new Usr() ;
        usr.setUid(uid);

        usr.setPasswd(passwd);
        Boolean flag=false;

        if(uid == null || "".equals(uid)) {
            info.add("用户名不能为空！");
        }
        if(passwd == null || "".equals(passwd)) {
            info.add("密码不能为空！");
        }
        if(info.size()==0) {    // 里面没有记录任何的错误
            request.setCharacterEncoding("gbk");
            response.setContentType("text/html;charset=gbk");
            try {
                flag = DAOFactory.getIUsrDAOInstance().check(usr);
            } catch (Exception e) {
                e.printStackTrace();
            }

            try{
                if(flag){
//					info.add("用户登陆成功，欢迎" + tea.getTname() + "光临！") ;
//					request.setAttribute("info",info) ;
                    request.getRequestDispatcher(successpath).forward(request, response) ;

                } else {
                    info.add("用户登陆失败，错误的用户名和密码！") ;
                    request.setAttribute("info",info) ;
                    request.getRequestDispatcher(failurepath).forward(request, response) ;
                }
            }catch(Exception e){
                e.printStackTrace() ;
            }
        }
    }

    /**
     * Initialization of the servlet. <br>
     *
     * @throws ServletException if an error occurs
     */
    public void init() throws ServletException {
        // Put your code here
    }
}
