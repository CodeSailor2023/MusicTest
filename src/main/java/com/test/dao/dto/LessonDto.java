package com.test.dao.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LessonDto {
    private String name;
    private Integer order;
    private Integer id;
    private Object radarmap;
    private Object link;
}
