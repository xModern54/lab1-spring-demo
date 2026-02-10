package com.example.demo.service;

import com.example.demo.model.Post;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostService {
    public List<Post> listAllPosts() {
        return List.of(
                new Post("Первый пост", 3),
                new Post("Второй пост", 15),
                new Post("Третий пост", 0)
        );
    }
}

