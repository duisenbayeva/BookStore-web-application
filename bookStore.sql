--
-- PostgreSQL database dump
--

-- Dumped from database version 8.4.17
-- Dumped by pg_dump version 9.2.4
-- Started on 2013-07-28 15:53:51

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 470 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


ALTER PROCEDURAL LANGUAGE plpgsql OWNER TO postgres;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 149 (class 1259 OID 24685)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Users" (
    id integer NOT NULL,
    username character varying,
    passwd character varying,
    admin integer DEFAULT 0
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 148 (class 1259 OID 24683)
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO postgres;

--
-- TOC entry 1839 (class 0 OID 0)
-- Dependencies: 148
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;


--
-- TOC entry 140 (class 1259 OID 24576)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE authors (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 141 (class 1259 OID 24582)
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO postgres;

--
-- TOC entry 1840 (class 0 OID 0)
-- Dependencies: 141
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE authors_id_seq OWNED BY authors.id;


--
-- TOC entry 142 (class 1259 OID 24584)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying,
    author_id integer,
    genre_id integer,
    publisher_id integer,
    year integer,
    price integer
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 143 (class 1259 OID 24590)
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO postgres;

--
-- TOC entry 1841 (class 0 OID 0)
-- Dependencies: 143
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- TOC entry 144 (class 1259 OID 24592)
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE genre (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 145 (class 1259 OID 24598)
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_id_seq OWNER TO postgres;

--
-- TOC entry 1842 (class 0 OID 0)
-- Dependencies: 145
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE genre_id_seq OWNED BY genre.id;


--
-- TOC entry 146 (class 1259 OID 24600)
-- Name: publishers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE publishers (
    id integer NOT NULL,
    title character varying,
    address character varying
);


ALTER TABLE public.publishers OWNER TO postgres;

--
-- TOC entry 147 (class 1259 OID 24606)
-- Name: publishers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE publishers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publishers_id_seq OWNER TO postgres;

--
-- TOC entry 1843 (class 0 OID 0)
-- Dependencies: 147
-- Name: publishers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE publishers_id_seq OWNED BY publishers.id;


--
-- TOC entry 1805 (class 2604 OID 24688)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);


--
-- TOC entry 1801 (class 2604 OID 24608)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);


--
-- TOC entry 1802 (class 2604 OID 24609)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- TOC entry 1803 (class 2604 OID 24610)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY genre ALTER COLUMN id SET DEFAULT nextval('genre_id_seq'::regclass);


--
-- TOC entry 1804 (class 2604 OID 24611)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY publishers ALTER COLUMN id SET DEFAULT nextval('publishers_id_seq'::regclass);


--
-- TOC entry 1831 (class 0 OID 24685)
-- Dependencies: 149
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Users" (id, username, passwd, admin) VALUES (1, 'uname1', 'passwd1', 1);
INSERT INTO "Users" (id, username, passwd, admin) VALUES (2, 'uname2', 'passwd2', 0);
INSERT INTO "Users" (id, username, passwd, admin) VALUES (3, 'uname3', 'passwd3', 0);
INSERT INTO "Users" (id, username, passwd, admin) VALUES (4, 'uname4', 'pass4', 0);
INSERT INTO "Users" (id, username, passwd, admin) VALUES (9, 'username2', 'pass2', 0);
INSERT INTO "Users" (id, username, passwd, admin) VALUES (10, 'user2', 'pass2', 0);
INSERT INTO "Users" (id, username, passwd, admin) VALUES (11, 'uname', 'pass', 0);
INSERT INTO "Users" (id, username, passwd, admin) VALUES (12, 'user1', 'qwe', 0);
INSERT INTO "Users" (id, username, passwd, admin) VALUES (13, 'u2', 'p2', 0);
INSERT INTO "Users" (id, username, passwd, admin) VALUES (14, 'u3', 'qw', 0);
INSERT INTO "Users" (id, username, passwd, admin) VALUES (15, 'user3', 'pass3', 0);
INSERT INTO "Users" (id, username, passwd, admin) VALUES (16, 'u4', 'p4', 0);
INSERT INTO "Users" (id, username, passwd, admin) VALUES (17, 'u5', 'p5', 0);
INSERT INTO "Users" (id, username, passwd, admin) VALUES (18, 'u6', 'p6', 0);


--
-- TOC entry 1844 (class 0 OID 0)
-- Dependencies: 148
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Users_id_seq"', 18, true);


--
-- TOC entry 1822 (class 0 OID 24576)
-- Dependencies: 140
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO authors (id, name) VALUES (1, 'Auezov');
INSERT INTO authors (id, name) VALUES (3, 'Abay');
INSERT INTO authors (id, name) VALUES (11, 'coelho1');
INSERT INTO authors (id, name) VALUES (21, 'Remark');


--
-- TOC entry 1845 (class 0 OID 0)
-- Dependencies: 141
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('authors_id_seq', 21, true);


--
-- TOC entry 1824 (class 0 OID 24584)
-- Dependencies: 142
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO books (id, title, author_id, genre_id, publisher_id, year, price) VALUES (2, 'Put'' Abaya', 1, 1, 1, 2001, 3000);
INSERT INTO books (id, title, author_id, genre_id, publisher_id, year, price) VALUES (3, 'Kara sozder', 3, 1, 1, 2003, 2000);
INSERT INTO books (id, title, author_id, genre_id, publisher_id, year, price) VALUES (11, 'title1', 11, 18, 7, 2005, 2500);
INSERT INTO books (id, title, author_id, genre_id, publisher_id, year, price) VALUES (12, 'title4', 11, 17, 7, 2006, 3700);
INSERT INTO books (id, title, author_id, genre_id, publisher_id, year, price) VALUES (13, 'title2', 3, 17, 9, 2010, 2000);


--
-- TOC entry 1846 (class 0 OID 0)
-- Dependencies: 143
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('books_id_seq', 13, true);


--
-- TOC entry 1826 (class 0 OID 24592)
-- Dependencies: 144
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO genre (id, title) VALUES (17, 'comedy');
INSERT INTO genre (id, title) VALUES (18, 'fantasy');
INSERT INTO genre (id, title) VALUES (19, 'scientific');
INSERT INTO genre (id, title) VALUES (1, 'literary');


--
-- TOC entry 1847 (class 0 OID 0)
-- Dependencies: 145
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('genre_id_seq', 19, true);


--
-- TOC entry 1828 (class 0 OID 24600)
-- Dependencies: 146
-- Data for Name: publishers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO publishers (id, title, address) VALUES (1, 'Atamura', 'Tole bi 8');
INSERT INTO publishers (id, title, address) VALUES (9, 'Mektep', 'auezova33');
INSERT INTO publishers (id, title, address) VALUES (7, 'Mektep2', 'gagarina 21');


--
-- TOC entry 1848 (class 0 OID 0)
-- Dependencies: 147
-- Name: publishers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('publishers_id_seq', 10, true);


--
-- TOC entry 1816 (class 2606 OID 24694)
-- Name: Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- TOC entry 1818 (class 2606 OID 24696)
-- Name: Users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_username_key" UNIQUE (username);


--
-- TOC entry 1808 (class 2606 OID 24613)
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- TOC entry 1810 (class 2606 OID 24615)
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 1812 (class 2606 OID 24617)
-- Name: genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- TOC entry 1814 (class 2606 OID 24619)
-- Name: publishers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (id);


--
-- TOC entry 1819 (class 2606 OID 24620)
-- Name: author_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY books
    ADD CONSTRAINT author_id_fk FOREIGN KEY (author_id) REFERENCES authors(id);


--
-- TOC entry 1820 (class 2606 OID 24625)
-- Name: genre_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY books
    ADD CONSTRAINT genre_id_fk FOREIGN KEY (genre_id) REFERENCES genre(id);


--
-- TOC entry 1821 (class 2606 OID 24630)
-- Name: publisher_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY books
    ADD CONSTRAINT publisher_id_fk FOREIGN KEY (publisher_id) REFERENCES publishers(id);


--
-- TOC entry 1838 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2013-07-28 15:53:53

--
-- PostgreSQL database dump complete
--

