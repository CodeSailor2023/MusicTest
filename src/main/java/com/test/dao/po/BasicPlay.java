package com.test.dao.po;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("basic_plays")
public class BasicPlay {
    private Integer id;
    private String musicScoreUrl;
    private Integer speed;
    @TableField(value = "`order`")
    private Integer order;
    private Integer site; //sites的逻辑外键
}
