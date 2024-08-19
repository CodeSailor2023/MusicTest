package com.test.dao.po;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("play_videos")
public class PlayVideo {
    private String name;
    private String videoName;
    private String url;
    @TableField(value = "`order`")
    private Integer order;
    private String comment;
}
