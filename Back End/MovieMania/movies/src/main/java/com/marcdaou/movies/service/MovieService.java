package com.marcdaou.movies.service;


import com.marcdaou.movies.model.Movie;
import com.marcdaou.movies.repository.IMoviesRepository;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import java.time.Clock;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.regex.Pattern;

@Service
public class MovieService implements IMovieService {

    @Autowired
    private IMoviesRepository moviesRepository;

    @Override
    public List<Movie> GetAll() {
        return moviesRepository.findAll();
    }

    @Override
    public Optional<Movie> FindOne(String id) throws NotFoundException {
        Optional<Movie> movie = moviesRepository.findById(id);
        return movie;
    }

    @Override
    public List<Movie> GetByName(String name, String sortParam) throws NotFoundException {
        Query query = new Query();
        query.addCriteria(Criteria.where("name").regex(Pattern.compile(name, Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE)));
        query.with(Sort.by(Sort.Direction.DESC, sortParam));

        try {
            return moviesRepository.findAllByNameContains(name, Sort.by(Sort.Direction.DESC, sortParam));
        } catch (Exception e) {
            throw new NotFoundException("Movie not found");
        }
    }

    @Override
    public Movie Create(Movie movie) {
        movie.setLastModifiedOn(LocalDate.now(Clock.systemUTC()));
        Movie mov = moviesRepository.save(movie);
        return mov;
    }

    @Override
    public Movie Update(Movie movie) throws NotFoundException {

        Optional<Movie> mov = FindOne(movie.getId());
        if (!mov.isPresent())
            throw new NotFoundException("Cant update because movie not found");
        Movie movieFound = mov.get();
        movieFound.setLastModifiedOn(LocalDate.now(Clock.systemUTC()));
        movieFound.setRating(movie.getRating());
        return moviesRepository.save(movieFound);
    }

    @Override
    public String DeleteById(String id) {
        moviesRepository.deleteById(id);
        return id;
    }


}
