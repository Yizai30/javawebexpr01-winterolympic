package winterolympic.servlet;

import winterolympic.vo.Usr;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 设置成功跳转路径
        String successpath = "home.jsp";

        // 设置失败跳转路径
        String failurepath = "login.jsp";

        // 设置 response 编码方式，防止乱码
        resp.setContentType("text/html;charset=utf-8");

        // 创建 session 保存用户信息
        HttpSession session = req.getSession();

        // 获得 session 中的用户对象
        Usr usr = (Usr) session.getAttribute("usr");

        // 判断是否登录
        if (usr == null) {  // 考虑使用多线程实现动态倒计时
            resp.getWriter().print("您还未登录，3秒后将跳转到<a href='login.jsp'>登录页面</a>");
            resp.setHeader("Refresh","3;URL="+failurepath);
        } else {
            Cookie cookie = new Cookie("JSESSIONID", session.getId());
            resp.addCookie(cookie);
            req.getRequestDispatcher(successpath).forward(req, resp);
        }
    }
}
