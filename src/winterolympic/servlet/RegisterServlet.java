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

public class RegisterServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String successpath = "login.jsp";
        String failurepath = "register.jsp";
        Usr usr = new Usr();
        usr.setUid(request.getParameter("uid"));
        usr.setName(request.getParameter("name"));
        usr.setGender(Byte.parseByte(request.getParameter("gender")));
        usr.setAge(Integer.parseInt(request.getParameter("age")));
        usr.setPasswd(request.getParameter("passwd"));
        System.out.println(request.getParameter("uid"));
        Boolean flag = false;

        try {
            flag = DAOFactory.getIUsrDAOInstance().doCreate(usr);
        } catch (Exception e) {
            e.printStackTrace();
        }

        try{
            if (flag) {
                request.getRequestDispatcher(successpath).forward(request, response);
            } else {
                request.getRequestDispatcher(failurepath).forward(request, response);
            }
        } catch(Exception e) {
            e.printStackTrace() ;
        }
    }

    public void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
