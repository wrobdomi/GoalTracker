package com.first.springboot.web.springbootwebapplication.service;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.first.springboot.web.springbootwebapplication.model.Todo;

// Setting up repository for managing Todo objects 
public interface TodoRepository extends JpaRepository<Todo, Integer>{
	
	// JPA provides the default methods but not
	// searching by name - to search by name it is enough
	// to declare method as below 
	List<Todo> findByUser(String user);
	// Search by user and isDone
	List<Todo> findByUserAndIsDone(String user, boolean isDone);
}
