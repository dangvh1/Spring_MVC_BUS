package springMVC.entity;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@Table(name = "driver_assignment")
public class DriverAssignment implements Serializable {

    @Id
    @ManyToOne
    @JoinColumn(name = "driver_id")
    private Driver driver;

    @Id
    @ManyToOne
    @JoinColumn(name = "busline_id")
    private Busline busline;

    @Column(name = "buslineSum", nullable = false)
    int busLineSum;

    @Column(name = "distancesum", nullable = false)
    float distanceSum;
}
