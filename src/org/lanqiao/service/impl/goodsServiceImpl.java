package org.lanqiao.service.impl;

import org.lanqiao.dao.impl.goodsDaoImpl;
import org.lanqiao.pojo.Goods;
import org.lanqiao.service.goodsService;

import java.sql.SQLException;
import java.util.List;

public class goodsServiceImpl implements goodsService {

    org.lanqiao.dao.goodsDao goodsDao =new goodsDaoImpl();

    @Override
    public List<Goods> findAllGoods() {
        List<Goods> goodsList = null;
        try {
            goodsList = goodsDao.findAllGoods();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return goodsList;
    }

    @Override
    public Goods findOneGoods(int id) {
        Goods goods = null;
        try {
            goods = goodsDao.findOneGoods(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return goods;
    }
}
