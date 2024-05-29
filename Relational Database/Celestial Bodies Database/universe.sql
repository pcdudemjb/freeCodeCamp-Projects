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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    composition text NOT NULL,
    diameter numeric NOT NULL,
    distance_from_earth numeric NOT NULL,
    potentially_hazardous boolean NOT NULL,
    discovered boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    type text NOT NULL,
    distance_from_earth numeric NOT NULL,
    inhabited boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter numeric NOT NULL,
    is_habitable boolean NOT NULL,
    is_spherical boolean NOT NULL,
    composition text NOT NULL,
    distance_from_planet integer NOT NULL
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
    name character varying(100) NOT NULL,
    star_id integer,
    description text NOT NULL,
    type text NOT NULL,
    orbit_distance numeric,
    has_rings boolean NOT NULL,
    has_life boolean NOT NULL,
    number_of_moons integer NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_id integer,
    description text NOT NULL,
    type text NOT NULL,
    magnitude numeric,
    is_visible boolean NOT NULL,
    temperature integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Largest object in the asteroid belt', 'Rock', 939.4, 413700000, false, true);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 'Second largest asteroid', 'Rock', 512, 414500000, false, true);
INSERT INTO public.asteroid VALUES (3, 'Vesta', 'Brightest asteroid visible from Earth', 'Rock', 525.4, 353400000, false, true);
INSERT INTO public.asteroid VALUES (4, 'Apophis', 'Near-Earth asteroid', 'Rock', 0.325, 37900000, true, true);
INSERT INTO public.asteroid VALUES (5, 'Eros', 'First asteroid orbited by a spacecraft', 'Rock', 16.84, 26300000, false, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 0, true, 13500);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 'Spiral', 2537000, false, 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in the Local Group', 'Spiral', 3000000, false, 9000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Known for its spiral arms', 'Spiral', 23000000, false, 10000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Bright central bulge', 'Spiral', 29000000, false, 8000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on view', 'Spiral', 21000000, false, 12000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474.8, false, true, 'Rock', 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22.4, false, false, 'Rock', 9376);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.4, false, false, 'Rock', 23460);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643.2, false, true, 'Rock', 421700);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121.6, false, true, 'Ice', 671100);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268.2, false, true, 'Rock', 1070400);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4820.6, false, true, 'Rock', 1882700);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5151.8, false, true, 'Ice', 1221870);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1529.4, false, true, 'Ice', 527070);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 1469.8, false, true, 'Ice', 3561300);
INSERT INTO public.moon VALUES (11, 'Oberon', 7, 1522.8, false, true, 'Ice', 584000);
INSERT INTO public.moon VALUES (12, 'Titania', 7, 1577.8, false, true, 'Ice', 435910);
INSERT INTO public.moon VALUES (13, 'Ariel', 7, 1157.8, false, true, 'Ice', 191020);
INSERT INTO public.moon VALUES (14, 'Umbriel', 7, 1169.4, false, true, 'Ice', 266300);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 471.6, false, true, 'Ice', 129900);
INSERT INTO public.moon VALUES (16, 'Triton', 8, 2706.8, false, true, 'Ice', 354760);
INSERT INTO public.moon VALUES (17, 'Nereid', 8, 340.0, false, true, 'Rock', 5513400);
INSERT INTO public.moon VALUES (18, 'Charon', 12, 1212.0, false, true, 'Ice', 19571);
INSERT INTO public.moon VALUES (19, 'Hydra', 12, 51.0, false, true, 'Ice', 64738);
INSERT INTO public.moon VALUES (20, 'Nix', 12, 49.0, false, true, 'Ice', 48694);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Smallest planet in the Solar System', 'Terrestrial', 0.39, false, false, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Hottest planet in the Solar System', 'Terrestrial', 0.72, false, false, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Our home planet', 'Terrestrial', 1.00, false, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'The Red Planet', 'Terrestrial', 1.52, false, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Largest planet in the Solar System', 'Gas Giant', 5.20, true, false, 79);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Famous for its rings', 'Gas Giant', 9.58, true, false, 82);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Rotates on its side', 'Ice Giant', 19.22, true, false, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Known for its strong winds', 'Ice Giant', 30.05, true, false, 14);
INSERT INTO public.planet VALUES (9, 'Proxima b', 3, 'Closest exoplanet to the Solar System', 'Terrestrial', 0.05, false, false, 0);
INSERT INTO public.planet VALUES (10, 'Proxima c', 3, 'Gas giant exoplanet', 'Gas Giant', 1.49, false, false, 0);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 4, 'First known exoplanet in the habitable zone', 'Super-Earth', 0.85, false, false, 0);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 5, 'Potentially habitable exoplanet', 'Terrestrial', 0.15, false, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Central star of our solar system', 'G-Type', 4.83, true, 5778);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'Brightest star in the night sky', 'A-Type', 1.46, true, 9940);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 'Closest star system to the Solar System', 'G-Type', -0.01, true, 5790);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 'Red supergiant in Orion', 'M-Type', -5.85, true, 3500);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 'Brightest star in Orion', 'B-Type', -6.69, true, 12130);
INSERT INTO public.star VALUES (6, 'Polaris', 3, 'North Star', 'F-Type', -3.64, true, 6015);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

