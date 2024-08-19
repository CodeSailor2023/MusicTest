package com.test.dao.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LinkDto {
    private Integer id;
    private String name;
    private Integer order;
    private String res_url;
    private Integer link_type;
    private String custom;
    private Object rhythms;
    private Object songs;   //设置为空
    private Object basic_coordinate;     //设置为空
    private Object basic_play;
    private Object rhythm_game;
    private Object Rhythm_game_extend;
    private Object videos;
}
