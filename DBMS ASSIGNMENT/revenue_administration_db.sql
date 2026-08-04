--
-- PostgreSQL database dump
--

\restrict SH7ll0UFQH1UGKPsAPE2u9sNZllcgst9coYZel1wN01qPpl7zRq0ATo4WIBrtH9

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: audit_finding; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_finding (
    finding_id integer NOT NULL,
    audit_id integer,
    tax_type_id integer,
    finding_amount integer,
    finding_date date
);


ALTER TABLE public.audit_finding OWNER TO postgres;

--
-- Name: bank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank (
    bank_id integer NOT NULL,
    bank_name character varying(30),
    bank_code integer,
    branch_name character varying(40),
    registration_date date
);


ALTER TABLE public.bank OWNER TO postgres;

--
-- Name: business; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business (
    business_id integer NOT NULL,
    taxpayer_id integer,
    business_name character varying(40),
    business_sector character varying(30),
    opening_date date
);


ALTER TABLE public.business OWNER TO postgres;

--
-- Name: enforcement_case; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enforcement_case (
    enforcement_id integer NOT NULL,
    taxpayer_id integer,
    officer_id integer,
    case_open_date date,
    outstanding_amount integer
);


ALTER TABLE public.enforcement_case OWNER TO postgres;

--
-- Name: penalty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.penalty (
    penalty_id integer NOT NULL,
    assessment_id integer,
    penalty_type character varying(30),
    penalty_amount integer,
    penalty_date date
);


ALTER TABLE public.penalty OWNER TO postgres;

--
-- Name: property; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property (
    property_id integer NOT NULL,
    taxpayer_id integer,
    property_location character varying(30),
    property_value integer,
    registration_date date
);


ALTER TABLE public.property OWNER TO postgres;

--
-- Name: revenue_target; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.revenue_target (
    target_id integer NOT NULL,
    tax_centre_id integer,
    tax_type_id integer,
    target_year date,
    target_amount integer
);


ALTER TABLE public.revenue_target OWNER TO postgres;

--
-- Name: tax_assessment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_assessment (
    assessment_id integer NOT NULL,
    declaration_id integer,
    officer_id integer,
    assessment_date date,
    assessment_amount integer
);


ALTER TABLE public.tax_assessment OWNER TO postgres;

--
-- Name: tax_audit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_audit (
    audit_id integer NOT NULL,
    taxpayer_id integer,
    officer_id integer,
    audit_start_date date,
    audit_status character varying(10)
);


ALTER TABLE public.tax_audit OWNER TO postgres;

--
-- Name: tax_centre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_centre (
    tax_centre_id integer NOT NULL,
    centre_name character varying(30),
    district_name character varying(30),
    centre_manager character varying(30),
    opening_date date
);


ALTER TABLE public.tax_centre OWNER TO postgres;

--
-- Name: tax_declaration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_declaration (
    declaration_id integer NOT NULL,
    registration_id integer,
    tax_period integer,
    declaration_date date,
    declared_amount integer
);


ALTER TABLE public.tax_declaration OWNER TO postgres;

--
-- Name: tax_objection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_objection (
    objection_id integer NOT NULL,
    assessment_id integer,
    objection_date date,
    objection_status character varying(8)
);


ALTER TABLE public.tax_objection OWNER TO postgres;

--
-- Name: tax_officer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_officer (
    officer_id integer NOT NULL,
    tax_centre_id integer,
    officer_name character varying(40),
    officer_position character varying(30),
    employment_date date
);


ALTER TABLE public.tax_officer OWNER TO postgres;

--
-- Name: tax_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_payment (
    payment_id integer NOT NULL,
    assessment_id integer,
    bank_id integer,
    payment_date date,
    payment_amount integer
);


ALTER TABLE public.tax_payment OWNER TO postgres;

--
-- Name: tax_period; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_period (
    tax_period_id integer CONSTRAINT tax_period_tax_period_not_null NOT NULL,
    tax_type_id integer,
    period_start_date date,
    period_end_date date,
    filing_due_date date
);


ALTER TABLE public.tax_period OWNER TO postgres;

--
-- Name: tax_refund; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_refund (
    refund_id integer NOT NULL,
    taxpayer_id integer,
    payment_id integer,
    refund_amount integer,
    refund_date date
);


ALTER TABLE public.tax_refund OWNER TO postgres;

--
-- Name: tax_registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_registration (
    registration_id integer NOT NULL,
    taxpayer_id integer,
    tax_type_id integer,
    tax_centre_id integer,
    registration_date date
);


ALTER TABLE public.tax_registration OWNER TO postgres;

--
-- Name: tax_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_type (
    tax_type_id integer NOT NULL,
    tax_type_name character varying(30),
    tax_rate integer,
    filing_frequency character varying(11),
    effective_date date
);


ALTER TABLE public.tax_type OWNER TO postgres;

--
-- Name: taxpayer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taxpayer (
    taxpayer_id integer NOT NULL,
    taxpayer_tin integer,
    taxpayer_name character varying(30),
    registration_date date
);


ALTER TABLE public.taxpayer OWNER TO postgres;

--
-- Name: vehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle (
    vehicle_id integer NOT NULL,
    taxpayer_id integer,
    plate_number integer,
    vehicle_value integer,
    registration_date date
);


ALTER TABLE public.vehicle OWNER TO postgres;

--
-- Data for Name: audit_finding; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_finding (finding_id, audit_id, tax_type_id, finding_amount, finding_date) FROM stdin;
1	1	1	25000	2022-02-10
2	2	2	30000	2022-02-15
3	3	3	45000	2022-02-20
4	4	4	28000	2022-03-01
5	5	5	50000	2022-03-05
6	6	6	35000	2022-03-10
7	7	7	42000	2022-03-15
8	8	8	38000	2022-03-20
9	9	9	60000	2022-04-01
10	10	10	32000	2022-04-05
11	11	11	27000	2022-04-10
12	12	12	34000	2022-04-15
13	13	13	48000	2022-04-20
14	14	14	29000	2022-05-01
15	15	15	55000	2022-05-05
16	16	16	36000	2022-05-10
17	17	17	44000	2022-05-15
18	18	18	39000	2022-05-20
19	19	19	62000	2022-06-01
20	20	20	33000	2022-06-05
21	21	21	30000	2022-06-10
22	22	22	37000	2022-06-15
23	23	23	52000	2022-06-20
24	24	24	31000	2022-07-01
25	25	25	58000	2022-07-05
26	26	26	39000	2022-07-10
27	27	27	47000	2022-07-15
28	28	28	41000	2022-07-20
29	29	29	65000	2022-08-01
30	30	30	35000	2022-08-05
31	31	31	33000	2022-08-10
32	32	32	40000	2022-08-15
33	33	33	56000	2022-08-20
34	34	34	34000	2022-09-01
35	35	35	60000	2022-09-05
36	36	36	42000	2022-09-10
37	37	37	50000	2022-09-15
38	38	38	45000	2022-09-20
39	39	39	68000	2022-10-01
41	41	41	36000	2022-10-10
42	42	42	43000	2022-10-15
43	43	43	59000	2022-10-20
44	44	44	38000	2022-11-01
45	45	45	65000	2022-11-05
46	46	46	45000	2022-11-10
47	47	47	53000	2022-11-15
48	48	48	48000	2022-11-20
49	49	49	70000	2022-12-01
50	50	50	40000	2022-12-05
51	51	51	39000	2023-02-10
52	52	52	46000	2023-02-15
53	53	53	62000	2023-02-20
54	54	54	41000	2023-03-01
55	55	55	68000	2023-03-05
56	56	56	48000	2023-03-10
57	57	57	56000	2023-03-15
58	58	58	51000	2023-03-20
59	59	59	73000	2023-04-01
60	60	60	43000	2023-04-05
61	61	61	42000	2023-04-10
62	62	62	49000	2023-04-15
63	63	63	65000	2023-04-20
64	64	64	44000	2023-05-01
65	65	65	70000	2023-05-05
66	66	66	50000	2023-05-10
67	67	67	58000	2023-05-15
68	68	68	53000	2023-05-20
69	69	69	76000	2023-06-01
70	70	70	46000	2023-06-05
71	71	71	45000	2023-06-10
72	72	72	52000	2023-06-15
73	73	73	68000	2023-06-20
74	74	74	47000	2023-07-01
75	75	75	73000	2023-07-05
76	76	76	53000	2023-07-10
77	77	77	61000	2023-07-15
78	78	78	56000	2023-07-20
79	79	79	79000	2023-08-01
80	80	80	49000	2023-08-05
81	81	81	48000	2023-08-10
82	82	82	55000	2023-08-15
83	83	83	71000	2023-08-20
84	84	84	50000	2023-09-01
85	85	85	76000	2023-09-05
86	86	86	56000	2023-09-10
87	87	87	64000	2023-09-15
88	88	88	59000	2023-09-20
89	89	89	82000	2023-10-01
90	90	90	52000	2023-10-05
91	91	91	51000	2023-10-10
92	92	92	58000	2023-10-15
93	93	93	74000	2023-10-20
94	94	94	53000	2023-11-01
95	95	95	79000	2023-11-05
96	96	96	59000	2023-11-10
97	97	97	67000	2023-11-15
98	98	98	62000	2023-11-20
99	99	99	85000	2023-12-01
100	100	100	55000	2023-12-05
40	40	40	600000	2022-10-05
\.


--
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank (bank_id, bank_name, bank_code, branch_name, registration_date) FROM stdin;
1	Bank of Kigali	1001	Kigali Main Branch	2015-01-10
2	Equity Bank Rwanda	1002	Kigali Branch	2015-02-15
3	I&M Bank Rwanda	1003	Downtown Branch	2015-03-20
4	Cogebanque	1004	Kicukiro Branch	2015-04-10
5	BPR Bank Rwanda	1005	Remera Branch	2015-05-05
6	Access Bank Rwanda	1006	Nyarugenge Branch	2015-06-15
7	Ecobank Rwanda	1007	Kigali City Branch	2015-07-20
8	GTBank Rwanda	1008	Kacyiru Branch	2015-08-25
9	NCBA Rwanda	1009	Kimihurura Branch	2015-09-10
10	Urwego Bank	1010	Kigali Branch	2015-10-05
11	Bank of Kigali	1011	Huye Branch	2016-01-10
12	Equity Bank Rwanda	1012	Musanze Branch	2016-02-15
13	I&M Bank Rwanda	1013	Rubavu Branch	2016-03-20
14	Cogebanque	1014	Muhanga Branch	2016-04-10
15	BPR Bank Rwanda	1015	Nyagatare Branch	2016-05-05
16	Access Bank Rwanda	1016	Rusizi Branch	2016-06-15
17	Ecobank Rwanda	1017	Huye Branch	2016-07-20
18	GTBank Rwanda	1018	Musanze Branch	2016-08-25
19	NCBA Rwanda	1019	Rubavu Branch	2016-09-10
20	Urwego Bank	1020	Muhanga Branch	2016-10-05
21	Bank of Kigali	1021	Kigali Main	2017-01-10
22	Equity Bank Rwanda	1022	Remera Branch	2017-02-15
23	I&M Bank Rwanda	1023	Kacyiru Branch	2017-03-20
24	Cogebanque	1024	Kicukiro Branch	2017-04-10
25	BPR Bank Rwanda	1025	Nyarugenge Branch	2017-05-05
26	Access Bank Rwanda	1026	Kimironko Branch	2017-06-15
27	Ecobank Rwanda	1027	Gikondo Branch	2017-07-20
28	GTBank Rwanda	1028	Nyamirambo Branch	2017-08-25
29	NCBA Rwanda	1029	Kabeza Branch	2017-09-10
30	Urwego Bank	1030	Kimironko Branch	2017-10-05
31	Bank of Kigali	1031	Huye Branch	2018-01-10
32	Equity Bank Rwanda	1032	Musanze Branch	2018-02-15
33	I&M Bank Rwanda	1033	Rubavu Branch	2018-03-20
34	Cogebanque	1034	Rusizi Branch	2018-04-10
35	BPR Bank Rwanda	1035	Muhanga Branch	2018-05-05
36	Access Bank Rwanda	1036	Nyagatare Branch	2018-06-15
37	Ecobank Rwanda	1037	Rwamagana Branch	2018-07-20
38	GTBank Rwanda	1038	Huye Branch	2018-08-25
39	NCBA Rwanda	1039	Musanze Branch	2018-09-10
40	Urwego Bank	1040	Rubavu Branch	2018-10-05
41	Bank of Kigali	1041	Kigali Branch	2019-01-10
42	Equity Bank Rwanda	1042	Kacyiru Branch	2019-02-15
43	I&M Bank Rwanda	1043	Remera Branch	2019-03-20
44	Cogebanque	1044	Kicukiro Branch	2019-04-10
45	BPR Bank Rwanda	1045	Downtown Branch	2019-05-05
46	Access Bank Rwanda	1046	Kimihurura Branch	2019-06-15
47	Ecobank Rwanda	1047	Kigali City Branch	2019-07-20
48	GTBank Rwanda	1048	Nyabugogo Branch	2019-08-25
49	NCBA Rwanda	1049	Gisozi Branch	2019-09-10
50	Urwego Bank	1050	Kimironko Branch	2019-10-05
51	Bank of Kigali	1051	Branch 51	2020-01-10
52	Equity Bank Rwanda	1052	Branch 52	2020-02-15
53	I&M Bank Rwanda	1053	Branch 53	2020-03-20
54	Cogebanque	1054	Branch 54	2020-04-10
55	BPR Bank Rwanda	1055	Branch 55	2020-05-05
56	Access Bank Rwanda	1056	Branch 56	2020-06-15
57	Ecobank Rwanda	1057	Branch 57	2020-07-20
58	GTBank Rwanda	1058	Branch 58	2020-08-25
59	NCBA Rwanda	1059	Branch 59	2020-09-10
60	Urwego Bank	1060	Branch 60	2020-10-05
61	Bank of Kigali	1061	Branch 61	2021-01-10
62	Equity Bank Rwanda	1062	Branch 62	2021-02-15
63	I&M Bank Rwanda	1063	Branch 63	2021-03-20
64	Cogebanque	1064	Branch 64	2021-04-10
65	BPR Bank Rwanda	1065	Branch 65	2021-05-05
66	Access Bank Rwanda	1066	Branch 66	2021-06-15
67	Ecobank Rwanda	1067	Branch 67	2021-07-20
68	GTBank Rwanda	1068	Branch 68	2021-08-25
69	NCBA Rwanda	1069	Branch 69	2021-09-10
70	Urwego Bank	1070	Branch 70	2021-10-05
71	Bank of Kigali	1071	Branch 71	2022-01-10
72	Equity Bank Rwanda	1072	Branch 72	2022-02-15
73	I&M Bank Rwanda	1073	Branch 73	2022-03-20
74	Cogebanque	1074	Branch 74	2022-04-10
75	BPR Bank Rwanda	1075	Branch 75	2022-05-05
76	Access Bank Rwanda	1076	Branch 76	2022-06-15
77	Ecobank Rwanda	1077	Branch 77	2022-07-20
78	GTBank Rwanda	1078	Branch 78	2022-08-25
79	NCBA Rwanda	1079	Branch 79	2022-09-10
80	Urwego Bank	1080	Branch 80	2022-10-05
81	Bank of Kigali	1081	Branch 81	2023-01-10
82	Equity Bank Rwanda	1082	Branch 82	2023-02-15
83	I&M Bank Rwanda	1083	Branch 83	2023-03-20
84	Cogebanque	1084	Branch 84	2023-04-10
85	BPR Bank Rwanda	1085	Branch 85	2023-05-05
86	Access Bank Rwanda	1086	Branch 86	2023-06-15
87	Ecobank Rwanda	1087	Branch 87	2023-07-20
88	GTBank Rwanda	1088	Branch 88	2023-08-25
89	NCBA Rwanda	1089	Branch 89	2023-09-10
90	Urwego Bank	1090	Branch 90	2023-10-05
91	Bank of Kigali	1091	Branch 91	2024-01-10
92	Equity Bank Rwanda	1092	Branch 92	2024-02-15
93	I&M Bank Rwanda	1093	Branch 93	2024-03-20
94	Cogebanque	1094	Branch 94	2024-04-10
95	BPR Bank Rwanda	1095	Branch 95	2024-05-05
96	Access Bank Rwanda	1096	Branch 96	2024-06-15
97	Ecobank Rwanda	1097	Branch 97	2024-07-20
98	GTBank Rwanda	1098	Branch 98	2024-08-25
99	NCBA Rwanda	1099	Branch 99	2024-09-10
100	Urwego Bank	1100	Branch 100	2024-10-05
\.


--
-- Data for Name: business; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.business (business_id, taxpayer_id, business_name, business_sector, opening_date) FROM stdin;
1	1	Kigali Tech Solutions	Technology	2018-01-10
2	2	Uwase Trading Ltd	Retail	2018-02-15
3	3	Imena Construction	Construction	2018-03-20
4	4	Bright Future Academy	Education	2018-04-05
5	5	Green Farm Rwanda	Agriculture	2018-05-12
6	6	City Fashion Store	Clothing	2018-06-18
7	7	Royal Transport Ltd	Transport	2018-07-22
8	8	Smart Electronics	Electronics	2018-08-10
9	9	Hope Medical Centre	Healthcare	2018-09-15
10	10	Kivu Restaurant	Hospitality	2018-10-20
11	11	Alpha General Store	Retail	2019-01-05
12	12	Future IT Services	Technology	2019-02-10
13	13	Mountain Construction Ltd	Construction	2019-03-15
14	14	Sunrise School	Education	2019-04-20
15	15	Fresh Valley Farm	Agriculture	2019-05-25
16	16	Urban Fashion Hub	Clothing	2019-06-05
17	17	Fast Move Transport	Transport	2019-07-10
18	18	Digital World Rwanda	Electronics	2019-08-15
19	19	Life Care Clinic	Healthcare	2019-09-20
20	20	Golden Restaurant	Hospitality	2019-10-25
21	21	Vision Retail Shop	Retail	2020-01-10
22	22	Code Masters Ltd	Technology	2020-02-15
23	23	Build Rwanda Ltd	Construction	2020-03-20
24	24	Knowledge Center	Education	2020-04-25
25	25	Agro Plus Rwanda	Agriculture	2020-05-30
26	26	Fashion Point	Clothing	2020-06-05
27	27	Express Logistics	Transport	2020-07-10
28	28	Phone World Ltd	Electronics	2020-08-15
29	29	Healthy Life Clinic	Healthcare	2020-09-20
30	30	Taste Corner	Hospitality	2020-10-25
31	31	Prime Market	Retail	2021-01-05
32	32	NextGen Software	Technology	2021-02-10
33	33	Strong Builders	Construction	2021-03-15
34	34	Excellent Academy	Education	2021-04-20
35	35	Organic Harvest	Agriculture	2021-05-25
36	36	Style House	Clothing	2021-06-30
37	37	Safe Transport Ltd	Transport	2021-07-05
38	38	Electro Hub	Electronics	2021-08-10
39	39	Care Plus Hospital	Healthcare	2021-09-15
40	40	Delicious Foods	Hospitality	2021-10-20
41	41	Market Express	Retail	2022-01-10
42	42	Tech Vision Ltd	Technology	2022-02-15
43	43	Rwanda Builders	Construction	2022-03-20
44	44	Smart Learning School	Education	2022-04-25
45	45	Green World Farm	Agriculture	2022-05-30
46	46	Modern Wear Shop	Clothing	2022-06-05
47	47	Quick Transport	Transport	2022-07-10
48	48	Mobile Center	Electronics	2022-08-15
49	49	Hope Clinic Rwanda	Healthcare	2022-09-20
50	50	City Food Court	Hospitality	2022-10-25
51	51	Daily Needs Shop	Retail	2023-01-05
52	52	Innovate Systems	Technology	2023-02-10
53	53	Elite Construction	Construction	2023-03-15
54	54	Future School	Education	2023-04-20
55	55	Farm Solutions	Agriculture	2023-05-25
56	56	Fashion Avenue	Clothing	2023-06-30
57	57	Reliable Transport	Transport	2023-07-05
58	58	Tech Electronics	Electronics	2023-08-10
59	59	Medical Support Center	Healthcare	2023-09-15
60	60	Royal Hospitality	Hospitality	2023-10-20
61	61	Best Choice Shop	Retail	2024-01-10
62	62	Digital Rwanda Ltd	Technology	2024-02-15
63	63	Safe Build Ltd	Construction	2024-03-20
64	64	Future Leaders Academy	Education	2024-04-25
65	65	Farmers Choice	Agriculture	2024-05-30
66	66	Classic Fashion	Clothing	2024-06-05
67	67	Travel Connect	Transport	2024-07-10
68	68	Smart Device Store	Electronics	2024-08-15
69	69	Health First Clinic	Healthcare	2024-09-20
70	70	Food Paradise	Hospitality	2024-10-25
71	71	Super Market Rwanda	Retail	2025-01-05
72	72	Cloud Technology Ltd	Technology	2025-02-10
73	73	Modern Builders	Construction	2025-03-15
74	74	Bright Minds School	Education	2025-04-20
75	75	Agri Growth Ltd	Agriculture	2025-05-25
76	76	Fashion World	Clothing	2025-06-30
77	77	Fast Delivery Ltd	Transport	2025-07-05
78	78	Electronic Solutions	Electronics	2025-08-10
79	79	Community Health Center	Healthcare	2025-09-15
80	80	Premium Restaurant	Hospitality	2025-10-20
81	81	Value Shop Ltd	Retail	2025-11-01
82	82	AI Solutions Rwanda	Technology	2025-11-05
83	83	Future Construction	Construction	2025-11-10
84	84	Global Academy	Education	2025-11-15
85	85	Smart Agriculture	Agriculture	2025-11-20
86	86	Trend Fashion	Clothing	2025-11-25
87	87	Easy Transport	Transport	2025-12-01
88	88	Digital Electronics	Electronics	2025-12-05
89	89	Health Point	Healthcare	2025-12-10
90	90	Modern Restaurant	Hospitality	2025-12-15
91	91	Family Retail Store	Retail	2026-01-05
92	92	Cyber Tech Ltd	Technology	2026-01-10
93	93	Rwanda Engineering	Construction	2026-01-15
94	94	Knowledge Academy	Education	2026-01-20
95	95	Green Agriculture Ltd	Agriculture	2026-01-25
96	96	Fashion Choice	Clothing	2026-02-01
97	97	Transport Rwanda	Transport	2026-02-05
98	98	Electronic Market	Electronics	2026-02-10
99	99	Wellness Clinic	Healthcare	2026-02-15
100	100	Luxury Restaurant	Hospitality	2026-02-20
\.


--
-- Data for Name: enforcement_case; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enforcement_case (enforcement_id, taxpayer_id, officer_id, case_open_date, outstanding_amount) FROM stdin;
1	1	1	2022-01-10	50000
2	2	2	2022-01-15	75000
3	3	3	2022-01-20	90000
4	4	4	2022-02-01	65000
5	5	5	2022-02-05	120000
6	6	6	2022-02-10	85000
7	7	7	2022-02-15	70000
8	8	8	2022-02-20	110000
9	9	9	2022-03-01	95000
10	10	10	2022-03-05	130000
11	11	11	2022-03-10	60000
12	12	12	2022-03-15	80000
13	13	13	2022-03-20	100000
14	14	14	2022-04-01	70000
15	15	15	2022-04-05	140000
16	16	16	2022-04-10	90000
17	17	17	2022-04-15	75000
18	18	18	2022-04-20	115000
19	19	19	2022-05-01	105000
20	20	20	2022-05-05	150000
21	21	21	2022-05-10	65000
22	22	22	2022-05-15	85000
23	23	23	2022-05-20	110000
24	24	24	2022-06-01	78000
25	25	25	2022-06-05	150000
26	26	26	2022-06-10	95000
27	27	27	2022-06-15	82000
28	28	28	2022-06-20	120000
29	29	29	2022-07-01	115000
30	30	30	2022-07-05	160000
31	31	31	2022-07-10	70000
32	32	32	2022-07-15	90000
33	33	33	2022-07-20	125000
34	34	34	2022-08-01	85000
35	35	35	2022-08-05	160000
36	36	36	2022-08-10	100000
37	37	37	2022-08-15	90000
38	38	38	2022-08-20	130000
39	39	39	2022-09-01	120000
40	40	40	2022-09-05	170000
41	41	41	2022-09-10	75000
42	42	42	2022-09-15	95000
43	43	43	2022-09-20	135000
44	44	44	2022-10-01	90000
45	45	45	2022-10-05	175000
46	46	46	2022-10-10	110000
47	47	47	2022-10-15	95000
48	48	48	2022-10-20	140000
49	49	49	2022-11-01	130000
50	50	50	2022-11-05	180000
51	51	51	2023-01-10	80000
52	52	52	2023-01-15	100000
53	53	53	2023-01-20	145000
54	54	54	2023-02-01	95000
55	55	55	2023-02-05	190000
56	56	56	2023-02-10	120000
57	57	57	2023-02-15	105000
58	58	58	2023-02-20	150000
59	59	59	2023-03-01	140000
60	60	60	2023-03-05	200000
61	61	61	2023-03-10	85000
62	62	62	2023-03-15	110000
63	63	63	2023-03-20	155000
64	64	64	2023-04-01	100000
65	65	65	2023-04-05	210000
66	66	66	2023-04-10	130000
67	67	67	2023-04-15	115000
68	68	68	2023-04-20	160000
69	69	69	2023-05-01	150000
70	70	70	2023-05-05	220000
71	71	71	2023-05-10	90000
72	72	72	2023-05-15	120000
73	73	73	2023-05-20	165000
74	74	74	2023-06-01	110000
75	75	75	2023-06-05	230000
76	76	76	2023-06-10	140000
77	77	77	2023-06-15	125000
78	78	78	2023-06-20	170000
79	79	79	2023-07-01	160000
80	80	80	2023-07-05	240000
81	81	81	2023-07-10	95000
82	82	82	2023-07-15	130000
83	83	83	2023-07-20	175000
84	84	84	2023-08-01	120000
85	85	85	2023-08-05	250000
86	86	86	2023-08-10	150000
87	87	87	2023-08-15	135000
88	88	88	2023-08-20	180000
89	89	89	2023-09-01	170000
90	90	90	2023-09-05	260000
91	91	91	2023-09-10	100000
92	92	92	2023-09-15	140000
93	93	93	2023-09-20	185000
94	94	94	2023-10-01	130000
95	95	95	2023-10-05	270000
96	96	96	2023-10-10	160000
97	97	97	2023-10-15	145000
98	98	98	2023-10-20	190000
99	99	99	2023-11-01	180000
100	100	100	2023-11-05	280000
\.


--
-- Data for Name: penalty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.penalty (penalty_id, assessment_id, penalty_type, penalty_amount, penalty_date) FROM stdin;
1	1	Late Filing	5000	2022-03-20
2	2	Late Payment	7000	2022-03-25
3	3	Incorrect Declaration	10000	2022-04-20
4	4	Late Filing	6000	2022-05-20
5	5	Late Payment	8000	2022-06-20
6	6	Incorrect Declaration	12000	2022-07-20
7	7	Late Filing	5000	2022-08-20
8	8	Late Payment	9000	2022-09-20
9	9	Tax Evasion	15000	2022-10-20
10	10	Late Filing	6000	2022-11-20
11	11	Late Payment	7000	2022-03-30
12	12	Late Filing	5000	2022-04-05
13	13	Tax Evasion	15000	2022-04-25
14	14	Late Payment	9000	2022-05-25
15	15	Incorrect Declaration	12000	2022-06-25
16	16	Late Filing	6000	2022-07-25
17	17	Late Payment	8000	2022-08-25
18	18	Tax Evasion	16000	2022-09-25
19	19	Late Filing	5000	2022-10-25
20	20	Late Payment	10000	2022-11-25
21	21	Late Filing	6000	2023-03-20
22	22	Late Payment	8000	2023-03-25
23	23	Incorrect Declaration	12000	2023-04-20
24	24	Late Filing	7000	2023-05-20
25	25	Tax Evasion	17000	2023-06-20
26	26	Late Payment	9000	2023-07-20
27	27	Late Filing	5000	2023-08-20
28	28	Incorrect Declaration	13000	2023-09-20
29	29	Late Payment	10000	2023-10-20
30	30	Tax Evasion	18000	2023-11-20
31	31	Late Filing	7000	2023-03-30
32	32	Late Payment	9000	2023-04-05
33	33	Incorrect Declaration	14000	2023-04-25
34	34	Late Filing	6000	2023-05-25
35	35	Tax Evasion	20000	2023-06-25
36	36	Late Payment	10000	2023-07-25
37	37	Late Filing	7000	2023-08-25
38	38	Incorrect Declaration	15000	2023-09-25
39	39	Late Payment	11000	2023-10-25
40	40	Tax Evasion	22000	2023-11-25
41	41	Late Filing	8000	2024-03-20
42	42	Late Payment	10000	2024-03-25
43	43	Incorrect Declaration	15000	2024-04-20
44	44	Late Filing	7000	2024-05-20
45	45	Tax Evasion	22000	2024-06-20
46	46	Late Payment	12000	2024-07-20
47	47	Late Filing	8000	2024-08-20
48	48	Incorrect Declaration	16000	2024-09-20
49	49	Late Payment	12000	2024-10-20
50	50	Tax Evasion	25000	2024-11-20
51	51	Late Filing	8000	2024-03-30
52	52	Late Payment	11000	2024-04-05
53	53	Incorrect Declaration	16000	2024-04-25
54	54	Late Filing	9000	2024-05-25
55	55	Tax Evasion	25000	2024-06-25
56	56	Late Payment	13000	2024-07-25
57	57	Late Filing	9000	2024-08-25
58	58	Incorrect Declaration	17000	2024-09-25
59	59	Late Payment	13000	2024-10-25
60	60	Tax Evasion	28000	2024-11-25
61	61	Late Filing	9000	2025-03-20
62	62	Late Payment	12000	2025-03-25
63	63	Incorrect Declaration	18000	2025-04-20
64	64	Late Filing	10000	2025-05-20
65	65	Tax Evasion	30000	2025-06-20
66	66	Late Payment	14000	2025-07-20
67	67	Late Filing	10000	2025-08-20
68	68	Incorrect Declaration	19000	2025-09-20
69	69	Late Payment	15000	2025-10-20
70	70	Tax Evasion	32000	2025-11-20
71	71	Late Filing	10000	2025-03-30
72	72	Late Payment	13000	2025-04-05
73	73	Incorrect Declaration	20000	2025-04-25
74	74	Late Filing	11000	2025-05-25
75	75	Tax Evasion	35000	2025-06-25
76	76	Late Payment	15000	2025-07-25
77	77	Late Filing	11000	2025-08-25
78	78	Incorrect Declaration	22000	2025-09-25
79	79	Late Payment	16000	2025-10-25
80	80	Tax Evasion	38000	2025-11-25
81	81	Late Filing	12000	2026-03-20
82	82	Late Payment	15000	2026-03-25
83	83	Incorrect Declaration	25000	2026-04-20
84	84	Late Filing	13000	2026-05-20
85	85	Tax Evasion	40000	2026-06-20
86	86	Late Payment	18000	2026-07-20
87	87	Late Filing	12000	2026-08-20
88	88	Incorrect Declaration	26000	2026-09-20
89	89	Late Payment	18000	2026-10-20
90	90	Tax Evasion	45000	2026-11-20
91	91	Late Filing	13000	2026-03-30
92	92	Late Payment	16000	2026-04-05
93	93	Incorrect Declaration	28000	2026-04-25
94	94	Late Filing	14000	2026-05-25
95	95	Tax Evasion	50000	2026-06-25
96	96	Late Payment	20000	2026-07-25
97	97	Late Filing	15000	2026-08-25
98	98	Incorrect Declaration	30000	2026-09-25
99	99	Late Payment	22000	2026-10-25
100	100	Tax Evasion	55000	2026-11-25
\.


--
-- Data for Name: property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property (property_id, taxpayer_id, property_location, property_value, registration_date) FROM stdin;
1	1	Kigali City	5000000	2018-01-10
2	2	Gasabo District	7000000	2018-02-15
3	3	Kicukiro District	8500000	2018-03-20
4	4	Nyarugenge District	6000000	2018-04-05
5	5	Musanze Town	9000000	2018-05-12
6	6	Rubavu Town	7500000	2018-06-18
7	7	Huye Town	6500000	2018-07-22
8	8	Muhanga Town	8000000	2018-08-10
9	9	Rwamagana Town	9500000	2018-09-15
10	10	Bugesera Town	12000000	2018-10-20
11	11	Kigali City	10000000	2019-01-05
12	12	Gasabo District	12500000	2019-02-10
13	13	Kicukiro District	15000000	2019-03-15
14	14	Nyarugenge District	8000000	2019-04-20
15	15	Musanze Town	17000000	2019-05-25
16	16	Rubavu Town	11000000	2019-06-05
17	17	Huye Town	9000000	2019-07-10
18	18	Muhanga Town	13000000	2019-08-15
19	19	Rwamagana Town	16000000	2019-09-20
20	20	Bugesera Town	14000000	2019-10-25
21	21	Kigali City	18000000	2020-01-10
22	22	Gasabo District	20000000	2020-02-15
23	23	Kicukiro District	22000000	2020-03-20
24	24	Nyarugenge District	15000000	2020-04-25
25	25	Musanze Town	25000000	2020-05-30
26	26	Rubavu Town	19000000	2020-06-05
27	27	Huye Town	17000000	2020-07-10
28	28	Muhanga Town	21000000	2020-08-15
29	29	Rwamagana Town	23000000	2020-09-20
30	30	Bugesera Town	26000000	2020-10-25
31	31	Kigali City	28000000	2021-01-05
32	32	Gasabo District	30000000	2021-02-10
33	33	Kicukiro District	35000000	2021-03-15
34	34	Nyarugenge District	24000000	2021-04-20
35	35	Musanze Town	38000000	2021-05-25
36	36	Rubavu Town	27000000	2021-06-30
37	37	Huye Town	25000000	2021-07-05
38	38	Muhanga Town	32000000	2021-08-10
39	39	Rwamagana Town	36000000	2021-09-15
40	40	Bugesera Town	40000000	2021-10-20
41	41	Kigali City	42000000	2022-01-10
42	42	Gasabo District	45000000	2022-02-15
43	43	Kicukiro District	50000000	2022-03-20
44	44	Nyarugenge District	38000000	2022-04-25
45	45	Musanze Town	55000000	2022-05-30
46	46	Rubavu Town	46000000	2022-06-05
47	47	Huye Town	39000000	2022-07-10
48	48	Muhanga Town	48000000	2022-08-15
49	49	Rwamagana Town	52000000	2022-09-20
50	50	Bugesera Town	60000000	2022-10-25
51	51	Kigali City	65000000	2023-01-05
52	52	Gasabo District	70000000	2023-02-10
53	53	Kicukiro District	75000000	2023-03-15
54	54	Nyarugenge District	60000000	2023-04-20
55	55	Musanze Town	80000000	2023-05-25
56	56	Rubavu Town	68000000	2023-06-30
57	57	Huye Town	55000000	2023-07-05
58	58	Muhanga Town	72000000	2023-08-10
59	59	Rwamagana Town	85000000	2023-09-15
60	60	Bugesera Town	90000000	2023-10-20
61	61	Kigali City	95000000	2024-01-10
62	62	Gasabo District	100000000	2024-02-15
63	63	Kicukiro District	110000000	2024-03-20
64	64	Nyarugenge District	85000000	2024-04-25
65	65	Musanze Town	120000000	2024-05-30
66	66	Rubavu Town	105000000	2024-06-05
67	67	Huye Town	90000000	2024-07-10
68	68	Muhanga Town	115000000	2024-08-15
69	69	Rwamagana Town	130000000	2024-09-20
70	70	Bugesera Town	140000000	2024-10-25
71	71	Kigali City	150000000	2025-01-05
72	72	Gasabo District	160000000	2025-02-10
73	73	Kicukiro District	170000000	2025-03-15
74	74	Nyarugenge District	145000000	2025-04-20
75	75	Musanze Town	180000000	2025-05-25
76	76	Rubavu Town	165000000	2025-06-30
77	77	Huye Town	150000000	2025-07-05
78	78	Muhanga Town	175000000	2025-08-10
79	79	Rwamagana Town	190000000	2025-09-15
80	80	Bugesera Town	200000000	2025-10-20
81	81	Kigali City	220000000	2025-11-01
82	82	Gasabo District	230000000	2025-11-05
83	83	Kicukiro District	240000000	2025-11-10
84	84	Nyarugenge District	210000000	2025-11-15
85	85	Musanze Town	260000000	2025-11-20
86	86	Rubavu Town	250000000	2025-11-25
87	87	Huye Town	220000000	2025-12-01
88	88	Muhanga Town	270000000	2025-12-05
89	89	Rwamagana Town	280000000	2025-12-10
90	90	Bugesera Town	300000000	2025-12-15
91	91	Kigali City	320000000	2026-01-05
92	92	Gasabo District	340000000	2026-01-10
93	93	Kicukiro District	360000000	2026-01-15
94	94	Nyarugenge District	310000000	2026-01-20
95	95	Musanze Town	380000000	2026-01-25
96	96	Rubavu Town	350000000	2026-02-01
97	97	Huye Town	330000000	2026-02-05
98	98	Muhanga Town	370000000	2026-02-10
99	99	Rwamagana Town	400000000	2026-02-15
100	100	Bugesera Town	450000000	2026-02-20
\.


--
-- Data for Name: revenue_target; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.revenue_target (target_id, tax_centre_id, tax_type_id, target_year, target_amount) FROM stdin;
1	1	1	2022-01-01	5000000
2	2	2	2022-01-01	7000000
3	3	3	2022-01-01	9000000
4	4	4	2022-01-01	6500000
5	5	5	2022-01-01	8000000
6	6	6	2022-01-01	7500000
7	7	7	2022-01-01	10000000
8	8	8	2022-01-01	8500000
9	9	9	2022-01-01	12000000
10	10	10	2022-01-01	9500000
11	11	11	2022-01-01	11000000
12	12	12	2022-01-01	13000000
13	13	13	2022-01-01	15000000
14	14	14	2022-01-01	12000000
15	15	15	2022-01-01	17000000
16	16	16	2022-01-01	14000000
17	17	17	2022-01-01	16000000
18	18	18	2022-01-01	13500000
19	19	19	2022-01-01	18000000
20	20	20	2022-01-01	20000000
21	21	21	2023-01-01	22000000
22	22	22	2023-01-01	24000000
23	23	23	2023-01-01	26000000
24	24	24	2023-01-01	23000000
25	25	25	2023-01-01	28000000
26	26	26	2023-01-01	25000000
27	27	27	2023-01-01	30000000
28	28	28	2023-01-01	27000000
29	29	29	2023-01-01	32000000
30	30	30	2023-01-01	35000000
31	31	31	2023-01-01	37000000
32	32	32	2023-01-01	40000000
33	33	33	2023-01-01	42000000
34	34	34	2023-01-01	39000000
35	35	35	2023-01-01	45000000
36	36	36	2023-01-01	43000000
37	37	37	2023-01-01	47000000
38	38	38	2023-01-01	46000000
39	39	39	2023-01-01	50000000
40	40	40	2023-01-01	55000000
41	41	41	2024-01-01	58000000
42	42	42	2024-01-01	60000000
43	43	43	2024-01-01	65000000
44	44	44	2024-01-01	62000000
45	45	45	2024-01-01	70000000
46	46	46	2024-01-01	68000000
47	47	47	2024-01-01	75000000
48	48	48	2024-01-01	72000000
49	49	49	2024-01-01	80000000
50	50	50	2024-01-01	85000000
51	51	51	2024-01-01	90000000
52	52	52	2024-01-01	95000000
53	53	53	2024-01-01	100000000
54	54	54	2024-01-01	92000000
55	55	55	2024-01-01	110000000
56	56	56	2024-01-01	105000000
57	57	57	2024-01-01	115000000
58	58	58	2024-01-01	120000000
59	59	59	2024-01-01	125000000
60	60	60	2024-01-01	130000000
61	61	61	2025-01-01	135000000
62	62	62	2025-01-01	140000000
63	63	63	2025-01-01	145000000
64	64	64	2025-01-01	150000000
65	65	65	2025-01-01	155000000
66	66	66	2025-01-01	160000000
67	67	67	2025-01-01	165000000
68	68	68	2025-01-01	170000000
69	69	69	2025-01-01	175000000
70	70	70	2025-01-01	180000000
71	71	71	2025-01-01	185000000
72	72	72	2025-01-01	190000000
73	73	73	2025-01-01	195000000
74	74	74	2025-01-01	200000000
75	75	75	2025-01-01	210000000
76	76	76	2025-01-01	220000000
77	77	77	2025-01-01	230000000
78	78	78	2025-01-01	240000000
79	79	79	2025-01-01	250000000
80	80	80	2025-01-01	260000000
81	81	81	2026-01-01	270000000
82	82	82	2026-01-01	280000000
83	83	83	2026-01-01	290000000
84	84	84	2026-01-01	300000000
85	85	85	2026-01-01	310000000
86	86	86	2026-01-01	320000000
87	87	87	2026-01-01	330000000
88	88	88	2026-01-01	340000000
89	89	89	2026-01-01	350000000
90	90	90	2026-01-01	360000000
91	91	91	2026-01-01	370000000
92	92	92	2026-01-01	380000000
93	93	93	2026-01-01	390000000
94	94	94	2026-01-01	400000000
95	95	95	2026-01-01	420000000
96	96	96	2026-01-01	440000000
97	97	97	2026-01-01	460000000
98	98	98	2026-01-01	480000000
99	99	99	2026-01-01	500000000
100	100	100	2026-01-01	550000000
\.


--
-- Data for Name: tax_assessment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_assessment (assessment_id, declaration_id, officer_id, assessment_date, assessment_amount) FROM stdin;
1	1	1	2022-03-01	52000
2	2	2	2022-03-05	78000
3	3	3	2022-04-01	125000
4	4	4	2022-05-01	95000
5	5	5	2022-06-01	155000
6	6	6	2022-07-01	85000
7	7	7	2022-08-01	70000
8	8	8	2022-09-01	100000
9	9	9	2022-10-01	115000
10	10	10	2022-11-01	135000
11	11	11	2022-03-10	58000
12	12	12	2022-03-15	80000
13	13	13	2022-04-10	130000
14	14	14	2022-05-10	98000
15	15	15	2022-06-10	160000
16	16	16	2022-07-10	88000
17	17	17	2022-08-10	73000
18	18	18	2022-09-10	102000
19	19	19	2022-10-10	120000
20	20	20	2022-11-10	140000
21	21	21	2023-03-01	63000
22	22	22	2023-03-05	85000
23	23	23	2023-04-01	135000
24	24	24	2023-05-01	100000
25	25	25	2023-06-01	165000
26	26	26	2023-07-01	92000
27	27	27	2023-08-01	76000
28	28	28	2023-09-01	108000
29	29	29	2023-10-01	125000
30	30	30	2023-11-01	145000
31	31	31	2023-03-10	68000
32	32	32	2023-03-15	88000
33	33	33	2023-04-10	140000
34	34	34	2023-05-10	105000
35	35	35	2023-06-10	170000
36	36	36	2023-07-10	95000
37	37	37	2023-08-10	80000
38	38	38	2023-09-10	112000
39	39	39	2023-10-10	130000
41	41	41	2024-03-01	72000
42	42	42	2024-03-05	92000
43	43	43	2024-04-01	145000
44	44	44	2024-05-01	112000
45	45	45	2024-06-01	175000
46	46	46	2024-07-01	98000
47	47	47	2024-08-01	85000
48	48	48	2024-09-01	118000
49	49	49	2024-10-01	135000
50	50	50	2024-11-01	155000
51	51	51	2024-03-10	75000
52	52	52	2024-03-15	95000
53	53	53	2024-04-10	150000
54	54	54	2024-05-10	118000
55	55	55	2024-06-10	180000
56	56	56	2024-07-10	102000
57	57	57	2024-08-10	88000
58	58	58	2024-09-10	120000
59	59	59	2024-10-10	140000
60	60	60	2024-11-10	160000
61	61	61	2025-03-01	78000
62	62	62	2025-03-05	100000
63	63	63	2025-04-01	155000
64	64	64	2025-05-01	125000
65	65	65	2025-06-01	185000
66	66	66	2025-07-01	108000
67	67	67	2025-08-01	92000
68	68	68	2025-09-01	125000
69	69	69	2025-10-01	145000
70	70	70	2025-11-01	165000
71	71	71	2025-03-10	82000
72	72	72	2025-03-15	105000
73	73	73	2025-04-10	160000
74	74	74	2025-05-10	130000
75	75	75	2025-06-10	190000
76	76	76	2025-07-10	112000
77	77	77	2025-08-10	95000
78	78	78	2025-09-10	130000
79	79	79	2025-10-10	150000
80	80	80	2025-11-10	170000
81	81	81	2026-03-01	85000
82	82	82	2026-03-05	110000
83	83	83	2026-04-01	165000
84	84	84	2026-05-01	135000
85	85	85	2026-06-01	200000
86	86	86	2026-07-01	120000
87	87	87	2026-08-01	100000
88	88	88	2026-09-01	135000
89	89	89	2026-10-01	155000
90	90	90	2026-11-01	175000
91	91	91	2026-03-10	90000
92	92	92	2026-03-15	115000
93	93	93	2026-04-10	170000
94	94	94	2026-05-10	140000
95	95	95	2026-06-10	205000
96	96	96	2026-07-10	125000
97	97	97	2026-08-10	105000
98	98	98	2026-09-10	140000
100	100	100	2026-11-10	180000
99	99	99	2026-10-10	2000000
40	40	40	2023-11-10	20000000
\.


--
-- Data for Name: tax_audit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_audit (audit_id, taxpayer_id, officer_id, audit_start_date, audit_status) FROM stdin;
1	1	1	2022-01-10	Open
2	2	2	2022-01-15	Closed
3	3	3	2022-01-20	Open
4	4	4	2022-02-01	Closed
5	5	5	2022-02-05	Open
6	6	6	2022-02-10	Closed
7	7	7	2022-02-15	Open
8	8	8	2022-02-20	Closed
9	9	9	2022-03-01	Open
10	10	10	2022-03-05	Closed
11	11	11	2022-03-10	Open
12	12	12	2022-03-15	Closed
13	13	13	2022-03-20	Open
14	14	14	2022-04-01	Closed
15	15	15	2022-04-05	Open
16	16	16	2022-04-10	Closed
17	17	17	2022-04-15	Open
18	18	18	2022-04-20	Closed
19	19	19	2022-05-01	Open
20	20	20	2022-05-05	Closed
21	21	21	2022-05-10	Open
22	22	22	2022-05-15	Closed
23	23	23	2022-05-20	Open
24	24	24	2022-06-01	Closed
25	25	25	2022-06-05	Open
26	26	26	2022-06-10	Closed
27	27	27	2022-06-15	Open
28	28	28	2022-06-20	Closed
29	29	29	2022-07-01	Open
30	30	30	2022-07-05	Closed
31	31	31	2022-07-10	Open
32	32	32	2022-07-15	Closed
33	33	33	2022-07-20	Open
34	34	34	2022-08-01	Closed
35	35	35	2022-08-05	Open
36	36	36	2022-08-10	Closed
37	37	37	2022-08-15	Open
38	38	38	2022-08-20	Closed
39	39	39	2022-09-01	Open
40	40	40	2022-09-05	Closed
41	41	41	2022-09-10	Open
42	42	42	2022-09-15	Closed
43	43	43	2022-09-20	Open
44	44	44	2022-10-01	Closed
45	45	45	2022-10-05	Open
46	46	46	2022-10-10	Closed
47	47	47	2022-10-15	Open
48	48	48	2022-10-20	Closed
49	49	49	2022-11-01	Open
50	50	50	2022-11-05	Closed
51	51	51	2023-01-10	Open
52	52	52	2023-01-15	Closed
53	53	53	2023-01-20	Open
54	54	54	2023-02-01	Closed
55	55	55	2023-02-05	Open
56	56	56	2023-02-10	Closed
57	57	57	2023-02-15	Open
58	58	58	2023-02-20	Closed
59	59	59	2023-03-01	Open
60	60	60	2023-03-05	Closed
61	61	61	2023-03-10	Open
62	62	62	2023-03-15	Closed
63	63	63	2023-03-20	Open
64	64	64	2023-04-01	Closed
65	65	65	2023-04-05	Open
66	66	66	2023-04-10	Closed
67	67	67	2023-04-15	Open
68	68	68	2023-04-20	Closed
69	69	69	2023-05-01	Open
70	70	70	2023-05-05	Closed
71	71	71	2023-05-10	Open
72	72	72	2023-05-15	Closed
73	73	73	2023-05-20	Open
74	74	74	2023-06-01	Closed
75	75	75	2023-06-05	Open
76	76	76	2023-06-10	Closed
77	77	77	2023-06-15	Open
78	78	78	2023-06-20	Closed
79	79	79	2023-07-01	Open
80	80	80	2023-07-05	Closed
81	81	81	2023-07-10	Open
82	82	82	2023-07-15	Closed
83	83	83	2023-07-20	Open
84	84	84	2023-08-01	Closed
85	85	85	2023-08-05	Open
86	86	86	2023-08-10	Closed
87	87	87	2023-08-15	Open
88	88	88	2023-08-20	Closed
89	89	89	2023-09-01	Open
90	90	90	2023-09-05	Closed
91	91	91	2023-09-10	Open
92	92	92	2023-09-15	Closed
93	93	93	2023-09-20	Open
94	94	94	2023-10-01	Closed
95	95	95	2023-10-05	Open
96	96	96	2023-10-10	Closed
97	97	97	2023-10-15	Open
98	98	98	2023-10-20	Closed
99	99	99	2023-11-01	Open
100	100	100	2023-11-05	Closed
\.


--
-- Data for Name: tax_centre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_centre (tax_centre_id, centre_name, district_name, centre_manager, opening_date) FROM stdin;
1	Kigali Central	Nyarugenge	Jean Uwimana	2019-01-10
2	Remera Centre	Gasabo	Alice Mukamana	2019-01-15
3	Kimironko Centre	Gasabo	Patrick Habimana	2019-02-01
4	Kacyiru Centre	Gasabo	Eric Ndayisaba	2019-02-10
5	Nyamirambo Centre	Nyarugenge	Grace Uwase	2019-03-01
6	Kanombe Centre	Kicukiro	Claude Musoni	2019-03-15
7	Gikondo Centre	Kicukiro	Olive Mukamana	2019-04-01
8	Kicukiro Centre	Kicukiro	David Nshimiyimana	2019-04-10
9	Gisozi Centre	Gasabo	Aimable Mugabo	2019-05-01
10	Kabeza Centre	Kicukiro	Jean Bosco	2019-05-10
11	Muhanga Centre	Muhanga	Samuel Habineza	2019-06-01
12	Kabgayi Centre	Muhanga	Yvette Uwamahoro	2019-06-10
13	Huye Centre	Huye	Ange Umutoni	2019-07-01
14	Ngoma Centre	Ngoma	Beatha Ingabire	2019-07-10
15	Musanze Centre	Musanze	Alex Rugira	2019-08-01
16	Rubavu Centre	Rubavu	Eric Mutabazi	2019-08-10
17	Rusizi Centre	Rusizi	Diane Mukankusi	2019-09-01
18	Karongi Centre	Karongi	Chris Rukundo	2019-09-10
19	Rwamagana Centre	Rwamagana	Fabrice Habyarimana	2019-10-01
20	Nyagatare Centre	Nyagatare	Marie Chantal	2019-10-10
21	Gatsibo Centre	Gatsibo	Emmy Niyibizi	2019-11-01
22	Kayonza Centre	Kayonza	Patrick Rwabukumba	2019-11-10
23	Kirehe Centre	Kirehe	Julienne Mukarubayiza	2019-12-01
24	Bugesera Centre	Bugesera	Claude Musoni	2019-12-10
25	Nyanza Centre	Nyanza	Vestine Mukarugwiza	2020-01-01
26	Ruhango Centre	Ruhango	Lionel Ntakirutimana	2020-01-10
27	Kamonyi Centre	Kamonyi	Chantal Uwase	2020-02-01
28	Gisagara Centre	Gisagara	Jean Claude Murekezi	2020-02-10
29	Nyamagabe Centre	Nyamagabe	Patrick Habimana	2020-03-01
30	Nyaruguru Centre	Nyaruguru	Olga Mukeshimana	2020-03-10
31	Nyabihu Centre	Nyabihu	Kevin Ndayambaje	2020-04-01
32	Rutsiro Centre	Rutsiro	Sandra Uwimana	2020-04-10
33	Ngororero Centre	Ngororero	Jean Bosco	2020-05-01
34	Burera Centre	Burera	Rose Nyirabazungu	2020-05-10
35	Gakenke Centre	Gakenke	Isaac Mugabo	2020-06-01
36	Rulindo Centre	Rulindo	Dorcas Uwamwezi	2020-06-10
37	Gicumbi Centre	Gicumbi	Joseph Niyonkuru	2020-07-01
38	Nyamasheke Centre	Nyamasheke	Gloria Mukamana	2020-07-10
39	Nyundo Centre	Rubavu	Theoneste Nzeyimana	2020-08-01
40	Kinigi Centre	Musanze	Benjamin Tuyubahe	2020-08-10
41	Kibungo Centre	Ngoma	Israel Cyubahiro	2020-09-01
42	Byumba Centre	Gicumbi	Gilbert Nsengimana	2020-09-10
43	Cyangugu Centre	Rusizi	Daniel Habimana	2020-10-01
44	Kibuye Centre	Karongi	Jeannette Uwase	2020-10-10
45	Gahini Centre	Kayonza	Jean Paul Mugisha	2020-11-01
46	Rukira Centre	Kayonza	Claude Rugema	2020-11-10
47	Rushashi Centre	Gakenke	Eric Nkuranga	2020-12-01
48	Kinihira Centre	Rulindo	Bosco Habyarimana	2020-12-10
49	Mimuri Centre	Nyagatare	Patrick Nshimiyimana	2021-01-01
50	Matimba Centre	Nyagatare	Odette Mukamana	2021-01-10
51	Centre 51	Gasabo	Manager 51	2021-02-01
52	Centre 52	Gasabo	Manager 52	2021-02-10
53	Centre 53	Gasabo	Manager 53	2021-03-01
54	Centre 54	Gasabo	Manager 54	2021-03-10
55	Centre 55	Gasabo	Manager 55	2021-04-01
56	Centre 56	Kicukiro	Manager 56	2021-04-10
57	Centre 57	Kicukiro	Manager 57	2021-05-01
58	Centre 58	Nyarugenge	Manager 58	2021-05-10
59	Centre 59	Muhanga	Manager 59	2021-06-01
60	Centre 60	Huye	Manager 60	2021-06-10
61	Centre 61	Rubavu	Manager 61	2021-07-01
62	Centre 62	Musanze	Manager 62	2021-07-10
63	Centre 63	Rusizi	Manager 63	2021-08-01
64	Centre 64	Karongi	Manager 64	2021-08-10
65	Centre 65	Ngoma	Manager 65	2021-09-01
66	Centre 66	Nyagatare	Manager 66	2021-09-10
67	Centre 67	Bugesera	Manager 67	2021-10-01
68	Centre 68	Kamonyi	Manager 68	2021-10-10
69	Centre 69	Ruhango	Manager 69	2021-11-01
70	Centre 70	Nyanza	Manager 70	2021-11-10
71	Centre 71	Gatsibo	Manager 71	2021-12-01
72	Centre 72	Kirehe	Manager 72	2021-12-10
73	Centre 73	Rwamagana	Manager 73	2022-01-01
74	Centre 74	Kayonza	Manager 74	2022-01-10
75	Centre 75	Gicumbi	Manager 75	2022-02-01
76	Centre 76	Rulindo	Manager 76	2022-02-10
77	Centre 77	Gakenke	Manager 77	2022-03-01
78	Centre 78	Burera	Manager 78	2022-03-10
79	Centre 79	Nyabihu	Manager 79	2022-04-01
80	Centre 80	Rutsiro	Manager 80	2022-04-10
81	Centre 81	Ngororero	Manager 81	2022-05-01
82	Centre 82	Nyamasheke	Manager 82	2022-05-10
83	Centre 83	Gisagara	Manager 83	2022-06-01
84	Centre 84	Nyamagabe	Manager 84	2022-06-10
85	Centre 85	Nyaruguru	Manager 85	2022-07-01
86	Centre 86	Gasabo	Manager 86	2022-07-10
87	Centre 87	Kicukiro	Manager 87	2022-08-01
88	Centre 88	Nyarugenge	Manager 88	2022-08-10
89	Centre 89	Rubavu	Manager 89	2022-09-01
90	Centre 90	Musanze	Manager 90	2022-09-10
91	Centre 91	Ngoma	Manager 91	2022-10-01
92	Centre 92	Kirehe	Manager 92	2022-10-10
93	Centre 93	Bugesera	Manager 93	2022-11-01
94	Centre 94	Kamonyi	Manager 94	2022-11-10
95	Centre 95	Muhanga	Manager 95	2022-12-01
96	Centre 96	Huye	Manager 96	2022-12-10
97	Centre 97	Karongi	Manager 97	2023-01-01
98	Centre 98	Rusizi	Manager 98	2023-01-10
99	Centre 99	Nyagatare	Manager 99	2023-02-01
100	Centre 100	Rwamagana	Manager 100	2023-02-10
\.


--
-- Data for Name: tax_declaration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_declaration (declaration_id, registration_id, tax_period, declaration_date, declared_amount) FROM stdin;
1	1	1	2022-02-10	50000
2	2	2	2022-03-10	75000
3	3	3	2022-04-10	120000
4	4	4	2022-05-10	90000
5	5	5	2022-06-10	150000
6	6	6	2022-07-10	80000
7	7	7	2022-08-10	65000
8	8	8	2022-09-10	95000
9	9	9	2022-10-10	110000
10	10	10	2022-11-10	130000
11	11	11	2022-02-15	55000
12	12	12	2022-03-15	78000
13	13	13	2022-04-15	125000
14	14	14	2022-05-15	92000
15	15	15	2022-06-15	155000
16	16	16	2022-07-15	83000
17	17	17	2022-08-15	68000
18	18	18	2022-09-15	98000
19	19	19	2022-10-15	115000
20	20	20	2022-11-15	135000
21	21	21	2023-02-10	60000
22	22	22	2023-03-10	82000
23	23	23	2023-04-10	130000
24	24	24	2023-05-10	97000
25	25	25	2023-06-10	160000
26	26	26	2023-07-10	88000
27	27	27	2023-08-10	72000
28	28	28	2023-09-10	102000
29	29	29	2023-10-10	120000
30	30	30	2023-11-10	140000
31	31	31	2023-02-15	65000
32	32	32	2023-03-15	85000
33	33	33	2023-04-15	135000
34	34	34	2023-05-15	100000
35	35	35	2023-06-15	165000
36	36	36	2023-07-15	90000
37	37	37	2023-08-15	75000
38	38	38	2023-09-15	105000
39	39	39	2023-10-15	125000
40	40	40	2023-11-15	145000
41	41	41	2024-02-10	70000
42	42	42	2024-03-10	88000
43	43	43	2024-04-10	140000
44	44	44	2024-05-10	110000
45	45	45	2024-06-10	170000
46	46	46	2024-07-10	95000
47	47	47	2024-08-10	78000
48	48	48	2024-09-10	110000
49	49	49	2024-10-10	130000
50	50	50	2024-11-10	150000
51	51	51	2024-02-15	72000
52	52	52	2024-03-15	90000
53	53	53	2024-04-15	145000
54	54	54	2024-05-15	115000
55	55	55	2024-06-15	175000
56	56	56	2024-07-15	98000
57	57	57	2024-08-15	82000
58	58	58	2024-09-15	115000
59	59	59	2024-10-15	135000
60	60	60	2024-11-15	155000
61	61	61	2025-02-10	75000
62	62	62	2025-03-10	95000
63	63	63	2025-04-10	150000
64	64	64	2025-05-10	120000
65	65	65	2025-06-10	180000
66	66	66	2025-07-10	100000
67	67	67	2025-08-10	85000
68	68	68	2025-09-10	120000
69	69	69	2025-10-10	140000
70	70	70	2025-11-10	160000
71	71	71	2025-02-15	78000
72	72	72	2025-03-15	98000
73	73	73	2025-04-15	155000
74	74	74	2025-05-15	125000
75	75	75	2025-06-15	185000
76	76	76	2025-07-15	105000
77	77	77	2025-08-15	88000
78	78	78	2025-09-15	125000
79	79	79	2025-10-15	145000
80	80	80	2025-11-15	165000
81	81	81	2026-02-10	80000
82	82	82	2026-03-10	100000
83	83	83	2026-04-10	160000
84	84	84	2026-05-10	130000
85	85	85	2026-06-10	190000
86	86	86	2026-07-10	110000
87	87	87	2026-08-10	90000
88	88	88	2026-09-10	130000
89	89	89	2026-10-10	150000
90	90	90	2026-11-10	170000
91	91	91	2026-02-15	85000
92	92	92	2026-03-15	105000
93	93	93	2026-04-15	165000
94	94	94	2026-05-15	135000
95	95	95	2026-06-15	195000
96	96	96	2026-07-15	115000
97	97	97	2026-08-15	95000
98	98	98	2026-09-15	135000
99	99	99	2026-10-15	155000
100	100	100	2026-11-15	175000
\.


--
-- Data for Name: tax_objection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_objection (objection_id, assessment_id, objection_date, objection_status) FROM stdin;
1	1	2022-04-01	Pending
2	2	2022-04-05	Approved
3	3	2022-04-10	Rejected
4	4	2022-04-15	Pending
5	5	2022-04-20	Approved
6	6	2022-04-25	Rejected
7	7	2022-05-01	Pending
8	8	2022-05-05	Approved
9	9	2022-05-10	Rejected
10	10	2022-05-15	Pending
11	11	2022-05-20	Approved
12	12	2022-05-25	Rejected
13	13	2022-06-01	Pending
14	14	2022-06-05	Approved
15	15	2022-06-10	Rejected
16	16	2022-06-15	Pending
17	17	2022-06-20	Approved
18	18	2022-06-25	Rejected
19	19	2022-07-01	Pending
20	20	2022-07-05	Approved
21	21	2022-07-10	Rejected
22	22	2022-07-15	Pending
23	23	2022-07-20	Approved
24	24	2022-07-25	Rejected
25	25	2022-08-01	Pending
26	26	2022-08-05	Approved
27	27	2022-08-10	Rejected
28	28	2022-08-15	Pending
29	29	2022-08-20	Approved
30	30	2022-08-25	Rejected
31	31	2022-09-01	Pending
32	32	2022-09-05	Approved
33	33	2022-09-10	Rejected
34	34	2022-09-15	Pending
35	35	2022-09-20	Approved
36	36	2022-09-25	Rejected
37	37	2022-10-01	Pending
38	38	2022-10-05	Approved
39	39	2022-10-10	Rejected
40	40	2022-10-15	Pending
41	41	2022-10-20	Approved
42	42	2022-10-25	Rejected
43	43	2022-11-01	Pending
44	44	2022-11-05	Approved
45	45	2022-11-10	Rejected
46	46	2022-11-15	Pending
47	47	2022-11-20	Approved
48	48	2022-11-25	Rejected
49	49	2022-12-01	Pending
50	50	2022-12-05	Approved
51	51	2023-04-01	Rejected
52	52	2023-04-05	Pending
53	53	2023-04-10	Approved
54	54	2023-04-15	Rejected
55	55	2023-04-20	Pending
56	56	2023-04-25	Approved
57	57	2023-05-01	Rejected
58	58	2023-05-05	Pending
59	59	2023-05-10	Approved
60	60	2023-05-15	Rejected
61	61	2023-05-20	Pending
62	62	2023-05-25	Approved
63	63	2023-06-01	Rejected
64	64	2023-06-05	Pending
65	65	2023-06-10	Approved
66	66	2023-06-15	Rejected
67	67	2023-06-20	Pending
68	68	2023-06-25	Approved
69	69	2023-07-01	Rejected
70	70	2023-07-05	Pending
71	71	2023-07-10	Approved
72	72	2023-07-15	Rejected
73	73	2023-07-20	Pending
74	74	2023-07-25	Approved
75	75	2023-08-01	Rejected
76	76	2023-08-05	Pending
77	77	2023-08-10	Approved
78	78	2023-08-15	Rejected
79	79	2023-08-20	Pending
80	80	2023-08-25	Approved
81	81	2023-09-01	Rejected
82	82	2023-09-05	Pending
83	83	2023-09-10	Approved
84	84	2023-09-15	Rejected
85	85	2023-09-20	Pending
86	86	2023-09-25	Approved
87	87	2023-10-01	Rejected
88	88	2023-10-05	Pending
89	89	2023-10-10	Approved
90	90	2023-10-15	Rejected
91	91	2023-10-20	Pending
92	92	2023-10-25	Approved
93	93	2023-11-01	Rejected
94	94	2023-11-05	Pending
95	95	2023-11-10	Approved
96	96	2023-11-15	Rejected
97	97	2023-11-20	Pending
98	98	2023-11-25	Approved
99	99	2023-12-01	Rejected
100	100	2023-12-05	Pending
\.


--
-- Data for Name: tax_officer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_officer (officer_id, tax_centre_id, officer_name, officer_position, employment_date) FROM stdin;
1	1	Jean Uwimana	Tax Officer	2020-01-10
2	2	Alice Mukamana	Senior Tax Officer	2020-01-15
3	3	Patrick Habimana	Tax Auditor	2020-01-20
4	4	Eric Ndayisaba	Revenue Officer	2020-02-01
5	5	Grace Uwase	Tax Officer	2020-02-05
6	6	Claude Musoni	Tax Auditor	2020-02-10
7	7	Olive Mukamana	Revenue Officer	2020-02-15
8	8	David Nshimiyimana	Senior Tax Officer	2020-02-20
9	9	Aimable Mugabo	Tax Officer	2020-03-01
10	10	Jean Bosco	Revenue Officer	2020-03-05
11	11	Samuel Habineza	Tax Auditor	2020-03-10
12	12	Yvette Uwamahoro	Tax Officer	2020-03-15
13	13	Ange Umutoni	Senior Tax Officer	2020-03-20
14	14	Beatha Ingabire	Revenue Officer	2020-04-01
15	15	Alex Rugira	Tax Officer	2020-04-05
16	16	Eric Mutabazi	Tax Auditor	2020-04-10
17	17	Diane Mukankusi	Revenue Officer	2020-04-15
18	18	Chris Rukundo	Tax Officer	2020-04-20
19	19	Fabrice Habyarimana	Senior Tax Officer	2020-05-01
20	20	Marie Chantal	Revenue Officer	2020-05-05
21	21	Emmy Niyibizi	Tax Officer	2020-05-10
22	22	Patrick Rwabukumba	Tax Auditor	2020-05-15
23	23	Julienne Mukarubayiza	Revenue Officer	2020-05-20
24	24	Claude Rugema	Tax Officer	2020-06-01
25	25	Vestine Mukarugwiza	Senior Tax Officer	2020-06-05
26	26	Lionel Ntakirutimana	Revenue Officer	2020-06-10
27	27	Chantal Uwase	Tax Officer	2020-06-15
28	28	Jean Claude Murekezi	Tax Auditor	2020-06-20
29	29	Patrick Habimana	Revenue Officer	2020-07-01
30	30	Olga Mukeshimana	Tax Officer	2020-07-05
31	31	Kevin Ndayambaje	Senior Tax Officer	2020-07-10
32	32	Sandra Uwimana	Revenue Officer	2020-07-15
33	33	Rose Nyirabazungu	Tax Officer	2020-07-20
34	34	Isaac Mugabo	Tax Auditor	2020-08-01
35	35	Dorcas Uwamwezi	Revenue Officer	2020-08-05
36	36	Joseph Niyonkuru	Tax Officer	2020-08-10
37	37	Gloria Mukamana	Senior Tax Officer	2020-08-15
38	38	Theoneste Nzeyimana	Revenue Officer	2020-08-20
39	39	Benjamin Tuyubahe	Tax Officer	2020-09-01
40	40	Israel Cyubahiro	Tax Auditor	2020-09-05
41	41	Gilbert Nsengimana	Revenue Officer	2020-09-10
42	42	Daniel Habimana	Tax Officer	2020-09-15
43	43	Jeannette Uwase	Senior Tax Officer	2020-09-20
44	44	Jean Paul Mugisha	Revenue Officer	2020-10-01
45	45	Eric Nkuranga	Tax Officer	2020-10-05
46	46	Bosco Habyarimana	Tax Auditor	2020-10-10
47	47	Patrick Nshimiyimana	Revenue Officer	2020-10-15
48	48	Odette Mukamana	Tax Officer	2020-10-20
49	49	Alice Mukarugwiza	Senior Tax Officer	2020-11-01
50	50	Jean Marie	Revenue Officer	2020-11-05
51	51	Officer 51	Tax Officer	2020-11-10
52	52	Officer 52	Senior Tax Officer	2020-11-15
53	53	Officer 53	Tax Auditor	2020-11-20
54	54	Officer 54	Revenue Officer	2020-12-01
55	55	Officer 55	Tax Officer	2020-12-05
56	56	Officer 56	Senior Tax Officer	2020-12-10
57	57	Officer 57	Tax Auditor	2020-12-15
58	58	Officer 58	Revenue Officer	2020-12-20
59	59	Officer 59	Tax Officer	2021-01-01
60	60	Officer 60	Senior Tax Officer	2021-01-05
61	61	Officer 61	Tax Auditor	2021-01-10
62	62	Officer 62	Revenue Officer	2021-01-15
63	63	Officer 63	Tax Officer	2021-01-20
64	64	Officer 64	Senior Tax Officer	2021-02-01
65	65	Officer 65	Tax Auditor	2021-02-05
66	66	Officer 66	Revenue Officer	2021-02-10
67	67	Officer 67	Tax Officer	2021-02-15
68	68	Officer 68	Senior Tax Officer	2021-02-20
69	69	Officer 69	Tax Auditor	2021-03-01
70	70	Officer 70	Revenue Officer	2021-03-05
71	71	Officer 71	Tax Officer	2021-03-10
72	72	Officer 72	Senior Tax Officer	2021-03-15
73	73	Officer 73	Tax Auditor	2021-03-20
74	74	Officer 74	Revenue Officer	2021-04-01
75	75	Officer 75	Tax Officer	2021-04-05
76	76	Officer 76	Senior Tax Officer	2021-04-10
77	77	Officer 77	Tax Auditor	2021-04-15
78	78	Officer 78	Revenue Officer	2021-04-20
79	79	Officer 79	Tax Officer	2021-05-01
80	80	Officer 80	Senior Tax Officer	2021-05-05
81	81	Officer 81	Tax Auditor	2021-05-10
82	82	Officer 82	Revenue Officer	2021-05-15
83	83	Officer 83	Tax Officer	2021-05-20
84	84	Officer 84	Senior Tax Officer	2021-06-01
85	85	Officer 85	Tax Auditor	2021-06-05
86	86	Officer 86	Revenue Officer	2021-06-10
87	87	Officer 87	Tax Officer	2021-06-15
88	88	Officer 88	Senior Tax Officer	2021-06-20
89	89	Officer 89	Tax Auditor	2021-07-01
90	90	Officer 90	Revenue Officer	2021-07-05
91	91	Officer 91	Tax Officer	2021-07-10
92	92	Officer 92	Senior Tax Officer	2021-07-15
93	93	Officer 93	Tax Auditor	2021-07-20
94	94	Officer 94	Revenue Officer	2021-08-01
95	95	Officer 95	Tax Officer	2021-08-05
96	96	Officer 96	Senior Tax Officer	2021-08-10
97	97	Officer 97	Tax Auditor	2021-08-15
98	98	Officer 98	Revenue Officer	2021-08-20
99	99	Officer 99	Tax Officer	2021-09-01
100	100	Officer 100	Senior Tax Officer	2021-09-05
\.


--
-- Data for Name: tax_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_payment (payment_id, assessment_id, bank_id, payment_date, payment_amount) FROM stdin;
1	1	1	2022-03-15	52000
2	2	2	2022-03-20	78000
3	3	3	2022-04-15	125000
4	4	4	2022-05-15	95000
5	5	5	2022-06-15	155000
6	6	6	2022-07-15	85000
7	7	7	2022-08-15	70000
8	8	8	2022-09-15	100000
9	9	9	2022-10-15	115000
10	10	10	2022-11-15	135000
11	11	11	2022-03-25	58000
12	12	12	2022-04-01	80000
13	13	13	2022-04-20	130000
14	14	14	2022-05-20	98000
15	15	15	2022-06-20	160000
16	16	16	2022-07-20	88000
17	17	17	2022-08-20	73000
18	18	18	2022-09-20	102000
19	19	19	2022-10-20	120000
20	20	20	2022-11-20	140000
21	21	21	2023-03-15	63000
22	22	22	2023-03-20	85000
23	23	23	2023-04-15	135000
24	24	24	2023-05-15	100000
25	25	25	2023-06-15	165000
26	26	26	2023-07-15	92000
27	27	27	2023-08-15	76000
28	28	28	2023-09-15	108000
29	29	29	2023-10-15	125000
30	30	30	2023-11-15	145000
31	31	31	2023-03-25	68000
32	32	32	2023-04-01	88000
33	33	33	2023-04-20	140000
34	34	34	2023-05-20	105000
35	35	35	2023-06-20	170000
36	36	36	2023-07-20	95000
37	37	37	2023-08-20	80000
38	38	38	2023-09-20	112000
39	39	39	2023-10-20	130000
40	40	40	2023-11-20	150000
41	41	41	2024-03-15	72000
42	42	42	2024-03-20	92000
43	43	43	2024-04-15	145000
44	44	44	2024-05-15	112000
45	45	45	2024-06-15	175000
46	46	46	2024-07-15	98000
47	47	47	2024-08-15	85000
48	48	48	2024-09-15	118000
49	49	49	2024-10-15	135000
50	50	50	2024-11-15	155000
51	51	51	2024-03-25	75000
52	52	52	2024-04-01	95000
53	53	53	2024-04-20	150000
54	54	54	2024-05-20	118000
55	55	55	2024-06-20	180000
56	56	56	2024-07-20	102000
57	57	57	2024-08-20	88000
58	58	58	2024-09-20	120000
59	59	59	2024-10-20	140000
60	60	60	2024-11-20	160000
61	61	61	2025-03-15	78000
62	62	62	2025-03-20	100000
63	63	63	2025-04-15	155000
64	64	64	2025-05-15	125000
65	65	65	2025-06-15	185000
66	66	66	2025-07-15	108000
67	67	67	2025-08-15	92000
68	68	68	2025-09-15	125000
69	69	69	2025-10-15	145000
70	70	70	2025-11-15	165000
71	71	71	2025-03-25	82000
72	72	72	2025-04-01	105000
73	73	73	2025-04-20	160000
74	74	74	2025-05-20	130000
75	75	75	2025-06-20	190000
76	76	76	2025-07-20	112000
77	77	77	2025-08-20	95000
78	78	78	2025-09-20	130000
79	79	79	2025-10-20	150000
80	80	80	2025-11-20	170000
81	81	81	2026-03-15	85000
82	82	82	2026-03-20	110000
83	83	83	2026-04-15	165000
84	84	84	2026-05-15	135000
85	85	85	2026-06-15	200000
86	86	86	2026-07-15	120000
87	87	87	2026-08-15	100000
88	88	88	2026-09-15	135000
89	89	89	2026-10-15	155000
90	90	90	2026-11-15	175000
91	91	91	2026-03-25	90000
92	92	92	2026-04-01	115000
93	93	93	2026-04-20	170000
94	94	94	2026-05-20	140000
95	95	95	2026-06-20	205000
96	96	96	2026-07-20	125000
97	97	97	2026-08-20	105000
98	98	98	2026-09-20	140000
99	99	99	2026-10-20	160000
100	100	100	2026-11-20	180000
\.


--
-- Data for Name: tax_period; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_period (tax_period_id, tax_type_id, period_start_date, period_end_date, filing_due_date) FROM stdin;
1	1	2022-01-01	2022-01-31	2022-02-15
2	2	2022-02-01	2022-02-28	2022-03-15
3	3	2022-03-01	2022-03-31	2022-04-15
4	4	2022-04-01	2022-04-30	2022-05-15
5	5	2022-05-01	2022-05-31	2022-06-15
6	6	2022-06-01	2022-06-30	2022-07-15
7	7	2022-07-01	2022-07-31	2022-08-15
8	8	2022-08-01	2022-08-31	2022-09-15
9	9	2022-09-01	2022-09-30	2022-10-15
10	10	2022-10-01	2022-10-31	2022-11-15
11	11	2022-01-01	2022-01-31	2022-02-15
12	12	2022-02-01	2022-02-28	2022-03-15
13	13	2022-03-01	2022-03-31	2022-04-15
14	14	2022-04-01	2022-04-30	2022-05-15
15	15	2022-05-01	2022-05-31	2022-06-15
16	16	2022-06-01	2022-06-30	2022-07-15
17	17	2022-07-01	2022-07-31	2022-08-15
18	18	2022-08-01	2022-08-31	2022-09-15
19	19	2022-09-01	2022-09-30	2022-10-15
20	20	2022-10-01	2022-10-31	2022-11-15
21	21	2023-01-01	2023-01-31	2023-02-15
22	22	2023-02-01	2023-02-28	2023-03-15
23	23	2023-03-01	2023-03-31	2023-04-15
24	24	2023-04-01	2023-04-30	2023-05-15
25	25	2023-05-01	2023-05-31	2023-06-15
26	26	2023-06-01	2023-06-30	2023-07-15
27	27	2023-07-01	2023-07-31	2023-08-15
28	28	2023-08-01	2023-08-31	2023-09-15
29	29	2023-09-01	2023-09-30	2023-10-15
30	30	2023-10-01	2023-10-31	2023-11-15
31	31	2023-01-01	2023-01-31	2023-02-15
32	32	2023-02-01	2023-02-28	2023-03-15
33	33	2023-03-01	2023-03-31	2023-04-15
34	34	2023-04-01	2023-04-30	2023-05-15
35	35	2023-05-01	2023-05-31	2023-06-15
36	36	2023-06-01	2023-06-30	2023-07-15
37	37	2023-07-01	2023-07-31	2023-08-15
38	38	2023-08-01	2023-08-31	2023-09-15
39	39	2023-09-01	2023-09-30	2023-10-15
40	40	2023-10-01	2023-10-31	2023-11-15
41	41	2024-01-01	2024-01-31	2024-02-15
42	42	2024-02-01	2024-02-29	2024-03-15
43	43	2024-03-01	2024-03-31	2024-04-15
44	44	2024-04-01	2024-04-30	2024-05-15
45	45	2024-05-01	2024-05-31	2024-06-15
46	46	2024-06-01	2024-06-30	2024-07-15
47	47	2024-07-01	2024-07-31	2024-08-15
48	48	2024-08-01	2024-08-31	2024-09-15
49	49	2024-09-01	2024-09-30	2024-10-15
50	50	2024-10-01	2024-10-31	2024-11-15
51	51	2024-01-01	2024-01-31	2024-02-15
52	52	2024-02-01	2024-02-29	2024-03-15
53	53	2024-03-01	2024-03-31	2024-04-15
54	54	2024-04-01	2024-04-30	2024-05-15
55	55	2024-05-01	2024-05-31	2024-06-15
56	56	2024-06-01	2024-06-30	2024-07-15
57	57	2024-07-01	2024-07-31	2024-08-15
58	58	2024-08-01	2024-08-31	2024-09-15
59	59	2024-09-01	2024-09-30	2024-10-15
60	60	2024-10-01	2024-10-31	2024-11-15
61	61	2025-01-01	2025-01-31	2025-02-15
62	62	2025-02-01	2025-02-28	2025-03-15
63	63	2025-03-01	2025-03-31	2025-04-15
64	64	2025-04-01	2025-04-30	2025-05-15
65	65	2025-05-01	2025-05-31	2025-06-15
66	66	2025-06-01	2025-06-30	2025-07-15
67	67	2025-07-01	2025-07-31	2025-08-15
68	68	2025-08-01	2025-08-31	2025-09-15
69	69	2025-09-01	2025-09-30	2025-10-15
70	70	2025-10-01	2025-10-31	2025-11-15
71	71	2025-01-01	2025-01-31	2025-02-15
72	72	2025-02-01	2025-02-28	2025-03-15
73	73	2025-03-01	2025-03-31	2025-04-15
74	74	2025-04-01	2025-04-30	2025-05-15
75	75	2025-05-01	2025-05-31	2025-06-15
76	76	2025-06-01	2025-06-30	2025-07-15
77	77	2025-07-01	2025-07-31	2025-08-15
78	78	2025-08-01	2025-08-31	2025-09-15
79	79	2025-09-01	2025-09-30	2025-10-15
80	80	2025-10-01	2025-10-31	2025-11-15
81	81	2026-01-01	2026-01-31	2026-02-15
82	82	2026-02-01	2026-02-28	2026-03-15
83	83	2026-03-01	2026-03-31	2026-04-15
84	84	2026-04-01	2026-04-30	2026-05-15
85	85	2026-05-01	2026-05-31	2026-06-15
86	86	2026-06-01	2026-06-30	2026-07-15
87	87	2026-07-01	2026-07-31	2026-08-15
88	88	2026-08-01	2026-08-31	2026-09-15
89	89	2026-09-01	2026-09-30	2026-10-15
90	90	2026-10-01	2026-10-31	2026-11-15
91	91	2026-01-01	2026-01-31	2026-02-15
92	92	2026-02-01	2026-02-28	2026-03-15
93	93	2026-03-01	2026-03-31	2026-04-15
94	94	2026-04-01	2026-04-30	2026-05-15
95	95	2026-05-01	2026-05-31	2026-06-15
96	96	2026-06-01	2026-06-30	2026-07-15
97	97	2026-07-01	2026-07-31	2026-08-15
98	98	2026-08-01	2026-08-31	2026-09-15
99	99	2026-09-01	2026-09-30	2026-10-15
100	100	2026-10-01	2026-10-31	2026-11-15
\.


--
-- Data for Name: tax_refund; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_refund (refund_id, taxpayer_id, payment_id, refund_amount, refund_date) FROM stdin;
1	1	1	5000	2022-04-01
2	2	2	7000	2022-04-05
3	3	3	8000	2022-04-10
4	4	4	6000	2022-04-15
5	5	5	9000	2022-04-20
6	6	6	7500	2022-04-25
7	7	7	10000	2022-05-01
8	8	8	8500	2022-05-05
9	9	9	12000	2022-05-10
10	10	10	6500	2022-05-15
11	11	11	5500	2022-05-20
12	12	12	9000	2022-05-25
13	13	13	11000	2022-06-01
14	14	14	7000	2022-06-05
15	15	15	13000	2022-06-10
16	16	16	8000	2022-06-15
17	17	17	9500	2022-06-20
18	18	18	7500	2022-06-25
19	19	19	14000	2022-07-01
20	20	20	9000	2022-07-05
21	21	21	6000	2022-07-10
22	22	22	10000	2022-07-15
23	23	23	12000	2022-07-20
24	24	24	8000	2022-07-25
25	25	25	15000	2022-08-01
26	26	26	9000	2022-08-05
27	27	27	11000	2022-08-10
28	28	28	8500	2022-08-15
29	29	29	16000	2022-08-20
30	30	30	9500	2022-08-25
31	31	31	7000	2022-09-01
32	32	32	11000	2022-09-05
33	33	33	13000	2022-09-10
34	34	34	9000	2022-09-15
35	35	35	17000	2022-09-20
36	36	36	10000	2022-09-25
37	37	37	12000	2022-10-01
38	38	38	9500	2022-10-05
39	39	39	18000	2022-10-10
40	40	40	10500	2022-10-15
41	41	41	8000	2022-10-20
42	42	42	12000	2022-10-25
43	43	43	14000	2022-11-01
44	44	44	10000	2022-11-05
45	45	45	19000	2022-11-10
46	46	46	11000	2022-11-15
47	47	47	13000	2022-11-20
48	48	48	10500	2022-11-25
49	49	49	20000	2022-12-01
50	50	50	12000	2022-12-05
51	51	51	9000	2023-04-01
52	52	52	13000	2023-04-05
53	53	53	15000	2023-04-10
54	54	54	11000	2023-04-15
55	55	55	22000	2023-04-20
56	56	56	12000	2023-04-25
57	57	57	14000	2023-05-01
58	58	58	11500	2023-05-05
59	59	59	23000	2023-05-10
60	60	60	13000	2023-05-15
61	61	61	10000	2023-05-20
62	62	62	14000	2023-05-25
63	63	63	16000	2023-06-01
64	64	64	12000	2023-06-05
65	65	65	25000	2023-06-10
66	66	66	14000	2023-06-15
67	67	67	16000	2023-06-20
68	68	68	13000	2023-06-25
69	69	69	26000	2023-07-01
70	70	70	15000	2023-07-05
71	71	71	11000	2023-07-10
72	72	72	15000	2023-07-15
73	73	73	17000	2023-07-20
74	74	74	13000	2023-07-25
75	75	75	28000	2023-08-01
76	76	76	16000	2023-08-05
77	77	77	18000	2023-08-10
78	78	78	15000	2023-08-15
79	79	79	29000	2023-08-20
80	80	80	17000	2023-08-25
81	81	81	12000	2023-09-01
82	82	82	16000	2023-09-05
83	83	83	18000	2023-09-10
84	84	84	14000	2023-09-15
85	85	85	30000	2023-09-20
86	86	86	17000	2023-09-25
87	87	87	19000	2023-10-01
88	88	88	16000	2023-10-05
89	89	89	32000	2023-10-10
90	90	90	18000	2023-10-15
91	91	91	13000	2023-10-20
92	92	92	17000	2023-10-25
93	93	93	19000	2023-11-01
94	94	94	15000	2023-11-05
95	95	95	35000	2023-11-10
96	96	96	18000	2023-11-15
97	97	97	20000	2023-11-20
98	98	98	17000	2023-11-25
99	99	99	38000	2023-12-01
100	100	100	20000	2023-12-05
\.


--
-- Data for Name: tax_registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_registration (registration_id, taxpayer_id, tax_type_id, tax_centre_id, registration_date) FROM stdin;
1	1	1	1	2022-01-10
2	2	2	2	2022-01-11
3	3	3	3	2022-01-12
4	4	4	4	2022-01-13
5	5	5	5	2022-01-14
6	6	6	6	2022-01-15
7	7	7	7	2022-01-16
8	8	8	8	2022-01-17
9	9	9	9	2022-01-18
10	10	10	10	2022-01-19
11	11	11	11	2022-01-20
12	12	12	12	2022-01-21
13	13	13	13	2022-01-22
14	14	14	14	2022-01-23
15	15	15	15	2022-01-24
16	16	16	16	2022-01-25
17	17	17	17	2022-01-26
18	18	18	18	2022-01-27
19	19	19	19	2022-01-28
20	20	20	20	2022-01-29
21	21	21	21	2022-01-30
22	22	22	22	2022-01-31
23	23	23	23	2022-02-01
24	24	24	24	2022-02-02
25	25	25	25	2022-02-03
26	26	26	26	2022-02-04
27	27	27	27	2022-02-05
28	28	28	28	2022-02-06
29	29	29	29	2022-02-07
30	30	30	30	2022-02-08
31	31	31	31	2022-02-09
32	32	32	32	2022-02-10
33	33	33	33	2022-02-11
34	34	34	34	2022-02-12
35	35	35	35	2022-02-13
36	36	36	36	2022-02-14
37	37	37	37	2022-02-15
38	38	38	38	2022-02-16
39	39	39	39	2022-02-17
40	40	40	40	2022-02-18
41	41	41	41	2022-02-19
42	42	42	42	2022-02-20
43	43	43	43	2022-02-21
44	44	44	44	2022-02-22
45	45	45	45	2022-02-23
46	46	46	46	2022-02-24
47	47	47	47	2022-02-25
48	48	48	48	2022-02-26
49	49	49	49	2022-02-27
50	50	50	50	2022-02-28
51	51	51	51	2022-03-01
52	52	52	52	2022-03-02
53	53	53	53	2022-03-03
54	54	54	54	2022-03-04
55	55	55	55	2022-03-05
56	56	56	56	2022-03-06
57	57	57	57	2022-03-07
58	58	58	58	2022-03-08
59	59	59	59	2022-03-09
60	60	60	60	2022-03-10
61	61	61	61	2022-03-11
62	62	62	62	2022-03-12
63	63	63	63	2022-03-13
64	64	64	64	2022-03-14
65	65	65	65	2022-03-15
66	66	66	66	2022-03-16
67	67	67	67	2022-03-17
68	68	68	68	2022-03-18
69	69	69	69	2022-03-19
70	70	70	70	2022-03-20
71	71	71	71	2022-03-21
72	72	72	72	2022-03-22
73	73	73	73	2022-03-23
74	74	74	74	2022-03-24
75	75	75	75	2022-03-25
76	76	76	76	2022-03-26
77	77	77	77	2022-03-27
78	78	78	78	2022-03-28
79	79	79	79	2022-03-29
80	80	80	80	2022-03-30
81	81	81	81	2022-03-31
82	82	82	82	2022-04-01
83	83	83	83	2022-04-02
84	84	84	84	2022-04-03
85	85	85	85	2022-04-04
86	86	86	86	2022-04-05
87	87	87	87	2022-04-06
88	88	88	88	2022-04-07
89	89	89	89	2022-04-08
90	90	90	90	2022-04-09
91	91	91	91	2022-04-10
92	92	92	92	2022-04-11
93	93	93	93	2022-04-12
94	94	94	94	2022-04-13
95	95	95	95	2022-04-14
96	96	96	96	2022-04-15
97	97	97	97	2022-04-16
98	98	98	98	2022-04-17
99	99	99	99	2022-04-18
100	100	100	100	2022-04-19
\.


--
-- Data for Name: tax_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_type (tax_type_id, tax_type_name, tax_rate, filing_frequency, effective_date) FROM stdin;
1	VAT	18	Monthly	2020-01-01
2	PAYE	30	Monthly	2020-01-01
3	Corporate Income Tax	30	Annually	2020-01-01
4	Withholding Tax	15	Monthly	2020-01-01
5	Rental Income Tax	30	Annually	2020-01-01
6	Excise Duty	10	Monthly	2020-01-01
7	Import Duty	25	Monthly	2020-01-01
8	Property Tax	1	Annually	2020-01-01
9	Capital Gains Tax	15	Annually	2020-01-01
10	Stamp Duty	5	Quarterly	2020-01-01
11	VAT	18	Monthly	2020-02-01
12	PAYE	30	Monthly	2020-02-01
13	Corporate Income Tax	30	Annually	2020-02-01
14	Withholding Tax	15	Monthly	2020-02-01
15	Rental Income Tax	30	Annually	2020-02-01
16	Excise Duty	10	Monthly	2020-02-01
17	Import Duty	25	Monthly	2020-02-01
18	Property Tax	1	Annually	2020-02-01
19	Capital Gains Tax	15	Annually	2020-02-01
20	Stamp Duty	5	Quarterly	2020-02-01
21	VAT	18	Monthly	2020-03-01
22	PAYE	30	Monthly	2020-03-01
23	Corporate Income Tax	30	Annually	2020-03-01
24	Withholding Tax	15	Monthly	2020-03-01
25	Rental Income Tax	30	Annually	2020-03-01
26	Excise Duty	10	Monthly	2020-03-01
27	Import Duty	25	Monthly	2020-03-01
28	Property Tax	1	Annually	2020-03-01
29	Capital Gains Tax	15	Annually	2020-03-01
30	Stamp Duty	5	Quarterly	2020-03-01
31	VAT	18	Monthly	2020-04-01
32	PAYE	30	Monthly	2020-04-01
33	Corporate Income Tax	30	Annually	2020-04-01
34	Withholding Tax	15	Monthly	2020-04-01
35	Rental Income Tax	30	Annually	2020-04-01
36	Excise Duty	10	Monthly	2020-04-01
37	Import Duty	25	Monthly	2020-04-01
38	Property Tax	1	Annually	2020-04-01
39	Capital Gains Tax	15	Annually	2020-04-01
40	Stamp Duty	5	Quarterly	2020-04-01
41	VAT	18	Monthly	2020-05-01
42	PAYE	30	Monthly	2020-05-01
43	Corporate Income Tax	30	Annually	2020-05-01
44	Withholding Tax	15	Monthly	2020-05-01
45	Rental Income Tax	30	Annually	2020-05-01
46	Excise Duty	10	Monthly	2020-05-01
47	Import Duty	25	Monthly	2020-05-01
48	Property Tax	1	Annually	2020-05-01
49	Capital Gains Tax	15	Annually	2020-05-01
50	Stamp Duty	5	Quarterly	2020-05-01
51	VAT	18	Monthly	2020-06-01
52	PAYE	30	Monthly	2020-06-01
53	Corporate Income Tax	30	Annually	2020-06-01
54	Withholding Tax	15	Monthly	2020-06-01
55	Rental Income Tax	30	Annually	2020-06-01
56	Excise Duty	10	Monthly	2020-06-01
57	Import Duty	25	Monthly	2020-06-01
58	Property Tax	1	Annually	2020-06-01
59	Capital Gains Tax	15	Annually	2020-06-01
60	Stamp Duty	5	Quarterly	2020-06-01
61	VAT	18	Monthly	2020-07-01
62	PAYE	30	Monthly	2020-07-01
63	Corporate Income Tax	30	Annually	2020-07-01
64	Withholding Tax	15	Monthly	2020-07-01
65	Rental Income Tax	30	Annually	2020-07-01
66	Excise Duty	10	Monthly	2020-07-01
67	Import Duty	25	Monthly	2020-07-01
68	Property Tax	1	Annually	2020-07-01
69	Capital Gains Tax	15	Annually	2020-07-01
70	Stamp Duty	5	Quarterly	2020-07-01
71	VAT	18	Monthly	2020-08-01
72	PAYE	30	Monthly	2020-08-01
73	Corporate Income Tax	30	Annually	2020-08-01
74	Withholding Tax	15	Monthly	2020-08-01
75	Rental Income Tax	30	Annually	2020-08-01
76	Excise Duty	10	Monthly	2020-08-01
77	Import Duty	25	Monthly	2020-08-01
78	Property Tax	1	Annually	2020-08-01
79	Capital Gains Tax	15	Annually	2020-08-01
80	Stamp Duty	5	Quarterly	2020-08-01
81	VAT	18	Monthly	2020-09-01
82	PAYE	30	Monthly	2020-09-01
83	Corporate Income Tax	30	Annually	2020-09-01
84	Withholding Tax	15	Monthly	2020-09-01
85	Rental Income Tax	30	Annually	2020-09-01
86	Excise Duty	10	Monthly	2020-09-01
87	Import Duty	25	Monthly	2020-09-01
88	Property Tax	1	Annually	2020-09-01
89	Capital Gains Tax	15	Annually	2020-09-01
90	Stamp Duty	5	Quarterly	2020-09-01
91	VAT	18	Monthly	2020-10-01
92	PAYE	30	Monthly	2020-10-01
93	Corporate Income Tax	30	Annually	2020-10-01
94	Withholding Tax	15	Monthly	2020-10-01
95	Rental Income Tax	30	Annually	2020-10-01
96	Excise Duty	10	Monthly	2020-10-01
97	Import Duty	25	Monthly	2020-10-01
98	Property Tax	1	Annually	2020-10-01
99	Capital Gains Tax	15	Annually	2020-10-01
100	Stamp Duty	5	Quarterly	2020-10-01
\.


--
-- Data for Name: taxpayer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taxpayer (taxpayer_id, taxpayer_tin, taxpayer_name, registration_date) FROM stdin;
1	100001	Jean Uwimana	2022-01-10
2	100002	Alice Mukamana	2022-01-15
3	100003	Eric Ndayisaba	2022-01-20
4	100004	Aline Uwase	2022-02-01
5	100005	Patrick Muhire	2022-02-08
6	100006	Grace Uwimana	2022-02-15
7	100007	Emmanuel Habimana	2022-02-22
8	100008	Olive Nyiramana	2022-03-01
9	100009	Claude Iradukunda	2022-03-08
10	100010	Keza Diane	2022-03-15
11	100011	John Niyonzima	2022-03-22
12	100012	Joy Mukeshimana	2022-04-01
13	100013	Didier Hakizimana	2022-04-08
14	100014	Pacifique Nkurunziza	2022-04-15
15	100015	Vestine Mukarugwiza	2022-04-22
16	100016	Samuel Habineza	2022-05-01
17	100017	Florence Mukamana	2022-05-08
18	100018	David Nshimiyimana	2022-05-15
19	100019	Yvette Uwamahoro	2022-05-22
20	100020	Robert Muryango	2022-06-01
21	100021	Ange Umutoni	2022-06-08
22	100022	Aimable Ndayambaje	2022-06-15
23	100023	Beatha Ingabire	2022-06-22
24	100024	Alex Rugira	2022-07-01
25	100025	Eric Mutabazi	2022-07-08
26	100026	Diane Mukankusi	2022-07-15
27	100027	Chris Rukundo	2022-07-22
28	100028	Fabrice Habyarimana	2022-08-01
29	100029	Marie Chantal	2022-08-08
30	100030	Emmy Niyibizi	2022-08-15
31	100031	Patrick Rwabukumba	2022-08-22
32	100032	Julienne Mukarubayiza	2022-09-01
33	100033	Claude Musoni	2022-09-08
34	100034	Vestine Nyiransabimana	2022-09-15
35	100035	Lionel Ntakirutimana	2022-09-22
36	100036	Chantal Uwase	2022-10-01
37	100037	Jean Claude Murekezi	2022-10-08
38	100038	Patrick Habimana	2022-10-15
39	100039	Olga Mukeshimana	2022-10-22
40	100040	Kevin Ndayambaje	2022-11-01
41	100041	Sandra Uwimana	2022-11-08
42	100042	Jean Bosco	2022-11-15
43	100043	Rose Nyirabazungu	2022-11-22
44	100044	Isaac Mugabo	2022-12-01
45	100045	Dorcas Uwamwezi	2022-12-08
46	100046	Joseph Niyonkuru	2022-12-15
47	100047	Gloria Mukamana	2022-12-22
48	100048	Theoneste Nzeyimana	2023-01-01
49	100049	Alice Nyiransabimana	2023-01-08
50	100050	Benjamin Tuyubahe	2023-01-15
51	100051	Israel Cyubahiro	2023-01-22
52	100052	Aime Mugisha	2023-02-01
53	100053	Gilbert Nsengimana	2023-02-08
54	100054	Patrick Nkurunziza	2023-02-15
55	100055	Emmanuel Mugabo	2023-02-22
56	100056	Alice Uwera	2023-03-01
57	100057	Daniel Habimana	2023-03-08
58	100058	Jeannette Uwase	2023-03-15
59	100059	Jean Paul Mugisha	2023-03-22
60	100060	Claude Rugema	2023-04-01
61	100061	Eric Nkuranga	2023-04-08
62	100062	Bosco Habyarimana	2023-04-15
63	100063	Patrick Nshimiyimana	2023-04-22
64	100064	Odette Mukamana	2023-05-01
65	100065	Alice Mukarugwiza	2023-05-08
66	100066	Jean Marie	2023-05-15
67	100067	Samuel Niyonsenga	2023-05-22
68	100068	Olive Mukankusi	2023-06-01
69	100069	Christine Ingabire	2023-06-08
70	100070	Didier Nsabimana	2023-06-15
71	100071	Patrick Niyomugabo	2023-06-22
72	100072	Eric Mugiraneza	2023-07-01
73	100073	Jeanine Uwamahoro	2023-07-08
74	100074	Paul Hakizimana	2023-07-15
75	100075	Fidele Rukundo	2023-07-22
76	100076	Gilbert Habineza	2023-08-01
77	100077	Richard Murenzi	2023-08-08
78	100078	Celine Mukarubayiza	2023-08-15
79	100079	Aline Mukamana	2023-08-22
80	100080	Patrick Karemera	2023-09-01
81	100081	Jean Damascene	2023-09-08
82	100082	Eric Ngarambe	2023-09-15
83	100083	Olga Nyirabazungu	2023-09-22
84	100084	Aimable Uwizeye	2023-10-01
85	100085	Jean Claude	2023-10-08
86	100086	David Rwabukumba	2023-10-15
87	100087	Christine Nyiransabimana	2023-10-22
88	100088	Patrick Musoni	2023-11-01
89	100089	Claude Muryango	2023-11-08
90	100090	Eric Ndayisenga	2023-11-15
91	100091	Samuel Mutabazi	2023-11-22
92	100092	Olive Nkuranga	2023-12-01
93	100093	Jean Pierre	2023-12-08
94	100094	Aline Uwamwezi	2023-12-15
95	100095	Emmanuel Rukundo	2023-12-22
96	100096	Patrick Hakizimana	2024-01-01
97	100097	Claude Uwimana	2024-01-08
98	100098	Grace Mukamana	2024-01-15
99	100099	Eric Nsengimana	2024-01-22
100	100100	Jean Baptiste	2024-02-01
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle (vehicle_id, taxpayer_id, plate_number, vehicle_value, registration_date) FROM stdin;
1	1	1001	5000000	2018-01-10
2	2	1002	7000000	2018-02-15
3	3	1003	8500000	2018-03-20
4	4	1004	6000000	2018-04-05
5	5	1005	9000000	2018-05-12
6	6	1006	7500000	2018-06-18
7	7	1007	6500000	2018-07-22
8	8	1008	8000000	2018-08-10
9	9	1009	9500000	2018-09-15
10	10	1010	12000000	2018-10-20
11	11	1011	10000000	2019-01-05
12	12	1012	12500000	2019-02-10
13	13	1013	15000000	2019-03-15
14	14	1014	8000000	2019-04-20
15	15	1015	17000000	2019-05-25
16	16	1016	11000000	2019-06-05
17	17	1017	9000000	2019-07-10
18	18	1018	13000000	2019-08-15
19	19	1019	16000000	2019-09-20
20	20	1020	14000000	2019-10-25
21	21	1021	18000000	2020-01-10
22	22	1022	20000000	2020-02-15
23	23	1023	22000000	2020-03-20
24	24	1024	15000000	2020-04-25
25	25	1025	25000000	2020-05-30
26	26	1026	19000000	2020-06-05
27	27	1027	17000000	2020-07-10
28	28	1028	21000000	2020-08-15
29	29	1029	23000000	2020-09-20
30	30	1030	26000000	2020-10-25
31	31	1031	28000000	2021-01-05
32	32	1032	30000000	2021-02-10
33	33	1033	35000000	2021-03-15
34	34	1034	24000000	2021-04-20
35	35	1035	38000000	2021-05-25
36	36	1036	27000000	2021-06-30
37	37	1037	25000000	2021-07-05
38	38	1038	32000000	2021-08-10
39	39	1039	36000000	2021-09-15
40	40	1040	40000000	2021-10-20
41	41	1041	42000000	2022-01-10
42	42	1042	45000000	2022-02-15
43	43	1043	50000000	2022-03-20
44	44	1044	38000000	2022-04-25
45	45	1045	55000000	2022-05-30
46	46	1046	46000000	2022-06-05
47	47	1047	39000000	2022-07-10
48	48	1048	48000000	2022-08-15
49	49	1049	52000000	2022-09-20
50	50	1050	60000000	2022-10-25
51	51	1051	65000000	2023-01-05
52	52	1052	70000000	2023-02-10
53	53	1053	75000000	2023-03-15
54	54	1054	60000000	2023-04-20
55	55	1055	80000000	2023-05-25
56	56	1056	68000000	2023-06-30
57	57	1057	55000000	2023-07-05
58	58	1058	72000000	2023-08-10
59	59	1059	85000000	2023-09-15
60	60	1060	90000000	2023-10-20
61	61	1061	95000000	2024-01-10
62	62	1062	100000000	2024-02-15
63	63	1063	110000000	2024-03-20
64	64	1064	85000000	2024-04-25
65	65	1065	120000000	2024-05-30
66	66	1066	105000000	2024-06-05
67	67	1067	90000000	2024-07-10
68	68	1068	115000000	2024-08-15
69	69	1069	130000000	2024-09-20
70	70	1070	140000000	2024-10-25
71	71	1071	150000000	2025-01-05
72	72	1072	160000000	2025-02-10
73	73	1073	170000000	2025-03-15
74	74	1074	145000000	2025-04-20
75	75	1075	180000000	2025-05-25
76	76	1076	165000000	2025-06-30
77	77	1077	150000000	2025-07-05
78	78	1078	175000000	2025-08-10
79	79	1079	190000000	2025-09-15
80	80	1080	200000000	2025-10-20
81	81	1081	220000000	2025-11-01
82	82	1082	230000000	2025-11-05
83	83	1083	240000000	2025-11-10
84	84	1084	210000000	2025-11-15
85	85	1085	260000000	2025-11-20
86	86	1086	250000000	2025-11-25
87	87	1087	220000000	2025-12-01
88	88	1088	270000000	2025-12-05
89	89	1089	280000000	2025-12-10
90	90	1090	300000000	2025-12-15
91	91	1091	320000000	2026-01-05
92	92	1092	340000000	2026-01-10
93	93	1093	360000000	2026-01-15
94	94	1094	310000000	2026-01-20
95	95	1095	380000000	2026-01-25
96	96	1096	350000000	2026-02-01
97	97	1097	330000000	2026-02-05
98	98	1098	370000000	2026-02-10
99	99	1099	400000000	2026-02-15
100	100	1100	450000000	2026-02-20
\.


--
-- Name: audit_finding audit_finding_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_finding
    ADD CONSTRAINT audit_finding_pkey PRIMARY KEY (finding_id);


--
-- Name: bank bank_bank_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT bank_bank_code_key UNIQUE (bank_code);


--
-- Name: bank bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (bank_id);


--
-- Name: business business_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_pkey PRIMARY KEY (business_id);


--
-- Name: enforcement_case enforcement_case_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enforcement_case
    ADD CONSTRAINT enforcement_case_pkey PRIMARY KEY (enforcement_id);


--
-- Name: penalty penalty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penalty
    ADD CONSTRAINT penalty_pkey PRIMARY KEY (penalty_id);


--
-- Name: property property_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_pkey PRIMARY KEY (property_id);


--
-- Name: revenue_target revenue_target_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenue_target
    ADD CONSTRAINT revenue_target_pkey PRIMARY KEY (target_id);


--
-- Name: tax_assessment tax_assessment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_assessment
    ADD CONSTRAINT tax_assessment_pkey PRIMARY KEY (assessment_id);


--
-- Name: tax_audit tax_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_audit
    ADD CONSTRAINT tax_audit_pkey PRIMARY KEY (audit_id);


--
-- Name: tax_centre tax_centre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_centre
    ADD CONSTRAINT tax_centre_pkey PRIMARY KEY (tax_centre_id);


--
-- Name: tax_declaration tax_declaration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_declaration
    ADD CONSTRAINT tax_declaration_pkey PRIMARY KEY (declaration_id);


--
-- Name: tax_objection tax_objection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_objection
    ADD CONSTRAINT tax_objection_pkey PRIMARY KEY (objection_id);


--
-- Name: tax_officer tax_officer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_officer
    ADD CONSTRAINT tax_officer_pkey PRIMARY KEY (officer_id);


--
-- Name: tax_payment tax_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_payment
    ADD CONSTRAINT tax_payment_pkey PRIMARY KEY (payment_id);


--
-- Name: tax_period tax_period_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_period
    ADD CONSTRAINT tax_period_pkey PRIMARY KEY (tax_period_id);


--
-- Name: tax_refund tax_refund_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_refund
    ADD CONSTRAINT tax_refund_pkey PRIMARY KEY (refund_id);


--
-- Name: tax_registration tax_registration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_registration
    ADD CONSTRAINT tax_registration_pkey PRIMARY KEY (registration_id);


--
-- Name: tax_type tax_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_type
    ADD CONSTRAINT tax_type_pkey PRIMARY KEY (tax_type_id);


--
-- Name: taxpayer taxpayer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxpayer
    ADD CONSTRAINT taxpayer_pkey PRIMARY KEY (taxpayer_id);


--
-- Name: taxpayer taxpayer_taxpayer_tin_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxpayer
    ADD CONSTRAINT taxpayer_taxpayer_tin_key UNIQUE (taxpayer_tin);


--
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (vehicle_id);


--
-- Name: audit_finding audit_finding_audit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_finding
    ADD CONSTRAINT audit_finding_audit_id_fkey FOREIGN KEY (audit_id) REFERENCES public.tax_audit(audit_id);


--
-- Name: audit_finding audit_finding_tax_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_finding
    ADD CONSTRAINT audit_finding_tax_type_id_fkey FOREIGN KEY (tax_type_id) REFERENCES public.tax_type(tax_type_id);


--
-- Name: business business_taxpayer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_taxpayer_id_fkey FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- Name: enforcement_case enforcement_case_officer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enforcement_case
    ADD CONSTRAINT enforcement_case_officer_id_fkey FOREIGN KEY (officer_id) REFERENCES public.tax_officer(officer_id);


--
-- Name: enforcement_case enforcement_case_taxpayer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enforcement_case
    ADD CONSTRAINT enforcement_case_taxpayer_id_fkey FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- Name: penalty penalty_assessment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penalty
    ADD CONSTRAINT penalty_assessment_id_fkey FOREIGN KEY (assessment_id) REFERENCES public.tax_assessment(assessment_id);


--
-- Name: property property_taxpayer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_taxpayer_id_fkey FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- Name: revenue_target revenue_target_tax_centre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenue_target
    ADD CONSTRAINT revenue_target_tax_centre_id_fkey FOREIGN KEY (tax_centre_id) REFERENCES public.tax_centre(tax_centre_id);


--
-- Name: revenue_target revenue_target_tax_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revenue_target
    ADD CONSTRAINT revenue_target_tax_type_id_fkey FOREIGN KEY (tax_type_id) REFERENCES public.tax_type(tax_type_id);


--
-- Name: tax_assessment tax_assessment_declaration_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_assessment
    ADD CONSTRAINT tax_assessment_declaration_id_fkey FOREIGN KEY (declaration_id) REFERENCES public.tax_declaration(declaration_id);


--
-- Name: tax_assessment tax_assessment_officer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_assessment
    ADD CONSTRAINT tax_assessment_officer_id_fkey FOREIGN KEY (officer_id) REFERENCES public.tax_officer(officer_id);


--
-- Name: tax_audit tax_audit_officer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_audit
    ADD CONSTRAINT tax_audit_officer_id_fkey FOREIGN KEY (officer_id) REFERENCES public.tax_officer(officer_id);


--
-- Name: tax_audit tax_audit_taxpayer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_audit
    ADD CONSTRAINT tax_audit_taxpayer_id_fkey FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- Name: tax_declaration tax_declaration_registration_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_declaration
    ADD CONSTRAINT tax_declaration_registration_id_fkey FOREIGN KEY (registration_id) REFERENCES public.tax_registration(registration_id);


--
-- Name: tax_declaration tax_declaration_tax_period_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_declaration
    ADD CONSTRAINT tax_declaration_tax_period_fkey FOREIGN KEY (tax_period) REFERENCES public.tax_period(tax_period_id);


--
-- Name: tax_objection tax_objection_assessment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_objection
    ADD CONSTRAINT tax_objection_assessment_id_fkey FOREIGN KEY (assessment_id) REFERENCES public.tax_assessment(assessment_id);


--
-- Name: tax_officer tax_officer_tax_centre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_officer
    ADD CONSTRAINT tax_officer_tax_centre_id_fkey FOREIGN KEY (tax_centre_id) REFERENCES public.tax_centre(tax_centre_id);


--
-- Name: tax_payment tax_payment_assessment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_payment
    ADD CONSTRAINT tax_payment_assessment_id_fkey FOREIGN KEY (assessment_id) REFERENCES public.tax_assessment(assessment_id);


--
-- Name: tax_payment tax_payment_bank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_payment
    ADD CONSTRAINT tax_payment_bank_id_fkey FOREIGN KEY (bank_id) REFERENCES public.bank(bank_id);


--
-- Name: tax_period tax_period_tax_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_period
    ADD CONSTRAINT tax_period_tax_type_id_fkey FOREIGN KEY (tax_type_id) REFERENCES public.tax_type(tax_type_id);


--
-- Name: tax_refund tax_refund_payment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_refund
    ADD CONSTRAINT tax_refund_payment_id_fkey FOREIGN KEY (payment_id) REFERENCES public.tax_payment(payment_id);


--
-- Name: tax_refund tax_refund_taxpayer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_refund
    ADD CONSTRAINT tax_refund_taxpayer_id_fkey FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- Name: tax_registration tax_registration_tax_centre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_registration
    ADD CONSTRAINT tax_registration_tax_centre_id_fkey FOREIGN KEY (tax_centre_id) REFERENCES public.tax_centre(tax_centre_id);


--
-- Name: tax_registration tax_registration_tax_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_registration
    ADD CONSTRAINT tax_registration_tax_type_id_fkey FOREIGN KEY (tax_type_id) REFERENCES public.tax_type(tax_type_id);


--
-- Name: tax_registration tax_registration_taxpayer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_registration
    ADD CONSTRAINT tax_registration_taxpayer_id_fkey FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- Name: vehicle vehicle_taxpayer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_taxpayer_id_fkey FOREIGN KEY (taxpayer_id) REFERENCES public.taxpayer(taxpayer_id);


--
-- PostgreSQL database dump complete
--

\unrestrict SH7ll0UFQH1UGKPsAPE2u9sNZllcgst9coYZel1wN01qPpl7zRq0ATo4WIBrtH9

