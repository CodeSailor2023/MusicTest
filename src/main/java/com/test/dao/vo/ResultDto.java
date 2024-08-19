package com.test.dao.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultDto {
    private Object data;
    private Long status_code;

    public static ResultDto ok(){
        return new ResultDto(null, null);
    }
    public static ResultDto ok(Object data){
        return new ResultDto(data, 2000L);
    }
}
