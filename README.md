# Uanify Exeni DataBase

## Naming Conventions
- Use lowercase letters for object names, as PostgreSQL automatically converts unquoted identifiers to lowercase.
- Separate words in object names with underscores (_) rather than using camelCase or PascalCase.
- Be descriptive and avoid using abbreviations that may be unclear to others.
- Reserved Words must be in UPPERCASE in order to improve readability.

## Folder Structure
```
.
├── liquibase/
│   └── changeset_sql_files
└── sql/
    ├── functions
    ├── main_script
    ├── seed
    ├── procedures
    ├── triggers
    └── views
└── Dockerfile
└── buildspec.yml
```

Organized as follows:

- `liquibase/`: This directory contains Liquibase files that help with database schema management and version control.
- - `changeset_sql_files/`: This subdirectory within liquibase/ holds the SQL scripts used by Liquibase to apply changes to the database schema.
- `sql/`: This directory contains the raw SQL scripts used for various aspects of the database.
- - `functions/`: This subdirectory holds SQL scripts related to database functions. Functions are reusable SQL code snippets that perform specific tasks and RETURN A RESULT. Functions must be grouped by module/functionality.
- - `main_script/`: This subdirectory contains the Genesis SQL script and tables definitions
- - `seed/`: This subdirectory stores SQL scripts for seeding initial data into the database. Seed scripts help pre-populate the database with sample or default data.
- - `procedures/`: This subdirectory contains SQL scripts related to procedures. Procedures are pre-compiled SQL code blocks that can be called with specific parameters to perform specific actions AND DO NOT RETURN A RESULT. Procedures must be grouped by module/functionality.
- - `triggers/`: This directory houses SQL scripts used to define database triggers. Triggers are specialized database objects that are automatically executed in response to specific events, such as INSERT, UPDATE, DELETE, or other data modifications, on particular tables.
- - `views/`: This subdirectory holds SQL scripts related to database views. Views are virtual tables derived from existing tables or other views and provide a simplified or aggregated representation of the data.
- `buildspec.yml`: This file contains the commands that will be excecuted in CodeBuild to deploy Liquibase changes.
- `Dockerfile`: This file is the Docker image that is being pushed to ECR and will be used in the CodeBuild project.


# Querying

IMPORTANT: When performing queries it is important that the first parameter of the `where` clause is the field by which the table was partitioned, in our case company_id. 