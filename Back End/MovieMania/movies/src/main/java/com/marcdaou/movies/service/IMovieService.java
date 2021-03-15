package com.marcdaou.movies.service;


import com.marcdaou.movies.model.Movie;
import javassist.NotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface IMovieService {

    public List<Movie> GetAll();
    public List<Movie> GetByName(String name, String sortparam) throws NotFoundException;
    public Movie Create(Movie movie);
    public Movie Update(Movie movie) throws NotFoundException;
    public String DeleteById(String id);
    public Optional<Movie> FindOne(String id) throws NotFoundException;

}
