package com.marcdaou.movies.repository;


import com.marcdaou.movies.model.Movie;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface IMoviesRepository extends MongoRepository<Movie, String> {
    List<Movie> findAllByNameContains(String name, Sort sort);
}
