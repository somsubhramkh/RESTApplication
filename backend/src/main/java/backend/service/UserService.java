package backend.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import backend.dao.UserDAO;
import backend.model.User;

@Service("userService")
public class UserService{
    
	@Autowired
	private UserDAO userDAO;
     
    
 
    public List<User> findAllUsers() {
        
    	List<User> users=userDAO.list();
    	return users;
    }
     
    public User findById(int id) {
        
    	return userDAO.get(id);
    }
     
    public User findByName(String name) {
        
    	return userDAO.getUserByName(name);
    }
     
    public void saveUser(User user) {
        
    	userDAO.saveOrUpdate(user);
    }
 
    public void updateUser(User user) {
        
    	userDAO.saveOrUpdate(user);
    }
 
    public void deleteUserById(int id) {
         
        userDAO.delete(id);
    }
 
    public boolean isUserExist(User user) {
        return findByName(user.getUsername())!=null;
    }
      

 
}
