package com.khy.dao;

import com.khy.pojo.Goods;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface GoodsDao {

    @Insert("insert into goods_tb (goodsname,goodsdescribe,goodsmoney,goodsnumber,incar) values(#{goodsName},#{goodsDescribe},#{goodsMoney},#{goodsNumber},#{inCar})")
    int insertGoods(Goods goods);

    @Delete("delete from goods_tb where goodsid=#{goodsId}")
    int deleteGoods(Goods goods);

    @Update("update goods_tb set goodsmoney=#{goodsMoney},goodsdescribe=#{goodsDescribe},incar = #{inCar},goodsname = #{goodsName},goodsnumber = #{goodsNumber} where goodsid=#{goodsId}")
    int updateGoods(Goods goods);

    @Update("update goods_tb set incar = 'false' ,goodsnumber = #{goodsNumber} where goodsid=#{goodsId}")
    int buyGoods(Goods goods);
    @Select("select * from goods_tb")
    List<Goods> getAllGoods();

    @Select("select * from goods_tb where incar = 'true'")
    List<Goods> getAllCar();

    @Update("update goods_tb set incar = #{inCar} where goodsid=#{goodsId}")
    int inoutcar(Goods goods);
}
