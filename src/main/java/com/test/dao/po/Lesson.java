package com.test.dao.po;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("lessons")
public class Lesson {
    private Integer id;
    private String name;
    @TableField(value = "`order`")
    private Integer order;
    private Integer course;
}
