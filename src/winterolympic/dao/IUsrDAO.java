package winterolympic.dao;

import winterolympic.vo.Usr;

public interface IUsrDAO {
    public boolean doCreate(Usr usr) throws Exception; // 执行数据的插入操作
    public Usr findByUid(String uid) throws Exception; // 根据 uid 查询，返回所有 Usr
    public boolean check(Usr usr) throws Exception; // 登录校验
}
