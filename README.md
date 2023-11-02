# SQL Interview Exercises

The repository with the SQL module exercises.

1. [Introduction](#introduction)
2. [Description](#description)
3. [Requirements](#requirements)
4. [Usage](#usage)
5. [Troubles](#troubles-and-mistakes)

## Introduction

This repository has the set of coding exercises for the SQL module. The exercises are divided into three sections 
`easy`, `medium` and `hard`. 

For every section, a further division into `days` is done collecting `15` exercises for each day. The **intention**
to have the exercises in this way is to complete a rally of exercises-review-feedback daily.

**Deliverable**

1. Make an `sql` file with the solution for each exercise
2. Use a the following naming convention:  `easy_d1_sql_ex_01(solution).sql` for the exercise `1` in the day `1` 
directory for the easy section.
3. Do not forget to document your `sql` file using comments in `sql` scripts.

**Please** see the [Usage](#usage) section below to get details on how to submit your job.

## Description

For each exercise, an `md` file has been created with the following structure:

- **Exercise Name**
  - **Tables** 
    
    A section with a brief description of the schema to have the context of the problem.
  
  - **Task**
  
    A description of the task to do using SQL and the tables from the previous section.
  
  - **Description of the Solution**
  
    This section has the test to be done with your SQL code. 
  
  - **Explanation**
  
    A quick explanation about the solution. Some exercises does not have an explanation.
  
  - **Schemas & scripts** 
    
    - **SQL Schema**
    
       The code, in generic SQL language, to create the tables and schemas for the exercise.
    
    - **Pandas Code**
    
       The code to generate the tables and schema in python using pandas dataframes.

## Requirements

1. **Oracle Database**
    
    [Oracle Database `12 C`](https://docs.oracle.com/en/database/oracle/oracle-database/index.html)  or above 
    in your computer. You can use an Oracle Live SQL instance to solve the queries.  

2. **Oracle SQLdeveloper**

    If you installed the Oracle Database in your computer, you need [Oracle SQL Developer](https://www.oracle.com/database/sqldeveloper/)
    to work with the database.

3. **(Optional) Python environment**

    Each exercise has a `pandas` code section to create the schemas and tables for the problem. You can use `Python` 
    and the code for `pandas` to create ORM models and populate the tables in the Oracle Database.

## Usage

### Coding

1. **Automate**

    Automate the setting of the schema to fulfill three things: *create the schema*, *make your query*, and *manage* 
    your working environment. This means to drop unused tables. 

2. **Document**

    Comment all your code. Use the `SQL` standard convention to comment `--` code. If further instructions to run your
    queries are needed, please specify this in the documentation.

3. **Test**

    Every exercise has a test to run in the corresponding section. Ensure your queries get the desired output. 
    Write your queries observing also the best possible performance in terms of memory and time.

4. **Pack**

    Pack each exercise solution as an individual `sql` file. Include in the solution script the code to create the 
    tables, populate the tables, and/or delete the tables.

### Submitting

This is a Git repository and version control is expected. Follow the steps to submit your work:
1. Clone the repository to your local.
2. Create a new branch from the `master` branch and name it `<USER>_solutions`.
3. Work on your branch. Make regular commits to your branch.
4. Create a directory inside the `solutions` folder with the name `<USER>`. This directory is your working directory. 
Observe this to make easy the collaboration among co-workers.
5. `PUSH` your work to the remote repository upon completion of each day work within the sections. 
For example, `push` your code when you finish the work for `day 2` on `medium` section.
6. **DO NOT MERGE** your code with the `master` branch. Avoid the temptation to do it.

## Troubles and Mistakes?

This is an ongoing work. If you find any issue with the problems, errors, mistakes in the redaction, please rise 
an issue in `Github` using the corresponding tool.