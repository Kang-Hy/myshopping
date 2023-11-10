package com.khy.controller;

import com.khy.pojo.Goods;
import com.khy.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class GoodsController {
    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/goodsGetAll")
    @ResponseBody
    public List<Goods> getAllGoods(){
        return goodsService.getAllGoods();
    }

    @RequestMapping("/buyGoods")
    @ResponseBody
    public int buyGoods(@RequestBody Goods goods){
        return goodsService.buyGoods(goods);
    }

    @RequestMapping("/updategoods")
    @ResponseBody
    public int updateGoods(@RequestBody Goods goods){
        return goodsService.updateGoods(goods);
    }

    @RequestMapping("/delGoods")
    @ResponseBody
    public int delGoods(@RequestBody Goods goods){
        return goodsService.deleteGoods(goods);
    }

    @RequestMapping("/insertGoods")
    @ResponseBody
    public int insertGoods(@RequestBody Goods goods){
        return goodsService.insertGoods(goods);
    }

    @RequestMapping("/getCar")
    @ResponseBody
    public List<Goods> getCar(){
        return goodsService.getAllCar();
    }

    @RequestMapping("/inoutcar")
    @ResponseBody
    public int inoutcar(@RequestBody Goods goods){
        return goodsService.inoutcar(goods);
    }
}
