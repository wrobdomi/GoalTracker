package com.first.springboot.web.springbootwebapplication.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.validation.Valid;
//import org.springframework.web.bind.annotation.ResponseBody; - testing reasons 
import org.springframework.web.bind.annotation.SessionAttributes;
import com.first.springboot.web.springbootwebapplication.model.Todo;
import com.first.springboot.web.springbootwebapplication.service.TodoRepository;


// The controller responsible for managing todos data
// Get name of a user as variable with session scope
@Controller
@SessionAttributes("name") 
public class TodoController {

	
	
	@Autowired
	TodoRepository repository;
	
	// Using InitBinder to set date format across application
	// Always use specified format for class Date.class 
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// date format : dd/mm/yyyy
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));
	}
	
	
	
	// Retrieve list of tickets for user and show them on page
	// Three tickets are already created for user by default ( hard-coded for admin )
    @RequestMapping(value="/list-todos", method = RequestMethod.GET)
    public String showTodos(ModelMap model){
    	String name = getLoggedInUserName(model);
    	model.put("todos", repository.findByUser(name));
    	Date currentDate = new Date();
    	model.put("currentDate", currentDate);
    	//model.put("todos", service.retrieveTodos(name));
        return "list-todos";
    }


    // Get user name form session scope attribute 
	private String getLoggedInUserName(ModelMap model) {
		return (String) model.get("name");
	}
    
    
    
    // Create new ticket and add it the model, return view for adding a ticket  
    @RequestMapping(value="/add-todo", method = RequestMethod.GET)
    public String showAddTodoPage(ModelMap model){
        model.addAttribute("todo", new Todo(0, getLoggedInUserName(model), "Description...", new Date(), false));
    	return "todo";
    }
    
    // Handle data posted by user while adding a ticket
    // Validation for length of description ( see Todo.java desc field ) 
    @RequestMapping(value="/add-todo", method = RequestMethod.POST)
    public String addTodo(ModelMap model, @Valid Todo todo, BindingResult result){
        
    	if(result.hasErrors()) {
    		return "todo";
    	}
    	
    	todo.setUser(getLoggedInUserName(model));
    	repository.save(todo);
    	// service.addTodo( getLoggedInUserName(model), todo.getDesc(), todo.getTargetDate(), false);
    	return "redirect:/list-todos";
    }
    
    
    // Deleting a ticket - id needed to identify proper ticket 
    @RequestMapping(value="/delete-todo", method = RequestMethod.GET)
    public String deleteTodo(@RequestParam int id){
        //service.deleteTodo(id);
    	repository.deleteById(id);
    	return "redirect:/list-todos";
    }
    
    
    // Updating a ticket - using the same view as for adding a ticket 
    // Get the specific ticket and put it to the model 
    @RequestMapping(value="/update-todo", method = RequestMethod.GET)
    public String showUpdateTodoPage(@RequestParam int id, ModelMap model){
       
    	//Todo todo = service.retrieveTodo(id);
    	Todo todo = repository.findById(id).get();
    	
    	model.put("todo", todo);
    	return "todo";
    }
    
    
    // Update ticket by removing old one and adding modified one to the list 
    @RequestMapping(value="/update-todo", method = RequestMethod.POST)
    public String showUpdateTodoPage(ModelMap model, @Valid Todo todo, BindingResult result){
    	
    	if(result.hasErrors()) {
    		return "todo";
    	}
        
    	todo.setUser(getLoggedInUserName(model));
    	
    	//service.updateTodo(todo);
    	repository.save(todo);
    	
    	return "redirect:/list-todos";
    }
    
    
    // Sign ticket as done 
    @RequestMapping(value="/signasdone-todo", method = RequestMethod.GET)
    public String signasdoneTodo(@RequestParam int id){
        //service.deleteTodo(id);
    	System.out.println("Inside signasdone-todo");
    	
    	Todo todo = repository.findById(id).get();
    	todo.setDone(true);
    	repository.save(todo);
    	
    	return "redirect:/list-todos";
    }
    
    
    
    // Retrieve list of done tickets for user and show them on page
    @RequestMapping(value="/done-todos", method = RequestMethod.GET)
    public String showDoneTodos(ModelMap model){
     	String name = getLoggedInUserName(model);
     	
     	
     	model.put("todos", repository.findByUserAndIsDone(name, true));
     	//model.put("todos", service.retrieveTodos(name));
        return "done-todos";
     }

     
     
    
      
}
