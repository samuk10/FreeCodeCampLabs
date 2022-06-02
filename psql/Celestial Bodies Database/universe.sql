--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

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
    galaxy_id bigint NOT NULL,
    name character varying(100) NOT NULL,
    population_in_millions integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    number_of_planets numeric NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
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
-- Name: meteor; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.meteor (
    meteor_id bigint NOT NULL,
    galaxy_id integer,
    name character varying(100) NOT NULL,
    time_to_die integer NOT NULL,
    speed_light_years integer NOT NULL
);


ALTER TABLE public.meteor OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.meteor_meteor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meteor_meteor_id_seq OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.meteor_meteor_id_seq OWNED BY public.meteor.meteor_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id bigint NOT NULL,
    planet_id integer,
    name character varying(100) NOT NULL,
    population_in_millions integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean NOT NULL,
    has_water boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
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
    planet_id bigint NOT NULL,
    star_id integer,
    name character varying(100) NOT NULL,
    population_in_millions integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    number_of_mons numeric NOT NULL,
    has_life boolean NOT NULL,
    has_water boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
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
    star_id bigint NOT NULL,
    galaxy_id integer,
    name character varying(100) NOT NULL,
    population_in_millions integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    years_left numeric NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
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
-- Name: meteor meteor_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor ALTER COLUMN meteor_id SET DEFAULT nextval('public.meteor_meteor_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Psora pacifica Timdal', 24483, 28783, 21112, 'Essential Cucumber and Green Tea Scent Anti-Perspirant', false);
INSERT INTO public.galaxy VALUES (2, 'Lotus creticus L.', 75824, 85787, 69743, 'PERFECTION LUMIERE VELVET', true);
INSERT INTO public.galaxy VALUES (3, 'Eucladium verticillatum', 670, 74530, 17303, 'CLE DE PEAU BEAUTE CORRECTING VEIL', false);
INSERT INTO public.galaxy VALUES (4, 'Smilax bona-nox L.', 82508, 81754, 13785, 'Nite Time', true);
INSERT INTO public.galaxy VALUES (5, 'Romulea rosea', 37173, 96739, 1063, 'Lisinopril', false);
INSERT INTO public.galaxy VALUES (6, 'Hedeoma nana', 37173, 67336, 64156, 'BENZTROPINE MESYLATE', true);


--
-- Data for Name: meteor; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.meteor VALUES (1, 1, 'Ditchburn', 60417, 46035);
INSERT INTO public.meteor VALUES (2, 2, 'Jaskiewicz', 7659, 77479);
INSERT INTO public.meteor VALUES (3, 3, 'Fowles', 99313, 96431);
INSERT INTO public.meteor VALUES (4, 4, 'Jump', 31217, 17063);
INSERT INTO public.meteor VALUES (5, 5, 'Jarnell', 80284, 17048);
INSERT INTO public.meteor VALUES (6, 6, 'Simonetti', 69689, 1244);
INSERT INTO public.meteor VALUES (7, 4, 'Wheatley', 68074, 67970);
INSERT INTO public.meteor VALUES (8, 3, 'Shimmings', 38752, 29888);
INSERT INTO public.meteor VALUES (9, 2, 'Spottiswoode', 39031, 5375);
INSERT INTO public.meteor VALUES (10, 1, 'Kassel', 49666, 52971);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 12, 'Clinopodium douglasii', 60417, 37670, false, false);
INSERT INTO public.moon VALUES (2, 12, 'Panicum miliaceum', 7659, 92704, true, true);
INSERT INTO public.moon VALUES (3, 10, 'Tradescantia subacaulis Bush', 99313, 15234, true, false);
INSERT INTO public.moon VALUES (4, 11, 'Salix fuscescens Andersson', 31217, 91508, true, true);
INSERT INTO public.moon VALUES (5, 9, 'Lomatium cookii J.S. Kagan', 80284, 59952, true, false);
INSERT INTO public.moon VALUES (6, 8, 'Arabis constancei Rollins', 69689, 23901, true, false);
INSERT INTO public.moon VALUES (7, 1, 'Lipochaeta rockii Sherff', 54525, 13789, true, false);
INSERT INTO public.moon VALUES (8, 5, 'Asarum lemmonii S. Watson', 4175, 57223, true, true);
INSERT INTO public.moon VALUES (9, 4, 'Callitriche palustris L.', 68074, 31112, false, false);
INSERT INTO public.moon VALUES (12, 6, 'Isodendrion laurifolium ', 49666, 47852, true, true);
INSERT INTO public.moon VALUES (13, 3, 'Malcolmia W.T. Aiton', 82161, 28898, false, true);
INSERT INTO public.moon VALUES (15, 9, 'Syringa josikaea Jacq', 43923, 20786, false, true);
INSERT INTO public.moon VALUES (16, 8, 'Dicranum rhabdocarpum Sull.', 6463, 98154, false, true);
INSERT INTO public.moon VALUES (17, 3, 'Chamaesyce angusta', 99222, 45159, true, false);
INSERT INTO public.moon VALUES (18, 1, 'Fraxinus anomala Torr', 2472, 28402, false, true);
INSERT INTO public.moon VALUES (19, 10, 'Xylorhiza tortifolia', 71971, 99012, false, true);
INSERT INTO public.moon VALUES (20, 2, 'Penstemon subglaber Rydb.', 25343, 48393, true, true);
INSERT INTO public.moon VALUES (21, 2, 'Pellaea ternifolia', 38752, 24810, true, false);
INSERT INTO public.moon VALUES (22, 3, 'Erigeron bloomeri', 39031, 13125, false, true);
INSERT INTO public.moon VALUES (25, 7, 'Nymphaea L.', 65244, 22638, true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 3, 'Chenopodium berlandieri Moq.', 18927, 55026, 4, false, false);
INSERT INTO public.planet VALUES (2, 2, 'Hemerocallis citrina Baroni', 17342, 87886, 5, true, false);
INSERT INTO public.planet VALUES (3, 5, 'Lycopodium venustulum Gaudich', 43105, 37307, 3, true, false);
INSERT INTO public.planet VALUES (4, 2, 'Verbesina lindheimeri', 12334, 40939, 85, true, false);
INSERT INTO public.planet VALUES (5, 1, 'Hypogynium Nees', 59669, 59329, 21, true, false);
INSERT INTO public.planet VALUES (6, 6, 'Gynura Cass.', 10713, 70652, 17, false, true);
INSERT INTO public.planet VALUES (7, 5, 'Polypogon monspeliensis', 81046, 83017, 45, true, true);
INSERT INTO public.planet VALUES (8, 5, 'Tradescantia diffusa Bush', 11450, 96338, 77, false, true);
INSERT INTO public.planet VALUES (9, 3, 'Sanicula crassicaulis', 9339, 53521, 97, true, true);
INSERT INTO public.planet VALUES (10, 2, 'Phacelia hubbyi', 87683, 83231, 49, true, false);
INSERT INTO public.planet VALUES (11, 1, 'Gillenia Moench', 6420, 49336, 67, false, false);
INSERT INTO public.planet VALUES (12, 4, 'Galium latifolium Michx.', 92710, 7567, 17, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 6, 'Aleurites moluccanus', 87886, 53029, 18175, true);
INSERT INTO public.star VALUES (2, 5, 'Linum austriacum L.', 40939, 75824, 11109, false);
INSERT INTO public.star VALUES (3, 4, 'Lesquerella carinata', 70652, 670, 51812, false);
INSERT INTO public.star VALUES (4, 3, 'Escobaria sandbergii', 83231, 81754, 55922, true);
INSERT INTO public.star VALUES (5, 2, 'Parnassia palustris', 96338, 51386, 36622, false);
INSERT INTO public.star VALUES (6, 1, 'Peltigera malacea Funck', 37307, 37173, 81393, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.meteor_meteor_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: meteor meteor_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_name_key UNIQUE (name);


--
-- Name: meteor meteor_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_pkey PRIMARY KEY (meteor_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: meteor fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

