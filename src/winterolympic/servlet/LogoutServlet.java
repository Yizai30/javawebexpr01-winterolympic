package winterolympic.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.invalidate();

        // 弹窗提醒
//        PrintWriter out = resp.getWriter();
//        String msg="注销成功";
//        out.println("<script type=\"text/javascript\">");
//        out.println("alert('" + msg + "');");
//        out.println("</script>");

        // 服务器跳转
        req.getRequestDispatcher("login.jsp").forward(req, resp) ;
    }
}
