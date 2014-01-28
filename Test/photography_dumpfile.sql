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
    filename character(40),
    title character(40),
    description character(40),
    id_photographer integer,
    photo_order integer,
    height integer,
    width integer,
    city character(40),
    state character(40),
    country character(40),
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
0	3
1	3
2	5
3	4
4	1
5	4
6	3
7	0
8	1
9	0
10	2
11	3
12	5
13	4
14	5
15	2
16	2
17	3
18	1
19	5
20	1
21	2
22	2
23	5
24	0
25	4
26	2
27	4
28	5
29	2
30	2
31	0
32	4
33	1
34	4
35	2
36	3
37	4
38	4
\.


--
-- Data for Name: photographers; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY photographers (id_photographer, first_name, last_name, order_form) FROM stdin;
0	Jeff                	Salvage             	Order 2                       
1	TYNISHA             	JOHNSON             	Order 12                      
2	TREENA              	WILLIAMS            	Order 6                       
3	TOCCARA             	JONES               	Order 17                      
4	TISH                	BROWN               	Order 4                       
5	THOMASENA           	DAVIS               	Order 14                      
6	TEGAN               	MILLER              	Order 7                       
7	SOILA               	WILSON              	Order 2                       
8	SHILOH              	MOORE               	Order 3                       
9	SHENNA              	TAYLOR              	Order 17                      
10	SHARMAINE           	ANDERSON            	Order 9                       
\.


--
-- Name: photographers_id_photographer_seq; Type: SEQUENCE SET; Schema: public; Owner: rhh32
--

SELECT pg_catalog.setval('photographers_id_photographer_seq', 1, false);


--
-- Data for Name: photographs; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY photographs (id_photo, filename, title, description, id_photographer, photo_order, height, width, city, state, country, date_taken) FROM stdin;
0	00.jpg                                  	Photo 0                                 	Pictures of Family                      	5	40	300	600	San Miguel de Allende                   	#N/A                                    	Mexico                                  	2013-10-29
1	01.jpg                                  	Photo 1                                 	Pictures of Friends                     	9	39	520	1020	Budapest                                	#N/A                                    	Hungary                                 	2013-12-28
2	02.jpg                                  	Photo 2                                 	Pictures for Work                       	6	38	480	860	Florence                                	#N/A                                    	Italy                                   	2013-09-04
3	03.jpg                                  	Photo 3                                 	Pictures of Historical Monuments        	4	37	570	990	Salzburg                                	#N/A                                    	Austria                                 	2010-07-27
4	04.jpg                                  	Photo 4                                 	Pictures of Family                      	4	36	300	600	Charleston                              	South Carolina                          	#N/A                                    	2013-08-10
5	05.jpg                                  	Photo 5                                 	Pictures of Friends                     	2	35	520	1020	San Sebastián                           	#N/A                                    	Spain                                   	2013-10-25
6	06.jpg                                  	Photo 6                                 	Pictures for Work                       	9	34	480	860	Vienna                                  	#N/A                                    	Austria                                 	2012-09-23
7	07.jpg                                  	Photo 7                                 	Pictures of Historical Monuments        	6	33	570	990	Rome                                    	#N/A                                    	Italy                                   	2014-10-21
8	8.jpg                                   	Photo 8                                 	Pictures of Historical Monuments        	1	32	570	990	Maimi                                   	Florida                                 	#N/A                                    	2013-07-07
9	9.jpg                                   	Photo 9                                 	Pictures of Family                      	5	31	300	600	Honolulu                                	Hawaii                                  	#N/A                                    	2013-05-23
10	10.jpg                                  	Photo 10                                	Pictures of Friends                     	6	30	520	1020	Chicago                                 	Illinois                                	#N/A                                    	2014-04-16
11	11.jpg                                  	Photo 11                                	Pictures of Historical Monuments        	1	29	570	990	Bruges                                  	#N/A                                    	Belgium                                 	2012-04-22
12	12.jpg                                  	Photo 12                                	Pictures of Family                      	6	28	300	600	Vancouver                               	#N/A                                    	Canada                                  	2012-03-02
13	13.jpg                                  	Photo 13                                	Pictures of Friends                     	7	27	520	1020	Kyoto                                   	#N/A                                    	Japan                                   	2011-05-18
14	14.jpg                                  	Photo 14                                	Pictures for Work                       	1	26	480	860	Prague                                  	#N/A                                    	Czech Republic                          	2010-11-28
15	15.jpg                                  	Photo 15                                	Pictures of Historical Monuments        	3	25	570	990	Kraków                                  	#N/A                                    	Poland                                  	2012-02-21
16	16.jpg                                  	Photo 16                                	Pictures of Family                      	10	24	300	600	Victoria                                	#N/A                                    	Canada                                  	2010-04-27
17	17.jpg                                  	Photo 17                                	Pictures of Friends                     	4	23	520	1020	Sydney                                  	#N/A                                    	Australia                               	2010-03-26
18	18.jpg                                  	Photo 18                                	Pictures for Work                       	3	22	480	860	Santa Fe                                	New Mexico                              	#N/A                                    	2014-04-12
19	19.jpg                                  	Photo 19                                	Pictures of Historical Monuments        	2	21	570	990	Seville                                 	#N/A                                    	Spain                                   	2012-07-30
20	20.jpg                                  	Photo 20                                	Pictures of Family                      	9	20	300	600	Beirut                                  	#N/A                                    	Lebanon                                 	2014-11-13
21	21.jpg                                  	Photo 21                                	Pictures of Friends                     	4	19	520	1020	Paris                                   	#N/A                                    	France                                  	2012-04-17
22	22.jpg                                  	Photo 22                                	Pictures for Work                       	5	18	480	860	Melbourne                               	#N/A                                    	Australia                               	2014-02-23
23	23.jpg                                  	Photo 23                                	Pictures of Historical Monuments        	8	17	570	990	Venice                                  	#N/A                                    	Italy                                   	2014-10-22
24	24.jpg                                  	Photo 24                                	Pictures of Family                      	1	16	300	600	Barcelona                               	#N/A                                    	Spain                                   	2013-07-08
25	25.jpg                                  	Photo 25                                	Pictures of Friends                     	4	15	520	1020	Philadelphia                            	Pennsylvania                            	#N/A                                    	2012-12-24
26	26.jpg                                  	Photo 26                                	Pictures for Work                       	2	14	480	860	NYC                                     	New York                                	#N/A                                    	2011-09-23
27	27.jpg                                  	Photo 27                                	Pictures of Historical Monuments        	4	13	570	990	Maimi                                   	Florida                                 	#N/A                                    	2012-09-29
28	28.jpg                                  	Photo 28                                	Pictures of Family                      	10	12	300	600	Honolulu                                	Hawaii                                  	#N/A                                    	2013-10-23
29	29.jpg                                  	Photo 29                                	Pictures of Friends                     	3	11	520	1020	Chicago                                 	Illinois                                	#N/A                                    	2012-02-15
30	30.jpg                                  	Photo 30                                	Pictures for Work                       	4	10	480	860	San Miguel de Allende                   	#N/A                                    	Mexico                                  	2010-09-24
31	31.jpg                                  	Photo 31                                	Pictures of Historical Monuments        	1	9	570	990	Budapest                                	#N/A                                    	Hungary                                 	2010-02-04
32	32.jpg                                  	Photo 32                                	Pictures of Family                      	1	8	300	600	Florence                                	#N/A                                    	Italy                                   	2011-03-28
33	33.jpg                                  	Photo 33                                	Pictures of Friends                     	1	7	520	1020	Salzburg                                	#N/A                                    	Austria                                 	2010-04-26
34	34.jpg                                  	Photo 34                                	Pictures for Work                       	3	6	480	860	Charleston                              	South Carolina                          	#N/A                                    	2010-08-17
35	35.jpg                                  	Photo 35                                	Pictures of Historical Monuments        	10	5	570	990	San Sebastián                           	#N/A                                    	Spain                                   	2010-10-20
36	36.jpg                                  	Photo 36                                	Pictures of Family                      	7	4	300	600	Vienna                                  	#N/A                                    	Austria                                 	2012-06-18
37	37.jpg                                  	Photo 37                                	Pictures of Friends                     	4	3	520	1020	Rome                                    	#N/A                                    	Italy                                   	2010-06-30
38	38.jpg                                  	Photo 38                                	Pictures for Work                       	3	2	480	860	Siena                                   	#N/A                                    	Italy                                   	2010-02-25
39	39.jpg                                  	Photo 39                                	Pictures of Historical Monuments        	1	1	480	860	Beijing                                 	#N/A                                    	China                                   	2014-07-24
40	40.jpg                                  	Photo 40                                	Pictures of Historical Monuments        	5	0	480	860	Chongqing                               	#N/A                                    	China                                   	2011-12-07
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
0	580X Flash II                 
1	Canon Rebel                   
2	300mm IS F2.8 Lens Canon      
3	M12 Lens                      
4	Nikon COOLPIX L820            
5	Pentax Bridge camera          
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
1	Cat 1               
2	Cat 2               
3	Cat 3               
4	Cat 4               
5	Cat 5               
6	Cat 6               
\.


--
-- Data for Name: salescategories; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY salescategories (id_photo, id_sales_category) FROM stdin;
0	2
1	6
2	3
3	4
4	3
5	5
6	6
7	3
8	3
9	5
10	2
11	1
12	5
13	6
14	5
15	3
16	1
17	3
18	5
19	5
20	3
21	6
22	2
23	3
24	6
25	1
26	5
27	6
28	1
29	5
30	5
31	3
32	6
33	6
34	1
35	2
36	1
37	4
38	6
39	1
40	1
\.


--
-- Data for Name: updatedphotographs; Type: TABLE DATA; Schema: public; Owner: rhh32
--

COPY updatedphotographs (filename, title) FROM stdin;
A.jpeg              	Photo A.jpeg        
B.jpeg              	Photo B.jpeg        
C.jpeg              	Photo C.jpeg        
D.jpeg              	Photo D.jpeg        
E.jpeg              	Photo E.jpeg        
F.jpeg              	Photo F.jpeg        
G.jpeg              	Photo G.jpeg        
H.jpeg              	Photo H.jpeg        
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

