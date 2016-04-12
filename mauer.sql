--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.4.1
-- Started on 2016-04-12 19:14:28

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2080 (class 1262 OID 12135)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Slovak_Slovakia.1250' LC_CTYPE = 'Slovak_Slovakia.1250';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2081 (class 1262 OID 12135)
-- Dependencies: 2080
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 188 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2084 (class 0 OID 0)
-- Dependencies: 188
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 187 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2085 (class 0 OID 0)
-- Dependencies: 187
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 16684)
-- Name: dodavatel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dodavatel (
    id integer NOT NULL,
    nazov character varying(25) NOT NULL,
    adresa character varying(50) NOT NULL
);


ALTER TABLE dodavatel OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 16682)
-- Name: dodavatel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dodavatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dodavatel_id_seq OWNER TO postgres;

--
-- TOC entry 2086 (class 0 OID 0)
-- Dependencies: 176
-- Name: dodavatel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dodavatel_id_seq OWNED BY dodavatel.id;


--
-- TOC entry 182 (class 1259 OID 16706)
-- Name: mnozstvo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mnozstvo (
    id_sklad integer NOT NULL,
    id_dodavatel integer NOT NULL,
    id_tovar integer NOT NULL,
    pocet integer NOT NULL
);


ALTER TABLE mnozstvo OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16700)
-- Name: obchod; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE obchod (
    id integer NOT NULL,
    nazov character varying(25) NOT NULL,
    adresa character varying(50) NOT NULL
);


ALTER TABLE obchod OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16698)
-- Name: obchod_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE obchod_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE obchod_id_seq OWNER TO postgres;

--
-- TOC entry 2087 (class 0 OID 0)
-- Dependencies: 180
-- Name: obchod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE obchod_id_seq OWNED BY obchod.id;


--
-- TOC entry 184 (class 1259 OID 16726)
-- Name: objednavka; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE objednavka (
    id integer NOT NULL,
    id_obchod integer NOT NULL,
    datum date NOT NULL,
    komplet boolean NOT NULL
);


ALTER TABLE objednavka OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16724)
-- Name: objednavka_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE objednavka_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE objednavka_id_seq OWNER TO postgres;

--
-- TOC entry 2088 (class 0 OID 0)
-- Dependencies: 183
-- Name: objednavka_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE objednavka_id_seq OWNED BY objednavka.id;


--
-- TOC entry 186 (class 1259 OID 16772)
-- Name: polozka; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE polozka (
    id integer NOT NULL,
    id_objednavka integer NOT NULL,
    id_dodavatel integer NOT NULL,
    id_tovar integer NOT NULL,
    id_sklad integer,
    id_skladnik integer,
    pocet integer NOT NULL
);


ALTER TABLE polozka OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16770)
-- Name: polozka_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE polozka_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE polozka_id_seq OWNER TO postgres;

--
-- TOC entry 2089 (class 0 OID 0)
-- Dependencies: 185
-- Name: polozka_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE polozka_id_seq OWNED BY polozka.id;


--
-- TOC entry 173 (class 1259 OID 16668)
-- Name: sklad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sklad (
    id integer NOT NULL,
    nazov character varying(25) NOT NULL,
    adresa character varying(50) NOT NULL
);


ALTER TABLE sklad OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 16666)
-- Name: sklad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sklad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sklad_id_seq OWNER TO postgres;

--
-- TOC entry 2090 (class 0 OID 0)
-- Dependencies: 172
-- Name: sklad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sklad_id_seq OWNED BY sklad.id;


--
-- TOC entry 179 (class 1259 OID 16692)
-- Name: skladnik; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE skladnik (
    id integer NOT NULL,
    meno character varying(25) NOT NULL,
    priezvisko character varying(25) NOT NULL,
    datum date NOT NULL
);


ALTER TABLE skladnik OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16690)
-- Name: skladnik_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE skladnik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skladnik_id_seq OWNER TO postgres;

--
-- TOC entry 2091 (class 0 OID 0)
-- Dependencies: 178
-- Name: skladnik_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE skladnik_id_seq OWNED BY skladnik.id;


--
-- TOC entry 175 (class 1259 OID 16676)
-- Name: tovar; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tovar (
    id integer NOT NULL,
    nazov character varying(25) NOT NULL,
    druh character varying(25) NOT NULL,
    pocet character varying(25) NOT NULL
);


ALTER TABLE tovar OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16674)
-- Name: tovar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tovar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tovar_id_seq OWNER TO postgres;

--
-- TOC entry 2092 (class 0 OID 0)
-- Dependencies: 174
-- Name: tovar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tovar_id_seq OWNED BY tovar.id;


--
-- TOC entry 1924 (class 2604 OID 16687)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dodavatel ALTER COLUMN id SET DEFAULT nextval('dodavatel_id_seq'::regclass);


--
-- TOC entry 1926 (class 2604 OID 16703)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY obchod ALTER COLUMN id SET DEFAULT nextval('obchod_id_seq'::regclass);


--
-- TOC entry 1927 (class 2604 OID 16729)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY objednavka ALTER COLUMN id SET DEFAULT nextval('objednavka_id_seq'::regclass);


--
-- TOC entry 1928 (class 2604 OID 16775)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY polozka ALTER COLUMN id SET DEFAULT nextval('polozka_id_seq'::regclass);


--
-- TOC entry 1922 (class 2604 OID 16671)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sklad ALTER COLUMN id SET DEFAULT nextval('sklad_id_seq'::regclass);


--
-- TOC entry 1925 (class 2604 OID 16695)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY skladnik ALTER COLUMN id SET DEFAULT nextval('skladnik_id_seq'::regclass);


--
-- TOC entry 1923 (class 2604 OID 16679)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tovar ALTER COLUMN id SET DEFAULT nextval('tovar_id_seq'::regclass);


--
-- TOC entry 2066 (class 0 OID 16684)
-- Dependencies: 177
-- Data for Name: dodavatel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dodavatel (id, nazov, adresa) FROM stdin;
2	NayElektro	Panonska 1
1	TescoStore	Mimozemska 9
3	Tatra	Starohajska 5
4	Mauer	Zeleznicna 78
\.


--
-- TOC entry 2093 (class 0 OID 0)
-- Dependencies: 176
-- Name: dodavatel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dodavatel_id_seq', 4, true);


--
-- TOC entry 2071 (class 0 OID 16706)
-- Dependencies: 182
-- Data for Name: mnozstvo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mnozstvo (id_sklad, id_dodavatel, id_tovar, pocet) FROM stdin;
1	2	2	10
2	2	2	2
2	1	1	3
1	3	3	75
4	1	2	25
5	1	4	150
5	3	3	1000
5	4	1	500
\.


--
-- TOC entry 2070 (class 0 OID 16700)
-- Dependencies: 181
-- Data for Name: obchod; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY obchod (id, nazov, adresa) FROM stdin;
1	Tesco	Panonska 4
2	Lidl	Jiraskova 5
3	Billa	OD Slimak
4	Lidl	Starohajska 7
5	Vibratory	Philadelfia
\.


--
-- TOC entry 2094 (class 0 OID 0)
-- Dependencies: 180
-- Name: obchod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('obchod_id_seq', 5, true);


--
-- TOC entry 2073 (class 0 OID 16726)
-- Dependencies: 184
-- Data for Name: objednavka; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY objednavka (id, id_obchod, datum, komplet) FROM stdin;
11	3	2016-04-11	t
12	1	2016-04-11	f
13	3	2016-04-11	f
16	5	2016-04-12	f
15	2	2016-04-11	t
\.


--
-- TOC entry 2095 (class 0 OID 0)
-- Dependencies: 183
-- Name: objednavka_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('objednavka_id_seq', 16, true);


--
-- TOC entry 2075 (class 0 OID 16772)
-- Dependencies: 186
-- Data for Name: polozka; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY polozka (id, id_objednavka, id_dodavatel, id_tovar, id_sklad, id_skladnik, pocet) FROM stdin;
3	12	1	1	\N	\N	10
5	12	3	3	\N	\N	10
6	12	1	3	\N	\N	15
2	11	2	2	2	4	1
7	13	1	1	\N	\N	1
8	13	1	2	\N	\N	1
9	13	3	1	\N	\N	1
10	13	3	3	\N	\N	2
11	16	4	1	\N	\N	50
12	16	2	2	\N	\N	2
14	16	3	3	\N	\N	150
15	16	1	4	\N	\N	10
16	15	1	1	\N	\N	10
17	15	3	3	\N	\N	12
18	15	2	2	\N	\N	5
\.


--
-- TOC entry 2096 (class 0 OID 0)
-- Dependencies: 185
-- Name: polozka_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('polozka_id_seq', 18, true);


--
-- TOC entry 2062 (class 0 OID 16668)
-- Dependencies: 173
-- Data for Name: sklad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sklad (id, nazov, adresa) FROM stdin;
1	Moj sklad	Kopcany
2	Smetisko	Panonska 90
4	GigaStore	Slnieckova 58
5	To je jedno	Kopcany
\.


--
-- TOC entry 2097 (class 0 OID 0)
-- Dependencies: 172
-- Name: sklad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sklad_id_seq', 5, true);


--
-- TOC entry 2068 (class 0 OID 16692)
-- Dependencies: 179
-- Data for Name: skladnik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY skladnik (id, meno, priezvisko, datum) FROM stdin;
1	Martin	Mauer	2015-04-01
3	Eleonora	Metrixova	2002-12-01
4	Korilin	Micvieva	2008-06-01
6	Anakonda	Mauer	2016-10-01
\.


--
-- TOC entry 2098 (class 0 OID 0)
-- Dependencies: 178
-- Name: skladnik_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('skladnik_id_seq', 6, true);


--
-- TOC entry 2064 (class 0 OID 16676)
-- Dependencies: 175
-- Data for Name: tovar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tovar (id, nazov, druh, pocet) FROM stdin;
1	Banany	Ovocie	kilogramov
2	Pracka	Elektro	kusov
3	Mlieko	Potraviny	litrov
4	Jablka	Ovocie	kusov
\.


--
-- TOC entry 2099 (class 0 OID 0)
-- Dependencies: 174
-- Name: tovar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tovar_id_seq', 4, true);


--
-- TOC entry 1934 (class 2606 OID 16689)
-- Name: dodavatel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dodavatel
    ADD CONSTRAINT dodavatel_pkey PRIMARY KEY (id);


--
-- TOC entry 1938 (class 2606 OID 16705)
-- Name: obchod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY obchod
    ADD CONSTRAINT obchod_pkey PRIMARY KEY (id);


--
-- TOC entry 1940 (class 2606 OID 16731)
-- Name: objednavka_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY objednavka
    ADD CONSTRAINT objednavka_pkey PRIMARY KEY (id);


--
-- TOC entry 1942 (class 2606 OID 16777)
-- Name: polozka_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY polozka
    ADD CONSTRAINT polozka_pkey PRIMARY KEY (id);


--
-- TOC entry 1930 (class 2606 OID 16673)
-- Name: sklad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sklad
    ADD CONSTRAINT sklad_pkey PRIMARY KEY (id);


--
-- TOC entry 1936 (class 2606 OID 16697)
-- Name: skladnik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY skladnik
    ADD CONSTRAINT skladnik_pkey PRIMARY KEY (id);


--
-- TOC entry 1932 (class 2606 OID 16681)
-- Name: tovar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tovar
    ADD CONSTRAINT tovar_pkey PRIMARY KEY (id);


--
-- TOC entry 1944 (class 2606 OID 16714)
-- Name: mnozstvo_id_dodavatel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mnozstvo
    ADD CONSTRAINT mnozstvo_id_dodavatel_fkey FOREIGN KEY (id_dodavatel) REFERENCES dodavatel(id);


--
-- TOC entry 1943 (class 2606 OID 16709)
-- Name: mnozstvo_id_sklad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mnozstvo
    ADD CONSTRAINT mnozstvo_id_sklad_fkey FOREIGN KEY (id_sklad) REFERENCES sklad(id);


--
-- TOC entry 1945 (class 2606 OID 16719)
-- Name: mnozstvo_id_tovar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mnozstvo
    ADD CONSTRAINT mnozstvo_id_tovar_fkey FOREIGN KEY (id_tovar) REFERENCES tovar(id);


--
-- TOC entry 1946 (class 2606 OID 16732)
-- Name: objednavka_id_obchod_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY objednavka
    ADD CONSTRAINT objednavka_id_obchod_fkey FOREIGN KEY (id_obchod) REFERENCES obchod(id);


--
-- TOC entry 1948 (class 2606 OID 16783)
-- Name: polozka_id_dodavatel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY polozka
    ADD CONSTRAINT polozka_id_dodavatel_fkey FOREIGN KEY (id_dodavatel) REFERENCES dodavatel(id);


--
-- TOC entry 1947 (class 2606 OID 16778)
-- Name: polozka_id_objednavka_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY polozka
    ADD CONSTRAINT polozka_id_objednavka_fkey FOREIGN KEY (id_objednavka) REFERENCES objednavka(id);


--
-- TOC entry 1950 (class 2606 OID 16793)
-- Name: polozka_id_sklad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY polozka
    ADD CONSTRAINT polozka_id_sklad_fkey FOREIGN KEY (id_sklad) REFERENCES sklad(id);


--
-- TOC entry 1951 (class 2606 OID 16798)
-- Name: polozka_id_skladnik_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY polozka
    ADD CONSTRAINT polozka_id_skladnik_fkey FOREIGN KEY (id_skladnik) REFERENCES skladnik(id);


--
-- TOC entry 1949 (class 2606 OID 16788)
-- Name: polozka_id_tovar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY polozka
    ADD CONSTRAINT polozka_id_tovar_fkey FOREIGN KEY (id_tovar) REFERENCES tovar(id);


--
-- TOC entry 2083 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-04-12 19:14:28

--
-- PostgreSQL database dump complete
--

