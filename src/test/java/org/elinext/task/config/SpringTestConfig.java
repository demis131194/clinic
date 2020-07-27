package org.elinext.task.config;

import com.opentable.db.postgres.embedded.EmbeddedPostgres;
import org.hibernate.cfg.AvailableSettings;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.Properties;

@Configuration
@ComponentScan("org.elinext.task.model")
@EnableJpaRepositories(basePackages = "org.elinext.task.repository", entityManagerFactoryRef = "test-entityManagerFactory")
@EnableTransactionManagement
public class SpringTestConfig {
    private static final String ENTITY_PATH = "org.elinext.task.model";

    @Bean
    public DataSource dataSource() throws IOException {
        return EmbeddedPostgres.start().getPostgresDatabase();
    }

    @Bean(name = "test-entityManagerFactory")
    public LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean(DataSource dataSource) {
        LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();
        entityManagerFactoryBean.setDataSource(dataSource);
//        entityManagerFactoryBean.setPersistenceUnitName("jpaData");
        entityManagerFactoryBean.setPackagesToScan(ENTITY_PATH);

        Properties properties = new Properties();
        properties.setProperty(AvailableSettings.FORMAT_SQL, "true");
        properties.setProperty(AvailableSettings.USE_SQL_COMMENTS, "true");
        properties.setProperty(AvailableSettings.DIALECT, "org.hibernate.dialect.PostgreSQL10Dialect");

        entityManagerFactoryBean.setJpaProperties(properties);
        HibernateJpaVendorAdapter adapter = new HibernateJpaVendorAdapter();

        adapter.setShowSql(true);

        entityManagerFactoryBean.setJpaVendorAdapter(adapter);

        return entityManagerFactoryBean;
    }

    @Bean
    public JpaTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
        return new JpaTransactionManager(entityManagerFactory);
    }
}
