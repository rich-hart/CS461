--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE TABLE customers (
    id_customer integer NOT NULL,
    first_name character(20),
    last_name character(20),
    address1 character(50),
    address2 character(50),
    city character(20),
    state character(20),
    zip character(9),
    country character(20)
);


ALTER TABLE public.customers OWNER TO rhh32;

--
-- Name: customers_id_customer_seq; Type: SEQUENCE; Schema: public; Owner: rhh32
--

CREATE SEQUENCE customers_id_customer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_customer_seq OWNER TO rhh32;

--
-- Name: customers_id_customer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhh32
--

ALTER SEQUENCE customers_id_customer_seq OWNED BY customers.id_customer;


--
-- Name: photoattributes; Type: TABLE; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE TABLE photoattributes (
    id_photo integer NOT NULL,
    id_attribute integer NOT NULL
);


ALTER TABLE public.photoattributes OWNER TO rhh32;

--
-- Name: photoequipment; Type: TABLE; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE TABLE photoequipment (
    id_photo integer NOT NULL,
    id_equipment integer NOT NULL
);


ALTER TABLE public.photoequipment OWNER TO rhh32;

--
-- Name: photographers; Type: TABLE; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE TABLE photographers (
    id_photographer integer NOT NULL,
    first_name character(20),
    last_name character(20),
    order_form character(30)
);


ALTER TABLE public.photographers OWNER TO rhh32;

--
-- Name: photographers_id_photographer_seq; Type: SEQUENCE; Schema: public; Owner: rhh32
--

CREATE SEQUENCE photographers_id_photographer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photographers_id_photographer_seq OWNER TO rhh32;

--
-- Name: photographers_id_photographer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhh32
--

ALTER SEQUENCE photographers_id_photographer_seq OWNED BY photographers.id_photographer;


--
-- Name: photographs; Type: TABLE; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE TABLE photographs (
    id_photo integer NOT NULL,
    filename character(20),
    title character(20),
    description character(20),
    id_photographer integer,
    photo_order integer,
    height integer,
    width integer,
    city character(20),
    state character(20),
    country character(20),
    date_taken date
);


ALTER TABLE public.photographs OWNER TO rhh32;

--
-- Name: photographs_id_photo_seq; Type: SEQUENCE; Schema: public; Owner: rhh32
--

CREATE SEQUENCE photographs_id_photo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photographs_id_photo_seq OWNER TO rhh32;

--
-- Name: photographs_id_photo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhh32
--

ALTER SEQUENCE photographs_id_photo_seq OWNED BY photographs.id_photo;


--
-- Name: photosales; Type: TABLE; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE TABLE photosales (
    id_sale integer NOT NULL,
    id_customer integer,
    id_photo integer,
    quanity_sold integer,
    id_sale_price double precision,
    id_tax double precision,
    sale_date date
);


ALTER TABLE public.photosales OWNER TO rhh32;

--
-- Name: photosales_id_sale_seq; Type: SEQUENCE; Schema: public; Owner: rhh32
--

CREATE SEQUENCE photosales_id_sale_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photosales_id_sale_seq OWNER TO rhh32;

--
-- Name: photosales_id_sale_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhh32
--

ALTER SEQUENCE photosales_id_sale_seq OWNED BY photosales.id_sale;


--
-- Name: refequipmentused; Type: TABLE; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE TABLE refequipmentused (
    id_equipment integer NOT NULL,
    equipment_desc character(30)
);


ALTER TABLE public.refequipmentused OWNER TO rhh32;

--
-- Name: refequipmentused_id_equipment_seq; Type: SEQUENCE; Schema: public; Owner: rhh32
--

CREATE SEQUENCE refequipmentused_id_equipment_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refequipmentused_id_equipment_seq OWNER TO rhh32;

--
-- Name: refequipmentused_id_equipment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhh32
--

ALTER SEQUENCE refequipmentused_id_equipment_seq OWNED BY refequipmentused.id_equipment;


--
-- Name: refphotoattributes; Type: TABLE; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE TABLE refphotoattributes (
    id_attribute integer NOT NULL,
    attribute_desc character(20)
);


ALTER TABLE public.refphotoattributes OWNER TO rhh32;

--
-- Name: refphotoattributes_id_attribute_seq; Type: SEQUENCE; Schema: public; Owner: rhh32
--

CREATE SEQUENCE refphotoattributes_id_attribute_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refphotoattributes_id_attribute_seq OWNER TO rhh32;

--
-- Name: refphotoattributes_id_attribute_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rhh32
--

ALTER SEQUENCE refphotoattributes_id_attribute_seq OWNED BY refphotoattributes.id_attribute;


--
-- Name: refsalescategory; Type: TABLE; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE TABLE refsalescategory (
    id_sales_category integer NOT NULL,
    sales_category character(20)
);


ALTER TABLE public.refsalescategory OWNER TO rhh32;

--
-- Name: salescategories; Type: TABLE; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE TABLE salescategories (
    id_photo integer NOT NULL,
    id_sales_category integer NOT NULL
);


ALTER TABLE public.salescategories OWNER TO rhh32;

--
-- Name: updatedphotographs; Type: TABLE; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE TABLE updatedphotographs (
    filename character(20) NOT NULL,
    title character(20)
);


ALTER TABLE public.updatedphotographs OWNER TO rhh32;

--
-- Name: id_customer; Type: DEFAULT; Schema: public; Owner: rhh32
--

ALTER TABLE ONLY customers ALTER COLUMN id_customer SET DEFAULT nextval('customers_id_customer_seq'::regclass);


--
-- Name: id_photographer; Type: DEFAULT; Schema: public; Owner: rhh32
--

ALTER TABLE ONLY photographers ALTER COLUMN id_photographer SET DEFAULT nextval('photographers_id_photographer_seq'::regclass);


--
-- Name: id_photo; Type: DEFAULT; Schema: public; Owner: rhh32
--

ALTER TABLE ONLY photographs ALTER COLUMN id_photo SET DEFAULT nextval('photographs_id_photo_seq'::regclass);


--
-- Name: id_sale; Type: DEFAULT; Schema: public; Owner: rhh32
--

ALTER TABLE ONLY photosales ALTER COLUMN id_sale SET DEFAULT nextval('photosales_id_sale_seq'::regclass);


--
-- Name: id_equipment; Type: DEFAULT; Schema: public; Owner: rhh32
--

ALTER TABLE ONLY refequipmentused ALTER COLUMN id_equipment SET DEFAULT nextval('refequipmentused_id_equipment_seq'::regclass);


--
-- Name: id_attribute; Type: DEFAULT; Schema: public; Owner: rhh32
--

ALTER TABLE ONLY refphotoattributes ALTER COLUMN id_attribute SET DEFAULT nextval('refphotoattributes_id_attribute_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY customers (id_customer, first_name, last_name, address1, address2, city, state, zip, country) FROM stdin;
\.


--
-- Name: customers_id_customer_seq; Type: SEQUENCE SET; Schema: public; Owner: rhh32
--

SELECT pg_catalog.setval('customers_id_customer_seq', 1, false);


--
-- Data for Name: photoattributes; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY photoattributes (id_photo, id_attribute) FROM stdin;
\.


--
-- Data for Name: photoequipment; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY photoequipment (id_photo, id_equipment) FROM stdin;
\.


--
-- Data for Name: photographers; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY photographers (id_photographer, first_name, last_name, order_form) FROM stdin;
\.


--
-- Name: photographers_id_photographer_seq; Type: SEQUENCE SET; Schema: public; Owner: rhh32
--

SELECT pg_catalog.setval('photographers_id_photographer_seq', 1, false);


--
-- Data for Name: photographs; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY photographs (id_photo, filename, title, description, id_photographer, photo_order, height, width, city, state, country, date_taken) FROM stdin;
\.


--
-- Name: photographs_id_photo_seq; Type: SEQUENCE SET; Schema: public; Owner: rhh32
--

SELECT pg_catalog.setval('photographs_id_photo_seq', 1, false);


--
-- Data for Name: photosales; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY photosales (id_sale, id_customer, id_photo, quanity_sold, id_sale_price, id_tax, sale_date) FROM stdin;
\.


--
-- Name: photosales_id_sale_seq; Type: SEQUENCE SET; Schema: public; Owner: rhh32
--

SELECT pg_catalog.setval('photosales_id_sale_seq', 1, false);


--
-- Data for Name: refequipmentused; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY refequipmentused (id_equipment, equipment_desc) FROM stdin;
\.


--
-- Name: refequipmentused_id_equipment_seq; Type: SEQUENCE SET; Schema: public; Owner: rhh32
--

SELECT pg_catalog.setval('refequipmentused_id_equipment_seq', 1, false);


--
-- Data for Name: refphotoattributes; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY refphotoattributes (id_attribute, attribute_desc) FROM stdin;
\.


--
-- Name: refphotoattributes_id_attribute_seq; Type: SEQUENCE SET; Schema: public; Owner: rhh32
--

SELECT pg_catalog.setval('refphotoattributes_id_attribute_seq', 1, false);


--
-- Data for Name: refsalescategory; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY refsalescategory (id_sales_category, sales_category) FROM stdin;
\.


--
-- Data for Name: salescategories; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY salescategories (id_photo, id_sales_category) FROM stdin;
\.


--
-- Data for Name: updatedphotographs; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY updatedphotographs (filename, title) FROM stdin;
\.


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: rhh32; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id_customer);


--
-- Name: photoattributes_pkey; Type: CONSTRAINT; Schema: public; Owner: rhh32; Tablespace: 
--

ALTER TABLE ONLY photoattributes
    ADD CONSTRAINT photoattributes_pkey PRIMARY KEY (id_photo, id_attribute);


--
-- Name: photoequipment_pkey; Type: CONSTRAINT; Schema: public; Owner: rhh32; Tablespace: 
--

ALTER TABLE ONLY photoequipment
    ADD CONSTRAINT photoequipment_pkey PRIMARY KEY (id_photo, id_equipment);


--
-- Name: photographers_pkey; Type: CONSTRAINT; Schema: public; Owner: rhh32; Tablespace: 
--

ALTER TABLE ONLY photographers
    ADD CONSTRAINT photographers_pkey PRIMARY KEY (id_photographer);


--
-- Name: photographs_pkey; Type: CONSTRAINT; Schema: public; Owner: rhh32; Tablespace: 
--

ALTER TABLE ONLY photographs
    ADD CONSTRAINT photographs_pkey PRIMARY KEY (id_photo);


--
-- Name: photosales_pkey; Type: CONSTRAINT; Schema: public; Owner: rhh32; Tablespace: 
--

ALTER TABLE ONLY photosales
    ADD CONSTRAINT photosales_pkey PRIMARY KEY (id_sale);


--
-- Name: refequipmentused_pkey; Type: CONSTRAINT; Schema: public; Owner: rhh32; Tablespace: 
--

ALTER TABLE ONLY refequipmentused
    ADD CONSTRAINT refequipmentused_pkey PRIMARY KEY (id_equipment);


--
-- Name: refphotoattributes_pkey; Type: CONSTRAINT; Schema: public; Owner: rhh32; Tablespace: 
--

ALTER TABLE ONLY refphotoattributes
    ADD CONSTRAINT refphotoattributes_pkey PRIMARY KEY (id_attribute);


--
-- Name: refsalescategory_pkey; Type: CONSTRAINT; Schema: public; Owner: rhh32; Tablespace: 
--

ALTER TABLE ONLY refsalescategory
    ADD CONSTRAINT refsalescategory_pkey PRIMARY KEY (id_sales_category);


--
-- Name: salescategories_pkey; Type: CONSTRAINT; Schema: public; Owner: rhh32; Tablespace: 
--

ALTER TABLE ONLY salescategories
    ADD CONSTRAINT salescategories_pkey PRIMARY KEY (id_photo, id_sales_category);


--
-- Name: updatedphotographs_pkey; Type: CONSTRAINT; Schema: public; Owner: rhh32; Tablespace: 
--

ALTER TABLE ONLY updatedphotographs
    ADD CONSTRAINT updatedphotographs_pkey PRIMARY KEY (filename);


--
-- Name: attribute_index; Type: INDEX; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE UNIQUE INDEX attribute_index ON refphotoattributes USING btree (attribute_desc);


--
-- Name: customer_name_index; Type: INDEX; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE UNIQUE INDEX customer_name_index ON customers USING btree (last_name, first_name);


--
-- Name: filename_index; Type: INDEX; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE UNIQUE INDEX filename_index ON photographs USING btree (filename);


--
-- Name: name_index; Type: INDEX; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE UNIQUE INDEX name_index ON photographers USING btree (last_name, first_name);


--
-- Name: salescat_index; Type: INDEX; Schema: public; Owner: rhh32; Tablespace: 
--

CREATE UNIQUE INDEX salescat_index ON refsalescategory USING btree (sales_category);


--
-- Name: photoattributes_id_attribute_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rhh32
--

ALTER TABLE ONLY photoattributes
    ADD CONSTRAINT photoattributes_id_attribute_fkey FOREIGN KEY (id_attribute) REFERENCES refphotoattributes(id_attribute) ON DELETE CASCADE;


--
-- Name: photoattributes_id_photo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rhh32
--

ALTER TABLE ONLY photoattributes
    ADD CONSTRAINT photoattributes_id_photo_fkey FOREIGN KEY (id_photo) REFERENCES photographs(id_photo) ON DELETE CASCADE;


--
-- Name: photoequipment_id_equipment_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rhh32
--

ALTER TABLE ONLY photoequipment
    ADD CONSTRAINT photoequipment_id_equipment_fkey FOREIGN KEY (id_equipment) REFERENCES refequipmentused(id_equipment) ON DELETE CASCADE;


--
-- Name: photoequipment_id_photo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rhh32
--

ALTER TABLE ONLY photoequipment
    ADD CONSTRAINT photoequipment_id_photo_fkey FOREIGN KEY (id_photo) REFERENCES photographs(id_photo) ON DELETE CASCADE;


--
-- Name: photographs_id_photographer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rhh32
--

ALTER TABLE ONLY photographs
    ADD CONSTRAINT photographs_id_photographer_fkey FOREIGN KEY (id_photographer) REFERENCES photographers(id_photographer) ON DELETE CASCADE;


--
-- Name: salescategories_id_photo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rhh32
--

ALTER TABLE ONLY salescategories
    ADD CONSTRAINT salescategories_id_photo_fkey FOREIGN KEY (id_photo) REFERENCES photographs(id_photo) ON DELETE CASCADE;


--
-- Name: salescategories_id_sales_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rhh32
--

ALTER TABLE ONLY salescategories
    ADD CONSTRAINT salescategories_id_sales_category_fkey FOREIGN KEY (id_sales_category) REFERENCES refsalescategory(id_sales_category) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

