package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.bean.Students;

public interface StudentsRepository extends CrudRepository<Students,Integer>{

}
