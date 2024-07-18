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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    name character varying(30) NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (21, 2018, 'Final', 1, 2, 4, 2);
INSERT INTO public.games VALUES (22, 2018, 'Third Place', 3, 4, 2, 0);
INSERT INTO public.games VALUES (23, 2018, 'Semi-Final', 2, 4, 2, 1);
INSERT INTO public.games VALUES (24, 2018, 'Semi-Final', 1, 3, 1, 0);
INSERT INTO public.games VALUES (25, 2018, 'Quarter-Final', 2, 58, 3, 2);
INSERT INTO public.games VALUES (26, 2018, 'Quarter-Final', 4, 60, 2, 0);
INSERT INTO public.games VALUES (27, 2018, 'Quarter-Final', 3, 62, 2, 1);
INSERT INTO public.games VALUES (28, 2018, 'Quarter-Final', 1, 64, 2, 0);
INSERT INTO public.games VALUES (29, 2018, 'Eighth-Final', 4, 66, 2, 1);
INSERT INTO public.games VALUES (30, 2018, 'Eighth-Final', 60, 68, 1, 0);
INSERT INTO public.games VALUES (31, 2018, 'Eighth-Final', 3, 70, 3, 2);
INSERT INTO public.games VALUES (32, 2018, 'Eighth-Final', 62, 72, 2, 0);
INSERT INTO public.games VALUES (33, 2018, 'Eighth-Final', 2, 74, 2, 1);
INSERT INTO public.games VALUES (34, 2018, 'Eighth-Final', 58, 76, 2, 1);
INSERT INTO public.games VALUES (35, 2018, 'Eighth-Final', 64, 78, 2, 1);
INSERT INTO public.games VALUES (36, 2018, 'Eighth-Final', 1, 80, 4, 3);
INSERT INTO public.games VALUES (37, 2014, 'Final', 81, 80, 1, 0);
INSERT INTO public.games VALUES (38, 2014, 'Third Place', 83, 62, 3, 0);
INSERT INTO public.games VALUES (39, 2014, 'Semi-Final', 80, 83, 1, 0);
INSERT INTO public.games VALUES (40, 2014, 'Semi-Final', 81, 62, 7, 1);
INSERT INTO public.games VALUES (41, 2014, 'Quarter-Final', 83, 90, 1, 0);
INSERT INTO public.games VALUES (42, 2014, 'Quarter-Final', 80, 3, 1, 0);
INSERT INTO public.games VALUES (43, 2014, 'Quarter-Final', 62, 66, 2, 1);
INSERT INTO public.games VALUES (44, 2014, 'Quarter-Final', 81, 1, 1, 0);
INSERT INTO public.games VALUES (45, 2014, 'Eighth-Final', 62, 98, 2, 1);
INSERT INTO public.games VALUES (46, 2014, 'Eighth-Final', 66, 64, 2, 0);
INSERT INTO public.games VALUES (47, 2014, 'Eighth-Final', 1, 102, 2, 0);
INSERT INTO public.games VALUES (48, 2014, 'Eighth-Final', 81, 104, 2, 1);
INSERT INTO public.games VALUES (49, 2014, 'Eighth-Final', 83, 72, 2, 1);
INSERT INTO public.games VALUES (50, 2014, 'Eighth-Final', 90, 108, 2, 1);
INSERT INTO public.games VALUES (51, 2014, 'Eighth-Final', 80, 68, 1, 0);
INSERT INTO public.games VALUES (52, 2014, 'Eighth-Final', 3, 112, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES ('France', 1);
INSERT INTO public.teams VALUES ('Croatia', 2);
INSERT INTO public.teams VALUES ('Belgium', 3);
INSERT INTO public.teams VALUES ('England', 4);
INSERT INTO public.teams VALUES ('Russia', 58);
INSERT INTO public.teams VALUES ('Sweden', 60);
INSERT INTO public.teams VALUES ('Brazil', 62);
INSERT INTO public.teams VALUES ('Uruguay', 64);
INSERT INTO public.teams VALUES ('Colombia', 66);
INSERT INTO public.teams VALUES ('Switzerland', 68);
INSERT INTO public.teams VALUES ('Japan', 70);
INSERT INTO public.teams VALUES ('Mexico', 72);
INSERT INTO public.teams VALUES ('Denmark', 74);
INSERT INTO public.teams VALUES ('Spain', 76);
INSERT INTO public.teams VALUES ('Portugal', 78);
INSERT INTO public.teams VALUES ('Argentina', 80);
INSERT INTO public.teams VALUES ('Germany', 81);
INSERT INTO public.teams VALUES ('Netherlands', 83);
INSERT INTO public.teams VALUES ('Costa Rica', 90);
INSERT INTO public.teams VALUES ('Chile', 98);
INSERT INTO public.teams VALUES ('Nigeria', 102);
INSERT INTO public.teams VALUES ('Algeria', 104);
INSERT INTO public.teams VALUES ('Greece', 108);
INSERT INTO public.teams VALUES ('United States', 112);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 52, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 112, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: teams teams_team_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_team_key UNIQUE (name);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

