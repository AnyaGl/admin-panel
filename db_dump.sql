--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

--
-- Name: product; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA product;


ALTER SCHEMA product OWNER TO postgres;

--
-- Name: SCHEMA product; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA product IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_permissions; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE product.admin_permissions OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.admin_permissions_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.admin_permissions_id_seq OWNED BY product.admin_permissions.id;


--
-- Name: admin_permissions_role_links; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.admin_permissions_role_links (
    permission_id integer,
    role_id integer
);


ALTER TABLE product.admin_permissions_role_links OWNER TO postgres;

--
-- Name: admin_roles; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE product.admin_roles OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.admin_roles_id_seq OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.admin_roles_id_seq OWNED BY product.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE product.admin_users OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.admin_users_id_seq OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.admin_users_id_seq OWNED BY product.admin_users.id;


--
-- Name: admin_users_roles_links; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.admin_users_roles_links (
    user_id integer,
    role_id integer
);


ALTER TABLE product.admin_users_roles_links OWNER TO postgres;

--
-- Name: components_product_info_tariff_variants; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.components_product_info_tariff_variants (
    id integer NOT NULL,
    period character varying(255),
    ops_json jsonb,
    discount integer
);


ALTER TABLE product.components_product_info_tariff_variants OWNER TO postgres;

--
-- Name: components_product_info_tariff_variants_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.components_product_info_tariff_variants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.components_product_info_tariff_variants_id_seq OWNER TO postgres;

--
-- Name: components_product_info_tariff_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.components_product_info_tariff_variants_id_seq OWNED BY product.components_product_info_tariff_variants.id;


--
-- Name: components_product_info_tariffs; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.components_product_info_tariffs (
    id integer NOT NULL,
    name character varying(255),
    description text,
    maximum_licenses_count integer,
    "order" integer,
    unit_price double precision,
    unit_period character varying(255)
);


ALTER TABLE product.components_product_info_tariffs OWNER TO postgres;

--
-- Name: components_product_info_tariffs_components; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.components_product_info_tariffs_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" integer DEFAULT 0
);


ALTER TABLE product.components_product_info_tariffs_components OWNER TO postgres;

--
-- Name: components_product_info_tariffs_components_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.components_product_info_tariffs_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.components_product_info_tariffs_components_id_seq OWNER TO postgres;

--
-- Name: components_product_info_tariffs_components_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.components_product_info_tariffs_components_id_seq OWNED BY product.components_product_info_tariffs_components.id;


--
-- Name: components_product_info_tariffs_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.components_product_info_tariffs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.components_product_info_tariffs_id_seq OWNER TO postgres;

--
-- Name: components_product_info_tariffs_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.components_product_info_tariffs_id_seq OWNED BY product.components_product_info_tariffs.id;


--
-- Name: files; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE product.files OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.files_id_seq OWNED BY product.files.id;


--
-- Name: files_related_morphs; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.files_related_morphs (
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" integer
);


ALTER TABLE product.files_related_morphs OWNER TO postgres;

--
-- Name: i18n_locale; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE product.i18n_locale OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.i18n_locale_id_seq OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.i18n_locale_id_seq OWNED BY product.i18n_locale.id;


--
-- Name: products; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.products (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    widjet text
);


ALTER TABLE product.products OWNER TO postgres;

--
-- Name: products_components; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.products_components (
    id integer NOT NULL,
    entity_id integer,
    component_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" integer DEFAULT 0
);


ALTER TABLE product.products_components OWNER TO postgres;

--
-- Name: products_components_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.products_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.products_components_id_seq OWNER TO postgres;

--
-- Name: products_components_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.products_components_id_seq OWNED BY product.products_components.id;


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.products_id_seq OWNED BY product.products.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE product.strapi_api_tokens OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.strapi_api_tokens_id_seq OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.strapi_api_tokens_id_seq OWNED BY product.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE product.strapi_core_store_settings OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.strapi_core_store_settings_id_seq OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.strapi_core_store_settings_id_seq OWNED BY product.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE product.strapi_database_schema OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.strapi_database_schema_id_seq OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.strapi_database_schema_id_seq OWNED BY product.strapi_database_schema.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE product.strapi_migrations OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.strapi_migrations_id_seq OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.strapi_migrations_id_seq OWNED BY product.strapi_migrations.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE product.strapi_webhooks OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.strapi_webhooks_id_seq OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.strapi_webhooks_id_seq OWNED BY product.strapi_webhooks.id;


--
-- Name: up_permissions; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE product.up_permissions OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.up_permissions_id_seq OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.up_permissions_id_seq OWNED BY product.up_permissions.id;


--
-- Name: up_permissions_role_links; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.up_permissions_role_links (
    permission_id integer,
    role_id integer
);


ALTER TABLE product.up_permissions_role_links OWNER TO postgres;

--
-- Name: up_roles; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE product.up_roles OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.up_roles_id_seq OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.up_roles_id_seq OWNED BY product.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE product.up_users OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: product; Owner: postgres
--

CREATE SEQUENCE product.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product.up_users_id_seq OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: product; Owner: postgres
--

ALTER SEQUENCE product.up_users_id_seq OWNED BY product.up_users.id;


--
-- Name: up_users_role_links; Type: TABLE; Schema: product; Owner: postgres
--

CREATE TABLE product.up_users_role_links (
    user_id integer,
    role_id integer
);


ALTER TABLE product.up_users_role_links OWNER TO postgres;

--
-- Name: admin_permissions id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_permissions ALTER COLUMN id SET DEFAULT nextval('product.admin_permissions_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_roles ALTER COLUMN id SET DEFAULT nextval('product.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_users ALTER COLUMN id SET DEFAULT nextval('product.admin_users_id_seq'::regclass);


--
-- Name: components_product_info_tariff_variants id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.components_product_info_tariff_variants ALTER COLUMN id SET DEFAULT nextval('product.components_product_info_tariff_variants_id_seq'::regclass);


--
-- Name: components_product_info_tariffs id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.components_product_info_tariffs ALTER COLUMN id SET DEFAULT nextval('product.components_product_info_tariffs_id_seq'::regclass);


--
-- Name: components_product_info_tariffs_components id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.components_product_info_tariffs_components ALTER COLUMN id SET DEFAULT nextval('product.components_product_info_tariffs_components_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.files ALTER COLUMN id SET DEFAULT nextval('product.files_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.i18n_locale ALTER COLUMN id SET DEFAULT nextval('product.i18n_locale_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.products ALTER COLUMN id SET DEFAULT nextval('product.products_id_seq'::regclass);


--
-- Name: products_components id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.products_components ALTER COLUMN id SET DEFAULT nextval('product.products_components_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('product.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('product.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('product.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('product.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('product.strapi_webhooks_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_permissions ALTER COLUMN id SET DEFAULT nextval('product.up_permissions_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_roles ALTER COLUMN id SET DEFAULT nextval('product.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_users ALTER COLUMN id SET DEFAULT nextval('product.up_users_id_seq'::regclass);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: components_product_info_tariff_variants components_product_info_tariff_variants_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.components_product_info_tariff_variants
    ADD CONSTRAINT components_product_info_tariff_variants_pkey PRIMARY KEY (id);


--
-- Name: components_product_info_tariffs_components components_product_info_tariffs_components_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.components_product_info_tariffs_components
    ADD CONSTRAINT components_product_info_tariffs_components_pkey PRIMARY KEY (id);


--
-- Name: components_product_info_tariffs components_product_info_tariffs_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.components_product_info_tariffs
    ADD CONSTRAINT components_product_info_tariffs_pkey PRIMARY KEY (id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: products_components products_components_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.products_components
    ADD CONSTRAINT products_components_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX admin_permissions_created_by_id_fk ON product.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_fk ON product.admin_permissions_role_links USING btree (permission_id);


--
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_inv_fk ON product.admin_permissions_role_links USING btree (role_id);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX admin_permissions_updated_by_id_fk ON product.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX admin_roles_created_by_id_fk ON product.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX admin_roles_updated_by_id_fk ON product.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX admin_users_created_by_id_fk ON product.admin_users USING btree (created_by_id);


--
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX admin_users_roles_links_fk ON product.admin_users_roles_links USING btree (user_id);


--
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX admin_users_roles_links_inv_fk ON product.admin_users_roles_links USING btree (role_id);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX admin_users_updated_by_id_fk ON product.admin_users USING btree (updated_by_id);


--
-- Name: components_product_info_tariffs_component_type_index; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX components_product_info_tariffs_component_type_index ON product.components_product_info_tariffs_components USING btree (component_type);


--
-- Name: components_product_info_tariffs_entity_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX components_product_info_tariffs_entity_fk ON product.components_product_info_tariffs_components USING btree (entity_id);


--
-- Name: components_product_info_tariffs_field_index; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX components_product_info_tariffs_field_index ON product.components_product_info_tariffs_components USING btree (field);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX files_created_by_id_fk ON product.files USING btree (created_by_id);


--
-- Name: files_related_morphs_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX files_related_morphs_fk ON product.files_related_morphs USING btree (file_id);


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX files_updated_by_id_fk ON product.files USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX i18n_locale_created_by_id_fk ON product.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX i18n_locale_updated_by_id_fk ON product.i18n_locale USING btree (updated_by_id);


--
-- Name: products_component_type_index; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX products_component_type_index ON product.products_components USING btree (component_type);


--
-- Name: products_created_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX products_created_by_id_fk ON product.products USING btree (created_by_id);


--
-- Name: products_entity_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX products_entity_fk ON product.products_components USING btree (entity_id);


--
-- Name: products_field_index; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX products_field_index ON product.products_components USING btree (field);


--
-- Name: products_updated_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX products_updated_by_id_fk ON product.products USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON product.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON product.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX up_permissions_created_by_id_fk ON product.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX up_permissions_role_links_fk ON product.up_permissions_role_links USING btree (permission_id);


--
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX up_permissions_role_links_inv_fk ON product.up_permissions_role_links USING btree (role_id);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX up_permissions_updated_by_id_fk ON product.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX up_roles_created_by_id_fk ON product.up_roles USING btree (created_by_id);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX up_roles_updated_by_id_fk ON product.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX up_users_created_by_id_fk ON product.up_users USING btree (created_by_id);


--
-- Name: up_users_role_links_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX up_users_role_links_fk ON product.up_users_role_links USING btree (user_id);


--
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX up_users_role_links_inv_fk ON product.up_users_role_links USING btree (role_id);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: product; Owner: postgres
--

CREATE INDEX up_users_updated_by_id_fk ON product.up_users USING btree (updated_by_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES product.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES product.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES product.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES product.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: components_product_info_tariffs_components components_product_info_tariffs_entity_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.components_product_info_tariffs_components
    ADD CONSTRAINT components_product_info_tariffs_entity_fk FOREIGN KEY (entity_id) REFERENCES product.components_product_info_tariffs(id) ON DELETE CASCADE;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES product.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: products products_created_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.products
    ADD CONSTRAINT products_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: products_components products_entity_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.products_components
    ADD CONSTRAINT products_entity_fk FOREIGN KEY (entity_id) REFERENCES product.products(id) ON DELETE CASCADE;


--
-- Name: products products_updated_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.products
    ADD CONSTRAINT products_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES product.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES product.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES product.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES product.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: product; Owner: postgres
--

ALTER TABLE ONLY product.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES product.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

