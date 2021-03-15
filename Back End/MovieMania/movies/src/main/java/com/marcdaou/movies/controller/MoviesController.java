package com.marcdaou.movies.controller;

import com.marcdaou.movies.dto.MovieDto;
import com.marcdaou.movies.model.Movie;
import com.marcdaou.movies.service.IMovieService;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/movies")
public class MoviesController {

    @Autowired
    private IMovieService movieService;

    @GetMapping(path = "")
    public ResponseEntity<List<Movie>> getMovies()
    {
        return ResponseEntity.ok(movieService.GetAll());
    }

    @GetMapping(path = "/{name}/{sort}")
    public ResponseEntity<List<Movie>> getByName(@PathVariable("name") String name, @PathVariable("sort") String sort) throws NotFoundException {
        List<Movie> movies = movieService.GetByName(name, sort);
        return ResponseEntity.ok(movies);
    }

    @PostMapping(path = "")
    public ResponseEntity<Movie> createMovie(@Valid @RequestBody MovieDto movieDto)
    {
        Movie movie = movieDto.toMovie();
        return ResponseEntity.ok(movieService.Create(movie));
    }

    @PutMapping(path = "/{id}")
    public ResponseEntity<Movie> updateMovie(@PathVariable String id, @Valid @RequestBody MovieDto movieDto) throws IllegalArgumentException, NotFoundException {
        if (id.isBlank())
            throw new IllegalArgumentException("No id provided");
        Movie movie = movieDto.toMovie();
        return ResponseEntity.ok(movieService.Update(movie));
    }

    @DeleteMapping(path = "/{name}")
    public String deleteById(@PathVariable String name) throws NotFoundException
    {
        Optional<Movie> movie = movieService.FindOne(name);
        if (!movie.isPresent()) {
            throw new NotFoundException("Movie not found");
        }
        return movieService.DeleteById(movie.get().getId());
    }

}
