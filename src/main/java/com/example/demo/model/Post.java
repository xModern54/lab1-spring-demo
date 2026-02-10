package com.example.demo.model;

public class Post {
    private final String text;
    private final Integer likes;

    // Constructor required by assignment: allows setting the post text.
    public Post(String text) {
        this(text, 0);
    }

    public Post(String text, Integer likes) {
        this.text = text;
        this.likes = likes;
    }

    public String getText() {
        return text;
    }

    public Integer getLikes() {
        return likes;
    }
}

