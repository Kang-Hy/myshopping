package com.khy.service;

import com.khy.pojo.Goods;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * 管理员增删改查
 * 用户的buy 和 加入移除购物车  和 查询所有在购物车里的商品
 */

@Transactional
public interface GoodsService {


//管理员添加操作
    int insertGoods(Goods goods);
//管理员的删除操作
    int deleteGoods(Goods goods);
//管理员修改商品信息
    int updateGoods(Goods goods);



//用户购买商品后 （把商品数量-1 由前端jqury处理 ,incar字段修改为false这直接写在sql语句里了） 后端直接接受对象调用修改
    int buyGoods(Goods goods);

//查询所有商品
    List<Goods> getAllGoods();

//查询购物车所有记录
    List<Goods> getAllCar();


    /**
     * 移除和加入购物车 修改incar字段
     * @param goods
     * @return
     */
    int inoutcar(Goods goods);

}
