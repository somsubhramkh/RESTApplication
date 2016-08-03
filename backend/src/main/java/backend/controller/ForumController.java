package backend.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import backend.model.Blog;
import backend.model.Forum;
import backend.model.User;
import backend.service.BlogService;
import backend.service.ForumService;
import backend.service.UserService;

@RestController
public class ForumController {
  
    @Autowired
    ForumService forumService;  //Service which will do all data retrieval/manipulation work
  
     
    //-------------------Retrieve All Forum Posts--------------------------------------------------------
      
    @RequestMapping(value = "/forum/", method = RequestMethod.GET)
    public ResponseEntity<List<Forum>> listAllForums() {
        List<Forum> forums = forumService.findAllForums();
        if(forums.isEmpty()){
            return new ResponseEntity<List<Forum>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Forum>>(forums, HttpStatus.OK);
    }
  
  
     
    //-------------------Retrieve Single User--------------------------------------------------------
      
    @RequestMapping(value = "/forum/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Forum> getForum(@PathVariable("id") int id) {
        System.out.println("Fetching Forum with id " + id);
        Forum forum = forumService.findById(id);
        if (forum == null) {
            System.out.println("Forum with id " + id + " not found");
            return new ResponseEntity<Forum>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Forum>(forum, HttpStatus.OK);
    }
  
      
      
    //-------------------Create a Forum Post--------------------------------------------------------
      
    @RequestMapping(value = "/forum/", method = RequestMethod.POST)
    public ResponseEntity<Void> createForum(@RequestBody Forum forum, UriComponentsBuilder ucBuilder) {
        System.out.println("Creating Forum " + forum.getPostTitle());
        forum.setCreationDate(new Date());
        
        forumService.saveForum(forum);
  
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/forum/{id}").buildAndExpand(forum.getPostId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
  
     
      
    //------------------- Update a Forum Post --------------------------------------------------------
      
    @RequestMapping(value = "/forum/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Forum> updateForum(@PathVariable("id") int id, @RequestBody Forum forum) {
        System.out.println("Updating Forum " + id);
          
        Forum currentPost = forumService.findById(id);
          
        if (currentPost==null) {
            System.out.println("Forum post with id " + id + " not found");
            return new ResponseEntity<Forum>(HttpStatus.NOT_FOUND);
        }
  
        currentPost.setPostTitle(forum.getPostTitle());
        currentPost.setPostContent(forum.getPostContent());
        currentPost.setCreationDate(forum.getCreationDate());
        forumService.updateForum(currentPost);
        return new ResponseEntity<Forum>(currentPost, HttpStatus.OK);
    }
  
     
     
    //------------------- Delete a Forum Post --------------------------------------------------------
      
    @RequestMapping(value = "/forum/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Forum> deleteForum(@PathVariable("id") int id) {
        System.out.println("Fetching & Deleting Forum Post with id " + id);
  
        Forum forum = forumService.findById(id);
        if (forum == null) {
            System.out.println("Unable to delete. Forum post with id " + id + " not found");
            return new ResponseEntity<Forum>(HttpStatus.NOT_FOUND);
        }
  
        forumService.deleteForumById(id);
        return new ResponseEntity<Forum>(HttpStatus.NO_CONTENT);
    }
  
      
     
    //------------------- Delete All Users --------------------------------------------------------
      
    /*@RequestMapping(value = "/user/", method = RequestMethod.DELETE)
    public ResponseEntity<User> deleteAllUsers() {
        System.out.println("Deleting All Users");
  
        userService.deleteAllUsers();
        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
    }*/
  
}
