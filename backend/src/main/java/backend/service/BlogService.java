package backend.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import backend.dao.BlogDAO;
import backend.dao.UserDAO;
import backend.model.Blog;
import backend.model.User;

@Service("blogService")
public class BlogService{
    
	@Autowired
	private BlogDAO blogDAO;
     
    
 
    public List<Blog> findAllBlogs() {
        
    	List<Blog> blogs=blogDAO.list();
    	return blogs;
    }
     
    public Blog findById(int id) {
        
    	return blogDAO.get(id);
    }
     
    
     
    public void saveBlog(Blog blog) {
        
    	blogDAO.saveOrUpdate(blog);
    }
 
    public void updateBlog(Blog blog) {
        
    	blogDAO.saveOrUpdate(blog);
    }
 
    public void deleteBlogById(int id) {
         
        blogDAO.delete(id);
    }
 
      

 
}
