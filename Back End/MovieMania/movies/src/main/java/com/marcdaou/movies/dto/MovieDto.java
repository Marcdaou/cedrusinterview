package com.marcdaou.movies.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.marcdaou.movies.model.Movie;
import lombok.Getter;
import lombok.Setter;
import org.modelmapper.ModelMapper;
import org.springframework.data.annotation.Id;

import java.time.LocalDate;

@Getter
@Setter
public class MovieDto {

    private String id;
    private String name;
    public String genre;
    private String image1Url;
    private String image2Url;
    private String description;
    private Double rating;
    private Double trendingScore;
    private Double popularityScore;
    private String releaseDate;
    private String topActor;


    public Movie toMovie() {
        ModelMapper modelMapper = new ModelMapper();
        Movie movie = modelMapper.map(this, Movie.class);
        return movie;
    }
}
