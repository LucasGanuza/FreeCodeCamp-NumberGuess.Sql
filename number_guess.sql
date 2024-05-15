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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_username_id_seq OWNER TO freecodecamp;

--
-- Name: users_username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_username_id_seq OWNED BY public.users.username_id;


--
-- Name: users username_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN username_id SET DEFAULT nextval('public.users_username_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (27, 'user_1715800459720', 2, 831);
INSERT INTO public.users VALUES (41, 'user_1715800952616', 2, 178);
INSERT INTO public.users VALUES (26, 'user_1715800459721', 5, 129);
INSERT INTO public.users VALUES (40, 'user_1715800952617', 5, 299);
INSERT INTO public.users VALUES (25, 'Lucas', 6, 7);
INSERT INTO public.users VALUES (29, 'user_1715800689885', 2, 158);
INSERT INTO public.users VALUES (43, 'user_1715801035153', 2, 356);
INSERT INTO public.users VALUES (28, 'user_1715800689886', 5, 239);
INSERT INTO public.users VALUES (42, 'user_1715801035154', 5, 354);
INSERT INTO public.users VALUES (31, 'user_1715800778934', 2, 156);
INSERT INTO public.users VALUES (30, 'user_1715800778935', 5, 90);
INSERT INTO public.users VALUES (33, 'user_1715800856463', 2, 251);
INSERT INTO public.users VALUES (32, 'user_1715800856464', 5, 6);
INSERT INTO public.users VALUES (35, 'user_1715800870424', 2, 469);
INSERT INTO public.users VALUES (34, 'user_1715800870425', 5, 39);
INSERT INTO public.users VALUES (37, 'user_1715800875015', 2, 818);
INSERT INTO public.users VALUES (36, 'user_1715800875016', 5, 427);
INSERT INTO public.users VALUES (39, 'user_1715800917593', 2, 358);
INSERT INTO public.users VALUES (38, 'user_1715800917594', 5, 217);


--
-- Name: users_username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_username_id_seq', 43, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username_id);


--
-- PostgreSQL database dump complete
--

