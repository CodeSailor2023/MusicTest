package com.test.dao.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RhythmGameDto {
    private Integer id;
    private String music_score_url;
    private Integer speed;
    private Integer order;
    private Object musics_url;
}
