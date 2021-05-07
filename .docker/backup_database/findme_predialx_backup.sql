--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2

-- Started on 2021-05-07 04:13:51 UTC

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
-- TOC entry 3896 (class 1262 OID 16384)
-- Name: findme-predialx; Type: DATABASE; Schema: -; Owner: findme-admin
--

CREATE DATABASE "findme-predialx" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE "findme-predialx" OWNER TO "findme-admin";

\connect -reuse-previous=on "dbname='findme-predialx'"

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
-- TOC entry 243 (class 1259 OID 17055)
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO "findme-admin";

--
-- TOC entry 272 (class 1259 OID 17518)
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO "findme-admin";

--
-- TOC entry 246 (class 1259 OID 17073)
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO "findme-admin";

--
-- TOC entry 245 (class 1259 OID 17067)
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO "findme-admin";

--
-- TOC entry 244 (class 1259 OID 17061)
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO "findme-admin";

--
-- TOC entry 247 (class 1259 OID 17078)
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO "findme-admin";

--
-- TOC entry 273 (class 1259 OID 17533)
-- Name: broker_link; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO "findme-admin";

--
-- TOC entry 204 (class 1259 OID 16410)
-- Name: client; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO "findme-admin";

--
-- TOC entry 227 (class 1259 OID 16784)
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO "findme-admin";

--
-- TOC entry 284 (class 1259 OID 17792)
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO "findme-admin";

--
-- TOC entry 283 (class 1259 OID 17667)
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO "findme-admin";

--
-- TOC entry 229 (class 1259 OID 16796)
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO "findme-admin";

--
-- TOC entry 261 (class 1259 OID 17316)
-- Name: client_scope; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO "findme-admin";

--
-- TOC entry 262 (class 1259 OID 17331)
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO "findme-admin";

--
-- TOC entry 285 (class 1259 OID 17834)
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO "findme-admin";

--
-- TOC entry 263 (class 1259 OID 17337)
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO "findme-admin";

--
-- TOC entry 205 (class 1259 OID 16422)
-- Name: client_session; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO "findme-admin";

--
-- TOC entry 250 (class 1259 OID 17099)
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO "findme-admin";

--
-- TOC entry 228 (class 1259 OID 16790)
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO "findme-admin";

--
-- TOC entry 242 (class 1259 OID 16977)
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO "findme-admin";

--
-- TOC entry 206 (class 1259 OID 16428)
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO "findme-admin";

--
-- TOC entry 251 (class 1259 OID 17180)
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO "findme-admin";

--
-- TOC entry 281 (class 1259 OID 17583)
-- Name: component; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO "findme-admin";

--
-- TOC entry 280 (class 1259 OID 17577)
-- Name: component_config; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO "findme-admin";

--
-- TOC entry 207 (class 1259 OID 16431)
-- Name: composite_role; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO "findme-admin";

--
-- TOC entry 208 (class 1259 OID 16434)
-- Name: credential; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO "findme-admin";

--
-- TOC entry 203 (class 1259 OID 16401)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO "findme-admin";

--
-- TOC entry 202 (class 1259 OID 16396)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO "findme-admin";

--
-- TOC entry 286 (class 1259 OID 17850)
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO "findme-admin";

--
-- TOC entry 209 (class 1259 OID 16440)
-- Name: event_entity; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO "findme-admin";

--
-- TOC entry 274 (class 1259 OID 17539)
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO "findme-admin";

--
-- TOC entry 275 (class 1259 OID 17545)
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO "findme-admin";

--
-- TOC entry 288 (class 1259 OID 17876)
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO "findme-admin";

--
-- TOC entry 276 (class 1259 OID 17554)
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO "findme-admin";

--
-- TOC entry 277 (class 1259 OID 17564)
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO "findme-admin";

--
-- TOC entry 278 (class 1259 OID 17567)
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO "findme-admin";

--
-- TOC entry 279 (class 1259 OID 17574)
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO "findme-admin";

--
-- TOC entry 232 (class 1259 OID 16834)
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO "findme-admin";

--
-- TOC entry 282 (class 1259 OID 17643)
-- Name: federated_user; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO "findme-admin";

--
-- TOC entry 258 (class 1259 OID 17253)
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO "findme-admin";

--
-- TOC entry 257 (class 1259 OID 17250)
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO "findme-admin";

--
-- TOC entry 233 (class 1259 OID 16840)
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO "findme-admin";

--
-- TOC entry 234 (class 1259 OID 16850)
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO "findme-admin";

--
-- TOC entry 239 (class 1259 OID 16956)
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO "findme-admin";

--
-- TOC entry 240 (class 1259 OID 16962)
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO "findme-admin";

--
-- TOC entry 256 (class 1259 OID 17247)
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO "findme-admin";

--
-- TOC entry 210 (class 1259 OID 16449)
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO "findme-admin";

--
-- TOC entry 238 (class 1259 OID 16953)
-- Name: migration_model; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO "findme-admin";

--
-- TOC entry 255 (class 1259 OID 17237)
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO "findme-admin";

--
-- TOC entry 254 (class 1259 OID 17231)
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO "findme-admin";

--
-- TOC entry 268 (class 1259 OID 17460)
-- Name: policy_config; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO "findme-admin";

--
-- TOC entry 230 (class 1259 OID 16821)
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO "findme-admin";

--
-- TOC entry 231 (class 1259 OID 16828)
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO "findme-admin";

--
-- TOC entry 211 (class 1259 OID 16456)
-- Name: realm; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO "findme-admin";

--
-- TOC entry 212 (class 1259 OID 16474)
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO "findme-admin";

--
-- TOC entry 260 (class 1259 OID 17263)
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO "findme-admin";

--
-- TOC entry 237 (class 1259 OID 16945)
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO "findme-admin";

--
-- TOC entry 213 (class 1259 OID 16483)
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO "findme-admin";

--
-- TOC entry 293 (class 1259 OID 17990)
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO "findme-admin";

--
-- TOC entry 214 (class 1259 OID 16486)
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO "findme-admin";

--
-- TOC entry 215 (class 1259 OID 16494)
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO "findme-admin";

--
-- TOC entry 235 (class 1259 OID 16860)
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO "findme-admin";

--
-- TOC entry 216 (class 1259 OID 16506)
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO "findme-admin";

--
-- TOC entry 253 (class 1259 OID 17194)
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO "findme-admin";

--
-- TOC entry 252 (class 1259 OID 17186)
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO "findme-admin";

--
-- TOC entry 290 (class 1259 OID 17915)
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO "findme-admin";

--
-- TOC entry 270 (class 1259 OID 17488)
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO "findme-admin";

--
-- TOC entry 269 (class 1259 OID 17473)
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO "findme-admin";

--
-- TOC entry 264 (class 1259 OID 17407)
-- Name: resource_server; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO "findme-admin";

--
-- TOC entry 289 (class 1259 OID 17891)
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO "findme-admin";

--
-- TOC entry 267 (class 1259 OID 17445)
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO "findme-admin";

--
-- TOC entry 265 (class 1259 OID 17415)
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO "findme-admin";

--
-- TOC entry 266 (class 1259 OID 17430)
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO "findme-admin";

--
-- TOC entry 291 (class 1259 OID 17934)
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO "findme-admin";

--
-- TOC entry 292 (class 1259 OID 17944)
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO "findme-admin";

--
-- TOC entry 217 (class 1259 OID 16509)
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO "findme-admin";

--
-- TOC entry 271 (class 1259 OID 17503)
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO "findme-admin";

--
-- TOC entry 201 (class 1259 OID 16387)
-- Name: service_order; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.service_order (
    id integer NOT NULL,
    date character varying NOT NULL,
    "clientId" character varying NOT NULL,
    "contributorId" character varying NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE public.service_order OWNER TO "findme-admin";

--
-- TOC entry 200 (class 1259 OID 16385)
-- Name: service_order_id_seq; Type: SEQUENCE; Schema: public; Owner: findme-admin
--

CREATE SEQUENCE public.service_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_order_id_seq OWNER TO "findme-admin";

--
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 200
-- Name: service_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: findme-admin
--

ALTER SEQUENCE public.service_order_id_seq OWNED BY public.service_order.id;


--
-- TOC entry 219 (class 1259 OID 16515)
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO "findme-admin";

--
-- TOC entry 241 (class 1259 OID 16968)
-- Name: user_consent; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO "findme-admin";

--
-- TOC entry 287 (class 1259 OID 17866)
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO "findme-admin";

--
-- TOC entry 220 (class 1259 OID 16521)
-- Name: user_entity; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO "findme-admin";

--
-- TOC entry 221 (class 1259 OID 16530)
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO "findme-admin";

--
-- TOC entry 248 (class 1259 OID 17084)
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO "findme-admin";

--
-- TOC entry 249 (class 1259 OID 17090)
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO "findme-admin";

--
-- TOC entry 222 (class 1259 OID 16536)
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO "findme-admin";

--
-- TOC entry 259 (class 1259 OID 17260)
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO "findme-admin";

--
-- TOC entry 223 (class 1259 OID 16542)
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO "findme-admin";

--
-- TOC entry 224 (class 1259 OID 16545)
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO "findme-admin";

--
-- TOC entry 225 (class 1259 OID 16548)
-- Name: user_session; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO "findme-admin";

--
-- TOC entry 236 (class 1259 OID 16863)
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO "findme-admin";

--
-- TOC entry 218 (class 1259 OID 16512)
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO "findme-admin";

--
-- TOC entry 226 (class 1259 OID 16561)
-- Name: web_origins; Type: TABLE; Schema: public; Owner: findme-admin
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO "findme-admin";

--
-- TOC entry 3230 (class 2604 OID 16390)
-- Name: service_order id; Type: DEFAULT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.service_order ALTER COLUMN id SET DEFAULT nextval('public.service_order_id_seq'::regclass);


--
-- TOC entry 3840 (class 0 OID 17055)
-- Dependencies: 243
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3869 (class 0 OID 17518)
-- Dependencies: 272
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.associated_policy (policy_id, associated_policy_id) VALUES ('5032591a-54a6-416c-8c57-cd78828cc7b0', '7f48b1a2-f599-41e3-8df8-91221aa9d51e');


--
-- TOC entry 3843 (class 0 OID 17073)
-- Dependencies: 246
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('21510d07-5fd8-4631-924b-381ba0f026b1', NULL, 'auth-cookie', 'master', '1e3b82af-82be-4625-bc0c-7d076020392b', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('9c8e7fee-982a-4c73-8636-6a0e29a15e65', NULL, 'auth-spnego', 'master', '1e3b82af-82be-4625-bc0c-7d076020392b', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('a8696e52-4f58-4969-9f30-fa0ef352cfbf', NULL, 'identity-provider-redirector', 'master', '1e3b82af-82be-4625-bc0c-7d076020392b', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('e7e52a5d-ce5f-4eee-a6ce-3263ed44c4a0', NULL, NULL, 'master', '1e3b82af-82be-4625-bc0c-7d076020392b', 2, 30, true, '599995a8-b95d-4668-81fb-d1dd6e1c3b57', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('65d4db0e-3f72-44bd-9017-899056004b3b', NULL, 'auth-username-password-form', 'master', '599995a8-b95d-4668-81fb-d1dd6e1c3b57', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('cadef4e5-c40d-425c-a9f4-146e24296e21', NULL, NULL, 'master', '599995a8-b95d-4668-81fb-d1dd6e1c3b57', 1, 20, true, 'ee9f0fdb-b828-44ed-bee0-e8e6848ea5a7', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('2481e299-0de8-4f41-94d0-12ace28180bd', NULL, 'conditional-user-configured', 'master', 'ee9f0fdb-b828-44ed-bee0-e8e6848ea5a7', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('265b24a6-4ebe-495c-8e80-800ecc0f3d4f', NULL, 'auth-otp-form', 'master', 'ee9f0fdb-b828-44ed-bee0-e8e6848ea5a7', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('f2d1b0a1-5f54-4800-93c6-a09bd19b70fc', NULL, 'direct-grant-validate-username', 'master', 'd6927ed1-638c-4b68-924c-388673f2e653', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('8ac58cbb-9938-470d-8d3d-247fb450b52d', NULL, 'direct-grant-validate-password', 'master', 'd6927ed1-638c-4b68-924c-388673f2e653', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('c2003e15-bab4-4dbc-82df-ac72b2e7b000', NULL, NULL, 'master', 'd6927ed1-638c-4b68-924c-388673f2e653', 1, 30, true, '8d6826dd-512b-4acf-b6c3-9035a74d8cbb', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('fb310797-f070-4285-b906-0cf7b85aee12', NULL, 'conditional-user-configured', 'master', '8d6826dd-512b-4acf-b6c3-9035a74d8cbb', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('dcde4640-4715-48f6-b4ec-a11a1a420964', NULL, 'direct-grant-validate-otp', 'master', '8d6826dd-512b-4acf-b6c3-9035a74d8cbb', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('659d2245-70cd-43d4-b164-c831c0a54c1a', NULL, 'registration-page-form', 'master', '04e08ef1-f1e0-4c38-bccf-8c9bc99a1edf', 0, 10, true, '9829ed5d-f4bb-4ef0-8a20-56c6436e783b', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('f6e331d1-116e-42c0-92c2-7dded95a2427', NULL, 'registration-user-creation', 'master', '9829ed5d-f4bb-4ef0-8a20-56c6436e783b', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('9d4301c8-a4f9-43e0-bda9-5a82ae914e0d', NULL, 'registration-profile-action', 'master', '9829ed5d-f4bb-4ef0-8a20-56c6436e783b', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('41903882-7bfa-45d3-b130-c07bb9e59d03', NULL, 'registration-password-action', 'master', '9829ed5d-f4bb-4ef0-8a20-56c6436e783b', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('dfa25cd4-047e-4800-8301-3cec8a80029a', NULL, 'registration-recaptcha-action', 'master', '9829ed5d-f4bb-4ef0-8a20-56c6436e783b', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('bca2d051-a5a9-469e-9e4e-0c6097492fb3', NULL, 'reset-credentials-choose-user', 'master', 'f7434470-589c-4349-bb38-ea67432e0bf6', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ac188ba4-7e98-466c-943b-27c4553800f0', NULL, 'reset-credential-email', 'master', 'f7434470-589c-4349-bb38-ea67432e0bf6', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('dd785b86-e6bd-47de-b838-f2b7498f1581', NULL, 'reset-password', 'master', 'f7434470-589c-4349-bb38-ea67432e0bf6', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('1de8e6e2-2b06-4024-b224-b5e7f369b4e6', NULL, NULL, 'master', 'f7434470-589c-4349-bb38-ea67432e0bf6', 1, 40, true, '913bf6a7-96f8-4558-af84-ba53f028cb31', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('2c643f6b-dcec-4bbd-8aaf-4fec209f0dfe', NULL, 'conditional-user-configured', 'master', '913bf6a7-96f8-4558-af84-ba53f028cb31', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('d678b2cf-f0d2-44b3-949e-d3f88839718d', NULL, 'reset-otp', 'master', '913bf6a7-96f8-4558-af84-ba53f028cb31', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('06c5d02a-358f-4b8c-b9d3-d6fcf423a689', NULL, 'client-secret', 'master', '4dc7128a-d67a-49e7-93bc-f54d6e722e77', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('f611a6f7-b628-4425-9503-9af92b081887', NULL, 'client-jwt', 'master', '4dc7128a-d67a-49e7-93bc-f54d6e722e77', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('83369833-dc0a-4d71-9cf0-8754fa25709b', NULL, 'client-secret-jwt', 'master', '4dc7128a-d67a-49e7-93bc-f54d6e722e77', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('1e8ce193-ee9c-477a-aa5e-fc90806e0fee', NULL, 'client-x509', 'master', '4dc7128a-d67a-49e7-93bc-f54d6e722e77', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('87c248e6-1472-4bed-bf93-dcefddd719be', NULL, 'idp-review-profile', 'master', '87c73a43-4de6-41db-baba-8692be1342a9', 0, 10, false, NULL, 'c0b36878-cc1d-48db-bfc0-c8432617f0b5');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('99585fb5-a4b7-4207-8a0a-13c0cf451361', NULL, NULL, 'master', '87c73a43-4de6-41db-baba-8692be1342a9', 0, 20, true, '9c836046-dc15-4264-ad93-239a252563de', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('752ec9b6-14a7-4cb0-bd18-02d5eafb605a', NULL, 'idp-create-user-if-unique', 'master', '9c836046-dc15-4264-ad93-239a252563de', 2, 10, false, NULL, '323df1ad-6280-41c5-9df7-a9470eb6e239');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('9c0a4324-b79d-4a10-8fa4-429113aeca48', NULL, NULL, 'master', '9c836046-dc15-4264-ad93-239a252563de', 2, 20, true, '5111a3f6-deba-4ac5-8312-75842529a3ff', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('0c3ff974-808a-48ac-9994-7bf0e4b43e71', NULL, 'idp-confirm-link', 'master', '5111a3f6-deba-4ac5-8312-75842529a3ff', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('3b9252c1-51d1-47bf-b4b6-befe49275224', NULL, NULL, 'master', '5111a3f6-deba-4ac5-8312-75842529a3ff', 0, 20, true, 'd97a168c-3faa-493f-aa9e-cc5583b76e37', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('8bbc8aa6-b374-4558-bb09-9e7abb3e4143', NULL, 'idp-email-verification', 'master', 'd97a168c-3faa-493f-aa9e-cc5583b76e37', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('580ea005-7286-44b9-98fd-0afccdf6c1b6', NULL, NULL, 'master', 'd97a168c-3faa-493f-aa9e-cc5583b76e37', 2, 20, true, '4a953313-65af-4155-83ef-511fedcc780b', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('36104b83-e59b-4bdb-b13c-1ae75da9d8af', NULL, 'idp-username-password-form', 'master', '4a953313-65af-4155-83ef-511fedcc780b', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ff74cd03-4a4c-4f57-b5a7-533a94c2f7e1', NULL, NULL, 'master', '4a953313-65af-4155-83ef-511fedcc780b', 1, 20, true, 'edc6aeff-a05c-441e-b9aa-47b7a77eb4c5', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('53c15b96-f487-4f70-90b7-a66e74ab67fd', NULL, 'conditional-user-configured', 'master', 'edc6aeff-a05c-441e-b9aa-47b7a77eb4c5', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('6eafca1a-2e8e-4fa1-883c-2ca96a49398d', NULL, 'auth-otp-form', 'master', 'edc6aeff-a05c-441e-b9aa-47b7a77eb4c5', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('0d1fdeae-1b19-44e7-8a52-67aa2be52936', NULL, 'http-basic-authenticator', 'master', '860f5683-9b11-4d03-95f1-af2985d8c761', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('1f59281c-b0a2-4bb4-bf35-ebc37c744aea', NULL, 'docker-http-basic-authenticator', 'master', '69f45486-41f5-4a22-bf59-413cc0691d36', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('eeb11e75-acdf-4ec2-b610-6823c4c241c5', NULL, 'no-cookie-redirect', 'master', '465fe867-7655-4a18-aec9-cbc16ae7dc69', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('638d8957-1819-49de-9250-4782b5416612', NULL, NULL, 'master', '465fe867-7655-4a18-aec9-cbc16ae7dc69', 0, 20, true, 'a9ca9653-9756-4909-99a2-af257a8e8ea8', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('de822cd5-a1aa-4840-a253-00825a2cf912', NULL, 'basic-auth', 'master', 'a9ca9653-9756-4909-99a2-af257a8e8ea8', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ed675832-15d2-48c5-9c7d-de267fb0e3dc', NULL, 'basic-auth-otp', 'master', 'a9ca9653-9756-4909-99a2-af257a8e8ea8', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('4e1f2399-abc7-4626-95b3-aa9c4b41ca7e', NULL, 'auth-spnego', 'master', 'a9ca9653-9756-4909-99a2-af257a8e8ea8', 3, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('f3405965-e9ba-4893-9c72-79452d0f2bfb', NULL, 'auth-cookie', 'findme-predialx', '2721c072-289d-4ad7-94fd-3f158dc810d9', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('68187111-29b6-4feb-a71a-54deaa2d8f19', NULL, 'auth-spnego', 'findme-predialx', '2721c072-289d-4ad7-94fd-3f158dc810d9', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('9a429e84-11f9-4ff3-8b66-bdb426fc8167', NULL, 'identity-provider-redirector', 'findme-predialx', '2721c072-289d-4ad7-94fd-3f158dc810d9', 2, 25, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('5912f634-e338-4bde-b945-fd555fe27f14', NULL, NULL, 'findme-predialx', '2721c072-289d-4ad7-94fd-3f158dc810d9', 2, 30, true, 'c3388599-06be-491d-82c7-46baa53ec26c', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('efc42310-6c2d-4367-afd5-1a1b35eb5e0b', NULL, 'auth-username-password-form', 'findme-predialx', 'c3388599-06be-491d-82c7-46baa53ec26c', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('72be24a9-d37c-43c6-afd7-a28c8f9dd72d', NULL, NULL, 'findme-predialx', 'c3388599-06be-491d-82c7-46baa53ec26c', 1, 20, true, '84643118-7db8-48c3-b58e-d139c8840056', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('c80c33f4-7fff-4a73-a191-41699ee47c98', NULL, 'conditional-user-configured', 'findme-predialx', '84643118-7db8-48c3-b58e-d139c8840056', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('740f44e0-cb24-4599-acdf-f585de810a5b', NULL, 'auth-otp-form', 'findme-predialx', '84643118-7db8-48c3-b58e-d139c8840056', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('6014da1c-f065-4db3-a8b6-0c5c770d6ff2', NULL, 'direct-grant-validate-username', 'findme-predialx', '7486d7f0-323b-4ab4-94df-536abe44113e', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('a8976aae-b123-49fe-bace-609c2aed46f0', NULL, 'direct-grant-validate-password', 'findme-predialx', '7486d7f0-323b-4ab4-94df-536abe44113e', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('36a787f4-114b-4117-b9f6-3077873a310a', NULL, NULL, 'findme-predialx', '7486d7f0-323b-4ab4-94df-536abe44113e', 1, 30, true, '774436e9-011c-4e77-afa1-72746b63ae39', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('fca469f7-230c-4417-acba-9b17f762af3a', NULL, 'conditional-user-configured', 'findme-predialx', '774436e9-011c-4e77-afa1-72746b63ae39', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('89b4417c-c486-4ce7-a3a2-1af706d7ecd1', NULL, 'direct-grant-validate-otp', 'findme-predialx', '774436e9-011c-4e77-afa1-72746b63ae39', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('0bbe2ff6-b4ec-4c15-83a3-bd844eff3f6e', NULL, 'registration-page-form', 'findme-predialx', 'e6d27890-c0cf-48bb-bf05-63025b3c8e33', 0, 10, true, '47c9f124-191a-4c37-8452-25e33a88de19', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('2fe7c785-d405-4a77-9b9e-1bb54ed8d9b6', NULL, 'registration-user-creation', 'findme-predialx', '47c9f124-191a-4c37-8452-25e33a88de19', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('62b36f5c-1880-4186-b24f-a5d9ebbbef2f', NULL, 'registration-profile-action', 'findme-predialx', '47c9f124-191a-4c37-8452-25e33a88de19', 0, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('e45f0042-f9da-4bb7-92e0-b60793d49a4f', NULL, 'registration-password-action', 'findme-predialx', '47c9f124-191a-4c37-8452-25e33a88de19', 0, 50, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('13890aaa-85ef-48aa-b611-432889121649', NULL, 'registration-recaptcha-action', 'findme-predialx', '47c9f124-191a-4c37-8452-25e33a88de19', 3, 60, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('01939dff-39e7-43b1-bddb-01f2012ca925', NULL, 'reset-credentials-choose-user', 'findme-predialx', 'fbe30de1-20d9-4a1f-9850-2cb0a8cef633', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('d33774f9-496b-4240-93fc-2337add5f08b', NULL, 'reset-credential-email', 'findme-predialx', 'fbe30de1-20d9-4a1f-9850-2cb0a8cef633', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('af83f21b-32b3-41d4-a3c8-fcb955a23612', NULL, 'reset-password', 'findme-predialx', 'fbe30de1-20d9-4a1f-9850-2cb0a8cef633', 0, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('d261c3ce-a489-473d-8daf-8de86b577ce4', NULL, NULL, 'findme-predialx', 'fbe30de1-20d9-4a1f-9850-2cb0a8cef633', 1, 40, true, '1b076f1d-7031-468e-9395-0678d68e5eb7', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('0ddb1b4d-79a1-40f8-bd77-321e7051414f', NULL, 'conditional-user-configured', 'findme-predialx', '1b076f1d-7031-468e-9395-0678d68e5eb7', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('41fb229a-6826-483a-9b2f-ca4151826cca', NULL, 'reset-otp', 'findme-predialx', '1b076f1d-7031-468e-9395-0678d68e5eb7', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('a7987f07-cbd5-428a-afd6-aa6469dbd4e0', NULL, 'client-secret', 'findme-predialx', '39b4f5e7-4998-45a6-a79a-d03cf1d303cf', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('ccad501b-9052-4b4c-8b1a-cd8d9fff7139', NULL, 'client-jwt', 'findme-predialx', '39b4f5e7-4998-45a6-a79a-d03cf1d303cf', 2, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('bf3f4998-d4af-4ed8-b0dc-a324866773df', NULL, 'client-secret-jwt', 'findme-predialx', '39b4f5e7-4998-45a6-a79a-d03cf1d303cf', 2, 30, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('8ff5387b-0e7d-4357-b1c9-f6406ebd163c', NULL, 'client-x509', 'findme-predialx', '39b4f5e7-4998-45a6-a79a-d03cf1d303cf', 2, 40, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('31ec2b54-77aa-496b-88eb-fb6d24087b5e', NULL, 'idp-review-profile', 'findme-predialx', '4f4ff7c7-0e95-4134-9cb0-46be64194478', 0, 10, false, NULL, '67f7e5c7-3d5b-478c-87a6-30269bee9a5b');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('6dbeadec-457d-4710-a4a4-2b59ee18ee60', NULL, NULL, 'findme-predialx', '4f4ff7c7-0e95-4134-9cb0-46be64194478', 0, 20, true, '99f751b1-0772-422f-a107-79f2174d3c92', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('8bedc632-a8cd-4d6f-876a-81bb6dab31dd', NULL, 'idp-create-user-if-unique', 'findme-predialx', '99f751b1-0772-422f-a107-79f2174d3c92', 2, 10, false, NULL, '20fc94ce-d7da-4624-94c9-c10111bdc910');
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('e3983ef3-49d6-4d29-bbd4-41f10fc56035', NULL, NULL, 'findme-predialx', '99f751b1-0772-422f-a107-79f2174d3c92', 2, 20, true, '30721d23-dc7c-46ed-9a3c-567b67be1046', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('61433a14-d849-4f1d-b76e-51bc211aa5c1', NULL, 'idp-confirm-link', 'findme-predialx', '30721d23-dc7c-46ed-9a3c-567b67be1046', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('675f3d1e-2158-44cf-b650-32f76434bb1c', NULL, NULL, 'findme-predialx', '30721d23-dc7c-46ed-9a3c-567b67be1046', 0, 20, true, '3abf4eca-0f38-4d17-9f17-8030d6d2be04', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('13ccc7ea-71b7-4e6c-ae54-55bbf0847f4f', NULL, 'idp-email-verification', 'findme-predialx', '3abf4eca-0f38-4d17-9f17-8030d6d2be04', 2, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('d9c2d7a1-ffac-4981-9305-5a7b20c8e19f', NULL, NULL, 'findme-predialx', '3abf4eca-0f38-4d17-9f17-8030d6d2be04', 2, 20, true, '923c1758-e09e-480c-9605-be1726b19dd9', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('d5bcc210-650c-41d1-9ed0-5ae5b118e0b5', NULL, 'idp-username-password-form', 'findme-predialx', '923c1758-e09e-480c-9605-be1726b19dd9', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('dbc3de94-da1a-4682-a724-895779a47b0c', NULL, NULL, 'findme-predialx', '923c1758-e09e-480c-9605-be1726b19dd9', 1, 20, true, '0ab4ef5b-3e61-44d5-89a0-c292bdc9c839', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('5f9980b5-0e47-481e-a1bd-ea0bb00ab972', NULL, 'conditional-user-configured', 'findme-predialx', '0ab4ef5b-3e61-44d5-89a0-c292bdc9c839', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('6f91868f-5881-4643-9649-676c09d7afac', NULL, 'auth-otp-form', 'findme-predialx', '0ab4ef5b-3e61-44d5-89a0-c292bdc9c839', 0, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('67cf25f8-7798-4f62-a2c6-348e89824eac', NULL, 'http-basic-authenticator', 'findme-predialx', '379e6289-af3f-462a-834f-d5233e8a63a6', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('c0d7a5d3-24e5-490a-9e59-798377874ba3', NULL, 'docker-http-basic-authenticator', 'findme-predialx', '5de7203b-117c-4662-8498-964c74edb0dc', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('9f2473c9-119f-4540-a38b-ec7a5667d215', NULL, 'no-cookie-redirect', 'findme-predialx', 'da796090-c567-4d15-bc4b-606de2f09841', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('a24f2a20-b5fd-4eab-a16c-092e98c6ed9f', NULL, NULL, 'findme-predialx', 'da796090-c567-4d15-bc4b-606de2f09841', 0, 20, true, '52d17f51-667e-48b1-a5e3-342c396d65ac', NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('59c6913a-6a00-4037-b0bd-574083f778d2', NULL, 'basic-auth', 'findme-predialx', '52d17f51-667e-48b1-a5e3-342c396d65ac', 0, 10, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('d8322062-d368-4035-be69-88fe6f68ca5c', NULL, 'basic-auth-otp', 'findme-predialx', '52d17f51-667e-48b1-a5e3-342c396d65ac', 3, 20, false, NULL, NULL);
INSERT INTO public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) VALUES ('e279d214-7f30-419f-9372-02621645969e', NULL, 'auth-spnego', 'findme-predialx', '52d17f51-667e-48b1-a5e3-342c396d65ac', 3, 30, false, NULL, NULL);


--
-- TOC entry 3842 (class 0 OID 17067)
-- Dependencies: 245
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('1e3b82af-82be-4625-bc0c-7d076020392b', 'browser', 'browser based authentication', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('599995a8-b95d-4668-81fb-d1dd6e1c3b57', 'forms', 'Username, password, otp and other auth forms.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('ee9f0fdb-b828-44ed-bee0-e8e6848ea5a7', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('d6927ed1-638c-4b68-924c-388673f2e653', 'direct grant', 'OpenID Connect Resource Owner Grant', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('8d6826dd-512b-4acf-b6c3-9035a74d8cbb', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('04e08ef1-f1e0-4c38-bccf-8c9bc99a1edf', 'registration', 'registration flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('9829ed5d-f4bb-4ef0-8a20-56c6436e783b', 'registration form', 'registration form', 'master', 'form-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('f7434470-589c-4349-bb38-ea67432e0bf6', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('913bf6a7-96f8-4558-af84-ba53f028cb31', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('4dc7128a-d67a-49e7-93bc-f54d6e722e77', 'clients', 'Base authentication for clients', 'master', 'client-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('87c73a43-4de6-41db-baba-8692be1342a9', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('9c836046-dc15-4264-ad93-239a252563de', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('5111a3f6-deba-4ac5-8312-75842529a3ff', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('d97a168c-3faa-493f-aa9e-cc5583b76e37', 'Account verification options', 'Method with which to verity the existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('4a953313-65af-4155-83ef-511fedcc780b', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('edc6aeff-a05c-441e-b9aa-47b7a77eb4c5', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('860f5683-9b11-4d03-95f1-af2985d8c761', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('69f45486-41f5-4a22-bf59-413cc0691d36', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('465fe867-7655-4a18-aec9-cbc16ae7dc69', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'master', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('a9ca9653-9756-4909-99a2-af257a8e8ea8', 'Authentication Options', 'Authentication options.', 'master', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('2721c072-289d-4ad7-94fd-3f158dc810d9', 'browser', 'browser based authentication', 'findme-predialx', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('c3388599-06be-491d-82c7-46baa53ec26c', 'forms', 'Username, password, otp and other auth forms.', 'findme-predialx', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('84643118-7db8-48c3-b58e-d139c8840056', 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'findme-predialx', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('7486d7f0-323b-4ab4-94df-536abe44113e', 'direct grant', 'OpenID Connect Resource Owner Grant', 'findme-predialx', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('774436e9-011c-4e77-afa1-72746b63ae39', 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'findme-predialx', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('e6d27890-c0cf-48bb-bf05-63025b3c8e33', 'registration', 'registration flow', 'findme-predialx', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('47c9f124-191a-4c37-8452-25e33a88de19', 'registration form', 'registration form', 'findme-predialx', 'form-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('fbe30de1-20d9-4a1f-9850-2cb0a8cef633', 'reset credentials', 'Reset credentials for a user if they forgot their password or something', 'findme-predialx', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('1b076f1d-7031-468e-9395-0678d68e5eb7', 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', 'findme-predialx', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('39b4f5e7-4998-45a6-a79a-d03cf1d303cf', 'clients', 'Base authentication for clients', 'findme-predialx', 'client-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('4f4ff7c7-0e95-4134-9cb0-46be64194478', 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', 'findme-predialx', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('99f751b1-0772-422f-a107-79f2174d3c92', 'User creation or linking', 'Flow for the existing/non-existing user alternatives', 'findme-predialx', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('30721d23-dc7c-46ed-9a3c-567b67be1046', 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', 'findme-predialx', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('3abf4eca-0f38-4d17-9f17-8030d6d2be04', 'Account verification options', 'Method with which to verity the existing account', 'findme-predialx', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('923c1758-e09e-480c-9605-be1726b19dd9', 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', 'findme-predialx', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('0ab4ef5b-3e61-44d5-89a0-c292bdc9c839', 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', 'findme-predialx', 'basic-flow', false, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('379e6289-af3f-462a-834f-d5233e8a63a6', 'saml ecp', 'SAML ECP Profile Authentication Flow', 'findme-predialx', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('5de7203b-117c-4662-8498-964c74edb0dc', 'docker auth', 'Used by Docker clients to authenticate against the IDP', 'findme-predialx', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('da796090-c567-4d15-bc4b-606de2f09841', 'http challenge', 'An authentication flow based on challenge-response HTTP Authentication Schemes', 'findme-predialx', 'basic-flow', true, true);
INSERT INTO public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) VALUES ('52d17f51-667e-48b1-a5e3-342c396d65ac', 'Authentication Options', 'Authentication options.', 'findme-predialx', 'basic-flow', false, true);


--
-- TOC entry 3841 (class 0 OID 17061)
-- Dependencies: 244
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('c0b36878-cc1d-48db-bfc0-c8432617f0b5', 'review profile config', 'master');
INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('323df1ad-6280-41c5-9df7-a9470eb6e239', 'create unique user config', 'master');
INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('67f7e5c7-3d5b-478c-87a6-30269bee9a5b', 'review profile config', 'findme-predialx');
INSERT INTO public.authenticator_config (id, alias, realm_id) VALUES ('20fc94ce-d7da-4624-94c9-c10111bdc910', 'create unique user config', 'findme-predialx');


--
-- TOC entry 3844 (class 0 OID 17078)
-- Dependencies: 247
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('c0b36878-cc1d-48db-bfc0-c8432617f0b5', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('323df1ad-6280-41c5-9df7-a9470eb6e239', 'false', 'require.password.update.after.registration');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('67f7e5c7-3d5b-478c-87a6-30269bee9a5b', 'missing', 'update.profile.on.first.login');
INSERT INTO public.authenticator_config_entry (authenticator_id, value, name) VALUES ('20fc94ce-d7da-4624-94c9-c10111bdc910', 'false', 'require.password.update.after.registration');


--
-- TOC entry 3870 (class 0 OID 17533)
-- Dependencies: 273
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3801 (class 0 OID 16410)
-- Dependencies: 204
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('987bd059-aab4-490f-a517-c06a02e1b53d', true, false, 'master-realm', 0, false, NULL, NULL, true, NULL, false, 'master', NULL, 0, false, false, 'master Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('0553ec4f-d2ac-4b97-a4a6-b2977833aec2', true, false, 'account', 0, true, NULL, '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('90aaaa5d-55b8-487a-846e-8482d2673b5c', true, false, 'account-console', 0, true, NULL, '/realms/master/account/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('c5a67170-22a2-49fc-8eee-6c8440dec364', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('d2c1a4c3-b48f-40fd-96fe-80d273959195', true, false, 'security-admin-console', 0, true, NULL, '/admin/master/console/', false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('236f02f1-d16b-4012-8f5b-124062dcd44e', true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, 'master', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('be9b703b-ee56-4f23-b934-c1c72e2e662a', true, false, 'findme-predialx-realm', 0, false, NULL, NULL, true, NULL, false, 'master', NULL, 0, false, false, 'findme-predialx Realm', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('e78153ba-5513-4c47-8c82-66420e850466', true, false, 'realm-management', 0, false, NULL, NULL, true, NULL, false, 'findme-predialx', 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('5914aec0-a8ae-48fb-bef2-e3b2636a105b', true, false, 'account', 0, true, NULL, '/realms/findme-predialx/account/', false, NULL, false, 'findme-predialx', 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('6572894e-01ba-49f6-8f01-791c9c5742e3', true, false, 'account-console', 0, true, NULL, '/realms/findme-predialx/account/', false, NULL, false, 'findme-predialx', 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('14d7923b-f8b9-4662-b5d5-a65acb732a77', true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, 'findme-predialx', 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('c7ed64ca-5b00-46cf-af5f-d318ca900d9f', true, false, 'security-admin-console', 0, true, NULL, '/admin/findme-predialx/console/', false, NULL, false, 'findme-predialx', 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('52b30859-05be-4345-89d7-43db9f74599b', true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, 'findme-predialx', 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);
INSERT INTO public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', true, true, 'backend', 0, false, 'eca16f92-73e4-4fac-9961-9eaba2e1cf75', NULL, false, 'http://localhost:3000', false, 'findme-predialx', 'openid-connect', -1, false, false, NULL, true, 'client-secret', 'http://localhost:3000', NULL, NULL, true, false, true, false);


--
-- TOC entry 3824 (class 0 OID 16784)
-- Dependencies: 227
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.client_attributes (client_id, value, name) VALUES ('90aaaa5d-55b8-487a-846e-8482d2673b5c', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('d2c1a4c3-b48f-40fd-96fe-80d273959195', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('6572894e-01ba-49f6-8f01-791c9c5742e3', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('c7ed64ca-5b00-46cf-af5f-d318ca900d9f', 'S256', 'pkce.code.challenge.method');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'true', 'backchannel.logout.session.required');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'backchannel.logout.revoke.offline.tokens');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'saml.artifact.binding');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'saml.server.signature');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'saml.server.signature.keyinfo.ext');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'saml.assertion.signature');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'saml.client.signature');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'saml.encrypt');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'saml.authnstatement');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'saml.onetimeuse.condition');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'saml_force_name_id_format');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'saml.multivalued.roles');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'saml.force.post.binding');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'exclude.session.state.from.auth.response');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'oauth2.device.authorization.grant.enabled');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'oidc.ciba.grant.enabled');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'true', 'use.refresh.tokens');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'tls.client.certificate.bound.access.tokens');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'client_credentials.use_refresh_token');
INSERT INTO public.client_attributes (client_id, value, name) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'false', 'display.on.consent.screen');


--
-- TOC entry 3881 (class 0 OID 17792)
-- Dependencies: 284
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3880 (class 0 OID 17667)
-- Dependencies: 283
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3826 (class 0 OID 16796)
-- Dependencies: 229
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3858 (class 0 OID 17316)
-- Dependencies: 261
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('6ac0433c-87f0-4b74-8205-6fccc2c9f1b8', 'offline_access', 'master', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('af7c6c9a-717c-47f2-b227-0974a6309fbe', 'role_list', 'master', 'SAML role list', 'saml');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1', 'profile', 'master', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('1f79846c-122c-4c84-8112-2c3ebf7807fc', 'email', 'master', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('528e0ff0-0f65-4682-87de-cd462015de1a', 'address', 'master', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('4ece53a1-cb1e-4e3d-a0ec-56cdd6d21c2e', 'phone', 'master', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('b455332c-e764-4cc2-9653-e7d338b21870', 'roles', 'master', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('0b2c5cc7-47ec-4e14-b8ae-49bd9ce66467', 'web-origins', 'master', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('f8678898-840a-4b1e-9c7c-b460bd64663e', 'microprofile-jwt', 'master', 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('91001054-9d9d-4441-8739-1dd22aea804f', 'offline_access', 'findme-predialx', 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('5e040652-8e63-4e9b-80bf-12a0d8cbd1b8', 'role_list', 'findme-predialx', 'SAML role list', 'saml');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('7222d1e5-b1ac-400c-b352-2a95033c5745', 'profile', 'findme-predialx', 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('4a587004-4a52-46d8-8433-9bea55c94792', 'email', 'findme-predialx', 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('7f2b9e3f-f62e-48a6-b96a-3485d7c14d62', 'address', 'findme-predialx', 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('30c44b8e-a7d6-478e-8a11-960b3558777d', 'phone', 'findme-predialx', 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('e0f294d6-d9c9-42fc-989e-9f28eaa35fdc', 'roles', 'findme-predialx', 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('3497b98d-1588-4084-ab10-3c67cdae072d', 'web-origins', 'findme-predialx', 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope (id, name, realm_id, description, protocol) VALUES ('0a6227fd-ab87-471c-942c-8b709c4bc86a', 'microprofile-jwt', 'findme-predialx', 'Microprofile - JWT built-in scope', 'openid-connect');


--
-- TOC entry 3859 (class 0 OID 17331)
-- Dependencies: 262
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('6ac0433c-87f0-4b74-8205-6fccc2c9f1b8', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('6ac0433c-87f0-4b74-8205-6fccc2c9f1b8', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('af7c6c9a-717c-47f2-b227-0974a6309fbe', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('af7c6c9a-717c-47f2-b227-0974a6309fbe', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('1f79846c-122c-4c84-8112-2c3ebf7807fc', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('1f79846c-122c-4c84-8112-2c3ebf7807fc', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('1f79846c-122c-4c84-8112-2c3ebf7807fc', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('528e0ff0-0f65-4682-87de-cd462015de1a', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('528e0ff0-0f65-4682-87de-cd462015de1a', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('528e0ff0-0f65-4682-87de-cd462015de1a', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('4ece53a1-cb1e-4e3d-a0ec-56cdd6d21c2e', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('4ece53a1-cb1e-4e3d-a0ec-56cdd6d21c2e', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('4ece53a1-cb1e-4e3d-a0ec-56cdd6d21c2e', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('b455332c-e764-4cc2-9653-e7d338b21870', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('b455332c-e764-4cc2-9653-e7d338b21870', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('b455332c-e764-4cc2-9653-e7d338b21870', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('0b2c5cc7-47ec-4e14-b8ae-49bd9ce66467', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('0b2c5cc7-47ec-4e14-b8ae-49bd9ce66467', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('0b2c5cc7-47ec-4e14-b8ae-49bd9ce66467', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('f8678898-840a-4b1e-9c7c-b460bd64663e', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('f8678898-840a-4b1e-9c7c-b460bd64663e', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('91001054-9d9d-4441-8739-1dd22aea804f', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('91001054-9d9d-4441-8739-1dd22aea804f', '${offlineAccessScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('5e040652-8e63-4e9b-80bf-12a0d8cbd1b8', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('5e040652-8e63-4e9b-80bf-12a0d8cbd1b8', '${samlRoleListScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('7222d1e5-b1ac-400c-b352-2a95033c5745', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('7222d1e5-b1ac-400c-b352-2a95033c5745', '${profileScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('7222d1e5-b1ac-400c-b352-2a95033c5745', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('4a587004-4a52-46d8-8433-9bea55c94792', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('4a587004-4a52-46d8-8433-9bea55c94792', '${emailScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('4a587004-4a52-46d8-8433-9bea55c94792', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('7f2b9e3f-f62e-48a6-b96a-3485d7c14d62', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('7f2b9e3f-f62e-48a6-b96a-3485d7c14d62', '${addressScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('7f2b9e3f-f62e-48a6-b96a-3485d7c14d62', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('30c44b8e-a7d6-478e-8a11-960b3558777d', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('30c44b8e-a7d6-478e-8a11-960b3558777d', '${phoneScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('30c44b8e-a7d6-478e-8a11-960b3558777d', 'true', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('e0f294d6-d9c9-42fc-989e-9f28eaa35fdc', 'true', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('e0f294d6-d9c9-42fc-989e-9f28eaa35fdc', '${rolesScopeConsentText}', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('e0f294d6-d9c9-42fc-989e-9f28eaa35fdc', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('3497b98d-1588-4084-ab10-3c67cdae072d', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('3497b98d-1588-4084-ab10-3c67cdae072d', '', 'consent.screen.text');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('3497b98d-1588-4084-ab10-3c67cdae072d', 'false', 'include.in.token.scope');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('0a6227fd-ab87-471c-942c-8b709c4bc86a', 'false', 'display.on.consent.screen');
INSERT INTO public.client_scope_attributes (scope_id, value, name) VALUES ('0a6227fd-ab87-471c-942c-8b709c4bc86a', 'true', 'include.in.token.scope');


--
-- TOC entry 3882 (class 0 OID 17834)
-- Dependencies: 285
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0553ec4f-d2ac-4b97-a4a6-b2977833aec2', 'b455332c-e764-4cc2-9653-e7d338b21870', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0553ec4f-d2ac-4b97-a4a6-b2977833aec2', '1f79846c-122c-4c84-8112-2c3ebf7807fc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0553ec4f-d2ac-4b97-a4a6-b2977833aec2', '0b2c5cc7-47ec-4e14-b8ae-49bd9ce66467', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0553ec4f-d2ac-4b97-a4a6-b2977833aec2', '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0553ec4f-d2ac-4b97-a4a6-b2977833aec2', 'f8678898-840a-4b1e-9c7c-b460bd64663e', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0553ec4f-d2ac-4b97-a4a6-b2977833aec2', '6ac0433c-87f0-4b74-8205-6fccc2c9f1b8', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0553ec4f-d2ac-4b97-a4a6-b2977833aec2', '528e0ff0-0f65-4682-87de-cd462015de1a', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('0553ec4f-d2ac-4b97-a4a6-b2977833aec2', '4ece53a1-cb1e-4e3d-a0ec-56cdd6d21c2e', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('90aaaa5d-55b8-487a-846e-8482d2673b5c', 'b455332c-e764-4cc2-9653-e7d338b21870', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('90aaaa5d-55b8-487a-846e-8482d2673b5c', '1f79846c-122c-4c84-8112-2c3ebf7807fc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('90aaaa5d-55b8-487a-846e-8482d2673b5c', '0b2c5cc7-47ec-4e14-b8ae-49bd9ce66467', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('90aaaa5d-55b8-487a-846e-8482d2673b5c', '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('90aaaa5d-55b8-487a-846e-8482d2673b5c', 'f8678898-840a-4b1e-9c7c-b460bd64663e', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('90aaaa5d-55b8-487a-846e-8482d2673b5c', '6ac0433c-87f0-4b74-8205-6fccc2c9f1b8', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('90aaaa5d-55b8-487a-846e-8482d2673b5c', '528e0ff0-0f65-4682-87de-cd462015de1a', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('90aaaa5d-55b8-487a-846e-8482d2673b5c', '4ece53a1-cb1e-4e3d-a0ec-56cdd6d21c2e', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('236f02f1-d16b-4012-8f5b-124062dcd44e', 'b455332c-e764-4cc2-9653-e7d338b21870', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('236f02f1-d16b-4012-8f5b-124062dcd44e', '1f79846c-122c-4c84-8112-2c3ebf7807fc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('236f02f1-d16b-4012-8f5b-124062dcd44e', '0b2c5cc7-47ec-4e14-b8ae-49bd9ce66467', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('236f02f1-d16b-4012-8f5b-124062dcd44e', '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('236f02f1-d16b-4012-8f5b-124062dcd44e', 'f8678898-840a-4b1e-9c7c-b460bd64663e', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('236f02f1-d16b-4012-8f5b-124062dcd44e', '6ac0433c-87f0-4b74-8205-6fccc2c9f1b8', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('236f02f1-d16b-4012-8f5b-124062dcd44e', '528e0ff0-0f65-4682-87de-cd462015de1a', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('236f02f1-d16b-4012-8f5b-124062dcd44e', '4ece53a1-cb1e-4e3d-a0ec-56cdd6d21c2e', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c5a67170-22a2-49fc-8eee-6c8440dec364', 'b455332c-e764-4cc2-9653-e7d338b21870', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c5a67170-22a2-49fc-8eee-6c8440dec364', '1f79846c-122c-4c84-8112-2c3ebf7807fc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c5a67170-22a2-49fc-8eee-6c8440dec364', '0b2c5cc7-47ec-4e14-b8ae-49bd9ce66467', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c5a67170-22a2-49fc-8eee-6c8440dec364', '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c5a67170-22a2-49fc-8eee-6c8440dec364', 'f8678898-840a-4b1e-9c7c-b460bd64663e', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c5a67170-22a2-49fc-8eee-6c8440dec364', '6ac0433c-87f0-4b74-8205-6fccc2c9f1b8', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c5a67170-22a2-49fc-8eee-6c8440dec364', '528e0ff0-0f65-4682-87de-cd462015de1a', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c5a67170-22a2-49fc-8eee-6c8440dec364', '4ece53a1-cb1e-4e3d-a0ec-56cdd6d21c2e', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('987bd059-aab4-490f-a517-c06a02e1b53d', 'b455332c-e764-4cc2-9653-e7d338b21870', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('987bd059-aab4-490f-a517-c06a02e1b53d', '1f79846c-122c-4c84-8112-2c3ebf7807fc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('987bd059-aab4-490f-a517-c06a02e1b53d', '0b2c5cc7-47ec-4e14-b8ae-49bd9ce66467', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('987bd059-aab4-490f-a517-c06a02e1b53d', '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('987bd059-aab4-490f-a517-c06a02e1b53d', 'f8678898-840a-4b1e-9c7c-b460bd64663e', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('987bd059-aab4-490f-a517-c06a02e1b53d', '6ac0433c-87f0-4b74-8205-6fccc2c9f1b8', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('987bd059-aab4-490f-a517-c06a02e1b53d', '528e0ff0-0f65-4682-87de-cd462015de1a', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('987bd059-aab4-490f-a517-c06a02e1b53d', '4ece53a1-cb1e-4e3d-a0ec-56cdd6d21c2e', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d2c1a4c3-b48f-40fd-96fe-80d273959195', 'b455332c-e764-4cc2-9653-e7d338b21870', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d2c1a4c3-b48f-40fd-96fe-80d273959195', '1f79846c-122c-4c84-8112-2c3ebf7807fc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d2c1a4c3-b48f-40fd-96fe-80d273959195', '0b2c5cc7-47ec-4e14-b8ae-49bd9ce66467', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d2c1a4c3-b48f-40fd-96fe-80d273959195', '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d2c1a4c3-b48f-40fd-96fe-80d273959195', 'f8678898-840a-4b1e-9c7c-b460bd64663e', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d2c1a4c3-b48f-40fd-96fe-80d273959195', '6ac0433c-87f0-4b74-8205-6fccc2c9f1b8', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d2c1a4c3-b48f-40fd-96fe-80d273959195', '528e0ff0-0f65-4682-87de-cd462015de1a', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('d2c1a4c3-b48f-40fd-96fe-80d273959195', '4ece53a1-cb1e-4e3d-a0ec-56cdd6d21c2e', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5914aec0-a8ae-48fb-bef2-e3b2636a105b', 'e0f294d6-d9c9-42fc-989e-9f28eaa35fdc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5914aec0-a8ae-48fb-bef2-e3b2636a105b', '7222d1e5-b1ac-400c-b352-2a95033c5745', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5914aec0-a8ae-48fb-bef2-e3b2636a105b', '4a587004-4a52-46d8-8433-9bea55c94792', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5914aec0-a8ae-48fb-bef2-e3b2636a105b', '3497b98d-1588-4084-ab10-3c67cdae072d', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5914aec0-a8ae-48fb-bef2-e3b2636a105b', '30c44b8e-a7d6-478e-8a11-960b3558777d', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5914aec0-a8ae-48fb-bef2-e3b2636a105b', '91001054-9d9d-4441-8739-1dd22aea804f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5914aec0-a8ae-48fb-bef2-e3b2636a105b', '0a6227fd-ab87-471c-942c-8b709c4bc86a', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('5914aec0-a8ae-48fb-bef2-e3b2636a105b', '7f2b9e3f-f62e-48a6-b96a-3485d7c14d62', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('6572894e-01ba-49f6-8f01-791c9c5742e3', 'e0f294d6-d9c9-42fc-989e-9f28eaa35fdc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('6572894e-01ba-49f6-8f01-791c9c5742e3', '7222d1e5-b1ac-400c-b352-2a95033c5745', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('6572894e-01ba-49f6-8f01-791c9c5742e3', '4a587004-4a52-46d8-8433-9bea55c94792', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('6572894e-01ba-49f6-8f01-791c9c5742e3', '3497b98d-1588-4084-ab10-3c67cdae072d', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('6572894e-01ba-49f6-8f01-791c9c5742e3', '30c44b8e-a7d6-478e-8a11-960b3558777d', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('6572894e-01ba-49f6-8f01-791c9c5742e3', '91001054-9d9d-4441-8739-1dd22aea804f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('6572894e-01ba-49f6-8f01-791c9c5742e3', '0a6227fd-ab87-471c-942c-8b709c4bc86a', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('6572894e-01ba-49f6-8f01-791c9c5742e3', '7f2b9e3f-f62e-48a6-b96a-3485d7c14d62', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('52b30859-05be-4345-89d7-43db9f74599b', 'e0f294d6-d9c9-42fc-989e-9f28eaa35fdc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('52b30859-05be-4345-89d7-43db9f74599b', '7222d1e5-b1ac-400c-b352-2a95033c5745', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('52b30859-05be-4345-89d7-43db9f74599b', '4a587004-4a52-46d8-8433-9bea55c94792', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('52b30859-05be-4345-89d7-43db9f74599b', '3497b98d-1588-4084-ab10-3c67cdae072d', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('52b30859-05be-4345-89d7-43db9f74599b', '30c44b8e-a7d6-478e-8a11-960b3558777d', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('52b30859-05be-4345-89d7-43db9f74599b', '91001054-9d9d-4441-8739-1dd22aea804f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('52b30859-05be-4345-89d7-43db9f74599b', '0a6227fd-ab87-471c-942c-8b709c4bc86a', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('52b30859-05be-4345-89d7-43db9f74599b', '7f2b9e3f-f62e-48a6-b96a-3485d7c14d62', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('14d7923b-f8b9-4662-b5d5-a65acb732a77', 'e0f294d6-d9c9-42fc-989e-9f28eaa35fdc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('14d7923b-f8b9-4662-b5d5-a65acb732a77', '7222d1e5-b1ac-400c-b352-2a95033c5745', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('14d7923b-f8b9-4662-b5d5-a65acb732a77', '4a587004-4a52-46d8-8433-9bea55c94792', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('14d7923b-f8b9-4662-b5d5-a65acb732a77', '3497b98d-1588-4084-ab10-3c67cdae072d', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('14d7923b-f8b9-4662-b5d5-a65acb732a77', '30c44b8e-a7d6-478e-8a11-960b3558777d', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('14d7923b-f8b9-4662-b5d5-a65acb732a77', '91001054-9d9d-4441-8739-1dd22aea804f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('14d7923b-f8b9-4662-b5d5-a65acb732a77', '0a6227fd-ab87-471c-942c-8b709c4bc86a', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('14d7923b-f8b9-4662-b5d5-a65acb732a77', '7f2b9e3f-f62e-48a6-b96a-3485d7c14d62', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e78153ba-5513-4c47-8c82-66420e850466', 'e0f294d6-d9c9-42fc-989e-9f28eaa35fdc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e78153ba-5513-4c47-8c82-66420e850466', '7222d1e5-b1ac-400c-b352-2a95033c5745', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e78153ba-5513-4c47-8c82-66420e850466', '4a587004-4a52-46d8-8433-9bea55c94792', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e78153ba-5513-4c47-8c82-66420e850466', '3497b98d-1588-4084-ab10-3c67cdae072d', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e78153ba-5513-4c47-8c82-66420e850466', '30c44b8e-a7d6-478e-8a11-960b3558777d', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e78153ba-5513-4c47-8c82-66420e850466', '91001054-9d9d-4441-8739-1dd22aea804f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e78153ba-5513-4c47-8c82-66420e850466', '0a6227fd-ab87-471c-942c-8b709c4bc86a', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('e78153ba-5513-4c47-8c82-66420e850466', '7f2b9e3f-f62e-48a6-b96a-3485d7c14d62', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c7ed64ca-5b00-46cf-af5f-d318ca900d9f', 'e0f294d6-d9c9-42fc-989e-9f28eaa35fdc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c7ed64ca-5b00-46cf-af5f-d318ca900d9f', '7222d1e5-b1ac-400c-b352-2a95033c5745', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c7ed64ca-5b00-46cf-af5f-d318ca900d9f', '4a587004-4a52-46d8-8433-9bea55c94792', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c7ed64ca-5b00-46cf-af5f-d318ca900d9f', '3497b98d-1588-4084-ab10-3c67cdae072d', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c7ed64ca-5b00-46cf-af5f-d318ca900d9f', '30c44b8e-a7d6-478e-8a11-960b3558777d', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c7ed64ca-5b00-46cf-af5f-d318ca900d9f', '91001054-9d9d-4441-8739-1dd22aea804f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c7ed64ca-5b00-46cf-af5f-d318ca900d9f', '0a6227fd-ab87-471c-942c-8b709c4bc86a', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('c7ed64ca-5b00-46cf-af5f-d318ca900d9f', '7f2b9e3f-f62e-48a6-b96a-3485d7c14d62', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'e0f294d6-d9c9-42fc-989e-9f28eaa35fdc', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', '7222d1e5-b1ac-400c-b352-2a95033c5745', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', '4a587004-4a52-46d8-8433-9bea55c94792', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', '3497b98d-1588-4084-ab10-3c67cdae072d', true);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', '30c44b8e-a7d6-478e-8a11-960b3558777d', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', '91001054-9d9d-4441-8739-1dd22aea804f', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', '0a6227fd-ab87-471c-942c-8b709c4bc86a', false);
INSERT INTO public.client_scope_client (client_id, scope_id, default_scope) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', '7f2b9e3f-f62e-48a6-b96a-3485d7c14d62', false);


--
-- TOC entry 3860 (class 0 OID 17337)
-- Dependencies: 263
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('6ac0433c-87f0-4b74-8205-6fccc2c9f1b8', 'adb8a2f9-7bc8-4517-b8bd-6621579a7b69');
INSERT INTO public.client_scope_role_mapping (scope_id, role_id) VALUES ('91001054-9d9d-4441-8739-1dd22aea804f', 'e6f437a8-97a5-4336-a3ad-81c705179a96');


--
-- TOC entry 3802 (class 0 OID 16422)
-- Dependencies: 205
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3847 (class 0 OID 17099)
-- Dependencies: 250
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3825 (class 0 OID 16790)
-- Dependencies: 228
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3839 (class 0 OID 16977)
-- Dependencies: 242
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3803 (class 0 OID 16428)
-- Dependencies: 206
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3848 (class 0 OID 17180)
-- Dependencies: 251
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3878 (class 0 OID 17583)
-- Dependencies: 281
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('b6f345e1-b500-4626-a412-f1f6960529da', 'Trusted Hosts', 'master', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('a0dbc8fe-67b8-44b5-ab65-fe2d64060acc', 'Consent Required', 'master', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('815cc870-6697-4be3-b829-f51f9d5bc155', 'Full Scope Disabled', 'master', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('ea0ff1b3-13b3-4ff8-8de3-8299e1e41889', 'Max Clients Limit', 'master', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('59fea05a-c5f9-4181-9bc6-209827c4d86a', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('f590a12b-86ec-4676-9c3f-66230ee471a1', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('b0072181-47eb-42f5-8b09-23d5ecee4598', 'Allowed Protocol Mapper Types', 'master', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('ec1cf10a-45c1-4853-81be-c7df55662d16', 'Allowed Client Scopes', 'master', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'master', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('0aa2dd49-bd9c-4db3-8d00-e408b4b72b06', 'rsa-generated', 'master', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('861bf6e2-7a11-466e-89e7-f39509a65f3a', 'hmac-generated', 'master', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('69bb5538-9371-42b4-a356-c1a1d68eb914', 'aes-generated', 'master', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'master', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('121fae5b-d3ef-45f8-8809-794c36aa4512', 'rsa-generated', 'findme-predialx', 'rsa-generated', 'org.keycloak.keys.KeyProvider', 'findme-predialx', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('6f000400-81e3-4e0b-b7ec-33f491d2d086', 'hmac-generated', 'findme-predialx', 'hmac-generated', 'org.keycloak.keys.KeyProvider', 'findme-predialx', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('2e6e979c-f088-4777-993f-a71c48ca9aed', 'aes-generated', 'findme-predialx', 'aes-generated', 'org.keycloak.keys.KeyProvider', 'findme-predialx', NULL);
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('4872d0cb-246e-4c61-b909-027bda16284d', 'Trusted Hosts', 'findme-predialx', 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'findme-predialx', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('5514d9b0-ba58-4049-8db2-05b019185aa9', 'Consent Required', 'findme-predialx', 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'findme-predialx', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('6b6f0d28-ad44-433a-bf71-bfaf1bf7fba0', 'Full Scope Disabled', 'findme-predialx', 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'findme-predialx', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('cf25e096-95a3-40cd-b2a3-fad09e13ae57', 'Max Clients Limit', 'findme-predialx', 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'findme-predialx', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('76ffcdd4-a0d8-4212-bc40-f1f7ff16dbcc', 'Allowed Protocol Mapper Types', 'findme-predialx', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'findme-predialx', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('b184171b-d5b2-4970-9db5-a24a27dcfc7e', 'Allowed Client Scopes', 'findme-predialx', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'findme-predialx', 'anonymous');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('92a1835d-0abd-4657-b6e1-0e655af1a51e', 'Allowed Protocol Mapper Types', 'findme-predialx', 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'findme-predialx', 'authenticated');
INSERT INTO public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) VALUES ('2678004a-bef5-4ee7-a329-de19d2c77cca', 'Allowed Client Scopes', 'findme-predialx', 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', 'findme-predialx', 'authenticated');


--
-- TOC entry 3877 (class 0 OID 17577)
-- Dependencies: 280
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.component_config (id, component_id, name, value) VALUES ('316b2f43-ffe9-4a00-aec4-de8ee323f31e', 'f590a12b-86ec-4676-9c3f-66230ee471a1', 'allow-default-scopes', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('a85b4b0b-978b-4f27-932d-06652724b1c5', '59fea05a-c5f9-4181-9bc6-209827c4d86a', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('222332b2-df74-48dc-8670-c1f5b1b5a85a', '59fea05a-c5f9-4181-9bc6-209827c4d86a', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('1ea1589d-c8f0-493e-ad7e-678f414d65c0', '59fea05a-c5f9-4181-9bc6-209827c4d86a', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('ff6c8216-77c8-4a9e-942c-fcbf02f9336b', '59fea05a-c5f9-4181-9bc6-209827c4d86a', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('ef8334bb-5b92-46df-acd2-dda6d237f46d', '59fea05a-c5f9-4181-9bc6-209827c4d86a', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('820286c8-bca4-4c95-a24b-46c5dae383ee', '59fea05a-c5f9-4181-9bc6-209827c4d86a', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('4f191d25-d59b-4045-b54c-0377d9e4482e', '59fea05a-c5f9-4181-9bc6-209827c4d86a', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('006f68b9-2ad9-4186-8a5d-7a56e737c99f', '59fea05a-c5f9-4181-9bc6-209827c4d86a', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('82c8377f-398a-4cce-b19a-56a676afbb8d', 'ec1cf10a-45c1-4853-81be-c7df55662d16', 'allow-default-scopes', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('6a506b48-7100-4a74-9bb4-d349e61ff1d8', 'b0072181-47eb-42f5-8b09-23d5ecee4598', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('a4249c2d-0b92-48b6-89ac-7d2c31d97c48', 'b0072181-47eb-42f5-8b09-23d5ecee4598', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('e8b3e430-d6b0-4992-bcd3-daa39673705b', 'b0072181-47eb-42f5-8b09-23d5ecee4598', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('4274d62d-bbca-45c9-8fa4-0c64395d9859', 'b0072181-47eb-42f5-8b09-23d5ecee4598', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('7c67fcd4-8ac9-4e89-a21d-816ff69df20d', 'b0072181-47eb-42f5-8b09-23d5ecee4598', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('3798b36c-42ff-4b0f-9ceb-ac751e82f8bd', 'b0072181-47eb-42f5-8b09-23d5ecee4598', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('27a565ca-e16e-4e3d-b21b-a6ab860442a3', 'b0072181-47eb-42f5-8b09-23d5ecee4598', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('bb34c239-a1f8-4034-a943-f8eded18165f', 'b0072181-47eb-42f5-8b09-23d5ecee4598', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('50101d74-cea8-4c2b-8701-bd56cfd65441', 'ea0ff1b3-13b3-4ff8-8de3-8299e1e41889', 'max-clients', '200');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('ad08e6da-dc8e-4f8d-a4fa-08c17b38c4e6', 'b6f345e1-b500-4626-a412-f1f6960529da', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('827deddb-a1a5-42d6-b346-0f089c6cfd39', 'b6f345e1-b500-4626-a412-f1f6960529da', 'client-uris-must-match', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('2121d5fc-d6fd-476b-a096-5e579824f0ee', '0aa2dd49-bd9c-4db3-8d00-e408b4b72b06', 'privateKey', 'MIIEowIBAAKCAQEAgGVfZrwK9IGj9PMafcq6jLcZwT49OO6/sqTaPESR9f+CaYpMAZ3wimCml+chy/d3PUdeTqxeFwqh24rtoKIy5WkH67jejQhil1hfPQ2TRxBoMHtK2ZDKr3PnxBgxd3/2m9INXOcS5hlvsjgsKK6J2jO3gth8RFebxkT4wsVijvSxPI6DqwRQNysOVfSQItd/vboykSsMAzCOWF+mOR8ycXcdkUA4rXpkV45EtiZhbO1OqDAGuu74yOosfq+Qw9+R03J2lllfToqPYb0YRsN6G2fQDj3mgzcDkQ3DHWyAOBQyVQ8GvXBgiITODetGkfHWgvHKGpqo1swolwspjvanVQIDAQABAoIBAC0B3ABKOFjfPNb3hLjFoMEEyh1oMNPNNRttGCb6LmQaDd/rH5uNfq0zFhK3baxu8bhkVRWk7FKNYpFv0L53PPoX6DPkGPc9EjpVOwVOxeqqQKuF/IXpcHMyYPLnPCfUjmCusAp54bERB4tkj24vSJlZeaF/O4hFYZCNytmTkWnksswqfWl/1ZSdJ4snHaFX2U3Fzm6DR9h+JAUk9WmV9EWRGFfZu99wtQTHlUeYiVDn46d/kdvoBTd/gv0C/hTxn2CPj7TYznfmgoUx1PqLeK2bz1yj2byvSnDaPhf/On2wWTtpQ9MzTzvHxQ7QgVy3b4XjpjFgQuSd3lkvR3/eSr0CgYEAxaEyHOrPj6b1oIgEm11egEXfW5iyd+GIGf8uY1rQuH5hEct7YSOTjzkekx22ucellfZijC/YVvdMsllwkBOUxfMMKPWPX1/HLyLdpsuKtJRWwO/V/Fd9pgVvWJE42FxTITpjz+9/QPjPlClt2h1G83eNt5hP6lBir/ebyNZpK7sCgYEAplFozDOVUi6J6tTON0sFuODTVn5RqVcRrU+WQoRRjbZcaxVpJ/tWErb+17oAogvxblRcnPiyh013myWRyW28OQDC1gUqBRhq+xw++YdAcm30cV27bmH1korXoKtHB2GtwYfvxDAufzdfi6KGcqvdFfSiSR9/6C5NiOci+GHs4C8CgYEAp7yRFAoX8Qz8HSxU/KjatHSZhtyrXSSGp8n2TU2fKXfaW4ghR+kyLLWGRcdKd5QD7qwYKHPTYryy1A0lhKOZ+gi3oWwKLCDWpiMpjY/kQjBFEax+Kpb3hhnGz50yajCyPdmZLbtQfoyvYklne2Ct/6bRGaqk6XMgz8mQ531T9lECgYAlhV4wGz8HoEoq+UFghgNPdyEWdT71BhiN0dOjQ/imEMr+uYDUrUX4yOHrRyIXbLxV2KBgJVcZYSenj605FRGOhpZt9BJLvft8lR2764BlkFrCLJQ5Tc459iq5K4rFpoqti35S80+6EYLznIHaYt1os5zdBEc12SRSy1o/UNBArwKBgGsHicuSFrBik3edYFD+gLDg5o8lc3hNjm4rK7SchbdEHWv/esvUZPtzqo9DU8PqYmulCxECEj9U4VsjkoTSBr4RbvJ5X+YcwPPshsRdthJtdDLofNaxpYQSL+vmd4cGBFIFDjvcmjyPqpKN4+eTwLJH3AKGZpNHDOmb7EKDepCD');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('7c2fb1bc-ef1f-4146-84fa-9fa969124355', '0aa2dd49-bd9c-4db3-8d00-e408b4b72b06', 'certificate', 'MIICmzCCAYMCBgF5RKlOCzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjEwNTA3MDIyODM2WhcNMzEwNTA3MDIzMDE2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCAZV9mvAr0gaP08xp9yrqMtxnBPj047r+ypNo8RJH1/4JpikwBnfCKYKaX5yHL93c9R15OrF4XCqHbiu2gojLlaQfruN6NCGKXWF89DZNHEGgwe0rZkMqvc+fEGDF3f/ab0g1c5xLmGW+yOCworonaM7eC2HxEV5vGRPjCxWKO9LE8joOrBFA3Kw5V9JAi13+9ujKRKwwDMI5YX6Y5HzJxdx2RQDitemRXjkS2JmFs7U6oMAa67vjI6ix+r5DD35HTcnaWWV9Oio9hvRhGw3obZ9AOPeaDNwORDcMdbIA4FDJVDwa9cGCIhM4N60aR8daC8coamqjWzCiXCymO9qdVAgMBAAEwDQYJKoZIhvcNAQELBQADggEBACD9IqHgihnRUyNAwKZURmPU1oIDxyJfqKgCvdAnPAQpZNKCzLVM9tzLbSGpzo6fJTQ1xr5MpF+tid4rDHl1jCgQwVNAvYtIxUlEy9KocR/oY4OfbfX20ShT5QACuwOZBNhSWhqIH+1LOsSnG9l3T6ayHUBXMPAVdgsiW1SS1VmvGEqHA7NTuuwJMtpbwgTrTWFs6SIFK+czaCnNoxwimqSjK0U3gq7FJduDHT7emx0BreDfi3paZhS/a6FQ+W5NFeOU+zFlF9J6G24uStgnhhYZzn2U7bW4Jm3frk4Rnf483KWpQENieHJgkMtqfDVJlPQt456WmCNtoO5NFGWBMyE=');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('260db33b-b46b-411d-bd9a-ffce7b8ff9d1', '0aa2dd49-bd9c-4db3-8d00-e408b4b72b06', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('cfe43eab-242b-4f1e-9415-c801f31e17e1', '69bb5538-9371-42b4-a356-c1a1d68eb914', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('dffe9109-4562-49aa-a1c8-3b64b7301215', '69bb5538-9371-42b4-a356-c1a1d68eb914', 'secret', 'RCUWvD0tmqVOtb38999u6A');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('f022cf8e-8206-4290-be6e-274eac609567', '69bb5538-9371-42b4-a356-c1a1d68eb914', 'kid', 'a85ad2ed-1766-4943-8a98-d6621250e0d9');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('0e077ab5-f2be-4ed4-80a4-308565d7e600', '861bf6e2-7a11-466e-89e7-f39509a65f3a', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('75784d5c-eee2-4db5-b319-21a2cbe7660f', '861bf6e2-7a11-466e-89e7-f39509a65f3a', 'kid', '34d605a8-32ce-4347-a0a0-dcb7f555ed0e');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('4a099b5d-b699-40a8-aecd-76324f59a090', '861bf6e2-7a11-466e-89e7-f39509a65f3a', 'algorithm', 'HS256');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('fabd0f60-6eba-4018-94a9-474c7547e95f', '861bf6e2-7a11-466e-89e7-f39509a65f3a', 'secret', 'a3nmxxXSvKw6RLtcgkIkmgSGelz7eGRHnoeGFlLCfVXrABPO_TwhZjMAhy5iSg3rNRM-t31A5i49Jdp6Yg41KA');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('82786fdf-7559-4629-8c08-0e98ab582edc', '6f000400-81e3-4e0b-b7ec-33f491d2d086', 'algorithm', 'HS256');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('3b6d95fe-eff8-4f46-94a1-168b141926b7', '6f000400-81e3-4e0b-b7ec-33f491d2d086', 'kid', 'ff9f87dc-26a2-4a79-9d29-92167f4b860b');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('425f1f64-99b2-43ff-ac57-4a249ae3e8b3', '6f000400-81e3-4e0b-b7ec-33f491d2d086', 'secret', 'gxDTneNDKmZl4FE5rkP675kKIwxsCUVd31UQzTW7sjrdyOyo_E1HFwEqCLE-LncmlnWRvTKkHCCoI8gQwyu8Bg');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('ecb016a0-4bfe-452e-8e36-93b3bf993bc1', '6f000400-81e3-4e0b-b7ec-33f491d2d086', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('0806d0ff-9d71-45fd-b38f-eafea076eec1', '2e6e979c-f088-4777-993f-a71c48ca9aed', 'secret', 'xgX2JSErrtGfhDiIJWOhNg');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('9c170e9e-7c0f-462e-ba8b-c6b859fcba4f', '2e6e979c-f088-4777-993f-a71c48ca9aed', 'kid', '90a73cd4-1605-4577-9add-85a0a096fcd8');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('e3ab7545-be19-49cb-aa67-b03a2e3c1894', '2e6e979c-f088-4777-993f-a71c48ca9aed', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('a3fe3f47-0cf4-49e6-96ec-5cbefa1eaf1a', '121fae5b-d3ef-45f8-8809-794c36aa4512', 'privateKey', 'MIIEpAIBAAKCAQEAxwREdN8lHmpOpQ2/K1QqeqQTvmew5iY5Ug/w53vmEw/6qvnZY4N8arDgMQ4KgqrzdCigOL57YZjve5+C+BYwJRf01PNTqnQAxOJTHi9Cfr5p2Tw5+VW3kWCqB4epDEZQjs7u/ybm/22Q8t540calIaXdC8eezZP1cPnjBgoPaPaC0SyljJkmIjYCxoNjiBap3Jv2YRhLSdszg5h/5c+YGkKV4aMel7E1Cd92xHMuRkg+r+XRbYCrCJ66gFF0ljyKmyo9OBvRMSng/z/KNcdhh/WnbV8makKfabKFm0OihMpieikFTwhp9mmdkZbmagCaajpIEKTZbwVzc2x5kQTKjQIDAQABAoIBAQCdmueLlluS5qU5WNWXvqOVU/K+yubwnDywnCcvapMdbX4ZgJuDj1EsPL6OmowARtldl/6qcU7MT4z33a6eQRQHjB07tyb+ybcCNCmWsd56+NhiTKuspREmc+Ky6+AX9Gc/cOkb7vboOSCc9UnA9ws2xl9zQLamHxI0UfBTjAwAFjDuA8IMn9AX/xDuffH0uNB7R4tWC1BMtPHnPfS4fXHQ5FlFDUo+CbW27ZV4/uW223H+TzEyOcyYxOoKwt6qM5WR68ZhSpUsXtdWxUdUoS3Zv5rGSXxRGx0iSVNTlEhcGcNiJCqHvpom0DiVGwf2lbHx377fr004Pp1SyfZH66mBAoGBAPkQCxJAckAqm65Y1ptjfAyBqirE9FJ0ZRzJxCIdbUPTsxuhZTkI2B4g5NtrzpqdSy4Ek64X7lC3KefNAP91PzmJr3FXGQgnQraKW1caIV8mGLvJBdX1pS8b4wQVI+Odb12tPmG5QznxO8ZjrgWc0M64JzjWxitsVgoCxAX/nB4FAoGBAMyPXjnRozwcRAt6XfUOPGWTzpVsPfwRyk3pFY4mNeKjOQdVxkugOwgb9yHfxgajrOWb8fSbJUAVgiWWvYn/iSBYzELY24eZPkGw3oo48gSJxSSYCTJVmhLQq1AOQ8D0K3OgMLewy40UsfADX4fUcHL4hdisuoeJ6srNS4lSORjpAoGAZ4w6/iCbH4BXb1nyB3KKDW0PQW7XITzRGPHtwD05wzxNt8wXGGpL5+LHI06j+/YvXnd6qqO6agZsvrmlk4+8dICA139dod0oyFmndgQgIb3mBJSj/3t8bKSMcpMTc7ttpKW1TM3IXFul/WpN3HmA+qDndaMdisokz06tDs1hq70CgYAYQjhOawoMqt127wANe6617R1movuG1SVEsAuaW/Wv9uNgd0+Y0FuvzoE0RzFYwDhU0nWTKIL2YpaYlpPLtb4xU9aFZupB3m5/o9YAVlh9KUlz2YPdsEEhUhW+3LI0Q8CTab/dSN4a0QV5DS1bElpzh/13gKRuRnDNtCLtGg8jYQKBgQDm8jsZeWBPYDQUeZ5eZYziDm1WLOXTS1076grMOtWWeEWKwqwpWqNbmOIyJbppEEIyit2KuEUa+7IVGMyWyQoL2EQ+J/NGsJlwUZ9hXiDxS5T6Td5l+dMEZR65hrX7w11lsEu22LZ8G3NEtFwjNGpbrMhEer+ME7BfY6W0m83noQ==');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('d88e2b03-cab6-4c24-bc8b-0fb00f2b3584', '121fae5b-d3ef-45f8-8809-794c36aa4512', 'certificate', 'MIICrTCCAZUCBgF5RKm9czANBgkqhkiG9w0BAQsFADAaMRgwFgYDVQQDDA9maW5kbWUtcHJlZGlhbHgwHhcNMjEwNTA3MDIyOTA1WhcNMzEwNTA3MDIzMDQ1WjAaMRgwFgYDVQQDDA9maW5kbWUtcHJlZGlhbHgwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDHBER03yUeak6lDb8rVCp6pBO+Z7DmJjlSD/Dne+YTD/qq+dljg3xqsOAxDgqCqvN0KKA4vnthmO97n4L4FjAlF/TU81OqdADE4lMeL0J+vmnZPDn5VbeRYKoHh6kMRlCOzu7/Jub/bZDy3njRxqUhpd0Lx57Nk/Vw+eMGCg9o9oLRLKWMmSYiNgLGg2OIFqncm/ZhGEtJ2zODmH/lz5gaQpXhox6XsTUJ33bEcy5GSD6v5dFtgKsInrqAUXSWPIqbKj04G9ExKeD/P8o1x2GH9adtXyZqQp9psoWbQ6KEymJ6KQVPCGn2aZ2RluZqAJpqOkgQpNlvBXNzbHmRBMqNAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHaFl7YhEPakt7yuhIcO+gIprkGBZZeSffjTWeb2/CTm0ZrT2w1lcWYAEtwL6Us9P1bAT1aVC9Zo6T+5LejWN8Z1LI5yaBVJe9AwQ0TxeH8KDbUT3U4umVQgVnCpz8Jf9ge5vN7FsQRyUwikq8Yut2LrNlufL7UwvqoaGMsHiECsyD4YuEPoQu2FYhcDJpRp9+AuE5xoI3mBWjooX6m5o3rIMDp9PG/pa3drSv1TEUJpvIwJBrmZctersYSmaOwe192RMRnGQh+iQ0ywIw0tvsr2q+1vHDwMIuICTeQvR8VEeHyje4A5Hrv2+eqBL8XbJghPU3ET+MyCIsfUMKSQmDk=');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('c2937d21-9af1-48ca-8eea-e911e05d76b7', '121fae5b-d3ef-45f8-8809-794c36aa4512', 'priority', '100');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('4d2ba4bd-e3af-4a20-9fa5-b711f053bdb6', '4872d0cb-246e-4c61-b909-027bda16284d', 'host-sending-registration-request-must-match', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('a5c1d12c-b3cf-4f48-93a7-4872d54d99fe', '4872d0cb-246e-4c61-b909-027bda16284d', 'client-uris-must-match', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('ccc9d919-e463-457c-9860-932b2785aff1', '76ffcdd4-a0d8-4212-bc40-f1f7ff16dbcc', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('24954b50-53fc-4823-9bb9-f391ca49a53d', '76ffcdd4-a0d8-4212-bc40-f1f7ff16dbcc', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('0824c93e-3759-4e75-97e9-5533be1f675e', '76ffcdd4-a0d8-4212-bc40-f1f7ff16dbcc', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('2fadb887-fa11-41f8-ac67-ce5974665774', '76ffcdd4-a0d8-4212-bc40-f1f7ff16dbcc', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('67b0efd6-66e0-48e1-9f33-560a1d3e1026', '76ffcdd4-a0d8-4212-bc40-f1f7ff16dbcc', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('f6f98c01-b704-4850-800c-ae337ce9ea08', '76ffcdd4-a0d8-4212-bc40-f1f7ff16dbcc', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('825ae092-e3c4-474a-9e2e-5cc8aa106b76', '76ffcdd4-a0d8-4212-bc40-f1f7ff16dbcc', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('9c3f71ed-c17a-4fe8-9d44-47842b991a6b', '76ffcdd4-a0d8-4212-bc40-f1f7ff16dbcc', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('2f3d2c87-0ff1-481d-9188-ca30300a469c', 'cf25e096-95a3-40cd-b2a3-fad09e13ae57', 'max-clients', '200');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('e88d16fd-7706-46c9-830a-30039bdbfcbf', '92a1835d-0abd-4657-b6e1-0e655af1a51e', 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('806f56f0-971e-4cc6-bf41-29f8754e7453', '92a1835d-0abd-4657-b6e1-0e655af1a51e', 'allowed-protocol-mapper-types', 'saml-role-list-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('b79f435f-aa1f-45cf-8f68-e5e5f951cd2f', '92a1835d-0abd-4657-b6e1-0e655af1a51e', 'allowed-protocol-mapper-types', 'oidc-full-name-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('34c7baf4-ba91-4212-8398-e9fd48dd1983', '92a1835d-0abd-4657-b6e1-0e655af1a51e', 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('1eb4cbce-0190-4261-85c3-55464cb41679', '92a1835d-0abd-4657-b6e1-0e655af1a51e', 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('e597e31d-303e-48a1-8198-641ef6468929', '92a1835d-0abd-4657-b6e1-0e655af1a51e', 'allowed-protocol-mapper-types', 'oidc-address-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('a503d4b6-54b4-47a5-8c86-fdf98c170532', '92a1835d-0abd-4657-b6e1-0e655af1a51e', 'allowed-protocol-mapper-types', 'saml-user-property-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('b0c402d5-62a1-4bc7-a14a-9ff9e0f56f56', '92a1835d-0abd-4657-b6e1-0e655af1a51e', 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('46431bf2-4a58-47d0-b574-08e6fb758a4d', '2678004a-bef5-4ee7-a329-de19d2c77cca', 'allow-default-scopes', 'true');
INSERT INTO public.component_config (id, component_id, name, value) VALUES ('f5eb24d1-829f-4642-8c1a-190473aad0f8', 'b184171b-d5b2-4970-9db5-a24a27dcfc7e', 'allow-default-scopes', 'true');


--
-- TOC entry 3804 (class 0 OID 16431)
-- Dependencies: 207
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '125bb9c6-7022-4f40-b9ce-e6cd0f9d662c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'ca5082c8-78c5-499b-ba57-c0160c7f57da');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'c017721d-92ab-4e71-b72c-f05fe3dba251');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '14a37f1e-2e7d-429a-af2c-6b9275656a4e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'ac2f7551-859e-49c2-a6f0-ea6e75f44f0b');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '3c0c9fae-975b-4cfd-9a37-d952de528125');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'ed870aac-6472-4218-8505-b8817678b2c7');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'd902123d-d33a-440d-921f-c66cc6358df3');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'a9770230-62c6-4eef-a9ce-e38fde27db9a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'ac9e89e0-9a07-4602-a2aa-7516f1f62790');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'b1f37038-200d-44a1-ac31-2ae1cb09be50');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '03f909e4-b6b8-45f9-b1c2-cbfc4a14afca');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '859d7674-6fb8-457a-9090-a6ec48ce6bc2');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '26da895a-817c-4c5e-a219-b4c0d4f40ce4');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'f5d99f3a-fb5a-496d-b2ce-006729a86f22');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'fe8b6432-13cb-4bd2-9765-a2a0f806acae');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'd92ade04-c6bb-4592-b341-f185c54a5198');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '1ee0f276-98a8-4de1-bc63-2217570137fd');
INSERT INTO public.composite_role (composite, child_role) VALUES ('ac2f7551-859e-49c2-a6f0-ea6e75f44f0b', 'fe8b6432-13cb-4bd2-9765-a2a0f806acae');
INSERT INTO public.composite_role (composite, child_role) VALUES ('14a37f1e-2e7d-429a-af2c-6b9275656a4e', 'f5d99f3a-fb5a-496d-b2ce-006729a86f22');
INSERT INTO public.composite_role (composite, child_role) VALUES ('14a37f1e-2e7d-429a-af2c-6b9275656a4e', '1ee0f276-98a8-4de1-bc63-2217570137fd');
INSERT INTO public.composite_role (composite, child_role) VALUES ('ecb7351c-a889-4d85-b0d6-ef1b92cb0f0d', 'caa35a13-66e3-454c-83f3-49b98dc9689d');
INSERT INTO public.composite_role (composite, child_role) VALUES ('ecb7351c-a889-4d85-b0d6-ef1b92cb0f0d', '7ddd6674-cf40-4a85-8dbd-80e2bbd4511b');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7ddd6674-cf40-4a85-8dbd-80e2bbd4511b', '650bd664-847c-43a3-91da-18ceb8e92a4a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('1eb9e377-260b-4727-a331-b0f54e42eb16', '50759b52-ba93-46f1-9f34-52626fa4e6e1');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'b8ed23b9-69b0-4d80-bb15-9d034fa409ea');
INSERT INTO public.composite_role (composite, child_role) VALUES ('ecb7351c-a889-4d85-b0d6-ef1b92cb0f0d', 'adb8a2f9-7bc8-4517-b8bd-6621579a7b69');
INSERT INTO public.composite_role (composite, child_role) VALUES ('ecb7351c-a889-4d85-b0d6-ef1b92cb0f0d', '464f9b83-8a43-4633-ba02-144efbd1e00d');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'a699c120-f162-4f72-b2c3-ab6a54076cf3');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'edb50e6b-f848-453b-9df2-f9059fdd5c39');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '5178f735-be6a-491c-bdae-e2c04e6a4cd2');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '8ff258f7-9a04-478d-a5dd-f4843af82c74');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '1c8088a5-494c-40ed-bca1-6977098d3a38');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '78372280-9bf6-4147-8b32-8b077d611996');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '1441e6ca-ba23-44cf-bff0-758c14399ad4');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '08172add-32f6-4c05-a1ca-0f8c782a9cc2');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'd0cfb2f5-7399-44fd-897d-17258669f8b8');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'a92d9a41-34f3-4c76-9882-733506d8731a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'e6f6cdef-48bc-444c-b1f7-62b9d8609e1c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '440d62d4-abe8-49dd-a928-c748dd9caccd');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '8830f891-adbc-4c71-ad49-9bb5096f5b8b');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'db61561e-6fc9-4f7a-900b-4fbd34be049a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '7dc36b2e-388d-4088-8996-cee825c598db');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '6894fff3-21bc-4f32-bc65-bc0bfac1b0c4');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '1007a061-e854-4d83-8782-042f344cca00');
INSERT INTO public.composite_role (composite, child_role) VALUES ('8ff258f7-9a04-478d-a5dd-f4843af82c74', '7dc36b2e-388d-4088-8996-cee825c598db');
INSERT INTO public.composite_role (composite, child_role) VALUES ('5178f735-be6a-491c-bdae-e2c04e6a4cd2', 'db61561e-6fc9-4f7a-900b-4fbd34be049a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('5178f735-be6a-491c-bdae-e2c04e6a4cd2', '1007a061-e854-4d83-8782-042f344cca00');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', '1e630e32-980c-4e27-b8fe-3bb066724fb2');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', 'ae3cdf77-2a91-4aca-9092-c669f1d7c7cd');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', '2da373f5-617f-4c72-835c-cbdce97f2db8');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', 'd1f186fb-32d3-4665-8cdd-fd83f33e1e50');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', '437771a4-42bd-4d9f-a5ee-e9c5264fa7e3');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', '86e09c79-730d-4926-af09-05f305a10d34');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', '1c8d1deb-c446-4f99-92c1-b5e02b167087');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', '40c7eabe-c462-450d-91b3-2b6e35a207bb');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', '5a9e063d-4fe5-446e-a650-b24e28f8ad4e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', 'b9262690-8f03-4854-8d4f-cb42e6a48dee');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', '1ed21bcf-6e19-4951-a7b4-bc0d66fa3e55');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', 'a9e01c0b-3c30-49ab-bbb2-6e6d0b37d56c');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', '412d3d85-c5b9-4113-b3cd-a9f4b5f06be8');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', '578bcdd6-4c6f-4277-9402-2e6df50ea229');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', 'e217411a-1c71-4ead-bcac-ae44ff4e369e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', 'e1fff7c1-79d6-4ffe-90e9-bcd28ed08b42');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', '8b60df18-1004-464f-8c66-a34b8c88f077');
INSERT INTO public.composite_role (composite, child_role) VALUES ('d1f186fb-32d3-4665-8cdd-fd83f33e1e50', 'e217411a-1c71-4ead-bcac-ae44ff4e369e');
INSERT INTO public.composite_role (composite, child_role) VALUES ('2da373f5-617f-4c72-835c-cbdce97f2db8', '578bcdd6-4c6f-4277-9402-2e6df50ea229');
INSERT INTO public.composite_role (composite, child_role) VALUES ('2da373f5-617f-4c72-835c-cbdce97f2db8', '8b60df18-1004-464f-8c66-a34b8c88f077');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7d4c47c1-4fd6-410a-90d6-2cbfa58c0101', '0812b9c4-b7cf-4809-b5e3-87ec2f82a6d2');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7d4c47c1-4fd6-410a-90d6-2cbfa58c0101', '16c3eeec-835f-4ab4-a8da-ccbd1b40aa33');
INSERT INTO public.composite_role (composite, child_role) VALUES ('16c3eeec-835f-4ab4-a8da-ccbd1b40aa33', '12b1a0c9-093f-4e4d-928e-82a14021b2ef');
INSERT INTO public.composite_role (composite, child_role) VALUES ('b0e10fc6-6b77-480b-8051-9ebcb8cb69c7', 'ac4d0aaa-7cff-4e19-8b63-df04d92a9701');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'f68f9f6d-e00a-4453-9680-5c3a798b2ca1');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', 'fbed30f9-d8a4-4346-ad96-3e4ee1688733');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7d4c47c1-4fd6-410a-90d6-2cbfa58c0101', 'e6f437a8-97a5-4336-a3ad-81c705179a96');
INSERT INTO public.composite_role (composite, child_role) VALUES ('7d4c47c1-4fd6-410a-90d6-2cbfa58c0101', 'b08f91e9-dc6d-4796-a4d3-37bd58a549fa');
INSERT INTO public.composite_role (composite, child_role) VALUES ('6b451637-1bdc-4e9f-baa2-6663a0c122f3', '98f0af56-786f-4f6b-9928-3d1710313c2a');
INSERT INTO public.composite_role (composite, child_role) VALUES ('f2541986-e9a3-4384-9ee4-aecb1385c63f', 'c514c9db-6ac2-4070-a7b7-475b3c9d21af');
INSERT INTO public.composite_role (composite, child_role) VALUES ('9b313cc9-c45c-4c10-8929-af63c65e6407', '4a090b18-6c42-4dcb-bae7-e3fe00c4e578');


--
-- TOC entry 3805 (class 0 OID 16434)
-- Dependencies: 208
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) VALUES ('92cda386-39d5-44b7-9c90-440b40138088', NULL, 'password', '688388c5-80af-45d5-838a-3edf213b0eac', 1620354617511, NULL, '{"value":"JDOLGJHzP2XlYd39yLi9POQBapFIj8gBWtBNVylKYYpO2Bt0ibZrEygieqqwQq3GuDUMA9OxIFQCuQwvW/A3MQ==","salt":"fBpe4zzwhJuFnNM59lz1qQ==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);
INSERT INTO public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) VALUES ('f7640173-87f3-46f8-a611-e7dd0b003873', NULL, 'password', '9dde6744-a98d-4f17-8f0d-3830b493de4f', 1620357574594, NULL, '{"value":"9oUNEnkrEfNpFA2e9VOABlMAT1aGZl66rkl3jrrypejmxNfgm8pO6mogJu7JmMpC8VqDFP9Z3n0oraEAP4EAKw==","salt":"QZ6pgUMoLDzdNQfKBgTPQw==","additionalParameters":{}}', '{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}', 10);


--
-- TOC entry 3800 (class 0 OID 16401)
-- Dependencies: 203
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.0.0.Final.xml', '2021-05-07 02:30:04.739332', 1, 'EXECUTED', '7:4e70412f24a3f382c82183742ec79317', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.0.0.Final-KEYCLOAK-5461', 'sthorger@redhat.com', 'META-INF/db2-jpa-changelog-1.0.0.Final.xml', '2021-05-07 02:30:04.776189', 2, 'MARK_RAN', '7:cb16724583e9675711801c6875114f28', 'createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.1.0.Beta1', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Beta1.xml', '2021-05-07 02:30:04.927788', 3, 'EXECUTED', '7:0310eb8ba07cec616460794d42ade0fa', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.1.0.Final', 'sthorger@redhat.com', 'META-INF/jpa-changelog-1.1.0.Final.xml', '2021-05-07 02:30:04.933626', 4, 'EXECUTED', '7:5d25857e708c3233ef4439df1f93f012', 'renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/jpa-changelog-1.2.0.Beta1.xml', '2021-05-07 02:30:05.227643', 5, 'EXECUTED', '7:c7a54a1041d58eb3817a4a883b4d4e84', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.Beta1', 'psilva@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.Beta1.xml', '2021-05-07 02:30:05.231772', 6, 'MARK_RAN', '7:2e01012df20974c1c2a605ef8afe25b7', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.2.0.CR1.xml', '2021-05-07 02:30:05.441239', 7, 'EXECUTED', '7:0f08df48468428e0f30ee59a8ec01a41', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.RC1', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.2.0.CR1.xml', '2021-05-07 02:30:05.449343', 8, 'MARK_RAN', '7:a77ea2ad226b345e7d689d366f185c8c', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.2.0.Final', 'keycloak', 'META-INF/jpa-changelog-1.2.0.Final.xml', '2021-05-07 02:30:05.457771', 9, 'EXECUTED', '7:a3377a2059aefbf3b90ebb4c4cc8e2ab', 'update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.3.0.xml', '2021-05-07 02:30:05.795571', 10, 'EXECUTED', '7:04c1dbedc2aa3e9756d1a1668e003451', 'delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.4.0.xml', '2021-05-07 02:30:05.928049', 11, 'EXECUTED', '7:36ef39ed560ad07062d956db861042ba', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.4.0', 'bburke@redhat.com', 'META-INF/db2-jpa-changelog-1.4.0.xml', '2021-05-07 02:30:05.933189', 12, 'MARK_RAN', '7:d909180b2530479a716d3f9c9eaea3d7', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.5.0.xml', '2021-05-07 02:30:05.964066', 13, 'EXECUTED', '7:cf12b04b79bea5152f165eb41f3955f6', 'delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.6.1_from15', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-05-07 02:30:06.024184', 14, 'EXECUTED', '7:7e32c8f05c755e8675764e7d5f514509', 'addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.6.1_from16-pre', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-05-07 02:30:06.026906', 15, 'MARK_RAN', '7:980ba23cc0ec39cab731ce903dd01291', 'delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.6.1_from16', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-05-07 02:30:06.029058', 16, 'MARK_RAN', '7:2fa220758991285312eb84f3b4ff5336', 'dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.6.1', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.6.1.xml', '2021-05-07 02:30:06.030978', 17, 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.7.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-1.7.0.xml', '2021-05-07 02:30:06.139739', 18, 'EXECUTED', '7:91ace540896df890cc00a0490ee52bbc', 'createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.8.0.xml', '2021-05-07 02:30:06.257412', 19, 'EXECUTED', '7:c31d1646dfa2618a9335c00e07f89f24', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.8.0-2', 'keycloak', 'META-INF/jpa-changelog-1.8.0.xml', '2021-05-07 02:30:06.264985', 20, 'EXECUTED', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part1', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-05-07 02:30:08.630509', 45, 'EXECUTED', '7:6a48ce645a3525488a90fbf76adf3bb3', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.8.0', 'mposolda@redhat.com', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2021-05-07 02:30:06.267313', 21, 'MARK_RAN', '7:f987971fe6b37d963bc95fee2b27f8df', 'addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.8.0-2', 'keycloak', 'META-INF/db2-jpa-changelog-1.8.0.xml', '2021-05-07 02:30:06.277949', 22, 'MARK_RAN', '7:df8bc21027a4f7cbbb01f6344e89ce07', 'dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.9.0', 'mposolda@redhat.com', 'META-INF/jpa-changelog-1.9.0.xml', '2021-05-07 02:30:06.360779', 23, 'EXECUTED', '7:ed2dc7f799d19ac452cbcda56c929e47', 'update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.9.1', 'keycloak', 'META-INF/jpa-changelog-1.9.1.xml', '2021-05-07 02:30:06.365504', 24, 'EXECUTED', '7:80b5db88a5dda36ece5f235be8757615', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.9.1', 'keycloak', 'META-INF/db2-jpa-changelog-1.9.1.xml', '2021-05-07 02:30:06.367797', 25, 'MARK_RAN', '7:1437310ed1305a9b93f8848f301726ce', 'modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1.9.2', 'keycloak', 'META-INF/jpa-changelog-1.9.2.xml', '2021-05-07 02:30:06.635917', 26, 'EXECUTED', '7:b82ffb34850fa0836be16deefc6a87c4', 'createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-2.0.0', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.0.0.xml', '2021-05-07 02:30:06.885252', 27, 'EXECUTED', '7:9cc98082921330d8d9266decdd4bd658', 'createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-2.5.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-2.5.1.xml', '2021-05-07 02:30:06.891425', 28, 'EXECUTED', '7:03d64aeed9cb52b969bd30a7ac0db57e', 'update tableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.1.0-KEYCLOAK-5461', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.1.0.xml', '2021-05-07 02:30:07.152253', 29, 'EXECUTED', '7:f1f9fd8710399d725b780f463c6b21cd', 'createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.2.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.2.0.xml', '2021-05-07 02:30:07.191921', 30, 'EXECUTED', '7:53188c3eb1107546e6f765835705b6c1', 'addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.3.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.3.0.xml', '2021-05-07 02:30:07.230979', 31, 'EXECUTED', '7:d6e6f3bc57a0c5586737d1351725d4d4', 'createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.4.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.4.0.xml', '2021-05-07 02:30:07.235321', 32, 'EXECUTED', '7:454d604fbd755d9df3fd9c6329043aa5', 'customChange', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-05-07 02:30:07.241555', 33, 'EXECUTED', '7:57e98a3077e29caf562f7dbf80c72600', 'customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0-unicode-oracle', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-05-07 02:30:07.243693', 34, 'MARK_RAN', '7:e4c7e8f2256210aee71ddc42f538b57a', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0-unicode-other-dbs', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-05-07 02:30:07.302985', 35, 'EXECUTED', '7:09a43c97e49bc626460480aa1379b522', 'modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0-duplicate-email-support', 'slawomir@dabek.name', 'META-INF/jpa-changelog-2.5.0.xml', '2021-05-07 02:30:07.307931', 36, 'EXECUTED', '7:26bfc7c74fefa9126f2ce702fb775553', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.0-unique-group-names', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-2.5.0.xml', '2021-05-07 02:30:07.319227', 37, 'EXECUTED', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('2.5.1', 'bburke@redhat.com', 'META-INF/jpa-changelog-2.5.1.xml', '2021-05-07 02:30:07.324674', 38, 'EXECUTED', '7:37fc1781855ac5388c494f1442b3f717', 'addColumn tableName=FED_USER_CONSENT', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.0.0', 'bburke@redhat.com', 'META-INF/jpa-changelog-3.0.0.xml', '2021-05-07 02:30:07.328001', 39, 'EXECUTED', '7:13a27db0dae6049541136adad7261d27', 'addColumn tableName=IDENTITY_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.2.0-fix', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-05-07 02:30:07.330568', 40, 'MARK_RAN', '7:550300617e3b59e8af3a6294df8248a3', 'addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.2.0-fix-with-keycloak-5416', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-05-07 02:30:07.333116', 41, 'MARK_RAN', '7:e3a9482b8931481dc2772a5c07c44f17', 'dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.2.0-fix-offline-sessions', 'hmlnarik', 'META-INF/jpa-changelog-3.2.0.xml', '2021-05-07 02:30:07.339758', 42, 'EXECUTED', '7:72b07d85a2677cb257edb02b408f332d', 'customChange', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.2.0-fixed', 'keycloak', 'META-INF/jpa-changelog-3.2.0.xml', '2021-05-07 02:30:08.610095', 43, 'EXECUTED', '7:a72a7858967bd414835d19e04d880312', 'addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.3.0', 'keycloak', 'META-INF/jpa-changelog-3.3.0.xml', '2021-05-07 02:30:08.622024', 44, 'EXECUTED', '7:94edff7cf9ce179e7e85f0cd78a3cf2c', 'addColumn tableName=USER_ENTITY', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-05-07 02:30:08.636669', 46, 'EXECUTED', '7:e64b5dcea7db06077c6e57d3b9e5ca14', 'customChange', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-05-07 02:30:08.638733', 47, 'MARK_RAN', '7:fd8cf02498f8b1e72496a20afc75178c', 'dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-05-07 02:30:08.790615', 48, 'EXECUTED', '7:542794f25aa2b1fbabb7e577d6646319', 'addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authn-3.4.0.CR1-refresh-token-max-reuse', 'glavoie@gmail.com', 'META-INF/jpa-changelog-authz-3.4.0.CR1.xml', '2021-05-07 02:30:08.79741', 49, 'EXECUTED', '7:edad604c882df12f74941dac3cc6d650', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.0', 'keycloak', 'META-INF/jpa-changelog-3.4.0.xml', '2021-05-07 02:30:08.918909', 50, 'EXECUTED', '7:0f88b78b7b46480eb92690cbf5e44900', 'addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.0-KEYCLOAK-5230', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-3.4.0.xml', '2021-05-07 02:30:09.152573', 51, 'EXECUTED', '7:d560e43982611d936457c327f872dd59', 'createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.1', 'psilva@redhat.com', 'META-INF/jpa-changelog-3.4.1.xml', '2021-05-07 02:30:09.15716', 52, 'EXECUTED', '7:c155566c42b4d14ef07059ec3b3bbd8e', 'modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.2', 'keycloak', 'META-INF/jpa-changelog-3.4.2.xml', '2021-05-07 02:30:09.160347', 53, 'EXECUTED', '7:b40376581f12d70f3c89ba8ddf5b7dea', 'update tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('3.4.2-KEYCLOAK-5172', 'mkanis@redhat.com', 'META-INF/jpa-changelog-3.4.2.xml', '2021-05-07 02:30:09.163995', 54, 'EXECUTED', '7:a1132cc395f7b95b3646146c2e38f168', 'update tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.0.0-KEYCLOAK-6335', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-05-07 02:30:09.186212', 55, 'EXECUTED', '7:d8dc5d89c789105cfa7ca0e82cba60af', 'createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.0.0-CLEANUP-UNUSED-TABLE', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-05-07 02:30:09.20849', 56, 'EXECUTED', '7:7822e0165097182e8f653c35517656a3', 'dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.0.0-KEYCLOAK-6228', 'bburke@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-05-07 02:30:09.28814', 57, 'EXECUTED', '7:c6538c29b9c9a08f9e9ea2de5c2b6375', 'dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.0.0-KEYCLOAK-5579-fixed', 'mposolda@redhat.com', 'META-INF/jpa-changelog-4.0.0.xml', '2021-05-07 02:30:09.80242', 58, 'EXECUTED', '7:6d4893e36de22369cf73bcb051ded875', 'dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-4.0.0.CR1', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.CR1.xml', '2021-05-07 02:30:09.908901', 59, 'EXECUTED', '7:57960fc0b0f0dd0563ea6f8b2e4a1707', 'createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-4.0.0.Beta3', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-4.0.0.Beta3.xml', '2021-05-07 02:30:09.919998', 60, 'EXECUTED', '7:2b4b8bff39944c7097977cc18dbceb3b', 'addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-4.2.0.Final', 'mhajas@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2021-05-07 02:30:09.933807', 61, 'EXECUTED', '7:2aa42a964c59cd5b8ca9822340ba33a8', 'createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-4.2.0.Final-KEYCLOAK-9944', 'hmlnarik@redhat.com', 'META-INF/jpa-changelog-authz-4.2.0.Final.xml', '2021-05-07 02:30:09.94815', 62, 'EXECUTED', '7:9ac9e58545479929ba23f4a3087a0346', 'addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.2.0-KEYCLOAK-6313', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.2.0.xml', '2021-05-07 02:30:09.951131', 63, 'EXECUTED', '7:14d407c35bc4fe1976867756bcea0c36', 'addColumn tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.3.0-KEYCLOAK-7984', 'wadahiro@gmail.com', 'META-INF/jpa-changelog-4.3.0.xml', '2021-05-07 02:30:09.957406', 64, 'EXECUTED', '7:241a8030c748c8548e346adee548fa93', 'update tableName=REQUIRED_ACTION_PROVIDER', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.6.0-KEYCLOAK-7950', 'psilva@redhat.com', 'META-INF/jpa-changelog-4.6.0.xml', '2021-05-07 02:30:09.961655', 65, 'EXECUTED', '7:7d3182f65a34fcc61e8d23def037dc3f', 'update tableName=RESOURCE_SERVER_RESOURCE', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.6.0-KEYCLOAK-8377', 'keycloak', 'META-INF/jpa-changelog-4.6.0.xml', '2021-05-07 02:30:10.091288', 66, 'EXECUTED', '7:b30039e00a0b9715d430d1b0636728fa', 'createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.6.0-KEYCLOAK-8555', 'gideonray@gmail.com', 'META-INF/jpa-changelog-4.6.0.xml', '2021-05-07 02:30:10.126327', 67, 'EXECUTED', '7:3797315ca61d531780f8e6f82f258159', 'createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.7.0-KEYCLOAK-1267', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.7.0.xml', '2021-05-07 02:30:10.134836', 68, 'EXECUTED', '7:c7aa4c8d9573500c2d347c1941ff0301', 'addColumn tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.7.0-KEYCLOAK-7275', 'keycloak', 'META-INF/jpa-changelog-4.7.0.xml', '2021-05-07 02:30:10.275563', 69, 'EXECUTED', '7:b207faee394fc074a442ecd42185a5dd', 'renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('4.8.0-KEYCLOAK-8835', 'sguilhen@redhat.com', 'META-INF/jpa-changelog-4.8.0.xml', '2021-05-07 02:30:10.284539', 70, 'EXECUTED', '7:ab9a9762faaba4ddfa35514b212c4922', 'addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('authz-7.0.0-KEYCLOAK-10443', 'psilva@redhat.com', 'META-INF/jpa-changelog-authz-7.0.0.xml', '2021-05-07 02:30:10.295544', 71, 'EXECUTED', '7:b9710f74515a6ccb51b72dc0d19df8c4', 'addColumn tableName=RESOURCE_SERVER', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-adding-credential-columns', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-05-07 02:30:10.30424', 72, 'EXECUTED', '7:ec9707ae4d4f0b7452fee20128083879', 'addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-updating-credential-data-not-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-05-07 02:30:10.318944', 73, 'EXECUTED', '7:03b3f4b264c3c68ba082250a80b74216', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-updating-credential-data-oracle', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-05-07 02:30:10.322378', 74, 'MARK_RAN', '7:64c5728f5ca1f5aa4392217701c4fe23', 'update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-credential-cleanup-fixed', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-05-07 02:30:10.386184', 75, 'EXECUTED', '7:b48da8c11a3d83ddd6b7d0c8c2219345', 'dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('8.0.0-resource-tag-support', 'keycloak', 'META-INF/jpa-changelog-8.0.0.xml', '2021-05-07 02:30:10.411616', 76, 'EXECUTED', '7:a73379915c23bfad3e8f5c6d5c0aa4bd', 'addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.0-always-display-client', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-05-07 02:30:10.415401', 77, 'EXECUTED', '7:39e0073779aba192646291aa2332493d', 'addColumn tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.0-drop-constraints-for-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-05-07 02:30:10.417695', 78, 'MARK_RAN', '7:81f87368f00450799b4bf42ea0b3ec34', 'dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.0-increase-column-size-federated-fk', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-05-07 02:30:10.460893', 79, 'EXECUTED', '7:20b37422abb9fb6571c618148f013a15', 'modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.0-recreate-constraints-after-column-increase', 'keycloak', 'META-INF/jpa-changelog-9.0.0.xml', '2021-05-07 02:30:10.463596', 80, 'MARK_RAN', '7:1970bb6cfb5ee800736b95ad3fb3c78a', 'addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-add-index-to-client.client_id', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-05-07 02:30:10.492404', 81, 'EXECUTED', '7:45d9b25fc3b455d522d8dcc10a0f4c80', 'createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-KEYCLOAK-12579-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-05-07 02:30:10.496759', 82, 'MARK_RAN', '7:890ae73712bc187a66c2813a724d037f', 'dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-KEYCLOAK-12579-add-not-null-constraint', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-05-07 02:30:10.51217', 83, 'EXECUTED', '7:0a211980d27fafe3ff50d19a3a29b538', 'addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-KEYCLOAK-12579-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-05-07 02:30:10.514746', 84, 'MARK_RAN', '7:a161e2ae671a9020fff61e996a207377', 'addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('9.0.1-add-index-to-events', 'keycloak', 'META-INF/jpa-changelog-9.0.1.xml', '2021-05-07 02:30:10.540892', 85, 'EXECUTED', '7:01c49302201bdf815b0a18d1f98a55dc', 'createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-11.0.0.xml', '2021-05-07 02:30:10.549128', 86, 'EXECUTED', '7:3dace6b144c11f53f1ad2c0361279b86', 'dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('map-remove-ri', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2021-05-07 02:30:10.560263', 87, 'EXECUTED', '7:578d0b92077eaf2ab95ad0ec087aa903', 'dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('12.1.0-add-realm-localization-table', 'keycloak', 'META-INF/jpa-changelog-12.0.0.xml', '2021-05-07 02:30:10.587825', 88, 'EXECUTED', '7:c95abe90d962c57a09ecaee57972835d', 'createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('default-roles', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-05-07 02:30:10.596989', 89, 'EXECUTED', '7:f1313bcc2994a5c4dc1062ed6d8282d3', 'addColumn tableName=REALM; customChange', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('default-roles-cleanup', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-05-07 02:30:10.642445', 90, 'EXECUTED', '7:90d763b52eaffebefbcbde55f269508b', 'dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('13.0.0-KEYCLOAK-16844', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-05-07 02:30:10.665091', 91, 'EXECUTED', '7:d554f0cb92b764470dccfa5e0014a7dd', 'createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('map-remove-ri-13.0.0', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-05-07 02:30:10.672863', 92, 'EXECUTED', '7:73193e3ab3c35cf0f37ccea3bf783764', 'dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('13.0.0-KEYCLOAK-17992-drop-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-05-07 02:30:10.675094', 93, 'MARK_RAN', '7:90a1e74f92e9cbaa0c5eab80b8a037f3', 'dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('13.0.0-increase-column-size-federated', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-05-07 02:30:10.697937', 94, 'EXECUTED', '7:5b9248f29cd047c200083cc6d8388b16', 'modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('13.0.0-KEYCLOAK-17992-recreate-constraints', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-05-07 02:30:10.701928', 95, 'MARK_RAN', '7:64db59e44c374f13955489e8990d17a1', 'addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...', '', NULL, '3.5.4', NULL, NULL, '0354603889');
INSERT INTO public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('json-string-accomodation', 'keycloak', 'META-INF/jpa-changelog-13.0.0.xml', '2021-05-07 02:30:10.71231', 96, 'EXECUTED', '7:00e92c604b019717c8db9946ddc85af4', 'addColumn tableName=REALM_ATTRIBUTE; sql; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE', '', NULL, '3.5.4', NULL, NULL, '0354603889');


--
-- TOC entry 3799 (class 0 OID 16396)
-- Dependencies: 202
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.databasechangeloglock (id, locked, lockgranted, lockedby) VALUES (1, false, NULL, NULL);
INSERT INTO public.databasechangeloglock (id, locked, lockgranted, lockedby) VALUES (1000, false, NULL, NULL);
INSERT INTO public.databasechangeloglock (id, locked, lockgranted, lockedby) VALUES (1001, false, NULL, NULL);


--
-- TOC entry 3883 (class 0 OID 17850)
-- Dependencies: 286
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '6ac0433c-87f0-4b74-8205-6fccc2c9f1b8', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', 'af7c6c9a-717c-47f2-b227-0974a6309fbe', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '1f79846c-122c-4c84-8112-2c3ebf7807fc', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '528e0ff0-0f65-4682-87de-cd462015de1a', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '4ece53a1-cb1e-4e3d-a0ec-56cdd6d21c2e', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', 'b455332c-e764-4cc2-9653-e7d338b21870', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', '0b2c5cc7-47ec-4e14-b8ae-49bd9ce66467', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('master', 'f8678898-840a-4b1e-9c7c-b460bd64663e', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('findme-predialx', '91001054-9d9d-4441-8739-1dd22aea804f', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('findme-predialx', '5e040652-8e63-4e9b-80bf-12a0d8cbd1b8', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('findme-predialx', '7222d1e5-b1ac-400c-b352-2a95033c5745', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('findme-predialx', '4a587004-4a52-46d8-8433-9bea55c94792', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('findme-predialx', '7f2b9e3f-f62e-48a6-b96a-3485d7c14d62', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('findme-predialx', '30c44b8e-a7d6-478e-8a11-960b3558777d', false);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('findme-predialx', 'e0f294d6-d9c9-42fc-989e-9f28eaa35fdc', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('findme-predialx', '3497b98d-1588-4084-ab10-3c67cdae072d', true);
INSERT INTO public.default_client_scope (realm_id, scope_id, default_scope) VALUES ('findme-predialx', '0a6227fd-ab87-471c-942c-8b709c4bc86a', false);


--
-- TOC entry 3806 (class 0 OID 16440)
-- Dependencies: 209
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3871 (class 0 OID 17539)
-- Dependencies: 274
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3872 (class 0 OID 17545)
-- Dependencies: 275
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3885 (class 0 OID 17876)
-- Dependencies: 288
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3873 (class 0 OID 17554)
-- Dependencies: 276
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3874 (class 0 OID 17564)
-- Dependencies: 277
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3875 (class 0 OID 17567)
-- Dependencies: 278
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3876 (class 0 OID 17574)
-- Dependencies: 279
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3829 (class 0 OID 16834)
-- Dependencies: 232
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3879 (class 0 OID 17643)
-- Dependencies: 282
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3855 (class 0 OID 17253)
-- Dependencies: 258
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3854 (class 0 OID 17250)
-- Dependencies: 257
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3830 (class 0 OID 16840)
-- Dependencies: 233
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3831 (class 0 OID 16850)
-- Dependencies: 234
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3836 (class 0 OID 16956)
-- Dependencies: 239
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3837 (class 0 OID 16962)
-- Dependencies: 240
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3853 (class 0 OID 17247)
-- Dependencies: 256
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3807 (class 0 OID 16449)
-- Dependencies: 210
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ecb7351c-a889-4d85-b0d6-ef1b92cb0f0d', 'master', false, '${role_default-roles}', 'default-roles-master', 'master', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', 'master', false, '${role_admin}', 'admin', 'master', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('125bb9c6-7022-4f40-b9ce-e6cd0f9d662c', 'master', false, '${role_create-realm}', 'create-realm', 'master', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ca5082c8-78c5-499b-ba57-c0160c7f57da', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_create-client}', 'create-client', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('c017721d-92ab-4e71-b72c-f05fe3dba251', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_view-realm}', 'view-realm', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('14a37f1e-2e7d-429a-af2c-6b9275656a4e', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_view-users}', 'view-users', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ac2f7551-859e-49c2-a6f0-ea6e75f44f0b', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_view-clients}', 'view-clients', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('3c0c9fae-975b-4cfd-9a37-d952de528125', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_view-events}', 'view-events', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ed870aac-6472-4218-8505-b8817678b2c7', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('d902123d-d33a-440d-921f-c66cc6358df3', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_view-authorization}', 'view-authorization', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('a9770230-62c6-4eef-a9ce-e38fde27db9a', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_manage-realm}', 'manage-realm', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ac9e89e0-9a07-4602-a2aa-7516f1f62790', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_manage-users}', 'manage-users', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('b1f37038-200d-44a1-ac31-2ae1cb09be50', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_manage-clients}', 'manage-clients', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('03f909e4-b6b8-45f9-b1c2-cbfc4a14afca', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_manage-events}', 'manage-events', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('859d7674-6fb8-457a-9090-a6ec48ce6bc2', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('26da895a-817c-4c5e-a219-b4c0d4f40ce4', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_manage-authorization}', 'manage-authorization', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('f5d99f3a-fb5a-496d-b2ce-006729a86f22', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_query-users}', 'query-users', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('fe8b6432-13cb-4bd2-9765-a2a0f806acae', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_query-clients}', 'query-clients', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('d92ade04-c6bb-4592-b341-f185c54a5198', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_query-realms}', 'query-realms', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('1ee0f276-98a8-4de1-bc63-2217570137fd', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_query-groups}', 'query-groups', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('caa35a13-66e3-454c-83f3-49b98dc9689d', '0553ec4f-d2ac-4b97-a4a6-b2977833aec2', true, '${role_view-profile}', 'view-profile', 'master', '0553ec4f-d2ac-4b97-a4a6-b2977833aec2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('7ddd6674-cf40-4a85-8dbd-80e2bbd4511b', '0553ec4f-d2ac-4b97-a4a6-b2977833aec2', true, '${role_manage-account}', 'manage-account', 'master', '0553ec4f-d2ac-4b97-a4a6-b2977833aec2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('650bd664-847c-43a3-91da-18ceb8e92a4a', '0553ec4f-d2ac-4b97-a4a6-b2977833aec2', true, '${role_manage-account-links}', 'manage-account-links', 'master', '0553ec4f-d2ac-4b97-a4a6-b2977833aec2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('2c4cfe73-fa31-4883-aa03-11a0cf82089f', '0553ec4f-d2ac-4b97-a4a6-b2977833aec2', true, '${role_view-applications}', 'view-applications', 'master', '0553ec4f-d2ac-4b97-a4a6-b2977833aec2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('50759b52-ba93-46f1-9f34-52626fa4e6e1', '0553ec4f-d2ac-4b97-a4a6-b2977833aec2', true, '${role_view-consent}', 'view-consent', 'master', '0553ec4f-d2ac-4b97-a4a6-b2977833aec2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('1eb9e377-260b-4727-a331-b0f54e42eb16', '0553ec4f-d2ac-4b97-a4a6-b2977833aec2', true, '${role_manage-consent}', 'manage-consent', 'master', '0553ec4f-d2ac-4b97-a4a6-b2977833aec2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('3e17398d-e58d-467b-b527-113f3f2983c8', '0553ec4f-d2ac-4b97-a4a6-b2977833aec2', true, '${role_delete-account}', 'delete-account', 'master', '0553ec4f-d2ac-4b97-a4a6-b2977833aec2', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('a78f6027-b309-4392-8aa6-a68043367a21', 'c5a67170-22a2-49fc-8eee-6c8440dec364', true, '${role_read-token}', 'read-token', 'master', 'c5a67170-22a2-49fc-8eee-6c8440dec364', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('b8ed23b9-69b0-4d80-bb15-9d034fa409ea', '987bd059-aab4-490f-a517-c06a02e1b53d', true, '${role_impersonation}', 'impersonation', 'master', '987bd059-aab4-490f-a517-c06a02e1b53d', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('adb8a2f9-7bc8-4517-b8bd-6621579a7b69', 'master', false, '${role_offline-access}', 'offline_access', 'master', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('464f9b83-8a43-4633-ba02-144efbd1e00d', 'master', false, '${role_uma_authorization}', 'uma_authorization', 'master', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('7d4c47c1-4fd6-410a-90d6-2cbfa58c0101', 'findme-predialx', false, '${role_default-roles}', 'default-roles-findme-predialx', 'findme-predialx', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('a699c120-f162-4f72-b2c3-ab6a54076cf3', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_create-client}', 'create-client', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('edb50e6b-f848-453b-9df2-f9059fdd5c39', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_view-realm}', 'view-realm', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('5178f735-be6a-491c-bdae-e2c04e6a4cd2', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_view-users}', 'view-users', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('8ff258f7-9a04-478d-a5dd-f4843af82c74', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_view-clients}', 'view-clients', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('1c8088a5-494c-40ed-bca1-6977098d3a38', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_view-events}', 'view-events', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('78372280-9bf6-4147-8b32-8b077d611996', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_view-identity-providers}', 'view-identity-providers', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('1441e6ca-ba23-44cf-bff0-758c14399ad4', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_view-authorization}', 'view-authorization', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('08172add-32f6-4c05-a1ca-0f8c782a9cc2', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_manage-realm}', 'manage-realm', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('d0cfb2f5-7399-44fd-897d-17258669f8b8', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_manage-users}', 'manage-users', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('a92d9a41-34f3-4c76-9882-733506d8731a', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_manage-clients}', 'manage-clients', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('e6f6cdef-48bc-444c-b1f7-62b9d8609e1c', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_manage-events}', 'manage-events', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('440d62d4-abe8-49dd-a928-c748dd9caccd', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('8830f891-adbc-4c71-ad49-9bb5096f5b8b', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_manage-authorization}', 'manage-authorization', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('db61561e-6fc9-4f7a-900b-4fbd34be049a', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_query-users}', 'query-users', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('7dc36b2e-388d-4088-8996-cee825c598db', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_query-clients}', 'query-clients', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('6894fff3-21bc-4f32-bc65-bc0bfac1b0c4', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_query-realms}', 'query-realms', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('1007a061-e854-4d83-8782-042f344cca00', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_query-groups}', 'query-groups', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('7a9323a2-1d65-4b5c-95cd-f376509ee365', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_realm-admin}', 'realm-admin', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('1e630e32-980c-4e27-b8fe-3bb066724fb2', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_create-client}', 'create-client', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ae3cdf77-2a91-4aca-9092-c669f1d7c7cd', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_view-realm}', 'view-realm', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('2da373f5-617f-4c72-835c-cbdce97f2db8', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_view-users}', 'view-users', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('d1f186fb-32d3-4665-8cdd-fd83f33e1e50', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_view-clients}', 'view-clients', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('437771a4-42bd-4d9f-a5ee-e9c5264fa7e3', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_view-events}', 'view-events', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('86e09c79-730d-4926-af09-05f305a10d34', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_view-identity-providers}', 'view-identity-providers', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('1c8d1deb-c446-4f99-92c1-b5e02b167087', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_view-authorization}', 'view-authorization', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('40c7eabe-c462-450d-91b3-2b6e35a207bb', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_manage-realm}', 'manage-realm', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('5a9e063d-4fe5-446e-a650-b24e28f8ad4e', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_manage-users}', 'manage-users', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('b9262690-8f03-4854-8d4f-cb42e6a48dee', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_manage-clients}', 'manage-clients', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('1ed21bcf-6e19-4951-a7b4-bc0d66fa3e55', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_manage-events}', 'manage-events', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('a9e01c0b-3c30-49ab-bbb2-6e6d0b37d56c', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_manage-identity-providers}', 'manage-identity-providers', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('412d3d85-c5b9-4113-b3cd-a9f4b5f06be8', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_manage-authorization}', 'manage-authorization', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('578bcdd6-4c6f-4277-9402-2e6df50ea229', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_query-users}', 'query-users', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('e217411a-1c71-4ead-bcac-ae44ff4e369e', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_query-clients}', 'query-clients', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('e1fff7c1-79d6-4ffe-90e9-bcd28ed08b42', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_query-realms}', 'query-realms', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('8b60df18-1004-464f-8c66-a34b8c88f077', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_query-groups}', 'query-groups', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('0812b9c4-b7cf-4809-b5e3-87ec2f82a6d2', '5914aec0-a8ae-48fb-bef2-e3b2636a105b', true, '${role_view-profile}', 'view-profile', 'findme-predialx', '5914aec0-a8ae-48fb-bef2-e3b2636a105b', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('16c3eeec-835f-4ab4-a8da-ccbd1b40aa33', '5914aec0-a8ae-48fb-bef2-e3b2636a105b', true, '${role_manage-account}', 'manage-account', 'findme-predialx', '5914aec0-a8ae-48fb-bef2-e3b2636a105b', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('12b1a0c9-093f-4e4d-928e-82a14021b2ef', '5914aec0-a8ae-48fb-bef2-e3b2636a105b', true, '${role_manage-account-links}', 'manage-account-links', 'findme-predialx', '5914aec0-a8ae-48fb-bef2-e3b2636a105b', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('23cf3fe6-e312-4329-947c-42b73694c976', '5914aec0-a8ae-48fb-bef2-e3b2636a105b', true, '${role_view-applications}', 'view-applications', 'findme-predialx', '5914aec0-a8ae-48fb-bef2-e3b2636a105b', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('ac4d0aaa-7cff-4e19-8b63-df04d92a9701', '5914aec0-a8ae-48fb-bef2-e3b2636a105b', true, '${role_view-consent}', 'view-consent', 'findme-predialx', '5914aec0-a8ae-48fb-bef2-e3b2636a105b', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('b0e10fc6-6b77-480b-8051-9ebcb8cb69c7', '5914aec0-a8ae-48fb-bef2-e3b2636a105b', true, '${role_manage-consent}', 'manage-consent', 'findme-predialx', '5914aec0-a8ae-48fb-bef2-e3b2636a105b', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('87fcc4ac-0dd8-42f8-8d44-d7b674470278', '5914aec0-a8ae-48fb-bef2-e3b2636a105b', true, '${role_delete-account}', 'delete-account', 'findme-predialx', '5914aec0-a8ae-48fb-bef2-e3b2636a105b', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('f68f9f6d-e00a-4453-9680-5c3a798b2ca1', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', true, '${role_impersonation}', 'impersonation', 'master', 'be9b703b-ee56-4f23-b934-c1c72e2e662a', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('fbed30f9-d8a4-4346-ad96-3e4ee1688733', 'e78153ba-5513-4c47-8c82-66420e850466', true, '${role_impersonation}', 'impersonation', 'findme-predialx', 'e78153ba-5513-4c47-8c82-66420e850466', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('b4920882-3670-402e-ae34-68dcdbfddba0', '14d7923b-f8b9-4662-b5d5-a65acb732a77', true, '${role_read-token}', 'read-token', 'findme-predialx', '14d7923b-f8b9-4662-b5d5-a65acb732a77', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('e6f437a8-97a5-4336-a3ad-81c705179a96', 'findme-predialx', false, '${role_offline-access}', 'offline_access', 'findme-predialx', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('b08f91e9-dc6d-4796-a4d3-37bd58a549fa', 'findme-predialx', false, '${role_uma_authorization}', 'uma_authorization', 'findme-predialx', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('41a69148-9757-41ce-b5ed-ce3cd382a6f7', '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', true, NULL, 'uma_protection', 'findme-predialx', '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('98f0af56-786f-4f6b-9928-3d1710313c2a', '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', true, NULL, 'admin', 'findme-predialx', '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('c514c9db-6ac2-4070-a7b7-475b3c9d21af', '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', true, NULL, 'client', 'findme-predialx', '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('4a090b18-6c42-4dcb-bae7-e3fe00c4e578', '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', true, NULL, 'contributor', 'findme-predialx', '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('6b451637-1bdc-4e9f-baa2-6663a0c122f3', 'findme-predialx', false, NULL, 'admin', 'findme-predialx', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('f2541986-e9a3-4384-9ee4-aecb1385c63f', 'findme-predialx', false, NULL, 'client', 'findme-predialx', NULL, NULL);
INSERT INTO public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) VALUES ('9b313cc9-c45c-4c10-8929-af63c65e6407', 'findme-predialx', false, NULL, 'contributor', 'findme-predialx', NULL, NULL);


--
-- TOC entry 3835 (class 0 OID 16953)
-- Dependencies: 238
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.migration_model (id, version, update_time) VALUES ('kndbc', '13.0.0', 1620354615);


--
-- TOC entry 3852 (class 0 OID 17237)
-- Dependencies: 255
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3851 (class 0 OID 17231)
-- Dependencies: 254
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3865 (class 0 OID 17460)
-- Dependencies: 268
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.policy_config (policy_id, name, value) VALUES ('7f48b1a2-f599-41e3-8df8-91221aa9d51e', 'code', '// by default, grants any permission associated with this policy
$evaluation.grant();
');
INSERT INTO public.policy_config (policy_id, name, value) VALUES ('5032591a-54a6-416c-8c57-cd78828cc7b0', 'defaultResourceType', 'urn:backend:resources:default');


--
-- TOC entry 3827 (class 0 OID 16821)
-- Dependencies: 230
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('3ce8bb36-fa23-4dba-bb58-2d8496fb2fb4', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '90aaaa5d-55b8-487a-846e-8482d2673b5c', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('415cb21a-e6d9-4a96-8df0-880b8cffceb8', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'd2c1a4c3-b48f-40fd-96fe-80d273959195', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('80970837-d631-4a95-bdc4-8f143bbbe534', 'role list', 'saml', 'saml-role-list-mapper', NULL, 'af7c6c9a-717c-47f2-b227-0974a6309fbe');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('dc68eeff-3a4e-42c7-9d4a-b124e9f76a79', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('fffedefd-f417-4391-b3c0-a599facbb3dd', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('c3f8e257-adaa-408f-9320-1dfa8726b61e', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('c630f972-a3a5-460a-94a1-bafe865e8093', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('855e6621-d05e-443c-8bcc-2e52881a5c37', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('64795d5b-13a2-4228-a081-e07cd4745b87', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('d45e13d3-701a-49f3-8cf8-5befb0ec8b87', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('3e64e787-bb53-4ab0-ae91-c9dde8e79dca', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('0ae871da-6c6e-40db-b442-818cf2dc04b6', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('1d2076e5-e0a6-4b0b-bd1b-ee346a4a49e3', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('2bfeebb4-c6e4-4b77-a434-94901d47c149', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('fb643b4e-2cc7-4707-9cd7-838531b719ea', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('463d758e-d9db-4fe5-aff4-4c5ba9f40a0c', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('8a0c6944-db54-426e-9380-0ce98d86f90d', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '1ab8bd8f-8dd3-412f-8fad-eabfbd0608f1');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('350588a7-6bf5-416e-b754-75dc2dd0d489', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1f79846c-122c-4c84-8112-2c3ebf7807fc');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('4eec7251-4d1d-4b15-99cb-356a32cfafa5', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '1f79846c-122c-4c84-8112-2c3ebf7807fc');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('2d404702-14b3-43a8-a76e-fccba8e86561', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '528e0ff0-0f65-4682-87de-cd462015de1a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('c3d5930a-b43b-4be2-a3f3-850faeb445a2', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '4ece53a1-cb1e-4e3d-a0ec-56cdd6d21c2e');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('627b8c40-832c-48ab-9de3-812ce134aaeb', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '4ece53a1-cb1e-4e3d-a0ec-56cdd6d21c2e');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('1f0b52a6-1d1a-4e7c-aa74-db46150349f3', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'b455332c-e764-4cc2-9653-e7d338b21870');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('5fb0879f-c80b-4bbd-b415-29a09e33dad5', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'b455332c-e764-4cc2-9653-e7d338b21870');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('dbd1776e-12a5-4975-bc4a-e06dae7aca10', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, 'b455332c-e764-4cc2-9653-e7d338b21870');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('f16f0254-bfb9-413b-957c-cae683f54ab3', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '0b2c5cc7-47ec-4e14-b8ae-49bd9ce66467');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('750b652a-1e4a-46d1-939f-5195f803ec65', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, 'f8678898-840a-4b1e-9c7c-b460bd64663e');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('0ea4e524-e9a6-4426-ad3f-f32e1e953887', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'f8678898-840a-4b1e-9c7c-b460bd64663e');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('794ef196-c5e0-4130-940f-d797f0c831c4', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', '6572894e-01ba-49f6-8f01-791c9c5742e3', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('1ebf5541-0a3b-44e3-84ee-3d0800a8f4b7', 'role list', 'saml', 'saml-role-list-mapper', NULL, '5e040652-8e63-4e9b-80bf-12a0d8cbd1b8');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('4f31865c-909b-4874-8e6e-f22f6f34b635', 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, '7222d1e5-b1ac-400c-b352-2a95033c5745');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('46b74ec3-02d8-4d14-b5d0-2cd39616ad82', 'family name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '7222d1e5-b1ac-400c-b352-2a95033c5745');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('7e0a1d32-1cb5-4de0-8b7b-7b161b703329', 'given name', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '7222d1e5-b1ac-400c-b352-2a95033c5745');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('29d13b99-ca51-4d18-bc81-072ae7868621', 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '7222d1e5-b1ac-400c-b352-2a95033c5745');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('249ea1fa-12c3-493c-8d2c-6d38193082d5', 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '7222d1e5-b1ac-400c-b352-2a95033c5745');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('94d6ab6a-ab30-4224-b6eb-ad188a05f2fc', 'username', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '7222d1e5-b1ac-400c-b352-2a95033c5745');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('50bdfb78-cedb-4218-a776-03a473b4d035', 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '7222d1e5-b1ac-400c-b352-2a95033c5745');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('cb617f37-46dc-4c1e-94bc-ad3338019c09', 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '7222d1e5-b1ac-400c-b352-2a95033c5745');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('06d3d1eb-e710-4df8-bd8b-6e009e40fb8d', 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '7222d1e5-b1ac-400c-b352-2a95033c5745');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('a9236d7e-5372-4fc0-b905-bcc4057d0f23', 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '7222d1e5-b1ac-400c-b352-2a95033c5745');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('47d7c5b9-2d1d-4c24-b1f5-9af2960ec5b8', 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '7222d1e5-b1ac-400c-b352-2a95033c5745');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('9ad6eac4-9a4f-43f6-b931-7a77a005c698', 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '7222d1e5-b1ac-400c-b352-2a95033c5745');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('8cc9e027-11f7-4099-bcfe-7886d8ba2540', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '7222d1e5-b1ac-400c-b352-2a95033c5745');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('36cd35f3-8d5a-4fcf-b7a2-33b83d00d21f', 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '7222d1e5-b1ac-400c-b352-2a95033c5745');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('099636be-f6ba-440c-99b9-8ac1751b6b85', 'email', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '4a587004-4a52-46d8-8433-9bea55c94792');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('8cc35105-1054-4e49-857e-3cdcdd48d5fe', 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '4a587004-4a52-46d8-8433-9bea55c94792');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('189872c2-1c33-4a69-970c-748bd8ebec37', 'address', 'openid-connect', 'oidc-address-mapper', NULL, '7f2b9e3f-f62e-48a6-b96a-3485d7c14d62');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('bc070139-7c42-4278-aaf6-751f27be1aa3', 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '30c44b8e-a7d6-478e-8a11-960b3558777d');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('4842cea7-6659-487d-a42f-d6135f63446b', 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, '30c44b8e-a7d6-478e-8a11-960b3558777d');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('f16f1dd3-3ef4-40d3-9bb9-99c13faaae4a', 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, 'e0f294d6-d9c9-42fc-989e-9f28eaa35fdc');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('5a1a3e49-fd2d-42be-a579-4b48770637f5', 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, 'e0f294d6-d9c9-42fc-989e-9f28eaa35fdc');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('f60bb847-9466-4ab4-946f-5cd21bf32467', 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, 'e0f294d6-d9c9-42fc-989e-9f28eaa35fdc');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('ff903a33-c040-4b6a-ba22-25d8172f40fe', 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, '3497b98d-1588-4084-ab10-3c67cdae072d');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('110f072e-caf9-4acc-84b1-514ebd44f2a5', 'upn', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, '0a6227fd-ab87-471c-942c-8b709c4bc86a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('7d688013-ca1e-47f6-b962-c7d3ee065cc4', 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, '0a6227fd-ab87-471c-942c-8b709c4bc86a');
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('8f6b4350-6e4f-40bc-8194-098b10263991', 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', 'c7ed64ca-5b00-46cf-af5f-d318ca900d9f', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('c95d2af2-c8e0-4c79-ad98-fe63a9a231bf', 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('297c1a01-016b-4b06-88a2-1e3d7f868d33', 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', NULL);
INSERT INTO public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) VALUES ('b9a68053-586b-47d8-9407-a03007bdacd9', 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', NULL);


--
-- TOC entry 3828 (class 0 OID 16828)
-- Dependencies: 231
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('415cb21a-e6d9-4a96-8df0-880b8cffceb8', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('415cb21a-e6d9-4a96-8df0-880b8cffceb8', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('415cb21a-e6d9-4a96-8df0-880b8cffceb8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('415cb21a-e6d9-4a96-8df0-880b8cffceb8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('415cb21a-e6d9-4a96-8df0-880b8cffceb8', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('415cb21a-e6d9-4a96-8df0-880b8cffceb8', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('80970837-d631-4a95-bdc4-8f143bbbe534', 'false', 'single');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('80970837-d631-4a95-bdc4-8f143bbbe534', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('80970837-d631-4a95-bdc4-8f143bbbe534', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('dc68eeff-3a4e-42c7-9d4a-b124e9f76a79', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('dc68eeff-3a4e-42c7-9d4a-b124e9f76a79', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('dc68eeff-3a4e-42c7-9d4a-b124e9f76a79', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('fffedefd-f417-4391-b3c0-a599facbb3dd', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('fffedefd-f417-4391-b3c0-a599facbb3dd', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('fffedefd-f417-4391-b3c0-a599facbb3dd', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('fffedefd-f417-4391-b3c0-a599facbb3dd', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('fffedefd-f417-4391-b3c0-a599facbb3dd', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('fffedefd-f417-4391-b3c0-a599facbb3dd', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3f8e257-adaa-408f-9320-1dfa8726b61e', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3f8e257-adaa-408f-9320-1dfa8726b61e', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3f8e257-adaa-408f-9320-1dfa8726b61e', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3f8e257-adaa-408f-9320-1dfa8726b61e', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3f8e257-adaa-408f-9320-1dfa8726b61e', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3f8e257-adaa-408f-9320-1dfa8726b61e', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c630f972-a3a5-460a-94a1-bafe865e8093', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c630f972-a3a5-460a-94a1-bafe865e8093', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c630f972-a3a5-460a-94a1-bafe865e8093', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c630f972-a3a5-460a-94a1-bafe865e8093', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c630f972-a3a5-460a-94a1-bafe865e8093', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c630f972-a3a5-460a-94a1-bafe865e8093', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('855e6621-d05e-443c-8bcc-2e52881a5c37', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('855e6621-d05e-443c-8bcc-2e52881a5c37', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('855e6621-d05e-443c-8bcc-2e52881a5c37', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('855e6621-d05e-443c-8bcc-2e52881a5c37', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('855e6621-d05e-443c-8bcc-2e52881a5c37', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('855e6621-d05e-443c-8bcc-2e52881a5c37', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('64795d5b-13a2-4228-a081-e07cd4745b87', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('64795d5b-13a2-4228-a081-e07cd4745b87', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('64795d5b-13a2-4228-a081-e07cd4745b87', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('64795d5b-13a2-4228-a081-e07cd4745b87', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('64795d5b-13a2-4228-a081-e07cd4745b87', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('64795d5b-13a2-4228-a081-e07cd4745b87', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('d45e13d3-701a-49f3-8cf8-5befb0ec8b87', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('d45e13d3-701a-49f3-8cf8-5befb0ec8b87', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('d45e13d3-701a-49f3-8cf8-5befb0ec8b87', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('d45e13d3-701a-49f3-8cf8-5befb0ec8b87', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('d45e13d3-701a-49f3-8cf8-5befb0ec8b87', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('d45e13d3-701a-49f3-8cf8-5befb0ec8b87', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3e64e787-bb53-4ab0-ae91-c9dde8e79dca', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3e64e787-bb53-4ab0-ae91-c9dde8e79dca', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3e64e787-bb53-4ab0-ae91-c9dde8e79dca', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3e64e787-bb53-4ab0-ae91-c9dde8e79dca', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3e64e787-bb53-4ab0-ae91-c9dde8e79dca', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('3e64e787-bb53-4ab0-ae91-c9dde8e79dca', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0ae871da-6c6e-40db-b442-818cf2dc04b6', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0ae871da-6c6e-40db-b442-818cf2dc04b6', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0ae871da-6c6e-40db-b442-818cf2dc04b6', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0ae871da-6c6e-40db-b442-818cf2dc04b6', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0ae871da-6c6e-40db-b442-818cf2dc04b6', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0ae871da-6c6e-40db-b442-818cf2dc04b6', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1d2076e5-e0a6-4b0b-bd1b-ee346a4a49e3', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1d2076e5-e0a6-4b0b-bd1b-ee346a4a49e3', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1d2076e5-e0a6-4b0b-bd1b-ee346a4a49e3', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1d2076e5-e0a6-4b0b-bd1b-ee346a4a49e3', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1d2076e5-e0a6-4b0b-bd1b-ee346a4a49e3', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1d2076e5-e0a6-4b0b-bd1b-ee346a4a49e3', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2bfeebb4-c6e4-4b77-a434-94901d47c149', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2bfeebb4-c6e4-4b77-a434-94901d47c149', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2bfeebb4-c6e4-4b77-a434-94901d47c149', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2bfeebb4-c6e4-4b77-a434-94901d47c149', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2bfeebb4-c6e4-4b77-a434-94901d47c149', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2bfeebb4-c6e4-4b77-a434-94901d47c149', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('fb643b4e-2cc7-4707-9cd7-838531b719ea', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('fb643b4e-2cc7-4707-9cd7-838531b719ea', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('fb643b4e-2cc7-4707-9cd7-838531b719ea', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('fb643b4e-2cc7-4707-9cd7-838531b719ea', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('fb643b4e-2cc7-4707-9cd7-838531b719ea', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('fb643b4e-2cc7-4707-9cd7-838531b719ea', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('463d758e-d9db-4fe5-aff4-4c5ba9f40a0c', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('463d758e-d9db-4fe5-aff4-4c5ba9f40a0c', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('463d758e-d9db-4fe5-aff4-4c5ba9f40a0c', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('463d758e-d9db-4fe5-aff4-4c5ba9f40a0c', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('463d758e-d9db-4fe5-aff4-4c5ba9f40a0c', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('463d758e-d9db-4fe5-aff4-4c5ba9f40a0c', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8a0c6944-db54-426e-9380-0ce98d86f90d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8a0c6944-db54-426e-9380-0ce98d86f90d', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8a0c6944-db54-426e-9380-0ce98d86f90d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8a0c6944-db54-426e-9380-0ce98d86f90d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8a0c6944-db54-426e-9380-0ce98d86f90d', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8a0c6944-db54-426e-9380-0ce98d86f90d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('350588a7-6bf5-416e-b754-75dc2dd0d489', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('350588a7-6bf5-416e-b754-75dc2dd0d489', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('350588a7-6bf5-416e-b754-75dc2dd0d489', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('350588a7-6bf5-416e-b754-75dc2dd0d489', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('350588a7-6bf5-416e-b754-75dc2dd0d489', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('350588a7-6bf5-416e-b754-75dc2dd0d489', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4eec7251-4d1d-4b15-99cb-356a32cfafa5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4eec7251-4d1d-4b15-99cb-356a32cfafa5', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4eec7251-4d1d-4b15-99cb-356a32cfafa5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4eec7251-4d1d-4b15-99cb-356a32cfafa5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4eec7251-4d1d-4b15-99cb-356a32cfafa5', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4eec7251-4d1d-4b15-99cb-356a32cfafa5', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d404702-14b3-43a8-a76e-fccba8e86561', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d404702-14b3-43a8-a76e-fccba8e86561', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d404702-14b3-43a8-a76e-fccba8e86561', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d404702-14b3-43a8-a76e-fccba8e86561', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d404702-14b3-43a8-a76e-fccba8e86561', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d404702-14b3-43a8-a76e-fccba8e86561', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d404702-14b3-43a8-a76e-fccba8e86561', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d404702-14b3-43a8-a76e-fccba8e86561', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('2d404702-14b3-43a8-a76e-fccba8e86561', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3d5930a-b43b-4be2-a3f3-850faeb445a2', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3d5930a-b43b-4be2-a3f3-850faeb445a2', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3d5930a-b43b-4be2-a3f3-850faeb445a2', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3d5930a-b43b-4be2-a3f3-850faeb445a2', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3d5930a-b43b-4be2-a3f3-850faeb445a2', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c3d5930a-b43b-4be2-a3f3-850faeb445a2', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('627b8c40-832c-48ab-9de3-812ce134aaeb', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('627b8c40-832c-48ab-9de3-812ce134aaeb', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('627b8c40-832c-48ab-9de3-812ce134aaeb', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('627b8c40-832c-48ab-9de3-812ce134aaeb', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('627b8c40-832c-48ab-9de3-812ce134aaeb', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('627b8c40-832c-48ab-9de3-812ce134aaeb', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1f0b52a6-1d1a-4e7c-aa74-db46150349f3', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1f0b52a6-1d1a-4e7c-aa74-db46150349f3', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1f0b52a6-1d1a-4e7c-aa74-db46150349f3', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1f0b52a6-1d1a-4e7c-aa74-db46150349f3', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1f0b52a6-1d1a-4e7c-aa74-db46150349f3', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5fb0879f-c80b-4bbd-b415-29a09e33dad5', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5fb0879f-c80b-4bbd-b415-29a09e33dad5', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5fb0879f-c80b-4bbd-b415-29a09e33dad5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5fb0879f-c80b-4bbd-b415-29a09e33dad5', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5fb0879f-c80b-4bbd-b415-29a09e33dad5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('750b652a-1e4a-46d1-939f-5195f803ec65', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('750b652a-1e4a-46d1-939f-5195f803ec65', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('750b652a-1e4a-46d1-939f-5195f803ec65', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('750b652a-1e4a-46d1-939f-5195f803ec65', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('750b652a-1e4a-46d1-939f-5195f803ec65', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('750b652a-1e4a-46d1-939f-5195f803ec65', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0ea4e524-e9a6-4426-ad3f-f32e1e953887', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0ea4e524-e9a6-4426-ad3f-f32e1e953887', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0ea4e524-e9a6-4426-ad3f-f32e1e953887', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0ea4e524-e9a6-4426-ad3f-f32e1e953887', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0ea4e524-e9a6-4426-ad3f-f32e1e953887', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('0ea4e524-e9a6-4426-ad3f-f32e1e953887', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1ebf5541-0a3b-44e3-84ee-3d0800a8f4b7', 'false', 'single');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1ebf5541-0a3b-44e3-84ee-3d0800a8f4b7', 'Basic', 'attribute.nameformat');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('1ebf5541-0a3b-44e3-84ee-3d0800a8f4b7', 'Role', 'attribute.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4f31865c-909b-4874-8e6e-f22f6f34b635', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4f31865c-909b-4874-8e6e-f22f6f34b635', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4f31865c-909b-4874-8e6e-f22f6f34b635', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('46b74ec3-02d8-4d14-b5d0-2cd39616ad82', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('46b74ec3-02d8-4d14-b5d0-2cd39616ad82', 'lastName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('46b74ec3-02d8-4d14-b5d0-2cd39616ad82', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('46b74ec3-02d8-4d14-b5d0-2cd39616ad82', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('46b74ec3-02d8-4d14-b5d0-2cd39616ad82', 'family_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('46b74ec3-02d8-4d14-b5d0-2cd39616ad82', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7e0a1d32-1cb5-4de0-8b7b-7b161b703329', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7e0a1d32-1cb5-4de0-8b7b-7b161b703329', 'firstName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7e0a1d32-1cb5-4de0-8b7b-7b161b703329', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7e0a1d32-1cb5-4de0-8b7b-7b161b703329', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7e0a1d32-1cb5-4de0-8b7b-7b161b703329', 'given_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7e0a1d32-1cb5-4de0-8b7b-7b161b703329', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('29d13b99-ca51-4d18-bc81-072ae7868621', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('29d13b99-ca51-4d18-bc81-072ae7868621', 'middleName', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('29d13b99-ca51-4d18-bc81-072ae7868621', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('29d13b99-ca51-4d18-bc81-072ae7868621', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('29d13b99-ca51-4d18-bc81-072ae7868621', 'middle_name', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('29d13b99-ca51-4d18-bc81-072ae7868621', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('249ea1fa-12c3-493c-8d2c-6d38193082d5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('249ea1fa-12c3-493c-8d2c-6d38193082d5', 'nickname', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('249ea1fa-12c3-493c-8d2c-6d38193082d5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('249ea1fa-12c3-493c-8d2c-6d38193082d5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('249ea1fa-12c3-493c-8d2c-6d38193082d5', 'nickname', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('249ea1fa-12c3-493c-8d2c-6d38193082d5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('94d6ab6a-ab30-4224-b6eb-ad188a05f2fc', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('94d6ab6a-ab30-4224-b6eb-ad188a05f2fc', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('94d6ab6a-ab30-4224-b6eb-ad188a05f2fc', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('94d6ab6a-ab30-4224-b6eb-ad188a05f2fc', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('94d6ab6a-ab30-4224-b6eb-ad188a05f2fc', 'preferred_username', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('94d6ab6a-ab30-4224-b6eb-ad188a05f2fc', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('50bdfb78-cedb-4218-a776-03a473b4d035', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('50bdfb78-cedb-4218-a776-03a473b4d035', 'profile', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('50bdfb78-cedb-4218-a776-03a473b4d035', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('50bdfb78-cedb-4218-a776-03a473b4d035', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('50bdfb78-cedb-4218-a776-03a473b4d035', 'profile', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('50bdfb78-cedb-4218-a776-03a473b4d035', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('cb617f37-46dc-4c1e-94bc-ad3338019c09', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('cb617f37-46dc-4c1e-94bc-ad3338019c09', 'picture', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('cb617f37-46dc-4c1e-94bc-ad3338019c09', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('cb617f37-46dc-4c1e-94bc-ad3338019c09', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('cb617f37-46dc-4c1e-94bc-ad3338019c09', 'picture', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('cb617f37-46dc-4c1e-94bc-ad3338019c09', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('06d3d1eb-e710-4df8-bd8b-6e009e40fb8d', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('06d3d1eb-e710-4df8-bd8b-6e009e40fb8d', 'website', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('06d3d1eb-e710-4df8-bd8b-6e009e40fb8d', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('06d3d1eb-e710-4df8-bd8b-6e009e40fb8d', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('06d3d1eb-e710-4df8-bd8b-6e009e40fb8d', 'website', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('06d3d1eb-e710-4df8-bd8b-6e009e40fb8d', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a9236d7e-5372-4fc0-b905-bcc4057d0f23', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a9236d7e-5372-4fc0-b905-bcc4057d0f23', 'gender', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a9236d7e-5372-4fc0-b905-bcc4057d0f23', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a9236d7e-5372-4fc0-b905-bcc4057d0f23', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a9236d7e-5372-4fc0-b905-bcc4057d0f23', 'gender', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('a9236d7e-5372-4fc0-b905-bcc4057d0f23', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('47d7c5b9-2d1d-4c24-b1f5-9af2960ec5b8', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('47d7c5b9-2d1d-4c24-b1f5-9af2960ec5b8', 'birthdate', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('47d7c5b9-2d1d-4c24-b1f5-9af2960ec5b8', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('47d7c5b9-2d1d-4c24-b1f5-9af2960ec5b8', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('47d7c5b9-2d1d-4c24-b1f5-9af2960ec5b8', 'birthdate', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('47d7c5b9-2d1d-4c24-b1f5-9af2960ec5b8', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('9ad6eac4-9a4f-43f6-b931-7a77a005c698', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('9ad6eac4-9a4f-43f6-b931-7a77a005c698', 'zoneinfo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('9ad6eac4-9a4f-43f6-b931-7a77a005c698', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('9ad6eac4-9a4f-43f6-b931-7a77a005c698', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('9ad6eac4-9a4f-43f6-b931-7a77a005c698', 'zoneinfo', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('9ad6eac4-9a4f-43f6-b931-7a77a005c698', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8cc9e027-11f7-4099-bcfe-7886d8ba2540', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8cc9e027-11f7-4099-bcfe-7886d8ba2540', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8cc9e027-11f7-4099-bcfe-7886d8ba2540', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8cc9e027-11f7-4099-bcfe-7886d8ba2540', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8cc9e027-11f7-4099-bcfe-7886d8ba2540', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8cc9e027-11f7-4099-bcfe-7886d8ba2540', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('36cd35f3-8d5a-4fcf-b7a2-33b83d00d21f', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('36cd35f3-8d5a-4fcf-b7a2-33b83d00d21f', 'updatedAt', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('36cd35f3-8d5a-4fcf-b7a2-33b83d00d21f', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('36cd35f3-8d5a-4fcf-b7a2-33b83d00d21f', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('36cd35f3-8d5a-4fcf-b7a2-33b83d00d21f', 'updated_at', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('36cd35f3-8d5a-4fcf-b7a2-33b83d00d21f', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('099636be-f6ba-440c-99b9-8ac1751b6b85', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('099636be-f6ba-440c-99b9-8ac1751b6b85', 'email', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('099636be-f6ba-440c-99b9-8ac1751b6b85', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('099636be-f6ba-440c-99b9-8ac1751b6b85', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('099636be-f6ba-440c-99b9-8ac1751b6b85', 'email', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('099636be-f6ba-440c-99b9-8ac1751b6b85', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8cc35105-1054-4e49-857e-3cdcdd48d5fe', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8cc35105-1054-4e49-857e-3cdcdd48d5fe', 'emailVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8cc35105-1054-4e49-857e-3cdcdd48d5fe', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8cc35105-1054-4e49-857e-3cdcdd48d5fe', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8cc35105-1054-4e49-857e-3cdcdd48d5fe', 'email_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8cc35105-1054-4e49-857e-3cdcdd48d5fe', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('189872c2-1c33-4a69-970c-748bd8ebec37', 'formatted', 'user.attribute.formatted');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('189872c2-1c33-4a69-970c-748bd8ebec37', 'country', 'user.attribute.country');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('189872c2-1c33-4a69-970c-748bd8ebec37', 'postal_code', 'user.attribute.postal_code');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('189872c2-1c33-4a69-970c-748bd8ebec37', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('189872c2-1c33-4a69-970c-748bd8ebec37', 'street', 'user.attribute.street');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('189872c2-1c33-4a69-970c-748bd8ebec37', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('189872c2-1c33-4a69-970c-748bd8ebec37', 'region', 'user.attribute.region');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('189872c2-1c33-4a69-970c-748bd8ebec37', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('189872c2-1c33-4a69-970c-748bd8ebec37', 'locality', 'user.attribute.locality');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('bc070139-7c42-4278-aaf6-751f27be1aa3', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('bc070139-7c42-4278-aaf6-751f27be1aa3', 'phoneNumber', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('bc070139-7c42-4278-aaf6-751f27be1aa3', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('bc070139-7c42-4278-aaf6-751f27be1aa3', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('bc070139-7c42-4278-aaf6-751f27be1aa3', 'phone_number', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('bc070139-7c42-4278-aaf6-751f27be1aa3', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4842cea7-6659-487d-a42f-d6135f63446b', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4842cea7-6659-487d-a42f-d6135f63446b', 'phoneNumberVerified', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4842cea7-6659-487d-a42f-d6135f63446b', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4842cea7-6659-487d-a42f-d6135f63446b', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4842cea7-6659-487d-a42f-d6135f63446b', 'phone_number_verified', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('4842cea7-6659-487d-a42f-d6135f63446b', 'boolean', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f16f1dd3-3ef4-40d3-9bb9-99c13faaae4a', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f16f1dd3-3ef4-40d3-9bb9-99c13faaae4a', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f16f1dd3-3ef4-40d3-9bb9-99c13faaae4a', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f16f1dd3-3ef4-40d3-9bb9-99c13faaae4a', 'realm_access.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('f16f1dd3-3ef4-40d3-9bb9-99c13faaae4a', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5a1a3e49-fd2d-42be-a579-4b48770637f5', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5a1a3e49-fd2d-42be-a579-4b48770637f5', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5a1a3e49-fd2d-42be-a579-4b48770637f5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5a1a3e49-fd2d-42be-a579-4b48770637f5', 'resource_access.${client_id}.roles', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('5a1a3e49-fd2d-42be-a579-4b48770637f5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('110f072e-caf9-4acc-84b1-514ebd44f2a5', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('110f072e-caf9-4acc-84b1-514ebd44f2a5', 'username', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('110f072e-caf9-4acc-84b1-514ebd44f2a5', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('110f072e-caf9-4acc-84b1-514ebd44f2a5', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('110f072e-caf9-4acc-84b1-514ebd44f2a5', 'upn', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('110f072e-caf9-4acc-84b1-514ebd44f2a5', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7d688013-ca1e-47f6-b962-c7d3ee065cc4', 'true', 'multivalued');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7d688013-ca1e-47f6-b962-c7d3ee065cc4', 'foo', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7d688013-ca1e-47f6-b962-c7d3ee065cc4', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7d688013-ca1e-47f6-b962-c7d3ee065cc4', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7d688013-ca1e-47f6-b962-c7d3ee065cc4', 'groups', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('7d688013-ca1e-47f6-b962-c7d3ee065cc4', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8f6b4350-6e4f-40bc-8194-098b10263991', 'true', 'userinfo.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8f6b4350-6e4f-40bc-8194-098b10263991', 'locale', 'user.attribute');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8f6b4350-6e4f-40bc-8194-098b10263991', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8f6b4350-6e4f-40bc-8194-098b10263991', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8f6b4350-6e4f-40bc-8194-098b10263991', 'locale', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('8f6b4350-6e4f-40bc-8194-098b10263991', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c95d2af2-c8e0-4c79-ad98-fe63a9a231bf', 'clientId', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c95d2af2-c8e0-4c79-ad98-fe63a9a231bf', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c95d2af2-c8e0-4c79-ad98-fe63a9a231bf', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c95d2af2-c8e0-4c79-ad98-fe63a9a231bf', 'clientId', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('c95d2af2-c8e0-4c79-ad98-fe63a9a231bf', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('297c1a01-016b-4b06-88a2-1e3d7f868d33', 'clientHost', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('297c1a01-016b-4b06-88a2-1e3d7f868d33', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('297c1a01-016b-4b06-88a2-1e3d7f868d33', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('297c1a01-016b-4b06-88a2-1e3d7f868d33', 'clientHost', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('297c1a01-016b-4b06-88a2-1e3d7f868d33', 'String', 'jsonType.label');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b9a68053-586b-47d8-9407-a03007bdacd9', 'clientAddress', 'user.session.note');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b9a68053-586b-47d8-9407-a03007bdacd9', 'true', 'id.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b9a68053-586b-47d8-9407-a03007bdacd9', 'true', 'access.token.claim');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b9a68053-586b-47d8-9407-a03007bdacd9', 'clientAddress', 'claim.name');
INSERT INTO public.protocol_mapper_config (protocol_mapper_id, value, name) VALUES ('b9a68053-586b-47d8-9407-a03007bdacd9', 'String', 'jsonType.label');


--
-- TOC entry 3808 (class 0 OID 16456)
-- Dependencies: 211
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) VALUES ('findme-predialx', 60, 300, 432000, NULL, NULL, NULL, true, false, 0, NULL, 'findme-predialx', 0, NULL, false, false, false, false, 'EXTERNAL', 2592000, 864000, false, false, 'be9b703b-ee56-4f23-b934-c1c72e2e662a', 2592000, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '2721c072-289d-4ad7-94fd-3f158dc810d9', 'e6d27890-c0cf-48bb-bf05-63025b3c8e33', '7486d7f0-323b-4ab4-94df-536abe44113e', 'fbe30de1-20d9-4a1f-9850-2cb0a8cef633', '39b4f5e7-4998-45a6-a79a-d03cf1d303cf', 2592000, false, 1296000, true, false, '5de7203b-117c-4662-8498-964c74edb0dc', 0, false, 0, 0, '7d4c47c1-4fd6-410a-90d6-2cbfa58c0101');
INSERT INTO public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) VALUES ('master', 60, 300, 60, NULL, NULL, NULL, true, false, 0, NULL, 'master', 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, '987bd059-aab4-490f-a517-c06a02e1b53d', 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', '1e3b82af-82be-4625-bc0c-7d076020392b', '04e08ef1-f1e0-4c38-bccf-8c9bc99a1edf', 'd6927ed1-638c-4b68-924c-388673f2e653', 'f7434470-589c-4349-bb38-ea67432e0bf6', '4dc7128a-d67a-49e7-93bc-f54d6e722e77', 2592000, false, 900, true, false, '69f45486-41f5-4a22-bf59-413cc0691d36', 0, false, 0, 0, 'ecb7351c-a889-4d85-b0d6-ef1b92cb0f0d');


--
-- TOC entry 3809 (class 0 OID 16474)
-- Dependencies: 212
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.contentSecurityPolicyReportOnly', 'master', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xContentTypeOptions', 'master', 'nosniff');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xRobotsTag', 'master', 'none');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xFrameOptions', 'master', 'SAMEORIGIN');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.contentSecurityPolicy', 'master', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xXSSProtection', 'master', '1; mode=block');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.strictTransportSecurity', 'master', 'max-age=31536000; includeSubDomains');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('bruteForceProtected', 'master', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('permanentLockout', 'master', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('maxFailureWaitSeconds', 'master', '900');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('minimumQuickLoginWaitSeconds', 'master', '60');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('waitIncrementSeconds', 'master', '60');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('quickLoginCheckMilliSeconds', 'master', '1000');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('maxDeltaTimeSeconds', 'master', '43200');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('failureFactor', 'master', '30');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('client-policies.profiles', 'master', '{"profiles":[{"name":"builtin-default-profile","description":"The built-in default profile for enforcing basic security level to clients.","builtin":true,"executors":[{"secure-session-enforce-executor":{}}]}]}');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('client-policies.policies', 'master', '{"policies":[{"name":"builtin-default-policy","description":"The built-in default policy applied to all clients.","builtin":true,"enable":false,"conditions":[{"anyclient-condition":{}}],"profiles":["builtin-default-profile"]}]}');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('displayName', 'master', 'Keycloak');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('displayNameHtml', 'master', '<div class="kc-logo-text"><span>Keycloak</span></div>');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('defaultSignatureAlgorithm', 'master', 'RS256');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('offlineSessionMaxLifespanEnabled', 'master', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('offlineSessionMaxLifespan', 'master', '5184000');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('oauth2DeviceCodeLifespan', 'findme-predialx', '600');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('oauth2DevicePollingInterval', 'findme-predialx', '5');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('cibaBackchannelTokenDeliveryMode', 'findme-predialx', 'poll');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('cibaExpiresIn', 'findme-predialx', '120');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('cibaInterval', 'findme-predialx', '5');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('cibaAuthRequestedUserHint', 'findme-predialx', 'login_hint');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('bruteForceProtected', 'findme-predialx', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('permanentLockout', 'findme-predialx', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('maxFailureWaitSeconds', 'findme-predialx', '900');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('minimumQuickLoginWaitSeconds', 'findme-predialx', '60');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('waitIncrementSeconds', 'findme-predialx', '60');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('quickLoginCheckMilliSeconds', 'findme-predialx', '1000');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('maxDeltaTimeSeconds', 'findme-predialx', '43200');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('failureFactor', 'findme-predialx', '30');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('actionTokenGeneratedByAdminLifespan', 'findme-predialx', '43200');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('actionTokenGeneratedByUserLifespan', 'findme-predialx', '432000');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('defaultSignatureAlgorithm', 'findme-predialx', 'RS256');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('offlineSessionMaxLifespanEnabled', 'findme-predialx', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('offlineSessionMaxLifespan', 'findme-predialx', '5184000');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('clientSessionIdleTimeout', 'findme-predialx', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('clientSessionMaxLifespan', 'findme-predialx', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('clientOfflineSessionIdleTimeout', 'findme-predialx', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('clientOfflineSessionMaxLifespan', 'findme-predialx', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRpEntityName', 'findme-predialx', 'keycloak');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicySignatureAlgorithms', 'findme-predialx', 'ES256');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRpId', 'findme-predialx', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAttestationConveyancePreference', 'findme-predialx', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAuthenticatorAttachment', 'findme-predialx', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRequireResidentKey', 'findme-predialx', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyUserVerificationRequirement', 'findme-predialx', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyCreateTimeout', 'findme-predialx', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegister', 'findme-predialx', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRpEntityNamePasswordless', 'findme-predialx', 'keycloak');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicySignatureAlgorithmsPasswordless', 'findme-predialx', 'ES256');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRpIdPasswordless', 'findme-predialx', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAttestationConveyancePreferencePasswordless', 'findme-predialx', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAuthenticatorAttachmentPasswordless', 'findme-predialx', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyRequireResidentKeyPasswordless', 'findme-predialx', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyUserVerificationRequirementPasswordless', 'findme-predialx', 'not specified');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyCreateTimeoutPasswordless', 'findme-predialx', '0');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', 'findme-predialx', 'false');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.contentSecurityPolicyReportOnly', 'findme-predialx', '');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xContentTypeOptions', 'findme-predialx', 'nosniff');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xRobotsTag', 'findme-predialx', 'none');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xFrameOptions', 'findme-predialx', 'SAMEORIGIN');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.contentSecurityPolicy', 'findme-predialx', 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.xXSSProtection', 'findme-predialx', '1; mode=block');
INSERT INTO public.realm_attribute (name, realm_id, value) VALUES ('_browser_header.strictTransportSecurity', 'findme-predialx', 'max-age=31536000; includeSubDomains');


--
-- TOC entry 3857 (class 0 OID 17263)
-- Dependencies: 260
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3834 (class 0 OID 16945)
-- Dependencies: 237
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3810 (class 0 OID 16483)
-- Dependencies: 213
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.realm_events_listeners (realm_id, value) VALUES ('master', 'jboss-logging');
INSERT INTO public.realm_events_listeners (realm_id, value) VALUES ('findme-predialx', 'jboss-logging');


--
-- TOC entry 3890 (class 0 OID 17990)
-- Dependencies: 293
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3811 (class 0 OID 16486)
-- Dependencies: 214
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.realm_required_credential (type, form_label, input, secret, realm_id) VALUES ('password', 'password', true, true, 'master');
INSERT INTO public.realm_required_credential (type, form_label, input, secret, realm_id) VALUES ('password', 'password', true, true, 'findme-predialx');


--
-- TOC entry 3812 (class 0 OID 16494)
-- Dependencies: 215
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3832 (class 0 OID 16860)
-- Dependencies: 235
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3813 (class 0 OID 16506)
-- Dependencies: 216
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.redirect_uris (client_id, value) VALUES ('0553ec4f-d2ac-4b97-a4a6-b2977833aec2', '/realms/master/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('90aaaa5d-55b8-487a-846e-8482d2673b5c', '/realms/master/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('d2c1a4c3-b48f-40fd-96fe-80d273959195', '/admin/master/console/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('5914aec0-a8ae-48fb-bef2-e3b2636a105b', '/realms/findme-predialx/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('6572894e-01ba-49f6-8f01-791c9c5742e3', '/realms/findme-predialx/account/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('c7ed64ca-5b00-46cf-af5f-d318ca900d9f', '/admin/findme-predialx/console/*');
INSERT INTO public.redirect_uris (client_id, value) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'http://localhost:3000/*');


--
-- TOC entry 3850 (class 0 OID 17194)
-- Dependencies: 253
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3849 (class 0 OID 17186)
-- Dependencies: 252
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('0d5c5952-0b4e-4d3c-8061-f8e37e3e40aa', 'VERIFY_EMAIL', 'Verify Email', 'master', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('1bbcc7ab-17e9-4908-b71d-d821a9108649', 'UPDATE_PROFILE', 'Update Profile', 'master', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('9da8d91d-2562-4ac0-9316-aee99d5ad2d3', 'CONFIGURE_TOTP', 'Configure OTP', 'master', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('0198b22e-327b-410d-be20-219a818154d2', 'UPDATE_PASSWORD', 'Update Password', 'master', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('ade9086e-a455-453d-af50-3fa92bb1f04a', 'terms_and_conditions', 'Terms and Conditions', 'master', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('430f3593-7b4a-4e52-90af-92b65fc2363d', 'update_user_locale', 'Update User Locale', 'master', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('68ecfb4f-6f22-4e0f-9a73-396cde210e10', 'delete_account', 'Delete Account', 'master', false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('74c3d296-18c7-4d68-9315-1dd738ab58cd', 'VERIFY_EMAIL', 'Verify Email', 'findme-predialx', true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('b9e93bc1-1ce7-4319-82f9-223418a4673b', 'UPDATE_PROFILE', 'Update Profile', 'findme-predialx', true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('46017365-0e80-49c3-97e4-8324348543a0', 'CONFIGURE_TOTP', 'Configure OTP', 'findme-predialx', true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('b558ae19-3396-4b98-849b-15058d068bd3', 'UPDATE_PASSWORD', 'Update Password', 'findme-predialx', true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('c4b55e5e-da0d-41a1-b252-8f344491e1a2', 'terms_and_conditions', 'Terms and Conditions', 'findme-predialx', false, false, 'terms_and_conditions', 20);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('64fe7038-4389-4e76-a11f-4bf6cf7b6681', 'update_user_locale', 'Update User Locale', 'findme-predialx', true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) VALUES ('b7f89a70-89e0-4a87-9150-6b63e4f0b1b9', 'delete_account', 'Delete Account', 'findme-predialx', false, false, 'delete_account', 60);


--
-- TOC entry 3887 (class 0 OID 17915)
-- Dependencies: 290
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3867 (class 0 OID 17488)
-- Dependencies: 270
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3866 (class 0 OID 17473)
-- Dependencies: 269
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3861 (class 0 OID 17407)
-- Dependencies: 264
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', true, '0', 1);


--
-- TOC entry 3886 (class 0 OID 17891)
-- Dependencies: 289
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3864 (class 0 OID 17445)
-- Dependencies: 267
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) VALUES ('7f48b1a2-f599-41e3-8df8-91221aa9d51e', 'Default Policy', 'A policy that grants access only for users within this realm', 'js', '0', '0', '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', NULL);
INSERT INTO public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) VALUES ('5032591a-54a6-416c-8c57-cd78828cc7b0', 'Default Permission', 'A permission that applies to the default resource type', 'resource', '1', '0', '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', NULL);


--
-- TOC entry 3862 (class 0 OID 17415)
-- Dependencies: 265
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) VALUES ('33bed1d8-61ef-4bb3-aa39-6c709da2dbc7', 'Default Resource', 'urn:backend:resources:default', NULL, '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', false, NULL);


--
-- TOC entry 3863 (class 0 OID 17430)
-- Dependencies: 266
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3888 (class 0 OID 17934)
-- Dependencies: 291
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.resource_uris (resource_id, value) VALUES ('33bed1d8-61ef-4bb3-aa39-6c709da2dbc7', '/*');


--
-- TOC entry 3889 (class 0 OID 17944)
-- Dependencies: 292
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3814 (class 0 OID 16509)
-- Dependencies: 217
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.scope_mapping (client_id, role_id) VALUES ('90aaaa5d-55b8-487a-846e-8482d2673b5c', '7ddd6674-cf40-4a85-8dbd-80e2bbd4511b');
INSERT INTO public.scope_mapping (client_id, role_id) VALUES ('6572894e-01ba-49f6-8f01-791c9c5742e3', '16c3eeec-835f-4ab4-a8da-ccbd1b40aa33');


--
-- TOC entry 3868 (class 0 OID 17503)
-- Dependencies: 271
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3798 (class 0 OID 16387)
-- Dependencies: 201
-- Data for Name: service_order; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3816 (class 0 OID 16515)
-- Dependencies: 219
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3838 (class 0 OID 16968)
-- Dependencies: 241
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3884 (class 0 OID 17866)
-- Dependencies: 287
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3817 (class 0 OID 16521)
-- Dependencies: 220
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('688388c5-80af-45d5-838a-3edf213b0eac', NULL, 'c7bc8d80-70c2-4992-a6b3-65ba9d2979fe', false, true, NULL, NULL, NULL, 'master', 'admin', 1620354617396, NULL, 0);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('d8bea6f8-848c-4055-85f4-c0c397ee8167', NULL, '6a64ff43-acfd-4b1b-aa1f-683591b0a216', false, true, NULL, NULL, NULL, 'findme-predialx', 'service-account-backend', 1620354737643, '9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 0);
INSERT INTO public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) VALUES ('9dde6744-a98d-4f17-8f0d-3830b493de4f', 'admin@findme.id', 'admin@findme.id', false, true, NULL, 'Admin', 'FindMe', 'findme-predialx', 'admin', 1620357574532, NULL, 0);


--
-- TOC entry 3818 (class 0 OID 16530)
-- Dependencies: 221
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3845 (class 0 OID 17084)
-- Dependencies: 248
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3846 (class 0 OID 17090)
-- Dependencies: 249
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3819 (class 0 OID 16536)
-- Dependencies: 222
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3856 (class 0 OID 17260)
-- Dependencies: 259
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3820 (class 0 OID 16542)
-- Dependencies: 223
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3821 (class 0 OID 16545)
-- Dependencies: 224
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('ecb7351c-a889-4d85-b0d6-ef1b92cb0f0d', '688388c5-80af-45d5-838a-3edf213b0eac');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('6a627749-880b-443c-b9aa-594467b52cbb', '688388c5-80af-45d5-838a-3edf213b0eac');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('7d4c47c1-4fd6-410a-90d6-2cbfa58c0101', 'd8bea6f8-848c-4055-85f4-c0c397ee8167');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('41a69148-9757-41ce-b5ed-ce3cd382a6f7', 'd8bea6f8-848c-4055-85f4-c0c397ee8167');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('5a9e063d-4fe5-446e-a650-b24e28f8ad4e', 'd8bea6f8-848c-4055-85f4-c0c397ee8167');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('578bcdd6-4c6f-4277-9402-2e6df50ea229', 'd8bea6f8-848c-4055-85f4-c0c397ee8167');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('2da373f5-617f-4c72-835c-cbdce97f2db8', 'd8bea6f8-848c-4055-85f4-c0c397ee8167');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('7d4c47c1-4fd6-410a-90d6-2cbfa58c0101', '9dde6744-a98d-4f17-8f0d-3830b493de4f');
INSERT INTO public.user_role_mapping (role_id, user_id) VALUES ('6b451637-1bdc-4e9f-baa2-6663a0c122f3', '9dde6744-a98d-4f17-8f0d-3830b493de4f');


--
-- TOC entry 3822 (class 0 OID 16548)
-- Dependencies: 225
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3833 (class 0 OID 16863)
-- Dependencies: 236
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3815 (class 0 OID 16512)
-- Dependencies: 218
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: findme-admin
--



--
-- TOC entry 3823 (class 0 OID 16561)
-- Dependencies: 226
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: findme-admin
--

INSERT INTO public.web_origins (client_id, value) VALUES ('d2c1a4c3-b48f-40fd-96fe-80d273959195', '+');
INSERT INTO public.web_origins (client_id, value) VALUES ('c7ed64ca-5b00-46cf-af5f-d318ca900d9f', '+');
INSERT INTO public.web_origins (client_id, value) VALUES ('9cb49dc5-69eb-4a4c-a6d8-e2e3f9c90499', 'http://localhost:3000');


--
-- TOC entry 3898 (class 0 OID 0)
-- Dependencies: 200
-- Name: service_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: findme-admin
--

SELECT pg_catalog.setval('public.service_order_id_seq', 1, false);


--
-- TOC entry 3357 (class 2606 OID 17657)
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- TOC entry 3306 (class 2606 OID 16395)
-- Name: service_order PK_b01a59b48a0dfbd84dd8221364a; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.service_order
    ADD CONSTRAINT "PK_b01a59b48a0dfbd84dd8221364a" PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 17971)
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- TOC entry 3566 (class 2606 OID 17796)
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- TOC entry 3568 (class 2606 OID 18003)
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- TOC entry 3563 (class 2606 OID 17671)
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3480 (class 2606 OID 17302)
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- TOC entry 3528 (class 2606 OID 17590)
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3453 (class 2606 OID 17207)
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- TOC entry 3554 (class 2606 OID 17610)
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- TOC entry 3557 (class 2606 OID 17608)
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- TOC entry 3546 (class 2606 OID 17606)
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3530 (class 2606 OID 17592)
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3533 (class 2606 OID 17594)
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- TOC entry 3538 (class 2606 OID 17600)
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- TOC entry 3542 (class 2606 OID 17602)
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3550 (class 2606 OID 17604)
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3561 (class 2606 OID 17650)
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- TOC entry 3482 (class 2606 OID 17755)
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- TOC entry 3413 (class 2606 OID 17772)
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- TOC entry 3344 (class 2606 OID 17774)
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- TOC entry 3408 (class 2606 OID 17776)
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- TOC entry 3401 (class 2606 OID 16873)
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- TOC entry 3385 (class 2606 OID 16801)
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- TOC entry 3327 (class 2606 OID 16573)
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- TOC entry 3397 (class 2606 OID 16875)
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3336 (class 2606 OID 16575)
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 16577)
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- TOC entry 3380 (class 2606 OID 16579)
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- TOC entry 3371 (class 2606 OID 16581)
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- TOC entry 3387 (class 2606 OID 16803)
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- TOC entry 3310 (class 2606 OID 16585)
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- TOC entry 3315 (class 2606 OID 16587)
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 16589)
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- TOC entry 3389 (class 2606 OID 16805)
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- TOC entry 3341 (class 2606 OID 16591)
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- TOC entry 3347 (class 2606 OID 16593)
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- TOC entry 3332 (class 2606 OID 16595)
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- TOC entry 3431 (class 2606 OID 17759)
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- TOC entry 3443 (class 2606 OID 17112)
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- TOC entry 3439 (class 2606 OID 17110)
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- TOC entry 3436 (class 2606 OID 17108)
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- TOC entry 3433 (class 2606 OID 17106)
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- TOC entry 3451 (class 2606 OID 17116)
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- TOC entry 3377 (class 2606 OID 16597)
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3320 (class 2606 OID 17753)
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- TOC entry 3429 (class 2606 OID 16993)
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- TOC entry 3406 (class 2606 OID 16877)
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- TOC entry 3514 (class 2606 OID 17467)
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- TOC entry 3349 (class 2606 OID 16599)
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- TOC entry 3324 (class 2606 OID 16601)
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- TOC entry 3369 (class 2606 OID 16603)
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- TOC entry 3581 (class 2606 OID 17895)
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- TOC entry 3499 (class 2606 OID 17422)
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- TOC entry 3509 (class 2606 OID 17452)
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- TOC entry 3525 (class 2606 OID 17522)
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- TOC entry 3519 (class 2606 OID 17492)
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- TOC entry 3504 (class 2606 OID 17437)
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- TOC entry 3516 (class 2606 OID 17477)
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- TOC entry 3522 (class 2606 OID 17507)
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- TOC entry 3362 (class 2606 OID 16605)
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- TOC entry 3449 (class 2606 OID 17120)
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- TOC entry 3445 (class 2606 OID 17118)
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- TOC entry 3579 (class 2606 OID 17880)
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3576 (class 2606 OID 17870)
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3424 (class 2606 OID 16987)
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- TOC entry 3467 (class 2606 OID 17269)
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- TOC entry 3474 (class 2606 OID 17276)
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3471 (class 2606 OID 17290)
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- TOC entry 3419 (class 2606 OID 16983)
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- TOC entry 3422 (class 2606 OID 17169)
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- TOC entry 3416 (class 2606 OID 16981)
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- TOC entry 3464 (class 2606 OID 17978)
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- TOC entry 3460 (class 2606 OID 17244)
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- TOC entry 3391 (class 2606 OID 16871)
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- TOC entry 3395 (class 2606 OID 17162)
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- TOC entry 3351 (class 2606 OID 17778)
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- TOC entry 3458 (class 2606 OID 17205)
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- TOC entry 3455 (class 2606 OID 17203)
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- TOC entry 3374 (class 2606 OID 17114)
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3587 (class 2606 OID 17943)
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- TOC entry 3589 (class 2606 OID 17951)
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3359 (class 2606 OID 17201)
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3477 (class 2606 OID 17283)
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3411 (class 2606 OID 16881)
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- TOC entry 3382 (class 2606 OID 17780)
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- TOC entry 3491 (class 2606 OID 17388)
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- TOC entry 3486 (class 2606 OID 17347)
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- TOC entry 3308 (class 2606 OID 16400)
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- TOC entry 3497 (class 2606 OID 17733)
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- TOC entry 3495 (class 2606 OID 17376)
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- TOC entry 3574 (class 2606 OID 17855)
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- TOC entry 3592 (class 2606 OID 17997)
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- TOC entry 3585 (class 2606 OID 17923)
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3469 (class 2606 OID 17663)
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- TOC entry 3404 (class 2606 OID 16928)
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- TOC entry 3313 (class 2606 OID 16609)
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- TOC entry 3488 (class 2606 OID 17808)
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- TOC entry 3365 (class 2606 OID 16613)
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- TOC entry 3502 (class 2606 OID 17987)
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- TOC entry 3583 (class 2606 OID 17982)
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- TOC entry 3512 (class 2606 OID 17724)
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3507 (class 2606 OID 17728)
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3427 (class 2606 OID 17973)
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- TOC entry 3339 (class 2606 OID 16621)
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- TOC entry 3367 (class 2606 OID 17652)
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- TOC entry 3526 (class 1259 OID 17677)
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- TOC entry 3434 (class 1259 OID 17681)
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- TOC entry 3440 (class 1259 OID 17679)
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- TOC entry 3441 (class 1259 OID 17678)
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- TOC entry 3437 (class 1259 OID 17680)
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- TOC entry 3569 (class 1259 OID 18004)
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- TOC entry 3311 (class 1259 OID 17988)
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- TOC entry 3564 (class 1259 OID 17721)
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- TOC entry 3316 (class 1259 OID 17685)
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- TOC entry 3489 (class 1259 OID 17885)
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- TOC entry 3570 (class 1259 OID 18001)
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- TOC entry 3392 (class 1259 OID 17882)
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- TOC entry 3492 (class 1259 OID 17883)
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- TOC entry 3555 (class 1259 OID 17687)
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- TOC entry 3558 (class 1259 OID 17958)
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- TOC entry 3559 (class 1259 OID 17686)
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- TOC entry 3321 (class 1259 OID 17688)
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- TOC entry 3322 (class 1259 OID 17689)
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- TOC entry 3571 (class 1259 OID 17888)
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- TOC entry 3572 (class 1259 OID 17889)
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- TOC entry 3328 (class 1259 OID 17989)
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- TOC entry 3398 (class 1259 OID 17406)
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- TOC entry 3399 (class 1259 OID 17405)
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- TOC entry 3531 (class 1259 OID 17781)
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- TOC entry 3534 (class 1259 OID 17802)
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- TOC entry 3535 (class 1259 OID 17969)
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- TOC entry 3536 (class 1259 OID 17783)
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- TOC entry 3539 (class 1259 OID 17784)
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- TOC entry 3540 (class 1259 OID 17785)
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- TOC entry 3543 (class 1259 OID 17786)
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- TOC entry 3544 (class 1259 OID 17787)
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- TOC entry 3547 (class 1259 OID 17788)
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- TOC entry 3548 (class 1259 OID 17789)
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- TOC entry 3551 (class 1259 OID 17790)
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- TOC entry 3552 (class 1259 OID 17791)
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- TOC entry 3475 (class 1259 OID 17692)
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- TOC entry 3472 (class 1259 OID 17693)
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- TOC entry 3420 (class 1259 OID 17695)
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- TOC entry 3402 (class 1259 OID 17694)
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- TOC entry 3333 (class 1259 OID 17696)
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- TOC entry 3334 (class 1259 OID 17697)
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- TOC entry 3461 (class 1259 OID 17962)
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- TOC entry 3462 (class 1259 OID 17998)
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- TOC entry 3393 (class 1259 OID 17698)
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- TOC entry 3342 (class 1259 OID 17701)
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- TOC entry 3484 (class 1259 OID 17881)
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- TOC entry 3483 (class 1259 OID 17702)
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- TOC entry 3345 (class 1259 OID 17705)
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- TOC entry 3414 (class 1259 OID 17704)
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- TOC entry 3337 (class 1259 OID 17700)
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- TOC entry 3409 (class 1259 OID 17706)
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- TOC entry 3352 (class 1259 OID 17707)
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- TOC entry 3456 (class 1259 OID 17708)
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- TOC entry 3520 (class 1259 OID 17709)
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- TOC entry 3517 (class 1259 OID 17710)
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- TOC entry 3510 (class 1259 OID 17729)
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- TOC entry 3500 (class 1259 OID 17730)
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- TOC entry 3505 (class 1259 OID 17731)
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- TOC entry 3590 (class 1259 OID 17957)
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- TOC entry 3493 (class 1259 OID 17884)
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- TOC entry 3355 (class 1259 OID 17714)
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- TOC entry 3523 (class 1259 OID 17715)
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- TOC entry 3417 (class 1259 OID 17967)
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- TOC entry 3465 (class 1259 OID 17395)
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- TOC entry 3577 (class 1259 OID 17890)
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- TOC entry 3360 (class 1259 OID 17402)
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- TOC entry 3425 (class 1259 OID 17399)
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- TOC entry 3325 (class 1259 OID 17403)
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- TOC entry 3363 (class 1259 OID 17396)
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- TOC entry 3478 (class 1259 OID 17398)
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- TOC entry 3375 (class 1259 OID 17404)
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- TOC entry 3378 (class 1259 OID 17397)
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- TOC entry 3446 (class 1259 OID 17717)
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- TOC entry 3447 (class 1259 OID 17718)
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- TOC entry 3372 (class 1259 OID 17719)
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- TOC entry 3383 (class 1259 OID 17720)
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: findme-admin
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- TOC entry 3634 (class 2606 OID 17121)
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3618 (class 2606 OID 16882)
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3611 (class 2606 OID 16806)
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3617 (class 2606 OID 16892)
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3613 (class 2606 OID 17041)
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3612 (class 2606 OID 16811)
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3621 (class 2606 OID 16922)
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- TOC entry 3594 (class 2606 OID 16624)
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3603 (class 2606 OID 16629)
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3607 (class 2606 OID 16634)
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3626 (class 2606 OID 17019)
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3601 (class 2606 OID 16644)
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3664 (class 2606 OID 17924)
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3605 (class 2606 OID 16649)
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3608 (class 2606 OID 16659)
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3598 (class 2606 OID 16664)
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- TOC entry 3602 (class 2606 OID 16669)
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3599 (class 2606 OID 16684)
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3595 (class 2606 OID 16689)
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3630 (class 2606 OID 17141)
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- TOC entry 3629 (class 2606 OID 17136)
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3628 (class 2606 OID 17131)
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3627 (class 2606 OID 17126)
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3593 (class 2606 OID 16694)
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- TOC entry 3609 (class 2606 OID 16699)
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3641 (class 2606 OID 17829)
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3642 (class 2606 OID 17819)
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3635 (class 2606 OID 17213)
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3615 (class 2606 OID 17814)
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 3657 (class 2606 OID 17672)
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3655 (class 2606 OID 17616)
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- TOC entry 3656 (class 2606 OID 17611)
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3640 (class 2606 OID 17303)
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3633 (class 2606 OID 17156)
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- TOC entry 3632 (class 2606 OID 17151)
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 3631 (class 2606 OID 17146)
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3654 (class 2606 OID 17528)
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3652 (class 2606 OID 17513)
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3660 (class 2606 OID 17896)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3643 (class 2606 OID 17739)
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3661 (class 2606 OID 17901)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3662 (class 2606 OID 17906)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 3653 (class 2606 OID 17523)
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3651 (class 2606 OID 17508)
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 3663 (class 2606 OID 17929)
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3645 (class 2606 OID 17734)
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3647 (class 2606 OID 17478)
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3649 (class 2606 OID 17493)
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3650 (class 2606 OID 17498)
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3648 (class 2606 OID 17483)
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 3644 (class 2606 OID 17744)
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3596 (class 2606 OID 16714)
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3659 (class 2606 OID 17871)
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- TOC entry 3625 (class 2606 OID 17004)
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3638 (class 2606 OID 17277)
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 3637 (class 2606 OID 17291)
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 3622 (class 2606 OID 16948)
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3600 (class 2606 OID 16724)
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3623 (class 2606 OID 16994)
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3624 (class 2606 OID 17170)
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- TOC entry 3610 (class 2606 OID 16734)
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3604 (class 2606 OID 16744)
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3614 (class 2606 OID 16887)
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3597 (class 2606 OID 16759)
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3616 (class 2606 OID 17163)
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- TOC entry 3658 (class 2606 OID 17856)
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3636 (class 2606 OID 17208)
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3665 (class 2606 OID 17937)
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3666 (class 2606 OID 17952)
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3620 (class 2606 OID 16917)
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3606 (class 2606 OID 16779)
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 3639 (class 2606 OID 17284)
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3646 (class 2606 OID 17468)
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3619 (class 2606 OID 16897)
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: findme-admin
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


-- Completed on 2021-05-07 04:13:53 UTC

--
-- PostgreSQL database dump complete
--

