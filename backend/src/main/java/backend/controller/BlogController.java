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
import backend.model.User;
import backend.service.BlogService;
import backend.service.UserService;

@RestController
public class BlogController {
  
    @Autowired
    BlogService blogService;  //Service which will do all data retrieval/manipulation work
  
     
    //-------------------Retrieve All Users--------------------------------------------------------
      
    @RequestMapping(value = "/blog/", method = RequestMethod.GET)
    public ResponseEntity<List<Blog>> listAllBlogs() {
        List<Blog> blogs = blogService.findAllBlogs();
        if(blogs.isEmpty()){
            return new ResponseEntity<List<Blog>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Blog>>(blogs, HttpStatus.OK);
    }
  
  
     
    //-------------------Retrieve Single User--------------------------------------------------------
      
    @RequestMapping(value = "/blog/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Blog> getBlog(@PathVariable("id") int id) {
        System.out.println("Fetching Blog with id " + id);
        Blog blog = blogService.findById(id);
        if (blog == null) {
            System.out.println("Blog with id " + id + " not found");
            return new ResponseEntity<Blog>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Blog>(blog, HttpStatus.OK);
    }
  
      
      
    //-------------------Create a Blog--------------------------------------------------------
      
    @RequestMapping(value = "/blog/", method = RequestMethod.POST)
    public ResponseEntity<Void> createBlog(@RequestBody Blog blog, UriComponentsBuilder ucBuilder) {
        System.out.println("Creating Blog " + blog.getBlogTitle());
        blog.setCreationDate(new Date());
        
        blogService.saveBlog(blog);
  
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/blog/{id}").buildAndExpand(blog.getBlogId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
  
     
      
    //------------------- Update a Blog --------------------------------------------------------
      
    @RequestMapping(value = "/blog/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Blog> updateBlog(@PathVariable("id") int id, @RequestBody Blog blog) {
        System.out.println("Updating Blog " + id);
          
        Blog currentBlog = blogService.findById(id);
          
        if (currentBlog==null) {
            System.out.println("Blog with id " + id + " not found");
            return new ResponseEntity<Blog>(HttpStatus.NOT_FOUND);
        }
  
        currentBlog.setBlogTitle(blog.getBlogTitle());
        currentBlog.setBlogContent(blog.getBlogContent());
        currentBlog.setCreationDate(blog.getCreationDate());
        blogService.updateBlog(currentBlog);
        return new ResponseEntity<Blog>(currentBlog, HttpStatus.OK);
    }
  
     
     
    //------------------- Delete a Blog --------------------------------------------------------
      
    @RequestMapping(value = "/blog/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Blog> deleteBlog(@PathVariable("id") int id) {
        System.out.println("Fetching & Deleting Blog with id " + id);
  
        Blog blog = blogService.findById(id);
        if (blog == null) {
            System.out.println("Unable to delete. Blog with id " + id + " not found");
            return new ResponseEntity<Blog>(HttpStatus.NOT_FOUND);
        }
  
        blogService.deleteBlogById(id);
        return new ResponseEntity<Blog>(HttpStatus.NO_CONTENT);
    }
  
      
     
    //------------------- Delete All Users --------------------------------------------------------
      
    /*@RequestMapping(value = "/user/", method = RequestMethod.DELETE)
    public ResponseEntity<User> deleteAllUsers() {
        System.out.println("Deleting All Users");
  
        userService.deleteAllUsers();
        return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
    }*/
  
}
