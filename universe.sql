--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(55) NOT NULL,
    diameter numeric(10,2) NOT NULL,
    description text,
    discovered_year integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(55) NOT NULL,
    planet_id integer,
    diameter numeric(3,1) NOT NULL,
    discovered_year integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(55) NOT NULL,
    population integer,
    number_of_moons integer,
    has_life boolean,
    has_water boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planetoid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planetoid (
    planetoid_id integer NOT NULL,
    name character varying(55) NOT NULL,
    discovered_year integer
);


ALTER TABLE public.planetoid OWNER TO freecodecamp;

--
-- Name: planetoids_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planetoids_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planetoids_id_seq OWNER TO freecodecamp;

--
-- Name: planetoids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planetoids_id_seq OWNED BY public.planetoid.planetoid_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(55) NOT NULL,
    galaxy_id integer,
    type character varying(30),
    discovered_year integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planetoid planetoid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetoid ALTER COLUMN planetoid_id SET DEFAULT nextval('public.planetoids_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 10000000.23, 'Planet earths galaxy', NULL);
INSERT INTO public.galaxy VALUES (2, 'galaxy2', 10000000.23, 'some description', NULL);
INSERT INTO public.galaxy VALUES (3, 'galaxy3', 10000000.23, 'some description', NULL);
INSERT INTO public.galaxy VALUES (4, 'galaxy4', 10000000.23, 'some description', NULL);
INSERT INTO public.galaxy VALUES (5, 'galaxy5', 10000000.23, 'some description', NULL);
INSERT INTO public.galaxy VALUES (6, 'galaxy6', 10000000.23, 'some description', NULL);
INSERT INTO public.galaxy VALUES (7, 'galaxy 1', 10000000.23, 'some description', 1900);
INSERT INTO public.galaxy VALUES (8, 'galaxy 2', 10000000.23, 'some description', 1900);
INSERT INTO public.galaxy VALUES (9, 'galaxy 3', 10000000.23, 'some description', 1900);
INSERT INTO public.galaxy VALUES (10, 'galaxy 4', 10000000.23, 'some description', 1900);
INSERT INTO public.galaxy VALUES (11, 'galaxy 5', 10000000.23, 'some description', 1900);
INSERT INTO public.galaxy VALUES (12, 'galaxy 6', 10000000.23, 'some description', 1900);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'moon 1', 1, 20.2, 1901);
INSERT INTO public.moon VALUES (4, 'moon 2', 1, 20.2, 1902);
INSERT INTO public.moon VALUES (5, 'moon 3', 1, 20.2, 1903);
INSERT INTO public.moon VALUES (6, 'moon 4', 1, 20.2, 1904);
INSERT INTO public.moon VALUES (7, 'moon 5', 1, 20.2, 1905);
INSERT INTO public.moon VALUES (8, 'moon 6', 1, 20.2, 1906);
INSERT INTO public.moon VALUES (9, 'moon 7', 1, 20.2, 1907);
INSERT INTO public.moon VALUES (10, 'moon 8', 1, 20.2, 1908);
INSERT INTO public.moon VALUES (11, 'moon 9', 1, 20.2, 1909);
INSERT INTO public.moon VALUES (12, 'moon 10', 1, 20.2, 19010);
INSERT INTO public.moon VALUES (13, 'moon 11', 1, 20.2, 19011);
INSERT INTO public.moon VALUES (14, 'moon 12', 1, 20.2, 19012);
INSERT INTO public.moon VALUES (15, 'moon 13', 1, 20.2, 19013);
INSERT INTO public.moon VALUES (16, 'moon 14', 1, 20.2, 19014);
INSERT INTO public.moon VALUES (17, 'moon 15', 1, 20.2, 19015);
INSERT INTO public.moon VALUES (18, 'moon 16', 1, 20.2, 19016);
INSERT INTO public.moon VALUES (19, 'moon 17', 1, 20.2, 19017);
INSERT INTO public.moon VALUES (20, 'moon 18', 1, 20.2, 19018);
INSERT INTO public.moon VALUES (21, 'moon 19', 1, 20.2, 19019);
INSERT INTO public.moon VALUES (22, 'moon 20', 1, 20.2, 19020);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet 1', 100000, 2, false, true, 1);
INSERT INTO public.planet VALUES (2, 'planet 2', 100000, 2, false, true, 1);
INSERT INTO public.planet VALUES (3, 'planet 3', 100000, 2, false, true, 1);
INSERT INTO public.planet VALUES (4, 'planet 4', 100000, 2, false, true, 1);
INSERT INTO public.planet VALUES (5, 'planet 5', 100000, 2, false, true, 1);
INSERT INTO public.planet VALUES (6, 'planet 6', 100000, 2, false, true, 1);
INSERT INTO public.planet VALUES (7, 'planet 7', 100000, 2, false, true, 1);
INSERT INTO public.planet VALUES (8, 'planet 8', 100000, 2, false, true, 1);
INSERT INTO public.planet VALUES (9, 'planet 9', 100000, 2, false, true, 1);
INSERT INTO public.planet VALUES (10, 'planet 10', 100000, 2, false, true, 1);
INSERT INTO public.planet VALUES (11, 'planet 11', 100000, 2, false, true, 1);
INSERT INTO public.planet VALUES (12, 'planet 12', 100000, 2, false, true, 1);
INSERT INTO public.planet VALUES (13, 'earth', NULL, NULL, NULL, NULL, 1);


--
-- Data for Name: planetoid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planetoid VALUES (1, 'planetoid1', 1900);
INSERT INTO public.planetoid VALUES (2, 'planetoid2', 1900);
INSERT INTO public.planetoid VALUES (3, 'planetoid3', 1900);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'moon1', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'star 1', 1, 'type a', 1900);
INSERT INTO public.star VALUES (3, 'star 2', 2, 'type a', 1900);
INSERT INTO public.star VALUES (4, 'star 3', 3, 'type a', 1900);
INSERT INTO public.star VALUES (5, 'star 4', 4, 'type a', 1900);
INSERT INTO public.star VALUES (6, 'star 5', 5, 'type a', 1900);
INSERT INTO public.star VALUES (7, 'star 6', 6, 'type a', 1900);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planetoids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planetoids_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_discovered_year_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_discovered_year_key UNIQUE (discovered_year);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planetoid planetoids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetoid
    ADD CONSTRAINT planetoids_name_key UNIQUE (name);


--
-- Name: planetoid planetoids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetoid
    ADD CONSTRAINT planetoids_pkey PRIMARY KEY (planetoid_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

