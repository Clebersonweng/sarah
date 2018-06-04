--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: brands; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE brands (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE brands_id_seq OWNED BY brands.id;


--
-- Name: chart_of_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE chart_of_accounts (
    id integer NOT NULL,
    code character varying,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: chart_of_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE chart_of_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chart_of_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE chart_of_accounts_id_seq OWNED BY chart_of_accounts.id;


--
-- Name: cost_oper_machine_cont_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cost_oper_machine_cont_details (
    id integer NOT NULL,
    type_of_service_id integer,
    amount double precision,
    subtotal double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    cost_oper_machine_cont_id integer,
    implement_id integer
);


--
-- Name: cost_oper_machine_cont_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cost_oper_machine_cont_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cost_oper_machine_cont_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cost_oper_machine_cont_details_id_seq OWNED BY cost_oper_machine_cont_details.id;


--
-- Name: cost_oper_machine_conts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cost_oper_machine_conts (
    id integer NOT NULL,
    program_production_id integer,
    chart_of_account_id integer,
    total double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cost_oper_machine_conts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cost_oper_machine_conts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cost_oper_machine_conts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cost_oper_machine_conts_id_seq OWNED BY cost_oper_machine_conts.id;


--
-- Name: cost_oper_machine_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cost_oper_machine_details (
    id integer NOT NULL,
    cost_oper_machine_id integer,
    machine_id integer,
    amount double precision,
    fuel double precision,
    lubricant double precision,
    repair_and_maintenance double precision,
    subtotal double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    implement_id integer,
    hours_needed numeric(10,3) DEFAULT 0
);


--
-- Name: cost_oper_machine_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cost_oper_machine_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cost_oper_machine_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cost_oper_machine_details_id_seq OWNED BY cost_oper_machine_details.id;


--
-- Name: cost_oper_machines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cost_oper_machines (
    id integer NOT NULL,
    total numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    chart_of_account_id integer,
    program_production_id integer
);


--
-- Name: cost_oper_machines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cost_oper_machines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cost_oper_machines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cost_oper_machines_id_seq OWNED BY cost_oper_machines.id;


--
-- Name: estimate_sales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE estimate_sales (
    id integer NOT NULL,
    farming_plot_id integer,
    chart_of_account_id integer,
    estimate_production double precision,
    total_production double precision,
    price double precision,
    gross_sale double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    date_init date,
    code character varying,
    type_of_crop_id integer,
    date_end date
);


--
-- Name: estimate_sales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE estimate_sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: estimate_sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE estimate_sales_id_seq OWNED BY estimate_sales.id;


--
-- Name: farming_plots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE farming_plots (
    id integer NOT NULL,
    code character varying,
    name character varying,
    area double precision,
    person_id integer,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: farming_plots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE farming_plots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: farming_plots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE farming_plots_id_seq OWNED BY farming_plots.id;


--
-- Name: fuels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE fuels (
    id integer NOT NULL,
    name character varying,
    price double precision,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: fuels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fuels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fuels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fuels_id_seq OWNED BY fuels.id;


--
-- Name: history_sales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE history_sales (
    id integer NOT NULL,
    period integer NOT NULL,
    date date,
    quantity double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: history_sales_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE history_sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: history_sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE history_sales_id_seq OWNED BY history_sales.id;


--
-- Name: history_sales_period_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE history_sales_period_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: history_sales_period_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE history_sales_period_seq OWNED BY history_sales.period;


--
-- Name: implements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE implements (
    id integer NOT NULL,
    name character varying,
    model character varying,
    machine_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    brand character varying,
    year character varying,
    price double precision,
    coef_cccr numeric(15,10),
    oper_time numeric(15,10),
    working_capacity numeric(6,3),
    working_capacity_effective numeric(6,3),
    field_efficiency numeric(6,3)
);


--
-- Name: implements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE implements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: implements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE implements_id_seq OWNED BY implements.id;


--
-- Name: machines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE machines (
    id integer NOT NULL,
    brand_id integer,
    model_id integer,
    hp double precision,
    consumption double precision,
    price double precision,
    year_purchase character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    fuel_id integer,
    coeficient_cccr numeric(15,10),
    time_oper numeric(15,10),
    type_machine_id integer,
    working_capacity numeric(6,3),
    working_capacity_effective numeric(6,3),
    field_efficiency numeric(6,3)
);


--
-- Name: machines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE machines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: machines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE machines_id_seq OWNED BY machines.id;


--
-- Name: man_power_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE man_power_details (
    id integer NOT NULL,
    man_power_id integer,
    type_of_work_id integer,
    person_id integer,
    hours_needed numeric(12,4) DEFAULT 0,
    subtotal numeric(20,4) DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: man_power_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE man_power_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: man_power_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE man_power_details_id_seq OWNED BY man_power_details.id;


--
-- Name: man_powers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE man_powers (
    id integer NOT NULL,
    program_production_id integer,
    chart_of_account_id integer,
    total_hours_needed double precision,
    total double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: man_powers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE man_powers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: man_powers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE man_powers_id_seq OWNED BY man_powers.id;


--
-- Name: manu_indi_expense_dets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE manu_indi_expense_dets (
    id integer NOT NULL,
    manu_indi_expense_id integer,
    name character varying,
    "isFixed" boolean,
    subtotal double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: manu_indi_expense_dets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE manu_indi_expense_dets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: manu_indi_expense_dets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE manu_indi_expense_dets_id_seq OWNED BY manu_indi_expense_dets.id;


--
-- Name: manu_indi_expenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE manu_indi_expenses (
    id integer NOT NULL,
    program_production_id integer,
    chart_of_account_id integer,
    total_fixed double precision,
    total_variable double precision,
    "totalFixedAndVariable" double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: manu_indi_expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE manu_indi_expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: manu_indi_expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE manu_indi_expenses_id_seq OWNED BY manu_indi_expenses.id;


--
-- Name: mark_spending_dets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mark_spending_dets (
    id integer NOT NULL,
    mark_spending_id integer,
    name character varying,
    amount double precision,
    descr text,
    is_fixed boolean,
    subtotal double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: mark_spending_dets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mark_spending_dets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mark_spending_dets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mark_spending_dets_id_seq OWNED BY mark_spending_dets.id;


--
-- Name: mark_spendings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mark_spendings (
    id integer NOT NULL,
    chart_of_account_id integer,
    total double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    program_production_id integer,
    total_fixed numeric(25,5),
    total_variable numeric(25,5)
);


--
-- Name: mark_spendings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mark_spendings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mark_spendings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mark_spendings_id_seq OWNED BY mark_spendings.id;


--
-- Name: models; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE models (
    id integer NOT NULL,
    brand_id integer,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: models_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: models_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE models_id_seq OWNED BY models.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE people (
    id integer NOT NULL,
    name character varying,
    lastname character varying,
    salary double precision,
    user_id integer,
    ruc_ci integer,
    address character varying,
    phone character varying,
    birthday date,
    gender character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE people_id_seq OWNED BY people.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE products (
    id integer NOT NULL,
    maker character varying,
    unit_of_measurement_id integer,
    tradename character varying,
    price double precision,
    dosage double precision,
    cost_per_hectare double precision,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: program_productions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE program_productions (
    id integer NOT NULL,
    estimate_sale_id integer,
    stock_initial double precision,
    stock_end double precision,
    variation_stock double precision,
    program_production double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: program_productions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE program_productions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: program_productions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE program_productions_id_seq OWNED BY program_productions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE roles (
    id integer NOT NULL,
    role character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: stru_expense_dets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stru_expense_dets (
    id integer NOT NULL,
    structure_expense_id integer,
    name character varying,
    amount double precision,
    subtotal double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: stru_expense_dets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stru_expense_dets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stru_expense_dets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stru_expense_dets_id_seq OWNED BY stru_expense_dets.id;


--
-- Name: structure_expenses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE structure_expenses (
    id integer NOT NULL,
    program_production_id integer,
    chart_of_account_id integer,
    total double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: structure_expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE structure_expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: structure_expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE structure_expenses_id_seq OWNED BY structure_expenses.id;


--
-- Name: supplies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE supplies (
    id integer NOT NULL,
    program_production_id integer,
    chart_of_account_id integer,
    total double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: supplies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE supplies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: supplies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE supplies_id_seq OWNED BY supplies.id;


--
-- Name: supply_details; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE supply_details (
    id integer NOT NULL,
    supply_id integer,
    product_id integer,
    quantity_needed double precision,
    subtotal double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: supply_details_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE supply_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: supply_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE supply_details_id_seq OWNED BY supply_details.id;


--
-- Name: type_machines; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE type_machines (
    id integer NOT NULL,
    code character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: type_machines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE type_machines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: type_machines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE type_machines_id_seq OWNED BY type_machines.id;


--
-- Name: type_of_crops; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE type_of_crops (
    id integer NOT NULL,
    code character varying,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    variety_id integer
);


--
-- Name: type_of_crops_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE type_of_crops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: type_of_crops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE type_of_crops_id_seq OWNED BY type_of_crops.id;


--
-- Name: type_of_services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE type_of_services (
    id integer NOT NULL,
    name character varying,
    price double precision,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    unit_of_measurement_id integer
);


--
-- Name: type_of_services_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE type_of_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: type_of_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE type_of_services_id_seq OWNED BY type_of_services.id;


--
-- Name: type_of_works; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE type_of_works (
    id integer NOT NULL,
    name character varying,
    price_hours double precision,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: type_of_works_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE type_of_works_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: type_of_works_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE type_of_works_id_seq OWNED BY type_of_works.id;


--
-- Name: unit_of_measurements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE unit_of_measurements (
    id integer NOT NULL,
    name character varying,
    abbreviation character varying,
    coefficient double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: unit_of_measurements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE unit_of_measurements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: unit_of_measurements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE unit_of_measurements_id_seq OWNED BY unit_of_measurements.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    role_id integer,
    own_machine boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: varieties; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE varieties (
    id integer NOT NULL,
    code character varying,
    descr character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: varieties_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE varieties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: varieties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE varieties_id_seq OWNED BY varieties.id;


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY brands ALTER COLUMN id SET DEFAULT nextval('brands_id_seq'::regclass);


--
-- Name: chart_of_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_of_accounts ALTER COLUMN id SET DEFAULT nextval('chart_of_accounts_id_seq'::regclass);


--
-- Name: cost_oper_machine_cont_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machine_cont_details ALTER COLUMN id SET DEFAULT nextval('cost_oper_machine_cont_details_id_seq'::regclass);


--
-- Name: cost_oper_machine_conts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machine_conts ALTER COLUMN id SET DEFAULT nextval('cost_oper_machine_conts_id_seq'::regclass);


--
-- Name: cost_oper_machine_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machine_details ALTER COLUMN id SET DEFAULT nextval('cost_oper_machine_details_id_seq'::regclass);


--
-- Name: cost_oper_machines id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machines ALTER COLUMN id SET DEFAULT nextval('cost_oper_machines_id_seq'::regclass);


--
-- Name: estimate_sales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY estimate_sales ALTER COLUMN id SET DEFAULT nextval('estimate_sales_id_seq'::regclass);


--
-- Name: farming_plots id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY farming_plots ALTER COLUMN id SET DEFAULT nextval('farming_plots_id_seq'::regclass);


--
-- Name: fuels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY fuels ALTER COLUMN id SET DEFAULT nextval('fuels_id_seq'::regclass);


--
-- Name: history_sales id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY history_sales ALTER COLUMN id SET DEFAULT nextval('history_sales_id_seq'::regclass);


--
-- Name: history_sales period; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY history_sales ALTER COLUMN period SET DEFAULT nextval('history_sales_period_seq'::regclass);


--
-- Name: implements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY implements ALTER COLUMN id SET DEFAULT nextval('implements_id_seq'::regclass);


--
-- Name: machines id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY machines ALTER COLUMN id SET DEFAULT nextval('machines_id_seq'::regclass);


--
-- Name: man_power_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY man_power_details ALTER COLUMN id SET DEFAULT nextval('man_power_details_id_seq'::regclass);


--
-- Name: man_powers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY man_powers ALTER COLUMN id SET DEFAULT nextval('man_powers_id_seq'::regclass);


--
-- Name: manu_indi_expense_dets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY manu_indi_expense_dets ALTER COLUMN id SET DEFAULT nextval('manu_indi_expense_dets_id_seq'::regclass);


--
-- Name: manu_indi_expenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY manu_indi_expenses ALTER COLUMN id SET DEFAULT nextval('manu_indi_expenses_id_seq'::regclass);


--
-- Name: mark_spending_dets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mark_spending_dets ALTER COLUMN id SET DEFAULT nextval('mark_spending_dets_id_seq'::regclass);


--
-- Name: mark_spendings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mark_spendings ALTER COLUMN id SET DEFAULT nextval('mark_spendings_id_seq'::regclass);


--
-- Name: models id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY models ALTER COLUMN id SET DEFAULT nextval('models_id_seq'::regclass);


--
-- Name: people id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY people ALTER COLUMN id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: program_productions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_productions ALTER COLUMN id SET DEFAULT nextval('program_productions_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: stru_expense_dets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY stru_expense_dets ALTER COLUMN id SET DEFAULT nextval('stru_expense_dets_id_seq'::regclass);


--
-- Name: structure_expenses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY structure_expenses ALTER COLUMN id SET DEFAULT nextval('structure_expenses_id_seq'::regclass);


--
-- Name: supplies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY supplies ALTER COLUMN id SET DEFAULT nextval('supplies_id_seq'::regclass);


--
-- Name: supply_details id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY supply_details ALTER COLUMN id SET DEFAULT nextval('supply_details_id_seq'::regclass);


--
-- Name: type_machines id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY type_machines ALTER COLUMN id SET DEFAULT nextval('type_machines_id_seq'::regclass);


--
-- Name: type_of_crops id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY type_of_crops ALTER COLUMN id SET DEFAULT nextval('type_of_crops_id_seq'::regclass);


--
-- Name: type_of_services id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY type_of_services ALTER COLUMN id SET DEFAULT nextval('type_of_services_id_seq'::regclass);


--
-- Name: type_of_works id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY type_of_works ALTER COLUMN id SET DEFAULT nextval('type_of_works_id_seq'::regclass);


--
-- Name: unit_of_measurements id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY unit_of_measurements ALTER COLUMN id SET DEFAULT nextval('unit_of_measurements_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: varieties id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY varieties ALTER COLUMN id SET DEFAULT nextval('varieties_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: chart_of_accounts chart_of_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chart_of_accounts
    ADD CONSTRAINT chart_of_accounts_pkey PRIMARY KEY (id);


--
-- Name: cost_oper_machine_cont_details cost_oper_machine_cont_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machine_cont_details
    ADD CONSTRAINT cost_oper_machine_cont_details_pkey PRIMARY KEY (id);


--
-- Name: cost_oper_machine_conts cost_oper_machine_conts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machine_conts
    ADD CONSTRAINT cost_oper_machine_conts_pkey PRIMARY KEY (id);


--
-- Name: cost_oper_machine_details cost_oper_machine_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machine_details
    ADD CONSTRAINT cost_oper_machine_details_pkey PRIMARY KEY (id);


--
-- Name: cost_oper_machines cost_oper_machines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machines
    ADD CONSTRAINT cost_oper_machines_pkey PRIMARY KEY (id);


--
-- Name: estimate_sales estimate_sales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estimate_sales
    ADD CONSTRAINT estimate_sales_pkey PRIMARY KEY (id);


--
-- Name: farming_plots farming_plots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY farming_plots
    ADD CONSTRAINT farming_plots_pkey PRIMARY KEY (id);


--
-- Name: fuels fuels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fuels
    ADD CONSTRAINT fuels_pkey PRIMARY KEY (id);


--
-- Name: history_sales history_sales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY history_sales
    ADD CONSTRAINT history_sales_pkey PRIMARY KEY (id);


--
-- Name: implements implements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY implements
    ADD CONSTRAINT implements_pkey PRIMARY KEY (id);


--
-- Name: machines machines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY machines
    ADD CONSTRAINT machines_pkey PRIMARY KEY (id);


--
-- Name: man_power_details man_power_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY man_power_details
    ADD CONSTRAINT man_power_details_pkey PRIMARY KEY (id);


--
-- Name: man_powers man_powers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY man_powers
    ADD CONSTRAINT man_powers_pkey PRIMARY KEY (id);


--
-- Name: manu_indi_expense_dets manu_indi_expense_dets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manu_indi_expense_dets
    ADD CONSTRAINT manu_indi_expense_dets_pkey PRIMARY KEY (id);


--
-- Name: manu_indi_expenses manu_indi_expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manu_indi_expenses
    ADD CONSTRAINT manu_indi_expenses_pkey PRIMARY KEY (id);


--
-- Name: mark_spending_dets mark_spending_dets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mark_spending_dets
    ADD CONSTRAINT mark_spending_dets_pkey PRIMARY KEY (id);


--
-- Name: mark_spendings mark_spendings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mark_spendings
    ADD CONSTRAINT mark_spendings_pkey PRIMARY KEY (id);


--
-- Name: models models_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: program_productions program_productions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_productions
    ADD CONSTRAINT program_productions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stru_expense_dets stru_expense_dets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stru_expense_dets
    ADD CONSTRAINT stru_expense_dets_pkey PRIMARY KEY (id);


--
-- Name: structure_expenses structure_expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY structure_expenses
    ADD CONSTRAINT structure_expenses_pkey PRIMARY KEY (id);


--
-- Name: supplies supplies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supplies
    ADD CONSTRAINT supplies_pkey PRIMARY KEY (id);


--
-- Name: supply_details supply_details_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supply_details
    ADD CONSTRAINT supply_details_pkey PRIMARY KEY (id);


--
-- Name: type_machines type_machines_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY type_machines
    ADD CONSTRAINT type_machines_pkey PRIMARY KEY (id);


--
-- Name: type_of_crops type_of_crops_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY type_of_crops
    ADD CONSTRAINT type_of_crops_pkey PRIMARY KEY (id);


--
-- Name: type_of_services type_of_services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY type_of_services
    ADD CONSTRAINT type_of_services_pkey PRIMARY KEY (id);


--
-- Name: type_of_works type_of_works_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY type_of_works
    ADD CONSTRAINT type_of_works_pkey PRIMARY KEY (id);


--
-- Name: unit_of_measurements unit_of_measurements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY unit_of_measurements
    ADD CONSTRAINT unit_of_measurements_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: varieties varieties_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY varieties
    ADD CONSTRAINT varieties_pkey PRIMARY KEY (id);


--
-- Name: idx_cost_oper_machine_cont_detail; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cost_oper_machine_cont_detail ON cost_oper_machine_cont_details USING btree (cost_oper_machine_cont_id);


--
-- Name: idx_machine_on_type_machine_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_machine_on_type_machine_id ON machines USING btree (type_machine_id);


--
-- Name: index_cost_oper_machine_cont_details_on_implement_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cost_oper_machine_cont_details_on_implement_id ON cost_oper_machine_cont_details USING btree (implement_id);


--
-- Name: index_cost_oper_machine_cont_details_on_type_of_service_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cost_oper_machine_cont_details_on_type_of_service_id ON cost_oper_machine_cont_details USING btree (type_of_service_id);


--
-- Name: index_cost_oper_machine_conts_on_chart_of_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cost_oper_machine_conts_on_chart_of_account_id ON cost_oper_machine_conts USING btree (chart_of_account_id);


--
-- Name: index_cost_oper_machine_conts_on_program_production_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cost_oper_machine_conts_on_program_production_id ON cost_oper_machine_conts USING btree (program_production_id);


--
-- Name: index_cost_oper_machine_details_on_cost_oper_machine_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cost_oper_machine_details_on_cost_oper_machine_id ON cost_oper_machine_details USING btree (cost_oper_machine_id);


--
-- Name: index_cost_oper_machine_details_on_implement_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cost_oper_machine_details_on_implement_id ON cost_oper_machine_details USING btree (implement_id);


--
-- Name: index_cost_oper_machine_details_on_machine_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cost_oper_machine_details_on_machine_id ON cost_oper_machine_details USING btree (machine_id);


--
-- Name: index_cost_oper_machines_on_chart_of_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cost_oper_machines_on_chart_of_account_id ON cost_oper_machines USING btree (chart_of_account_id);


--
-- Name: index_cost_oper_machines_on_program_production_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cost_oper_machines_on_program_production_id ON cost_oper_machines USING btree (program_production_id);


--
-- Name: index_estimate_sales_on_chart_of_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_estimate_sales_on_chart_of_account_id ON estimate_sales USING btree (chart_of_account_id);


--
-- Name: index_estimate_sales_on_farming_plot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_estimate_sales_on_farming_plot_id ON estimate_sales USING btree (farming_plot_id);


--
-- Name: index_estimate_sales_on_type_of_crop_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_estimate_sales_on_type_of_crop_id ON estimate_sales USING btree (type_of_crop_id);


--
-- Name: index_farming_plots_on_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_farming_plots_on_person_id ON farming_plots USING btree (person_id);


--
-- Name: index_implements_on_machine_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_implements_on_machine_id ON implements USING btree (machine_id);


--
-- Name: index_machines_on_brand_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_machines_on_brand_id ON machines USING btree (brand_id);


--
-- Name: index_machines_on_fuel_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_machines_on_fuel_id ON machines USING btree (fuel_id);


--
-- Name: index_machines_on_model_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_machines_on_model_id ON machines USING btree (model_id);


--
-- Name: index_man_power_details_on_man_power_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_man_power_details_on_man_power_id ON man_power_details USING btree (man_power_id);


--
-- Name: index_man_power_details_on_person_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_man_power_details_on_person_id ON man_power_details USING btree (person_id);


--
-- Name: index_man_power_details_on_type_of_work_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_man_power_details_on_type_of_work_id ON man_power_details USING btree (type_of_work_id);


--
-- Name: index_man_powers_on_chart_of_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_man_powers_on_chart_of_account_id ON man_powers USING btree (chart_of_account_id);


--
-- Name: index_man_powers_on_program_production_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_man_powers_on_program_production_id ON man_powers USING btree (program_production_id);


--
-- Name: index_manu_indi_expense_dets_on_manu_indi_expense_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_manu_indi_expense_dets_on_manu_indi_expense_id ON manu_indi_expense_dets USING btree (manu_indi_expense_id);


--
-- Name: index_manu_indi_expenses_on_chart_of_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_manu_indi_expenses_on_chart_of_account_id ON manu_indi_expenses USING btree (chart_of_account_id);


--
-- Name: index_manu_indi_expenses_on_program_production_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_manu_indi_expenses_on_program_production_id ON manu_indi_expenses USING btree (program_production_id);


--
-- Name: index_mark_spending_dets_on_mark_spending_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mark_spending_dets_on_mark_spending_id ON mark_spending_dets USING btree (mark_spending_id);


--
-- Name: index_mark_spendings_on_chart_of_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mark_spendings_on_chart_of_account_id ON mark_spendings USING btree (chart_of_account_id);


--
-- Name: index_mark_spendings_on_program_production_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mark_spendings_on_program_production_id ON mark_spendings USING btree (program_production_id);


--
-- Name: index_models_on_brand_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_models_on_brand_id ON models USING btree (brand_id);


--
-- Name: index_people_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_people_on_user_id ON people USING btree (user_id);


--
-- Name: index_products_on_unit_of_measurement_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_unit_of_measurement_id ON products USING btree (unit_of_measurement_id);


--
-- Name: index_program_productions_on_estimate_sale_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_program_productions_on_estimate_sale_id ON program_productions USING btree (estimate_sale_id);


--
-- Name: index_stru_expense_dets_on_structure_expense_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stru_expense_dets_on_structure_expense_id ON stru_expense_dets USING btree (structure_expense_id);


--
-- Name: index_structure_expenses_on_chart_of_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_structure_expenses_on_chart_of_account_id ON structure_expenses USING btree (chart_of_account_id);


--
-- Name: index_structure_expenses_on_program_production_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_structure_expenses_on_program_production_id ON structure_expenses USING btree (program_production_id);


--
-- Name: index_supplies_on_chart_of_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_supplies_on_chart_of_account_id ON supplies USING btree (chart_of_account_id);


--
-- Name: index_supplies_on_program_production_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_supplies_on_program_production_id ON supplies USING btree (program_production_id);


--
-- Name: index_supply_details_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_supply_details_on_product_id ON supply_details USING btree (product_id);


--
-- Name: index_supply_details_on_supply_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_supply_details_on_supply_id ON supply_details USING btree (supply_id);


--
-- Name: index_type_of_crops_on_variety_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_type_of_crops_on_variety_id ON type_of_crops USING btree (variety_id);


--
-- Name: index_type_of_services_on_unit_of_measurement_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_type_of_services_on_unit_of_measurement_id ON type_of_services USING btree (unit_of_measurement_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_role_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_role_id ON users USING btree (role_id);


--
-- Name: man_power_details fk_rails_0493daf068; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY man_power_details
    ADD CONSTRAINT fk_rails_0493daf068 FOREIGN KEY (man_power_id) REFERENCES man_powers(id);


--
-- Name: man_powers fk_rails_0680c2e2e4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY man_powers
    ADD CONSTRAINT fk_rails_0680c2e2e4 FOREIGN KEY (chart_of_account_id) REFERENCES chart_of_accounts(id);


--
-- Name: structure_expenses fk_rails_09712292bb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY structure_expenses
    ADD CONSTRAINT fk_rails_09712292bb FOREIGN KEY (chart_of_account_id) REFERENCES chart_of_accounts(id);


--
-- Name: cost_oper_machines fk_rails_0cde3a194d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machines
    ADD CONSTRAINT fk_rails_0cde3a194d FOREIGN KEY (program_production_id) REFERENCES program_productions(id);


--
-- Name: supplies fk_rails_126371a95e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supplies
    ADD CONSTRAINT fk_rails_126371a95e FOREIGN KEY (chart_of_account_id) REFERENCES chart_of_accounts(id);


--
-- Name: cost_oper_machines fk_rails_168e17f560; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machines
    ADD CONSTRAINT fk_rails_168e17f560 FOREIGN KEY (chart_of_account_id) REFERENCES chart_of_accounts(id);


--
-- Name: mark_spending_dets fk_rails_177b2119cf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mark_spending_dets
    ADD CONSTRAINT fk_rails_177b2119cf FOREIGN KEY (mark_spending_id) REFERENCES mark_spendings(id);


--
-- Name: farming_plots fk_rails_1eb0770b1b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY farming_plots
    ADD CONSTRAINT fk_rails_1eb0770b1b FOREIGN KEY (person_id) REFERENCES people(id);


--
-- Name: manu_indi_expenses fk_rails_20f0846594; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manu_indi_expenses
    ADD CONSTRAINT fk_rails_20f0846594 FOREIGN KEY (program_production_id) REFERENCES program_productions(id);


--
-- Name: supply_details fk_rails_26ced1cef8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supply_details
    ADD CONSTRAINT fk_rails_26ced1cef8 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: cost_oper_machine_conts fk_rails_287b08c240; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machine_conts
    ADD CONSTRAINT fk_rails_287b08c240 FOREIGN KEY (program_production_id) REFERENCES farming_plots(id);


--
-- Name: estimate_sales fk_rails_2f0136e6ad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estimate_sales
    ADD CONSTRAINT fk_rails_2f0136e6ad FOREIGN KEY (chart_of_account_id) REFERENCES chart_of_accounts(id);


--
-- Name: cost_oper_machine_details fk_rails_32f8a2d8a3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machine_details
    ADD CONSTRAINT fk_rails_32f8a2d8a3 FOREIGN KEY (cost_oper_machine_id) REFERENCES cost_oper_machines(id);


--
-- Name: cost_oper_machine_details fk_rails_44de65af41; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machine_details
    ADD CONSTRAINT fk_rails_44de65af41 FOREIGN KEY (machine_id) REFERENCES machines(id);


--
-- Name: machines fk_rails_51cc6470f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY machines
    ADD CONSTRAINT fk_rails_51cc6470f9 FOREIGN KEY (model_id) REFERENCES models(id);


--
-- Name: man_powers fk_rails_5d52668e9f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY man_powers
    ADD CONSTRAINT fk_rails_5d52668e9f FOREIGN KEY (program_production_id) REFERENCES program_productions(id);


--
-- Name: mark_spendings fk_rails_62e61b5b81; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mark_spendings
    ADD CONSTRAINT fk_rails_62e61b5b81 FOREIGN KEY (chart_of_account_id) REFERENCES chart_of_accounts(id);


--
-- Name: estimate_sales fk_rails_6b3e22038a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estimate_sales
    ADD CONSTRAINT fk_rails_6b3e22038a FOREIGN KEY (type_of_crop_id) REFERENCES type_of_crops(id);


--
-- Name: cost_oper_machine_cont_details fk_rails_6d557b0b31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machine_cont_details
    ADD CONSTRAINT fk_rails_6d557b0b31 FOREIGN KEY (type_of_service_id) REFERENCES type_of_services(id);


--
-- Name: stru_expense_dets fk_rails_7012db2c88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stru_expense_dets
    ADD CONSTRAINT fk_rails_7012db2c88 FOREIGN KEY (structure_expense_id) REFERENCES structure_expenses(id);


--
-- Name: mark_spendings fk_rails_78b1c0fd6c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mark_spendings
    ADD CONSTRAINT fk_rails_78b1c0fd6c FOREIGN KEY (program_production_id) REFERENCES program_productions(id);


--
-- Name: cost_oper_machine_conts fk_rails_7f7497e005; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machine_conts
    ADD CONSTRAINT fk_rails_7f7497e005 FOREIGN KEY (chart_of_account_id) REFERENCES chart_of_accounts(id);


--
-- Name: supplies fk_rails_9176cf560a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supplies
    ADD CONSTRAINT fk_rails_9176cf560a FOREIGN KEY (program_production_id) REFERENCES program_productions(id);


--
-- Name: type_of_crops fk_rails_a22b887c55; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY type_of_crops
    ADD CONSTRAINT fk_rails_a22b887c55 FOREIGN KEY (variety_id) REFERENCES varieties(id);


--
-- Name: machines fk_rails_b1754f7dcb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY machines
    ADD CONSTRAINT fk_rails_b1754f7dcb FOREIGN KEY (fuel_id) REFERENCES fuels(id);


--
-- Name: people fk_rails_b39dcee1e8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people
    ADD CONSTRAINT fk_rails_b39dcee1e8 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: manu_indi_expenses fk_rails_b57101e88f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manu_indi_expenses
    ADD CONSTRAINT fk_rails_b57101e88f FOREIGN KEY (chart_of_account_id) REFERENCES chart_of_accounts(id);


--
-- Name: cost_oper_machine_details fk_rails_cdfd4ce8e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machine_details
    ADD CONSTRAINT fk_rails_cdfd4ce8e3 FOREIGN KEY (implement_id) REFERENCES implements(id);


--
-- Name: cost_oper_machine_cont_details fk_rails_d9de9fe79c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cost_oper_machine_cont_details
    ADD CONSTRAINT fk_rails_d9de9fe79c FOREIGN KEY (implement_id) REFERENCES implements(id);


--
-- Name: estimate_sales fk_rails_dcef68aade; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estimate_sales
    ADD CONSTRAINT fk_rails_dcef68aade FOREIGN KEY (farming_plot_id) REFERENCES farming_plots(id);


--
-- Name: type_of_services fk_rails_dedc6354af; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY type_of_services
    ADD CONSTRAINT fk_rails_dedc6354af FOREIGN KEY (unit_of_measurement_id) REFERENCES unit_of_measurements(id);


--
-- Name: man_power_details fk_rails_e10ea955d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY man_power_details
    ADD CONSTRAINT fk_rails_e10ea955d9 FOREIGN KEY (person_id) REFERENCES people(id);


--
-- Name: man_power_details fk_rails_e261349860; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY man_power_details
    ADD CONSTRAINT fk_rails_e261349860 FOREIGN KEY (type_of_work_id) REFERENCES type_of_works(id);


--
-- Name: program_productions fk_rails_e975a7b30d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_productions
    ADD CONSTRAINT fk_rails_e975a7b30d FOREIGN KEY (estimate_sale_id) REFERENCES estimate_sales(id);


--
-- Name: models fk_rails_ec6eb36a24; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY models
    ADD CONSTRAINT fk_rails_ec6eb36a24 FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: structure_expenses fk_rails_f6715954ae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY structure_expenses
    ADD CONSTRAINT fk_rails_f6715954ae FOREIGN KEY (program_production_id) REFERENCES program_productions(id);


--
-- Name: implements fk_rails_f85c9abf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY implements
    ADD CONSTRAINT fk_rails_f85c9abf0b FOREIGN KEY (machine_id) REFERENCES machines(id);


--
-- Name: machines fk_rails_fa5dcebe42; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY machines
    ADD CONSTRAINT fk_rails_fa5dcebe42 FOREIGN KEY (brand_id) REFERENCES brands(id);


--
-- Name: manu_indi_expense_dets fk_rails_ff5dfa2211; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manu_indi_expense_dets
    ADD CONSTRAINT fk_rails_ff5dfa2211 FOREIGN KEY (manu_indi_expense_id) REFERENCES manu_indi_expenses(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20161105233538'), ('20161105233539'), ('20161105233540'), ('20161106005358'), ('20161106011930'), ('20161106012957'), ('20161106013911'), ('20161106013912'), ('20161106020210'), ('20161107210501'), ('20161111032429'), ('20161111032430'), ('20161111033338'), ('20161119012645'), ('20161119012715'), ('20161119013108'), ('20161125003924'), ('20161125014256'), ('20161125014257'), ('20161209001334'), ('20170307231658'), ('20170307232241'), ('20170307233605'), ('20170414040515'), ('20170414040818'), ('20170414041458'), ('20170414042023'), ('20170414043035'), ('20170414043814'), ('20170414044327'), ('20170414050230'), ('20170421021434'), ('20170421021848'), ('20170421022020'), ('20170421023430'), ('20170421025355'), ('20170421032401'), ('20170421173139'), ('20170424001605'), ('20170426012021'), ('20170515153358'), ('20170520153215'), ('20170627015245'), ('20170918231409'), ('20170919000408'), ('20170922014853'), ('20171022150009'), ('20171022195918'), ('20171215223812'), ('20171217225905'), ('20180114222223'), ('20180203042703'), ('20180203044506'), ('20180210162558'), ('20180210175917'), ('20180210185920'), ('20180214005822'), ('20180217031950'), ('20180223014135'), ('20180410023152'), ('20180410041647');


