package backend.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import backend.dao.BlogDAO;
import backend.dao.ForumDAO;
import backend.dao.UserDAO;
import backend.model.Blog;
import backend.model.Forum;
import backend.model.User;

@Service("forumService")
public class ForumService{
    
	@Autowired
	private ForumDAO forumDAO;
     
    
 
    public List<Forum> findAllForums() {
        
    	List<Forum> forums=forumDAO.list();
    	return forums;
    }
     
    public Forum findById(int id) {
        
    	return forumDAO.get(id);
    }
     
    
     
    public void saveForum(Forum forum) {
        
    	forumDAO.saveOrUpdate(forum);
    }
 
    public void updateForum(Forum forum) {
        
    	forumDAO.saveOrUpdate(forum);
    }
 
    public void deleteForumById(int id) {
         
        forumDAO.delete(id);
    }
 
 
}
