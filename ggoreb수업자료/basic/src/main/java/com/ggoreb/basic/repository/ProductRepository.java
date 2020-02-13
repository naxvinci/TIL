package com.ggoreb.basic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.ggoreb.basic.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
}