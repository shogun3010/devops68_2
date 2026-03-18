--
-- PostgreSQL database dump
--

\restrict n6n2deinjdbtPm1UeZqKC8V98Ny4cHSMxXlj0nqRhvfqm5jFLClrDhdsNqavFjz

-- Dumped from database version 17.9
-- Dumped by pg_dump version 17.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: update_modified_column(); Type: FUNCTION; Schema: public; Owner: bookstore_user
--

CREATE FUNCTION public.update_modified_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.update_modified_column() OWNER TO bookstore_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: books; Type: TABLE; Schema: public; Owner: bookstore_user
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    author character varying(255),
    isbn character varying(50),
    year integer,
    price numeric(10,2),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.books OWNER TO bookstore_user;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: bookstore_user
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_id_seq OWNER TO bookstore_user;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bookstore_user
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: bookstore_user
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: bookstore_user
--

COPY public.books (id, title, author, isbn, year, price, created_at, updated_at) FROM stdin;
1	Fundamental of Deep Learning in Practice	Nuttachot Promrit and Sajjaporn Waijanya	978-1234567890	2023	599.00	2026-03-18 00:29:00.715935+00	2026-03-18 00:29:00.715935+00
2	Practical DevOps and Cloud Engineering	Nuttachot Promrit	978-0987654321	2024	500.00	2026-03-18 00:29:00.715935+00	2026-03-18 00:29:00.715935+00
3	Mastering Golang for E-commerce Back End Development	Nuttachot Promrit	978-1111222233	2023	450.00	2026-03-18 00:29:00.715935+00	2026-03-18 00:29:00.715935+00
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bookstore_user
--

SELECT pg_catalog.setval('public.books_id_seq', 3, true);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: bookstore_user
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: idx_books_title; Type: INDEX; Schema: public; Owner: bookstore_user
--

CREATE INDEX idx_books_title ON public.books USING btree (title);


--
-- Name: books update_books_modtime; Type: TRIGGER; Schema: public; Owner: bookstore_user
--

CREATE TRIGGER update_books_modtime BEFORE UPDATE ON public.books FOR EACH ROW EXECUTE FUNCTION public.update_modified_column();


--
-- PostgreSQL database dump complete
--

\unrestrict n6n2deinjdbtPm1UeZqKC8V98Ny4cHSMxXlj0nqRhvfqm5jFLClrDhdsNqavFjz

