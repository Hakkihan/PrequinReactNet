--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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
-- Name: RawData; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RawData" (
    id integer NOT NULL,
    "Investor Name" character varying(255) NOT NULL,
    "Investor Type" character varying(255) NOT NULL,
    "Investor Country" character varying(255),
    "Investor Date Added" date NOT NULL,
    "Investor Last Updated" date,
    "Commitment Asset Class" character varying,
    "Commitment Amount" numeric DEFAULT 0,
    "Commitment Currency" character varying(3)
);


ALTER TABLE public."RawData" OWNER TO postgres;

--
-- Name: RawData_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RawData_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RawData_id_seq" OWNER TO postgres;

--
-- Name: RawData_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RawData_id_seq" OWNED BY public."RawData".id;


--
-- Name: assetcommit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assetcommit (
    id integer NOT NULL,
    investor_id integer,
    commitmentassetclass character varying(255),
    commitmentamount numeric(19,4),
    commitmentcurrency character varying(255)
);


ALTER TABLE public.assetcommit OWNER TO postgres;

--
-- Name: assetcommit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assetcommit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.assetcommit_id_seq OWNER TO postgres;

--
-- Name: assetcommit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assetcommit_id_seq OWNED BY public.assetcommit.id;


--
-- Name: investors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investors (
    id integer NOT NULL,
    investorname character varying(255),
    investortype character varying(255),
    investorcountry character varying(255),
    investordateadded date,
    investorlastupdated date
);


ALTER TABLE public.investors OWNER TO postgres;

--
-- Name: investors1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.investors1 (
    investorname text,
    investortype text,
    investorcountry text,
    investordateadded date,
    investorlastupdated date,
    commitmentassetclass text,
    commitmentamount numeric,
    commitmentcurrency character(3)
);


ALTER TABLE public.investors1 OWNER TO postgres;

--
-- Name: investors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.investors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investors_id_seq OWNER TO postgres;

--
-- Name: investors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.investors_id_seq OWNED BY public.investors.id;


--
-- Name: my_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.my_sequence
    START WITH 602
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.my_sequence OWNER TO postgres;

--
-- Name: RawData id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RawData" ALTER COLUMN id SET DEFAULT nextval('public."RawData_id_seq"'::regclass);


--
-- Name: assetcommit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetcommit ALTER COLUMN id SET DEFAULT nextval('public.assetcommit_id_seq'::regclass);


--
-- Name: investors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investors ALTER COLUMN id SET DEFAULT nextval('public.investors_id_seq'::regclass);


--
-- Data for Name: RawData; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RawData" (id, "Investor Name", "Investor Type", "Investor Country", "Investor Date Added", "Investor Last Updated", "Commitment Asset Class", "Commitment Amount", "Commitment Currency") FROM stdin;
\.


--
-- Data for Name: assetcommit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assetcommit (id, investor_id, commitmentassetclass, commitmentamount, commitmentcurrency) FROM stdin;
1503	604	Hedge Funds	58000000.0000	GBP
1513	604	Private Equity	45000000.0000	GBP
1522	604	Hedge Funds	61000000.0000	GBP
1527	604	Hedge Funds	51000000.0000	GBP
1549	604	Private Equity	22000000.0000	GBP
1552	604	Infrastructure	40000000.0000	GBP
1558	604	Real Estate	65000000.0000	GBP
1560	604	Natural Resources	11000000.0000	GBP
1564	604	Natural Resources	69000000.0000	GBP
1572	604	Private Equity	36000000.0000	GBP
1580	604	Hedge Funds	14000000.0000	GBP
1582	604	Infrastructure	92000000.0000	GBP
1590	604	Private Debt	69000000.0000	GBP
1591	604	Natural Resources	53000000.0000	GBP
1595	604	Natural Resources	55000000.0000	GBP
1597	604	Natural Resources	55000000.0000	GBP
1600	604	Natural Resources	54000000.0000	GBP
1602	604	Private Debt	73000000.0000	GBP
1608	604	Infrastructure	39000000.0000	GBP
1613	604	Natural Resources	7000000.0000	GBP
1616	604	Private Debt	52000000.0000	GBP
1621	604	Private Equity	96000000.0000	GBP
1622	604	Hedge Funds	18000000.0000	GBP
1504	605	Private Equity	72000000.0000	GBP
1505	605	Natural Resources	1000000.0000	GBP
1508	605	Hedge Funds	28000000.0000	GBP
1512	605	Real Estate	48000000.0000	GBP
1516	605	Real Estate	94000000.0000	GBP
1518	605	Private Debt	86000000.0000	GBP
1520	605	Natural Resources	38000000.0000	GBP
1521	605	Real Estate	6000000.0000	GBP
1524	605	Infrastructure	15000000.0000	GBP
1528	605	Real Estate	92000000.0000	GBP
1535	605	Natural Resources	86000000.0000	GBP
1541	605	Natural Resources	86000000.0000	GBP
1502	603	Infrastructure	31000000.0000	GBP
1506	603	Real Estate	17000000.0000	GBP
1507	603	Real Estate	83000000.0000	GBP
1509	603	Hedge Funds	85000000.0000	GBP
1514	603	Real Estate	12000000.0000	GBP
1515	603	Natural Resources	30000000.0000	GBP
1517	603	Real Estate	17000000.0000	GBP
1523	603	Hedge Funds	63000000.0000	GBP
1529	603	Infrastructure	10000000.0000	GBP
1531	603	Private Equity	69000000.0000	GBP
1533	603	Private Equity	75000000.0000	GBP
1534	603	Private Equity	74000000.0000	GBP
1538	603	Infrastructure	60000000.0000	GBP
1540	603	Real Estate	75000000.0000	GBP
1556	603	Private Equity	78000000.0000	GBP
1557	603	Private Debt	69000000.0000	GBP
1561	603	Hedge Funds	87000000.0000	GBP
1565	603	Real Estate	15000000.0000	GBP
1579	603	Hedge Funds	16000000.0000	GBP
1585	603	Hedge Funds	18000000.0000	GBP
1601	603	Private Equity	78000000.0000	GBP
1604	603	Hedge Funds	95000000.0000	GBP
1605	603	Private Debt	54000000.0000	GBP
1606	603	Private Debt	75000000.0000	GBP
1607	603	Real Estate	89000000.0000	GBP
1609	603	Hedge Funds	32000000.0000	GBP
1612	603	Hedge Funds	36000000.0000	GBP
1614	603	Natural Resources	37000000.0000	GBP
1615	603	Infrastructure	37000000.0000	GBP
1618	603	Private Debt	80000000.0000	GBP
1623	603	Real Estate	47000000.0000	GBP
1628	603	Natural Resources	4000000.0000	GBP
1629	603	Hedge Funds	76000000.0000	GBP
1631	603	Infrastructure	4000000.0000	GBP
1542	605	Infrastructure	63000000.0000	GBP
1543	605	Infrastructure	4000000.0000	GBP
1544	605	Private Equity	82000000.0000	GBP
1545	605	Infrastructure	87000000.0000	GBP
1546	605	Hedge Funds	11000000.0000	GBP
1547	605	Natural Resources	89000000.0000	GBP
1551	605	Private Equity	24000000.0000	GBP
1555	605	Private Debt	36000000.0000	GBP
1559	605	Private Debt	70000000.0000	GBP
1562	605	Private Equity	5000000.0000	GBP
1563	605	Real Estate	18000000.0000	GBP
1569	605	Private Equity	8000000.0000	GBP
1571	605	Natural Resources	62000000.0000	GBP
1574	605	Private Equity	30000000.0000	GBP
1575	605	Natural Resources	4000000.0000	GBP
1576	605	Infrastructure	59000000.0000	GBP
1581	605	Private Debt	58000000.0000	GBP
1583	605	Real Estate	47000000.0000	GBP
1584	605	Private Equity	94000000.0000	GBP
1588	605	Hedge Funds	96000000.0000	GBP
1638	604	Real Estate	89000000.0000	GBP
1640	604	Hedge Funds	22000000.0000	GBP
1642	604	Private Debt	51000000.0000	GBP
1643	604	Real Estate	55000000.0000	GBP
1649	604	Private Debt	8000000.0000	GBP
1653	604	Infrastructure	69000000.0000	GBP
1656	604	Hedge Funds	28000000.0000	GBP
1663	604	Private Equity	68000000.0000	GBP
1670	604	Private Debt	45000000.0000	GBP
1679	604	Infrastructure	12000000.0000	GBP
1683	604	Natural Resources	47000000.0000	GBP
1691	604	Hedge Funds	22000000.0000	GBP
1693	604	Real Estate	69000000.0000	GBP
1695	604	Private Debt	18000000.0000	GBP
1697	604	Private Debt	5000000.0000	GBP
1702	604	Private Equity	23000000.0000	GBP
1706	604	Infrastructure	36000000.0000	GBP
1712	604	Infrastructure	41000000.0000	GBP
1713	604	Private Debt	19000000.0000	GBP
1716	604	Real Estate	69000000.0000	GBP
1725	604	Hedge Funds	9000000.0000	GBP
1737	604	Private Equity	10000000.0000	GBP
1740	604	Hedge Funds	30000000.0000	GBP
1742	604	Natural Resources	11000000.0000	GBP
1748	604	Real Estate	9000000.0000	GBP
1753	604	Private Equity	17000000.0000	GBP
1756	604	Natural Resources	60000000.0000	GBP
1759	604	Private Equity	69000000.0000	GBP
1760	604	Private Equity	17000000.0000	GBP
1763	604	Hedge Funds	48000000.0000	GBP
1764	604	Private Equity	95000000.0000	GBP
1592	605	Infrastructure	14000000.0000	GBP
1594	605	Private Debt	63000000.0000	GBP
1610	605	Hedge Funds	10000000.0000	GBP
1617	605	Infrastructure	89000000.0000	GBP
1619	605	Hedge Funds	67000000.0000	GBP
1625	605	Private Equity	31000000.0000	GBP
1626	605	Infrastructure	93000000.0000	GBP
1627	605	Natural Resources	77000000.0000	GBP
1639	603	Private Equity	81000000.0000	GBP
1641	603	Real Estate	31000000.0000	GBP
1645	603	Hedge Funds	67000000.0000	GBP
1647	603	Natural Resources	22000000.0000	GBP
1648	603	Natural Resources	94000000.0000	GBP
1651	603	Private Debt	92000000.0000	GBP
1654	603	Private Equity	21000000.0000	GBP
1657	603	Hedge Funds	41000000.0000	GBP
1662	603	Infrastructure	40000000.0000	GBP
1665	603	Private Debt	25000000.0000	GBP
1669	603	Private Debt	52000000.0000	GBP
1673	603	Natural Resources	59000000.0000	GBP
1675	603	Private Debt	3000000.0000	GBP
1678	603	Real Estate	20000000.0000	GBP
1686	603	Natural Resources	18000000.0000	GBP
1688	603	Private Debt	34000000.0000	GBP
1696	603	Private Equity	49000000.0000	GBP
1707	603	Natural Resources	56000000.0000	GBP
1709	603	Private Debt	86000000.0000	GBP
1711	603	Infrastructure	28000000.0000	GBP
1715	603	Natural Resources	98000000.0000	GBP
1718	603	Infrastructure	38000000.0000	GBP
1720	603	Infrastructure	57000000.0000	GBP
1722	603	Private Debt	36000000.0000	GBP
1723	603	Infrastructure	77000000.0000	GBP
1727	603	Private Equity	19000000.0000	GBP
1732	603	Real Estate	69000000.0000	GBP
1733	603	Real Estate	42000000.0000	GBP
1738	603	Natural Resources	9000000.0000	GBP
1739	603	Private Equity	60000000.0000	GBP
1744	603	Natural Resources	50000000.0000	GBP
1745	603	Private Equity	32000000.0000	GBP
1635	605	Natural Resources	51000000.0000	GBP
1636	605	Real Estate	53000000.0000	GBP
1644	605	Private Equity	27000000.0000	GBP
1646	605	Hedge Funds	3000000.0000	GBP
1652	605	Real Estate	75000000.0000	GBP
1667	605	Private Debt	80000000.0000	GBP
1671	605	Private Debt	81000000.0000	GBP
1674	605	Private Equity	55000000.0000	GBP
1676	605	Real Estate	97000000.0000	GBP
1677	605	Real Estate	1000000.0000	GBP
1681	605	Natural Resources	12000000.0000	GBP
1682	605	Private Debt	42000000.0000	GBP
1684	605	Natural Resources	32000000.0000	GBP
1685	605	Private Debt	5000000.0000	GBP
1687	605	Real Estate	59000000.0000	GBP
1689	605	Private Debt	61000000.0000	GBP
1692	605	Private Equity	52000000.0000	GBP
1694	605	Hedge Funds	76000000.0000	GBP
1703	605	Private Equity	1000000.0000	GBP
1705	605	Natural Resources	43000000.0000	GBP
1710	605	Hedge Funds	19000000.0000	GBP
1714	605	Real Estate	63000000.0000	GBP
1717	605	Infrastructure	26000000.0000	GBP
1721	605	Natural Resources	87000000.0000	GBP
1729	605	Hedge Funds	82000000.0000	GBP
1730	605	Hedge Funds	53000000.0000	GBP
1735	605	Private Debt	93000000.0000	GBP
1501	602	Infrastructure	15000000.0000	GBP
1510	602	Hedge Funds	31000000.0000	GBP
1511	602	Private Equity	45000000.0000	GBP
1519	602	Hedge Funds	32000000.0000	GBP
1525	602	Private Equity	70000000.0000	GBP
1526	602	Hedge Funds	27000000.0000	GBP
1530	602	Hedge Funds	41000000.0000	GBP
1532	602	Infrastructure	66000000.0000	GBP
1536	602	Hedge Funds	36000000.0000	GBP
1537	602	Natural Resources	55000000.0000	GBP
1539	602	Private Debt	4000000.0000	GBP
1548	602	Private Equity	12000000.0000	GBP
1550	602	Hedge Funds	16000000.0000	GBP
1553	602	Infrastructure	15000000.0000	GBP
1554	602	Natural Resources	45000000.0000	GBP
1566	602	Private Debt	76000000.0000	GBP
1567	602	Private Equity	31000000.0000	GBP
1568	602	Real Estate	44000000.0000	GBP
1570	602	Infrastructure	32000000.0000	GBP
1573	602	Natural Resources	88000000.0000	GBP
1577	602	Real Estate	79000000.0000	GBP
1578	602	Real Estate	71000000.0000	GBP
1586	602	Natural Resources	49000000.0000	GBP
1587	602	Private Equity	40000000.0000	GBP
1589	602	Private Equity	35000000.0000	GBP
1593	602	Private Equity	31000000.0000	GBP
1596	602	Infrastructure	60000000.0000	GBP
1598	602	Private Equity	66000000.0000	GBP
1599	602	Natural Resources	65000000.0000	GBP
1603	602	Hedge Funds	7000000.0000	GBP
1611	602	Real Estate	91000000.0000	GBP
1620	602	Hedge Funds	54000000.0000	GBP
1624	602	Natural Resources	72000000.0000	GBP
1630	602	Private Debt	92000000.0000	GBP
1632	602	Natural Resources	17000000.0000	GBP
1633	602	Private Debt	20000000.0000	GBP
1634	602	Private Equity	81000000.0000	GBP
1637	602	Private Debt	60000000.0000	GBP
1650	602	Real Estate	4000000.0000	GBP
1655	602	Hedge Funds	1000000.0000	GBP
1658	602	Infrastructure	63000000.0000	GBP
1659	602	Private Equity	55000000.0000	GBP
1660	602	Natural Resources	94000000.0000	GBP
1661	602	Infrastructure	42000000.0000	GBP
1664	602	Real Estate	45000000.0000	GBP
1666	602	Hedge Funds	39000000.0000	GBP
1668	602	Private Debt	70000000.0000	GBP
1672	602	Private Equity	9000000.0000	GBP
1680	602	Real Estate	36000000.0000	GBP
1690	602	Real Estate	4000000.0000	GBP
1698	602	Hedge Funds	73000000.0000	GBP
1699	602	Private Equity	18000000.0000	GBP
1700	602	Natural Resources	90000000.0000	GBP
1701	602	Private Debt	92000000.0000	GBP
1704	602	Private Equity	94000000.0000	GBP
1708	602	Private Equity	24000000.0000	GBP
1719	602	Infrastructure	69000000.0000	GBP
1724	602	Hedge Funds	50000000.0000	GBP
1726	602	Natural Resources	13000000.0000	GBP
1728	602	Private Equity	93000000.0000	GBP
1731	602	Hedge Funds	54000000.0000	GBP
1734	602	Real Estate	10000000.0000	GBP
1736	602	Natural Resources	95000000.0000	GBP
1741	602	Natural Resources	42000000.0000	GBP
1751	602	Real Estate	83000000.0000	GBP
1755	602	Private Debt	39000000.0000	GBP
1757	602	Real Estate	7000000.0000	GBP
1758	602	Natural Resources	5000000.0000	GBP
1761	602	Infrastructure	95000000.0000	GBP
1766	602	Natural Resources	1000000.0000	GBP
1772	602	Private Equity	6000000.0000	GBP
1778	602	Infrastructure	89000000.0000	GBP
1782	602	Hedge Funds	46000000.0000	GBP
1786	602	Infrastructure	26000000.0000	GBP
1788	602	Hedge Funds	45000000.0000	GBP
1746	603	Private Debt	79000000.0000	GBP
1749	603	Real Estate	24000000.0000	GBP
1750	603	Infrastructure	38000000.0000	GBP
1754	603	Natural Resources	50000000.0000	GBP
1762	603	Real Estate	21000000.0000	GBP
1767	603	Real Estate	48000000.0000	GBP
1771	603	Private Debt	42000000.0000	GBP
1775	603	Private Debt	73000000.0000	GBP
1777	603	Infrastructure	0.0000	GBP
1781	603	Private Debt	31000000.0000	GBP
1783	603	Private Equity	68000000.0000	GBP
1784	603	Private Equity	16000000.0000	GBP
1785	603	Natural Resources	29000000.0000	GBP
1789	603	Infrastructure	63000000.0000	GBP
1791	603	Natural Resources	20000000.0000	GBP
1796	603	Private Debt	57000000.0000	GBP
1797	603	Real Estate	37000000.0000	GBP
1779	604	Real Estate	21000000.0000	GBP
1780	604	Private Equity	12000000.0000	GBP
1795	604	Private Debt	20000000.0000	GBP
1799	604	Real Estate	37000000.0000	GBP
1800	604	Private Equity	34000000.0000	GBP
1743	605	Natural Resources	96000000.0000	GBP
1747	605	Real Estate	31000000.0000	GBP
1752	605	Infrastructure	72000000.0000	GBP
1765	605	Real Estate	89000000.0000	GBP
1768	605	Infrastructure	42000000.0000	GBP
1769	605	Private Equity	5000000.0000	GBP
1770	605	Private Equity	17000000.0000	GBP
1773	605	Private Equity	6000000.0000	GBP
1774	605	Real Estate	17000000.0000	GBP
1776	605	Infrastructure	64000000.0000	GBP
1787	605	Infrastructure	8000000.0000	GBP
1790	605	Hedge Funds	44000000.0000	GBP
1792	605	Hedge Funds	84000000.0000	GBP
1793	605	Private Debt	55000000.0000	GBP
1794	605	Private Equity	68000000.0000	GBP
1798	605	Natural Resources	13000000.0000	GBP
\.


--
-- Data for Name: investors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investors (id, investorname, investortype, investorcountry, investordateadded, investorlastupdated) FROM stdin;
602	Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21
603	Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21
604	Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21
605	Mjd Jedi fund	bank	China	2010-06-08	2024-02-21
\.


--
-- Data for Name: investors1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.investors1 (investorname, investortype, investorcountry, investordateadded, investorlastupdated, commitmentassetclass, commitmentamount, commitmentcurrency) FROM stdin;
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Infrastructure	15000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Infrastructure	31000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Hedge Funds	58000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	72000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	1000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	17000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	83000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Hedge Funds	28000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Hedge Funds	85000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	31000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	45000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	48000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Equity	45000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	12000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Natural Resources	30000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	94000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	17000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Debt	86000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	32000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	38000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	6000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Hedge Funds	61000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Hedge Funds	63000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Infrastructure	15000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	70000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	27000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Hedge Funds	51000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	92000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Infrastructure	10000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	41000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Equity	69000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Infrastructure	66000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Equity	75000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Equity	74000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	86000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	36000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Natural Resources	55000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Infrastructure	60000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Debt	4000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	75000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	86000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Infrastructure	63000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Infrastructure	4000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	82000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Infrastructure	87000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Hedge Funds	11000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	89000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	12000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Equity	22000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	16000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	24000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Infrastructure	40000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Infrastructure	15000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Natural Resources	45000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Debt	36000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Equity	78000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	69000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Real Estate	65000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Debt	70000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Natural Resources	11000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Hedge Funds	87000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	5000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	18000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Natural Resources	69000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	15000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Debt	76000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	31000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Real Estate	44000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	8000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Infrastructure	32000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	62000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Equity	36000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Natural Resources	88000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	30000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	4000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Infrastructure	59000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Real Estate	79000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Real Estate	71000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Hedge Funds	16000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Hedge Funds	14000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Debt	58000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Infrastructure	92000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	47000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	94000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Hedge Funds	18000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Natural Resources	49000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	40000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Hedge Funds	96000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	35000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Debt	69000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Natural Resources	53000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Infrastructure	14000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	31000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Debt	63000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Natural Resources	55000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Infrastructure	60000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Natural Resources	55000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	66000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Natural Resources	65000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Natural Resources	54000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Equity	78000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Debt	73000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	7000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Hedge Funds	95000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	54000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	75000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	89000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Infrastructure	39000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Hedge Funds	32000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Hedge Funds	10000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Real Estate	91000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Hedge Funds	36000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Natural Resources	7000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Natural Resources	37000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Infrastructure	37000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Debt	52000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Infrastructure	89000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	80000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Hedge Funds	67000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	54000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Equity	96000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Hedge Funds	18000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	47000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Natural Resources	72000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	31000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Infrastructure	93000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	77000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Natural Resources	4000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Hedge Funds	76000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Debt	92000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Infrastructure	4000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Natural Resources	17000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Debt	20000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	81000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	51000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	53000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Debt	60000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Real Estate	89000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Equity	81000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Hedge Funds	22000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	31000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Debt	51000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Real Estate	55000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	27000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Hedge Funds	67000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Hedge Funds	3000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Natural Resources	22000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Natural Resources	94000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Debt	8000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Real Estate	4000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	92000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	75000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Infrastructure	69000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Equity	21000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	1000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Hedge Funds	28000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Hedge Funds	41000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Infrastructure	63000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	55000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Natural Resources	94000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Infrastructure	42000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Infrastructure	40000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Equity	68000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Real Estate	45000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	25000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	39000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Debt	80000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Debt	70000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	52000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Debt	45000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Debt	81000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	9000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Natural Resources	59000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	55000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	3000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	97000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	1000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	20000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Infrastructure	12000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Real Estate	36000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	12000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Debt	42000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Natural Resources	47000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	32000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Debt	5000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Natural Resources	18000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	59000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	34000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Debt	61000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Real Estate	4000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Hedge Funds	22000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	52000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Real Estate	69000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Hedge Funds	76000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Debt	18000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Equity	49000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Debt	5000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	73000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	18000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Natural Resources	90000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Debt	92000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Equity	23000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	1000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	94000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	43000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Infrastructure	36000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Natural Resources	56000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	24000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	86000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Hedge Funds	19000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Infrastructure	28000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Infrastructure	41000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Debt	19000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	63000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Natural Resources	98000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Real Estate	69000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Infrastructure	26000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Infrastructure	38000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Infrastructure	69000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Infrastructure	57000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	87000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	36000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Infrastructure	77000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	50000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Hedge Funds	9000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Natural Resources	13000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Equity	19000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	93000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Hedge Funds	82000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Hedge Funds	53000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	54000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	69000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	42000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Real Estate	10000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Debt	93000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Natural Resources	95000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Equity	10000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Natural Resources	9000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Equity	60000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Hedge Funds	30000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Natural Resources	42000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Natural Resources	11000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	96000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Natural Resources	50000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Equity	32000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	79000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	31000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Real Estate	9000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	24000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Infrastructure	38000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Real Estate	83000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Infrastructure	72000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Equity	17000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Natural Resources	50000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Debt	39000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Natural Resources	60000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Real Estate	7000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Natural Resources	5000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Equity	69000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Equity	17000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Infrastructure	95000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	21000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Hedge Funds	48000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Equity	95000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	89000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Natural Resources	1000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	48000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Infrastructure	42000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	5000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	17000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	42000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Private Equity	6000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	6000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Real Estate	17000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	73000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Infrastructure	64000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Infrastructure	0	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Infrastructure	89000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Real Estate	21000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Equity	12000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	31000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	46000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Equity	68000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Equity	16000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Natural Resources	29000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Infrastructure	26000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Infrastructure	8000000	GBP
Ioo Gryffindor fund	fund manager	Singapore	2000-07-06	2024-02-21	Hedge Funds	45000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Infrastructure	63000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Hedge Funds	44000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Natural Resources	20000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Hedge Funds	84000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Debt	55000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Private Equity	68000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Debt	20000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Private Debt	57000000	GBP
Ibx Skywalker ltd	asset manager	United States	1997-07-21	2024-02-21	Real Estate	37000000	GBP
Mjd Jedi fund	bank	China	2010-06-08	2024-02-21	Natural Resources	13000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Real Estate	37000000	GBP
Cza Weasley fund	wealth manager	United Kingdom	2002-05-29	2024-02-21	Private Equity	34000000	GBP
\.


--
-- Name: RawData_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RawData_id_seq"', 1, false);


--
-- Name: assetcommit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assetcommit_id_seq', 1800, true);


--
-- Name: investors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.investors_id_seq', 901, true);


--
-- Name: my_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.my_sequence', 901, true);


--
-- Name: RawData RawData_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RawData"
    ADD CONSTRAINT "RawData_pkey" PRIMARY KEY (id, "Investor Type");


--
-- Name: assetcommit assetcommit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetcommit
    ADD CONSTRAINT assetcommit_pkey PRIMARY KEY (id);


--
-- Name: investors investors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.investors
    ADD CONSTRAINT investors_pkey PRIMARY KEY (id);


--
-- Name: assetcommit fk_investor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assetcommit
    ADD CONSTRAINT fk_investor_id FOREIGN KEY (investor_id) REFERENCES public.investors(id);


--
-- PostgreSQL database dump complete
--

