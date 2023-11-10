package com.khy.service.impl;

import com.khy.dao.GoodsDao;
import com.khy.pojo.Goods;
import com.khy.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsserviceImpl implements GoodsService {

    @Autowired
    private GoodsDao goodsDao;

    @Override
    public int insertGoods(Goods goods) {
        return goodsDao.insertGoods(goods);
    }

    @Override
    public int deleteGoods(Goods goods) {
        return goodsDao.deleteGoods(goods);
    }

    @Override
    public int updateGoods(Goods goods) {
        return goodsDao.updateGoods(goods);
    }

    @Override
    public int buyGoods(Goods goods) {
        return goodsDao.buyGoods(goods);
    }

    @Override
    public List<Goods> getAllGoods() {
        return goodsDao.getAllGoods();
    }

    @Override
    public List<Goods> getAllCar() {
        return goodsDao.getAllCar();
    }

    @Override
    public int inoutcar(Goods goods) {
        return goodsDao.inoutcar(goods);
    }

//    @Override
//    public boolean insertGoods(Goods Goods) {
//        int insert = GoodsDao.insertGoods(Goods);
//        return true;
//    }
//
//    @Override
//    public boolean deleteGoods(Integer id) {
//        int delete = GoodsDao.deleteGoods(id);
//        return true;
//    }
//
//    @Override
//    public boolean updateGoods(Goods Goods) {
//        int update = GoodsDao.updateGoods(Goods);
//        return true;
//    }
//
//    @Override
//    public Goods getByIdGoods(Integer id) {
//
//        return GoodsDao.getByIdGoods(id);
//    }


}
