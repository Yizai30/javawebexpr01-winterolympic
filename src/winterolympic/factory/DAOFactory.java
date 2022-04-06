package winterolympic.factory;

import winterolympic.dao.IUsrDAO;
import winterolympic.dao.proxy.UsrDAOProxy;

public class DAOFactory {
    public static IUsrDAO getIUsrDAOInstance() throws Exception {
        return new UsrDAOProxy();
    }
}
