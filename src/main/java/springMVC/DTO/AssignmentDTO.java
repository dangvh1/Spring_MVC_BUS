package springMVC.DTO;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AssignmentDTO implements Serializable {

    private Integer id;

    private Integer driver_id;

    private Integer busline_id;

    int busLineSum;

}
