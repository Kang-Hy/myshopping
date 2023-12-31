package com.khy.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@Configuration
@ComponentScan("com.khy.service")

@Import({JdbcConfig.class,MybatisConfig.class})
@PropertySource("classpath:jdbc.properties")

@EnableTransactionManagement
public class SpringConfig {
}
