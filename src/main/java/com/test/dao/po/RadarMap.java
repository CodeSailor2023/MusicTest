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
@TableName("radarmaps")
public class RadarMap {
    private Integer rhythmPct;
    private Integer speedPct;
    private Integer dynamicsPct;
    private Integer auditionPct;
    private Integer coordinatePct;
    private Integer imitationPct;
}
