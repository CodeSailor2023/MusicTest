package com.test.dao.po;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("rhythms")
public class Rhythm {
    private Integer id;
    private String musicScoreUrl;
    private String oneConcertScoreUrl;
    private String twoConcertScoreUrl;
    private Integer speed;
    private String name;
    private Integer order;
    private Integer site; //sites的逻辑外键
}
