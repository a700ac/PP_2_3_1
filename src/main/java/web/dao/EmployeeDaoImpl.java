package web.dao;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import web.model.Employee;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class EmployeeDaoImpl implements EmployeeDao {


    @PersistenceContext
    private EntityManager entityManager;

    @Override
    @Transactional
    public List<Employee> getAllEmployees() {
        return entityManager.createQuery("from Employee", Employee.class)
                .getResultList();

    }

    @Override
    @Transactional
    public void saveEmployee(Employee employee) {
        if (employee.getId() == 0) {
            entityManager.persist(employee);
        } else {
            entityManager.merge(employee);
        }
    }

    @Override
    @Transactional
    public Employee getEmployee(int id) {
        return entityManager.find(Employee.class, id);
    }

    @Override
    @Transactional
    public void deleteEmployee(int id) {
        Query query = (Query) entityManager.createQuery("delete from Employee where id=:employeeId");
        query.setParameter("employeeId", id);
        query.executeUpdate();
    }
}
