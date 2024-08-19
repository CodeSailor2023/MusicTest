package com.test.dao.po;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("rhythm_games")
public class RhythmGame {
    private Integer id;
    private String music_score_url;
    private Integer speed;
    private Integer order;
}
