package org.lanqiao.dao;

import org.lanqiao.pojo.Goods;

import java.sql.SQLException;
import java.util.List;

public interface goodsDao {
    //查询所有商品信息
    public List<Goods> findAllGoods() throws SQLException;
    //查询一个商品
    public Goods findOneGoods(int id) throws SQLException;
}
