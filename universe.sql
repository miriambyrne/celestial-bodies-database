--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: century_discovered; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.century_discovered (
    century_discovered_id integer NOT NULL,
    prominent_astronomer character varying(30),
    name character varying(30) NOT NULL,
    notes text
);


ALTER TABLE public.century_discovered OWNER TO freecodecamp;

--
-- Name: discovery_century_discovered_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.discovery_century_discovered_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discovery_century_discovered_id_seq OWNER TO freecodecamp;

--
-- Name: discovery_century_discovered_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.discovery_century_discovered_id_seq OWNED BY public.century_discovered.century_discovered_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_black_hole boolean,
    century_discovered_id integer NOT NULL,
    diameter_light_years integer
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
    name character varying(30) NOT NULL,
    miles_from_planet integer,
    days_to_orbit numeric(5,1),
    planet_id integer,
    century_discovered_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    million_miles_from_star integer,
    has_moon boolean,
    star_id integer,
    century_discovered_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_type character varying(30),
    galaxy_id integer,
    century_discovered_id integer NOT NULL,
    star_sun_mass_ratio numeric(5,2)
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
-- Name: century_discovered century_discovered_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.century_discovered ALTER COLUMN century_discovered_id SET DEFAULT nextval('public.discovery_century_discovered_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: century_discovered; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.century_discovered VALUES (1, 'Galileo', '17th', NULL);
INSERT INTO public.century_discovered VALUES (2, 'Herschel', '18th', NULL);
INSERT INTO public.century_discovered VALUES (3, 'Raphael', '19th', NULL);
INSERT INTO public.century_discovered VALUES (4, 'Hubble', '20th', NULL);
INSERT INTO public.century_discovered VALUES (5, 'Cometan', '21st', NULL);
INSERT INTO public.century_discovered VALUES (6, NULL, 'Unknown', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 1, 105700);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', true, 6, 220000);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', true, 2, 50000);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', false, 2, 170000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', false, 1, 60000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', true, 2, 60000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 238900, 27.3, 3, 2);
INSERT INTO public.moon VALUES (2, 'Phobos', 3700, 0.3, 4, 3);
INSERT INTO public.moon VALUES (3, 'Deimos', 14580, 1.3, 4, 3);
INSERT INTO public.moon VALUES (4, 'Europa', 417000, 3.6, 5, 1);
INSERT INTO public.moon VALUES (5, 'Io', 262000, 1.8, 5, 1);
INSERT INTO public.moon VALUES (6, 'Ganymede', 665000, 7.2, 5, 2);
INSERT INTO public.moon VALUES (7, 'Callisto', 1170000, 17.0, 5, 2);
INSERT INTO public.moon VALUES (8, 'Amalthea', 112500, 0.5, 5, 3);
INSERT INTO public.moon VALUES (9, 'Titan', 759000, 16.0, 6, 1);
INSERT INTO public.moon VALUES (10, 'Enceladus', 148000, 1.3, 6, 2);
INSERT INTO public.moon VALUES (11, 'Mimas', 115000, 0.9, 6, 2);
INSERT INTO public.moon VALUES (12, 'Dione', 234500, 2.7, 6, 1);
INSERT INTO public.moon VALUES (13, 'Iapetus', 2213000, 79.0, 6, 1);
INSERT INTO public.moon VALUES (14, 'Tethys', 183000, 1.9, 6, 1);
INSERT INTO public.moon VALUES (15, 'Hyperion', 933000, 21.0, 6, 3);
INSERT INTO public.moon VALUES (16, 'Titania', 270820, 8.7, 7, 2);
INSERT INTO public.moon VALUES (17, 'Oberon', 362000, 13.5, 7, 2);
INSERT INTO public.moon VALUES (18, 'Cupid', 2656983, 266.6, 7, 2);
INSERT INTO public.moon VALUES (19, 'Triton', 220500, 5.9, 8, 3);
INSERT INTO public.moon VALUES (20, 'Thalassa', 15700, 0.3, 8, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 66, false, 7, 6);
INSERT INTO public.planet VALUES (2, 'Venus', 66, false, 7, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 93, true, 7, 6);
INSERT INTO public.planet VALUES (4, 'Mars', 142, true, 7, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 484, true, 7, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 886, true, 7, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 1783, true, 7, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 2795, true, 7, 3);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 97, false, 8, 5);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 33, false, 9, 5);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 5, false, 10, 4);
INSERT INTO public.planet VALUES (12, 'TrES-2b', 3, false, 11, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'UY Scuti', 'Hypergiant', 1, 3, 30.00);
INSERT INTO public.star VALUES (2, 'Alpheratz', 'Double sub-giant', 2, 2, 3.60);
INSERT INTO public.star VALUES (3, 'Rigel', 'Blue supergiant', 1, 2, 21.00);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant', 1, 3, 15.00);
INSERT INTO public.star VALUES (5, 'Beta Trianguli', 'Blue to white giant', 5, 6, 1.65);
INSERT INTO public.star VALUES (6, 'Sirius A', 'A type main sequence', 6, 3, 2.30);
INSERT INTO public.star VALUES (7, 'Sun', 'Yellow dwarf star', 1, 6, 1.00);
INSERT INTO public.star VALUES (8, 'Kepler 452', 'G2 type', 1, 5, 1.04);
INSERT INTO public.star VALUES (9, 'Kepler 186', 'M dwarf', 1, 5, 0.50);
INSERT INTO public.star VALUES (10, 'Proxima Centauri', 'Red dwarf', 1, 4, 0.10);
INSERT INTO public.star VALUES (11, 'GSC 03549-02811', 'Yellow main-sequence', 1, 5, 0.67);


--
-- Name: discovery_century_discovered_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.discovery_century_discovered_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: century_discovered century_discovered_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.century_discovered
    ADD CONSTRAINT century_discovered_name_key UNIQUE (name);


--
-- Name: century_discovered discovery_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.century_discovered
    ADD CONSTRAINT discovery_pkey PRIMARY KEY (century_discovered_id);


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

