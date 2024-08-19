package com.test.dao.po;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;
import org.springframework.beans.factory.annotation.Value;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("links")
public class Link {
    private Integer id;
    private String name;
    @TableField(value = "`order`")
    private Integer order;
    private String resUrl;
    private Integer linkType;
    private String custom="";
}
