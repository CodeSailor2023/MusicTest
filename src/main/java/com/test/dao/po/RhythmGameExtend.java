package com.test.dao.po;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("rhythm_game_extends")
public class RhythmGameExtend {
    @TableId("id")
    private Integer l_id;
    private String ruleMusicUrl;
    private String otherMusicUrl;
    private String videoUrl;
    private Integer gameId;
}
