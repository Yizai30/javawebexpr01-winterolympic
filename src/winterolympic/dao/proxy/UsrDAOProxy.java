package winterolympic.dao.proxy;

import winterolympic.dao.IUsrDAO;
import winterolympic.dao.impl.UsrDAOImpl;
import winterolympic.dbc.DatabaseConnection;
import winterolympic.vo.Usr;

public class UsrDAOProxy implements IUsrDAO {

    private DatabaseConnection dbc = null;
    private IUsrDAO dao = null;

    public UsrDAOProxy() throws Exception {
        this.dbc = new DatabaseConnection();
        this.dao = new UsrDAOImpl(this.dbc.getConn());
    }

    public boolean doCreate(Usr usr) throws Exception {
        boolean flag = false;
        try {
            if (this.dao.findByUid(usr.getUid()) == null) {
                flag = this.dao.doCreate(usr);
            }
        } catch(Exception e) {
            throw e;
        } finally {
            this.dbc.close();
        }
        return flag;
    }

    public Usr findByUid(String uid) throws Exception {
        Usr usr = null;
        try {
            usr = this.dao.findByUid(uid);
        } catch(Exception e) {
            throw e;
        } finally {
            this.dbc.close();
        }
        return usr;
    }

    public boolean check(Usr usr) throws Exception {
        boolean flag = false;
        try {
            flag = this.dao.check(usr);
        } catch(Exception e) {
            throw e;
        } finally {
            this.dbc.close();
        }
        return flag;
    }
}
