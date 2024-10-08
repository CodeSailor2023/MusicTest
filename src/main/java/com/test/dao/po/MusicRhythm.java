package com.test.dao.po;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("music_rhythm")
public class MusicRhythm {
    private Integer id;
    private Integer musicId;
    private Integer rhythmId;
}
