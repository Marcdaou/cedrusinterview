package com.marcdaou.movies.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;

import java.time.LocalDate;



@Getter
@Setter
public class Movie {
    @Id
    private String id;
    private String name;
    private String genre;
    private String image1Url;
    private String image2Url;
    private String description;
    private Double rating;
    private Double trendingScore;
    private Double popularityScore;
    private String releaseDate;
    private String topActor;

    @JsonIgnore
    private LocalDate lastModifiedOn;


}
