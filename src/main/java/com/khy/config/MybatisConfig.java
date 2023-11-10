package com.khy.config;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.context.annotation.Bean;

import javax.sql.DataSource;


public class MybatisConfig {

    @Bean
    public SqlSessionFactoryBean SqlSessionFactoryBean(DataSource dataSource){
        SqlSessionFactoryBean ssfb = new SqlSessionFactoryBean();
        ssfb.setDataSource(dataSource);
        ssfb.setTypeAliasesPackage("com.khy.pojo");
        return ssfb;
    }
    @Bean
    public MapperScannerConfigurer mapperScannerConfigurer(){
        MapperScannerConfigurer msc =new MapperScannerConfigurer();
        msc.setBasePackage("com.khy.dao");
        return msc;
    }
}
