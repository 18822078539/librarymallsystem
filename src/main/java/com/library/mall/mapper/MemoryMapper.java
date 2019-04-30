package com.library.mall.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.library.mall.entity.Memory;

@Repository
public interface MemoryMapper {
	Memory findMemoryById(Integer id);
	List<Memory> findAllMemory();
}
