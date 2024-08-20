package com.test.dao.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RhythmDto {
    private Integer id;
    private String musicScoreUrl;
    private String oneConcertScoreUrl;
    private String twoConcertScoreUrl;
    private Integer speed;
    private String name;
    private Integer order;
    private Object[] sites;
    private Object musics_url;
}
