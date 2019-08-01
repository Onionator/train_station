--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.cities (
    city_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.cities OWNER TO "Guest";

--
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.cities_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_city_id_seq OWNER TO "Guest";

--
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.cities_city_id_seq OWNED BY public.cities.city_id;


--
-- Name: riders; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.riders (
    rider_id integer NOT NULL,
    train_id integer NOT NULL
);


ALTER TABLE public.riders OWNER TO "Guest";

--
-- Name: riders_rider_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.riders_rider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.riders_rider_id_seq OWNER TO "Guest";

--
-- Name: riders_rider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.riders_rider_id_seq OWNED BY public.riders.rider_id;


--
-- Name: stops; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.stops (
    stop_id integer NOT NULL,
    train_id integer NOT NULL,
    city_id integer NOT NULL
);


ALTER TABLE public.stops OWNER TO "Guest";

--
-- Name: stops_stop_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.stops_stop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stops_stop_id_seq OWNER TO "Guest";

--
-- Name: stops_stop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.stops_stop_id_seq OWNED BY public.stops.stop_id;


--
-- Name: trains; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.trains (
    train_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.trains OWNER TO "Guest";

--
-- Name: trains_train_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.trains_train_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trains_train_id_seq OWNER TO "Guest";

--
-- Name: trains_train_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.trains_train_id_seq OWNED BY public.trains.train_id;


--
-- Name: cities city_id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);


--
-- Name: riders rider_id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.riders ALTER COLUMN rider_id SET DEFAULT nextval('public.riders_rider_id_seq'::regclass);


--
-- Name: stops stop_id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.stops ALTER COLUMN stop_id SET DEFAULT nextval('public.stops_stop_id_seq'::regclass);


--
-- Name: trains train_id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.trains ALTER COLUMN train_id SET DEFAULT nextval('public.trains_train_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.cities (city_id, name) FROM stdin;
1	Boise
2	Redding
3	Portland
4	Providence
5	Seattle
6	Spokane
\.


--
-- Data for Name: riders; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.riders (rider_id, train_id) FROM stdin;
\.


--
-- Data for Name: stops; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.stops (stop_id, train_id, city_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	2	2
8	2	3
9	2	4
10	2	5
11	2	6
12	3	3
13	3	4
14	3	5
15	3	6
16	4	4
17	4	5
18	4	6
19	5	5
20	5	6
\.


--
-- Data for Name: trains; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.trains (train_id, name) FROM stdin;
1	Cord
2	Ben
3	Dan
4	Garland
5	Josh
\.


--
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.cities_city_id_seq', 6, true);


--
-- Name: riders_rider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.riders_rider_id_seq', 1, false);


--
-- Name: stops_stop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.stops_stop_id_seq', 20, true);


--
-- Name: trains_train_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.trains_train_id_seq', 5, true);


--
-- Name: cities cities_pk; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pk PRIMARY KEY (city_id);


--
-- Name: riders riders_pk; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.riders
    ADD CONSTRAINT riders_pk PRIMARY KEY (rider_id);


--
-- Name: stops stops_pk; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.stops
    ADD CONSTRAINT stops_pk PRIMARY KEY (stop_id);


--
-- Name: trains trains_pk; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.trains
    ADD CONSTRAINT trains_pk PRIMARY KEY (train_id);


--
-- Name: riders riders_fk0; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.riders
    ADD CONSTRAINT riders_fk0 FOREIGN KEY (train_id) REFERENCES public.trains(train_id);


--
-- Name: stops stops_fk0; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.stops
    ADD CONSTRAINT stops_fk0 FOREIGN KEY (train_id) REFERENCES public.trains(train_id);


--
-- Name: stops stops_fk1; Type: FK CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.stops
    ADD CONSTRAINT stops_fk1 FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


--
-- PostgreSQL database dump complete
--

