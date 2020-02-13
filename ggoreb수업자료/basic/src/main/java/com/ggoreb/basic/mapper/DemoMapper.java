package com.ggoreb.basic.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.ggoreb.basic.model.Demo;

@Mapper
public interface DemoMapper {
	public List<Demo> getDemoList();
}