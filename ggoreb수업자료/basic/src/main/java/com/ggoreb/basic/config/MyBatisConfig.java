package com.ggoreb.basic.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = "com.ggoreb.basic.mapper")
public class MyBatisConfig {
}