package com.test.dao.po;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("videos")
public class Video {
    private Integer id;
    private String videoUrl;
    @TableField(value = "`order`")
    private Integer order;
    private String name;
    private String comment;
}
