PGDMP         1                z            HR    10.22    10.22                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    16686    HR    DATABASE     ?   CREATE DATABASE "HR" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "HR";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            ?            1259    16697    departments     TABLE     ?   CREATE TABLE public."departments " (
    department_id integer NOT NULL,
    department_name character varying(30) NOT NULL,
    manager_id integer,
    location_id integer
);
 "   DROP TABLE public."departments ";
       public         postgres    false    3            ?            1259    16687 	   employees    TABLE     ?  CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(25) NOT NULL,
    email character varying(100) NOT NULL,
    phone_number character varying(20),
    hire_date date NOT NULL,
    job_id character varying(10) NOT NULL,
    salary numeric(8,2) NOT NULL,
    commission_pct numeric(2,2),
    manager_id integer,
    department_id integer
);
    DROP TABLE public.employees;
       public         postgres    false    3            ?            1259    16692    jobs    TABLE     ?   CREATE TABLE public.jobs (
    job_id character varying(10) NOT NULL,
    job_title character varying(35),
    min_salary numeric(8,2),
    max_salary numeric(8,2)
);
    DROP TABLE public.jobs;
       public         postgres    false    3            ?            1259    16702 	   locations    TABLE       CREATE TABLE public.locations (
    location_id integer NOT NULL,
    street_address character varying(40),
    postal_code character varying(12),
    city character varying(30) NOT NULL,
    state_province character varying(25),
    country_id character(2) NOT NULL
);
    DROP TABLE public.locations;
       public         postgres    false    3            ?
          0    16697    departments  
   TABLE DATA               a   COPY public."departments " (department_id, department_name, manager_id, location_id) FROM stdin;
    public       postgres    false    198          ?
          0    16687 	   employees 
   TABLE DATA               ?   COPY public.employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) FROM stdin;
    public       postgres    false    196   .       ?
          0    16692    jobs 
   TABLE DATA               I   COPY public.jobs (job_id, job_title, min_salary, max_salary) FROM stdin;
    public       postgres    false    197   K                  0    16702 	   locations 
   TABLE DATA               o   COPY public.locations (location_id, street_address, postal_code, city, state_province, country_id) FROM stdin;
    public       postgres    false    199   h       }
           2606    16701    departments  departments _pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."departments "
    ADD CONSTRAINT "departments _pkey" PRIMARY KEY (department_id);
 L   ALTER TABLE ONLY public."departments " DROP CONSTRAINT "departments _pkey";
       public         postgres    false    198            y
           2606    16691    employees employees_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public         postgres    false    196            {
           2606    16696    jobs jobs_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public         postgres    false    197            
           2606    16706    locations locations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public         postgres    false    199            ?
           2606    16717 *   departments  departments _location_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."departments "
    ADD CONSTRAINT "departments _location_id_fkey" FOREIGN KEY (location_id) REFERENCES public.locations(location_id) NOT VALID;
 X   ALTER TABLE ONLY public."departments " DROP CONSTRAINT "departments _location_id_fkey";
       public       postgres    false    2687    198    199            ?
           2606    16722 )   departments  departments _manager_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."departments "
    ADD CONSTRAINT "departments _manager_id_fkey" FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id) NOT VALID;
 W   ALTER TABLE ONLY public."departments " DROP CONSTRAINT "departments _manager_id_fkey";
       public       postgres    false    2681    196    198            ?
           2606    16707 &   employees employees_department_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_department_id_fkey FOREIGN KEY (department_id) REFERENCES public."departments "(department_id) NOT VALID;
 P   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_department_id_fkey;
       public       postgres    false    198    2685    196            ?
           2606    16712    employees employees_job_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(job_id) NOT VALID;
 I   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_job_id_fkey;
       public       postgres    false    2683    196    197            ?
      x?????? ? ?      ?
      x?????? ? ?      ?
      x?????? ? ?             x?????? ? ?     