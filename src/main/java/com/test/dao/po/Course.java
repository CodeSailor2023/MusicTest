package com.test.dao.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("courses")
public class Course {
    private String name;
    //通过注解解决关键字冲突
    @TableField(value = "`order`")
    private Integer order;
    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;
}
