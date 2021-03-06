toc.dat                                                                                             0000600 0004000 0002000 00000016771 14002460646 0014455 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       6                     y           spur    12.1 (Debian 12.1-1.pgdg100+1)    12.2     v           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         w           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         x           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         y           1262    16384    spur    DATABASE     t   CREATE DATABASE spur WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
    DROP DATABASE spur;
                admin    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                admin    false         z           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   admin    false    3         ?            1259    16385    _aqueduct_version_pgsql    TABLE     ?   CREATE TABLE public._aqueduct_version_pgsql (
    versionnumber integer NOT NULL,
    dateofupgrade timestamp without time zone NOT NULL
);
 +   DROP TABLE public._aqueduct_version_pgsql;
       public         heap    admin    false    3         ?            1259    16405    money_route    TABLE     ?   CREATE TABLE public.money_route (
    id bigint NOT NULL,
    name text NOT NULL,
    vara text,
    varb text,
    spur_id bigint
);
    DROP TABLE public.money_route;
       public         heap    admin    false    3         ?            1259    16403    money_route_id_seq    SEQUENCE     {   CREATE SEQUENCE public.money_route_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.money_route_id_seq;
       public          admin    false    206    3         {           0    0    money_route_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.money_route_id_seq OWNED BY public.money_route.id;
          public          admin    false    205         ?            1259    16392    spur    TABLE     L  CREATE TABLE public.spur (
    id bigint NOT NULL,
    title text NOT NULL,
    balance integer DEFAULT 0 NOT NULL,
    dateresolve timestamp without time zone,
    datecreation timestamp without time zone NOT NULL,
    type text,
    resolved boolean,
    resolveerror boolean,
    featured boolean,
    errormoneyroute boolean
);
    DROP TABLE public.spur;
       public         heap    admin    false    3         |           0    0    COLUMN spur.resolved    COMMENT     @   COMMENT ON COLUMN public.spur.resolved IS 'Outcome of resolve';
          public          admin    false    204         }           0    0    COLUMN spur.resolveerror    COMMENT     R   COMMENT ON COLUMN public.spur.resolveerror IS 'did resolve ended up in a error?';
          public          admin    false    204         ~           0    0    COLUMN spur.errormoneyroute    COMMENT     h   COMMENT ON COLUMN public.spur.errormoneyroute IS 'If resolve error money route to true or false route';
          public          admin    false    204         ?            1259    16390    spur_id_seq    SEQUENCE     t   CREATE SEQUENCE public.spur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.spur_id_seq;
       public          admin    false    204    3                    0    0    spur_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.spur_id_seq OWNED BY public.spur.id;
          public          admin    false    203         ?
           2604    16408    money_route id    DEFAULT     p   ALTER TABLE ONLY public.money_route ALTER COLUMN id SET DEFAULT nextval('public.money_route_id_seq'::regclass);
 =   ALTER TABLE public.money_route ALTER COLUMN id DROP DEFAULT;
       public          admin    false    206    205    206         ?
           2604    16420    spur id    DEFAULT     k   ALTER TABLE ONLY public.spur ALTER COLUMN id SET DEFAULT (nextval('public.spur_id_seq'::regclass) + 1000);
 6   ALTER TABLE public.spur ALTER COLUMN id DROP DEFAULT;
       public          admin    false    204    203    204         o          0    16385    _aqueduct_version_pgsql 
   TABLE DATA           O   COPY public._aqueduct_version_pgsql (versionnumber, dateofupgrade) FROM stdin;
    public          admin    false    202       2927.dat s          0    16405    money_route 
   TABLE DATA           D   COPY public.money_route (id, name, vara, varb, spur_id) FROM stdin;
    public          admin    false    206       2931.dat q          0    16392    spur 
   TABLE DATA           ?   COPY public.spur (id, title, balance, dateresolve, datecreation, type, resolved, resolveerror, featured, errormoneyroute) FROM stdin;
    public          admin    false    204       2929.dat ?           0    0    money_route_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.money_route_id_seq', 1, false);
          public          admin    false    205         ?           0    0    spur_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.spur_id_seq', 5, true);
          public          admin    false    203         ?
           2606    16389 A   _aqueduct_version_pgsql _aqueduct_version_pgsql_versionnumber_key 
   CONSTRAINT     ?   ALTER TABLE ONLY public._aqueduct_version_pgsql
    ADD CONSTRAINT _aqueduct_version_pgsql_versionnumber_key UNIQUE (versionnumber);
 k   ALTER TABLE ONLY public._aqueduct_version_pgsql DROP CONSTRAINT _aqueduct_version_pgsql_versionnumber_key;
       public            admin    false    202         ?
           2606    16413    money_route money_route_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.money_route
    ADD CONSTRAINT money_route_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.money_route DROP CONSTRAINT money_route_pkey;
       public            admin    false    206         ?
           2606    16401    spur spur_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.spur
    ADD CONSTRAINT spur_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.spur DROP CONSTRAINT spur_pkey;
       public            admin    false    204         ?
           1259    16414    money_route_spur_id_idx    INDEX     R   CREATE INDEX money_route_spur_id_idx ON public.money_route USING btree (spur_id);
 +   DROP INDEX public.money_route_spur_id_idx;
       public            admin    false    206         ?
           1259    16402    spur_featured_idx    INDEX     F   CREATE INDEX spur_featured_idx ON public.spur USING btree (featured);
 %   DROP INDEX public.spur_featured_idx;
       public            admin    false    204         ?
           2606    16415 $   money_route money_route_spur_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.money_route
    ADD CONSTRAINT money_route_spur_id_fkey FOREIGN KEY (spur_id) REFERENCES public.spur(id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.money_route DROP CONSTRAINT money_route_spur_id_fkey;
       public          admin    false    204    206    2796               2927.dat                                                                                            0000600 0004000 0002000 00000000077 14002460646 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2021-01-20 21:43:50.528403
2	2021-01-21 05:15:06.621091
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                 2931.dat                                                                                            0000600 0004000 0002000 00000000005 14002460646 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2929.dat                                                                                            0000600 0004000 0002000 00000000752 14002460646 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1005	Deze lange title is voor het goede doel weet jewel	89500	2021-07-05 00:00:00	2021-02-01 00:00:00	\N	\N	\N	\N	\N
1001	eerste title kut	5300	2021-07-05 00:00:00	2018-02-01 00:00:00	\N	\N	\N	t	\N
1002	tweede title hoerenzoonenennnnnnnn	5300	2021-07-05 00:00:00	2021-02-01 00:00:00	\N	\N	\N	t	\N
1003	Nog een entree voor de leuk	5300	2021-07-05 00:00:00	2021-02-01 00:00:00	\N	\N	\N	t	\N
1004	Ik wil graag een ultra rennen	123400	2021-07-05 00:00:00	2021-02-01 00:00:00	\N	\N	\N	t	\N
\.


                      restore.sql                                                                                         0000600 0004000 0002000 00000014706 14002460646 0015376 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1 (Debian 12.1-1.pgdg100+1)
-- Dumped by pg_dump version 12.2

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

DROP DATABASE spur;
--
-- Name: spur; Type: DATABASE; Schema: -; Owner: admin
--

CREATE DATABASE spur WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE spur OWNER TO admin;

\connect spur

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO admin;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: admin
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _aqueduct_version_pgsql; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public._aqueduct_version_pgsql (
    versionnumber integer NOT NULL,
    dateofupgrade timestamp without time zone NOT NULL
);


ALTER TABLE public._aqueduct_version_pgsql OWNER TO admin;

--
-- Name: money_route; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.money_route (
    id bigint NOT NULL,
    name text NOT NULL,
    vara text,
    varb text,
    spur_id bigint
);


ALTER TABLE public.money_route OWNER TO admin;

--
-- Name: money_route_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.money_route_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.money_route_id_seq OWNER TO admin;

--
-- Name: money_route_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.money_route_id_seq OWNED BY public.money_route.id;


--
-- Name: spur; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.spur (
    id bigint NOT NULL,
    title text NOT NULL,
    balance integer DEFAULT 0 NOT NULL,
    dateresolve timestamp without time zone,
    datecreation timestamp without time zone NOT NULL,
    type text,
    resolved boolean,
    resolveerror boolean,
    featured boolean,
    errormoneyroute boolean
);


ALTER TABLE public.spur OWNER TO admin;

--
-- Name: COLUMN spur.resolved; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.spur.resolved IS 'Outcome of resolve';


--
-- Name: COLUMN spur.resolveerror; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.spur.resolveerror IS 'did resolve ended up in a error?';


--
-- Name: COLUMN spur.errormoneyroute; Type: COMMENT; Schema: public; Owner: admin
--

COMMENT ON COLUMN public.spur.errormoneyroute IS 'If resolve error money route to true or false route';


--
-- Name: spur_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.spur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spur_id_seq OWNER TO admin;

--
-- Name: spur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.spur_id_seq OWNED BY public.spur.id;


--
-- Name: money_route id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.money_route ALTER COLUMN id SET DEFAULT nextval('public.money_route_id_seq'::regclass);


--
-- Name: spur id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.spur ALTER COLUMN id SET DEFAULT (nextval('public.spur_id_seq'::regclass) + 1000);


--
-- Data for Name: _aqueduct_version_pgsql; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public._aqueduct_version_pgsql (versionnumber, dateofupgrade) FROM stdin;
\.
COPY public._aqueduct_version_pgsql (versionnumber, dateofupgrade) FROM '$$PATH$$/2927.dat';

--
-- Data for Name: money_route; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.money_route (id, name, vara, varb, spur_id) FROM stdin;
\.
COPY public.money_route (id, name, vara, varb, spur_id) FROM '$$PATH$$/2931.dat';

--
-- Data for Name: spur; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.spur (id, title, balance, dateresolve, datecreation, type, resolved, resolveerror, featured, errormoneyroute) FROM stdin;
\.
COPY public.spur (id, title, balance, dateresolve, datecreation, type, resolved, resolveerror, featured, errormoneyroute) FROM '$$PATH$$/2929.dat';

--
-- Name: money_route_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.money_route_id_seq', 1, false);


--
-- Name: spur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.spur_id_seq', 5, true);


--
-- Name: _aqueduct_version_pgsql _aqueduct_version_pgsql_versionnumber_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public._aqueduct_version_pgsql
    ADD CONSTRAINT _aqueduct_version_pgsql_versionnumber_key UNIQUE (versionnumber);


--
-- Name: money_route money_route_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.money_route
    ADD CONSTRAINT money_route_pkey PRIMARY KEY (id);


--
-- Name: spur spur_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.spur
    ADD CONSTRAINT spur_pkey PRIMARY KEY (id);


--
-- Name: money_route_spur_id_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX money_route_spur_id_idx ON public.money_route USING btree (spur_id);


--
-- Name: spur_featured_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX spur_featured_idx ON public.spur USING btree (featured);


--
-- Name: money_route money_route_spur_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.money_route
    ADD CONSTRAINT money_route_spur_id_fkey FOREIGN KEY (spur_id) REFERENCES public.spur(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          