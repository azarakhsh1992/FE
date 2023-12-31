PGDMP                         {            fedge    15.5    15.5 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    29330    fedge    DATABASE     �   CREATE DATABASE fedge WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE fedge;
                fedge    false            �           0    0    DATABASE fedge    ACL     _   REVOKE CONNECT,TEMPORARY ON DATABASE fedge FROM PUBLIC;
GRANT ALL ON DATABASE fedge TO PUBLIC;
                   fedge    false    4585                        3079    29331    timescaledb 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS timescaledb WITH SCHEMA public;
    DROP EXTENSION timescaledb;
                   false            �           0    0    EXTENSION timescaledb    COMMENT     }   COMMENT ON EXTENSION timescaledb IS 'Enables scalable inserts and complex queries for time-series data (Community Edition)';
                        false    2            F           1259    30514    web_temperaturesensorvalue    TABLE     ?  CREATE TABLE public.web_temperaturesensorvalue (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    tempvalue double precision,
    tempvalue_min double precision,
    tempvalue_max double precision,
    humidvalue double precision,
    valid boolean,
    temperaturesensor_id bigint NOT NULL
);
 .   DROP TABLE public.web_temperaturesensorvalue;
       public         heap    fedge    false            W           1259    30794    _hyper_1_2_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_1_2_chunk (
    CONSTRAINT constraint_2 CHECK ((("time" >= '2023-11-23 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-11-30 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_temperaturesensorvalue);
 3   DROP TABLE _timescaledb_internal._hyper_1_2_chunk;
       _timescaledb_internal         heap    fedge    false    326    2            ^           1259    39058    _hyper_1_9_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_1_9_chunk (
    CONSTRAINT constraint_9 CHECK ((("time" >= '2023-11-30 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-07 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_temperaturesensorvalue);
 3   DROP TABLE _timescaledb_internal._hyper_1_9_chunk;
       _timescaledb_internal         heap    fedge    false    326    2            L           1259    30541    web_latchvalue    TABLE     �   CREATE TABLE public.web_latchvalue (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    value character varying(8),
    valid boolean NOT NULL,
    latch_id bigint NOT NULL
);
 "   DROP TABLE public.web_latchvalue;
       public         heap    fedge    false            _           1259    39069    _hyper_3_10_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_3_10_chunk (
    CONSTRAINT constraint_10 CHECK ((("time" >= '2023-11-30 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-07 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_latchvalue);
 4   DROP TABLE _timescaledb_internal._hyper_3_10_chunk;
       _timescaledb_internal         heap    fedge    false    2    332            X           1259    30847    _hyper_3_3_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_3_3_chunk (
    CONSTRAINT constraint_3 CHECK ((("time" >= '2023-11-23 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-11-30 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_latchvalue);
 3   DROP TABLE _timescaledb_internal._hyper_3_3_chunk;
       _timescaledb_internal         heap    fedge    false    2    332            N           1259    30549    web_latchsensorvalue    TABLE     �   CREATE TABLE public.web_latchsensorvalue (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    value boolean,
    valid boolean,
    latchsensor_id bigint NOT NULL
);
 (   DROP TABLE public.web_latchsensorvalue;
       public         heap    fedge    false            V           1259    30783    _hyper_4_1_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_4_1_chunk (
    CONSTRAINT constraint_1 CHECK ((("time" >= '2023-11-23 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-11-30 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_latchsensorvalue);
 3   DROP TABLE _timescaledb_internal._hyper_4_1_chunk;
       _timescaledb_internal         heap    fedge    false    2    334            ]           1259    39047    _hyper_4_8_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_4_8_chunk (
    CONSTRAINT constraint_8 CHECK ((("time" >= '2023-11-30 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-07 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_latchsensorvalue);
 3   DROP TABLE _timescaledb_internal._hyper_4_8_chunk;
       _timescaledb_internal         heap    fedge    false    334    2            P           1259    30571    web_energysensorvalue    TABLE     N  CREATE TABLE public.web_energysensorvalue (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    energy_value double precision,
    energy_unit character varying(4) NOT NULL,
    power_value double precision,
    power_unit character varying(4) NOT NULL,
    valid boolean,
    energysensor_id bigint NOT NULL
);
 )   DROP TABLE public.web_energysensorvalue;
       public         heap    fedge    false            Y           1259    30858    _hyper_5_4_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_5_4_chunk (
    CONSTRAINT constraint_4 CHECK ((("time" >= '2023-11-23 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-11-30 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_energysensorvalue);
 3   DROP TABLE _timescaledb_internal._hyper_5_4_chunk;
       _timescaledb_internal         heap    fedge    false    336    2            \           1259    39036    _hyper_5_7_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_5_7_chunk (
    CONSTRAINT constraint_7 CHECK ((("time" >= '2023-11-30 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-07 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_energysensorvalue);
 3   DROP TABLE _timescaledb_internal._hyper_5_7_chunk;
       _timescaledb_internal         heap    fedge    false    336    2            R           1259    30579    web_doorsensorvalue    TABLE     �   CREATE TABLE public.web_doorsensorvalue (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    value boolean,
    valid boolean,
    doorsensor_id bigint NOT NULL
);
 '   DROP TABLE public.web_doorsensorvalue;
       public         heap    fedge    false            [           1259    30880    _hyper_6_6_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_6_6_chunk (
    CONSTRAINT constraint_6 CHECK ((("time" >= '2023-11-23 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-11-30 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_doorsensorvalue);
 3   DROP TABLE _timescaledb_internal._hyper_6_6_chunk;
       _timescaledb_internal         heap    fedge    false    338    2            U           1259    30605    web_buttonvalue    TABLE     �   CREATE TABLE public.web_buttonvalue (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    value boolean,
    valid boolean NOT NULL,
    doorbutton_id bigint NOT NULL
);
 #   DROP TABLE public.web_buttonvalue;
       public         heap    fedge    false            Z           1259    30869    _hyper_7_5_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_7_5_chunk (
    CONSTRAINT constraint_5 CHECK ((("time" >= '2023-11-23 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-11-30 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_buttonvalue);
 3   DROP TABLE _timescaledb_internal._hyper_7_5_chunk;
       _timescaledb_internal         heap    fedge    false    2    341                       1259    30172 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    fedge    false                       1259    30171    auth_group_id_seq    SEQUENCE     �   ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    283                       1259    30180    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    fedge    false                       1259    30179    auth_group_permissions_id_seq    SEQUENCE     �   ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    285                       1259    30166    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    fedge    false                       1259    30165    auth_permission_id_seq    SEQUENCE     �   ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    281                       1259    30186 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    fedge    false            !           1259    30194    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    fedge    false                        1259    30193    auth_user_groups_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    289                       1259    30185    auth_user_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    287            #           1259    30200    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    fedge    false            "           1259    30199 !   auth_user_user_permissions_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    291            &           1259    30286    authtoken_token    TABLE     �   CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);
 #   DROP TABLE public.authtoken_token;
       public         heap    fedge    false            %           1259    30258    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    fedge    false            $           1259    30257    django_admin_log_id_seq    SEQUENCE     �   ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    293            '           1259    30300    django_apscheduler_djangojob    TABLE     �   CREATE TABLE public.django_apscheduler_djangojob (
    id character varying(255) NOT NULL,
    next_run_time timestamp with time zone,
    job_state bytea NOT NULL
);
 0   DROP TABLE public.django_apscheduler_djangojob;
       public         heap    fedge    false            )           1259    30310 %   django_apscheduler_djangojobexecution    TABLE     P  CREATE TABLE public.django_apscheduler_djangojobexecution (
    id bigint NOT NULL,
    status character varying(50) NOT NULL,
    run_time timestamp with time zone NOT NULL,
    duration numeric(15,2),
    finished numeric(15,2),
    exception character varying(1000),
    traceback text,
    job_id character varying(255) NOT NULL
);
 9   DROP TABLE public.django_apscheduler_djangojobexecution;
       public         heap    fedge    false            (           1259    30309 ,   django_apscheduler_djangojobexecution_id_seq    SEQUENCE     	  ALTER TABLE public.django_apscheduler_djangojobexecution ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_apscheduler_djangojobexecution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    297                       1259    30158    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    fedge    false                       1259    30157    django_content_type_id_seq    SEQUENCE     �   ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    279                       1259    30150    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    fedge    false                       1259    30149    django_migrations_id_seq    SEQUENCE     �   ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    277            *           1259    30365    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    fedge    false            T           1259    30604    web_buttonvalue_id_seq    SEQUENCE     �   ALTER TABLE public.web_buttonvalue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_buttonvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    341            ,           1259    30375    web_cabinet    TABLE     v  CREATE TABLE public.web_cabinet (
    id bigint NOT NULL,
    bereich character varying(1) NOT NULL,
    segment character varying(1) NOT NULL,
    anlage character varying(4) NOT NULL,
    arg_sps character varying(1) NOT NULL,
    pultbereich_sk character varying(1) NOT NULL,
    station character varying(4) NOT NULL,
    profinet_name character varying(12) NOT NULL
);
    DROP TABLE public.web_cabinet;
       public         heap    fedge    false            +           1259    30374    web_cabinet_id_seq    SEQUENCE     �   ALTER TABLE public.web_cabinet ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_cabinet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    300            .           1259    30383 
   web_device    TABLE     �  CREATE TABLE public.web_device (
    id bigint NOT NULL,
    geraet character varying(3) NOT NULL,
    bmk character varying(4) NOT NULL,
    serial_number character varying(50) NOT NULL,
    manufacturer character varying(50) NOT NULL,
    profinet_name character varying(22) NOT NULL,
    module_type character varying(32) NOT NULL,
    io_module character varying(8) NOT NULL,
    port character varying(4),
    plc_id bigint NOT NULL,
    rack_id bigint NOT NULL
);
    DROP TABLE public.web_device;
       public         heap    fedge    false            -           1259    30382    web_device_id_seq    SEQUENCE     �   ALTER TABLE public.web_device ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    302            0           1259    30393    web_door    TABLE     �   CREATE TABLE public.web_door (
    id bigint NOT NULL,
    direction character varying(32) NOT NULL,
    qr character varying(32) NOT NULL,
    rack_id bigint NOT NULL
);
    DROP TABLE public.web_door;
       public         heap    fedge    false            /           1259    30392    web_door_id_seq    SEQUENCE     �   ALTER TABLE public.web_door ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_door_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    304            S           1259    30593    web_doorbutton    TABLE     �   CREATE TABLE public.web_doorbutton (
    device_ptr_id bigint NOT NULL,
    door_direction character varying(32) NOT NULL,
    device_io_module character varying(8) NOT NULL,
    device_port character varying(4) NOT NULL,
    door_id bigint NOT NULL
);
 "   DROP TABLE public.web_doorbutton;
       public         heap    fedge    false            7           1259    30420    web_doorsensor    TABLE     �   CREATE TABLE public.web_doorsensor (
    device_ptr_id bigint NOT NULL,
    door_direction character varying(32) NOT NULL,
    device_io_module character varying(8) NOT NULL,
    device_port character varying(4) NOT NULL,
    door_id bigint NOT NULL
);
 "   DROP TABLE public.web_doorsensor;
       public         heap    fedge    false            Q           1259    30578    web_doorsensorvalue_id_seq    SEQUENCE     �   ALTER TABLE public.web_doorsensorvalue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_doorsensorvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    338            2           1259    30401    web_employeegroup    TABLE     n   CREATE TABLE public.web_employeegroup (
    id bigint NOT NULL,
    "group" character varying(10) NOT NULL
);
 %   DROP TABLE public.web_employeegroup;
       public         heap    fedge    false            1           1259    30400    web_employeegroup_id_seq    SEQUENCE     �   ALTER TABLE public.web_employeegroup ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_employeegroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    306            8           1259    30425    web_energysensor    TABLE     �   CREATE TABLE public.web_energysensor (
    device_ptr_id bigint NOT NULL,
    measuring_environment character varying(4) NOT NULL,
    device_io_module character varying(8) NOT NULL
);
 $   DROP TABLE public.web_energysensor;
       public         heap    fedge    false            O           1259    30570    web_energysensorvalue_id_seq    SEQUENCE     �   ALTER TABLE public.web_energysensorvalue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_energysensorvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    336            9           1259    30432 	   web_latch    TABLE     �   CREATE TABLE public.web_latch (
    device_ptr_id bigint NOT NULL,
    door_direction character varying(32) NOT NULL,
    device_io_module character varying(8) NOT NULL,
    device_port character varying(4) NOT NULL,
    door_id bigint NOT NULL
);
    DROP TABLE public.web_latch;
       public         heap    fedge    false            :           1259    30437    web_latchsensor    TABLE     �   CREATE TABLE public.web_latchsensor (
    device_ptr_id bigint NOT NULL,
    door_direction character varying(32) NOT NULL,
    device_io_module character varying(8) NOT NULL,
    device_port character varying(4) NOT NULL,
    door_id bigint NOT NULL
);
 #   DROP TABLE public.web_latchsensor;
       public         heap    fedge    false            M           1259    30548    web_latchsensorvalue_id_seq    SEQUENCE     �   ALTER TABLE public.web_latchsensorvalue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_latchsensorvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    334            K           1259    30540    web_latchvalue_id_seq    SEQUENCE     �   ALTER TABLE public.web_latchvalue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_latchvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    332            ;           1259    30442    web_led    TABLE     �   CREATE TABLE public.web_led (
    device_ptr_id bigint NOT NULL,
    door_direction character varying(32) NOT NULL,
    device_io_module character varying(8) NOT NULL,
    device_port character varying(4) NOT NULL,
    door_id bigint NOT NULL
);
    DROP TABLE public.web_led;
       public         heap    fedge    false            J           1259    30528    web_ledvalue    TABLE     �   CREATE TABLE public.web_ledvalue (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    value boolean,
    valid boolean NOT NULL,
    led_id bigint NOT NULL
);
     DROP TABLE public.web_ledvalue;
       public         heap    fedge    false            I           1259    30527    web_ledvalue_id_seq    SEQUENCE     �   ALTER TABLE public.web_ledvalue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_ledvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    330            D           1259    30483    web_plc    TABLE     �  CREATE TABLE public.web_plc (
    id bigint NOT NULL,
    funktionseinheit character varying(3) NOT NULL,
    geraet character varying(3) NOT NULL,
    bmk character varying(4) NOT NULL,
    ip_address inet NOT NULL,
    serial_number character varying(32) NOT NULL,
    mac_address character varying(32) NOT NULL,
    manufacturer character varying(16) NOT NULL,
    profinet_name character varying(22) NOT NULL,
    cabinet_id bigint NOT NULL
);
    DROP TABLE public.web_plc;
       public         heap    fedge    false            C           1259    30482    web_plc_id_seq    SEQUENCE     �   ALTER TABLE public.web_plc ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_plc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    324            4           1259    30409    web_rack    TABLE     �   CREATE TABLE public.web_rack (
    id bigint NOT NULL,
    name character varying(16) NOT NULL,
    cabinet_id bigint NOT NULL
);
    DROP TABLE public.web_rack;
       public         heap    fedge    false            3           1259    30408    web_rack_id_seq    SEQUENCE     �   ALTER TABLE public.web_rack ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_rack_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    308            6           1259    30415    web_request    TABLE     �  CREATE TABLE public.web_request (
    id bigint NOT NULL,
    description character varying(255) NOT NULL,
    servicelog boolean NOT NULL,
    buttonstatus boolean NOT NULL,
    cancelinghdw boolean NOT NULL,
    cancelingfrnt boolean NOT NULL,
    sendtomiddleware boolean NOT NULL,
    sendtofrontend boolean NOT NULL,
    datetime timestamp with time zone NOT NULL,
    cabinet_id bigint NOT NULL,
    door_id bigint NOT NULL,
    rack_id bigint NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.web_request;
       public         heap    fedge    false            5           1259    30414    web_request_id_seq    SEQUENCE     �   ALTER TABLE public.web_request ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    310            B           1259    30473    web_servicelog    TABLE     �   CREATE TABLE public.web_servicelog (
    id bigint NOT NULL,
    description text NOT NULL,
    datetime timestamp with time zone NOT NULL,
    request_id bigint NOT NULL
);
 "   DROP TABLE public.web_servicelog;
       public         heap    fedge    false            A           1259    30472    web_servicelog_id_seq    SEQUENCE     �   ALTER TABLE public.web_servicelog ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_servicelog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    322            H           1259    30522    web_shiftassignment    TABLE     �   CREATE TABLE public.web_shiftassignment (
    id bigint NOT NULL,
    starting_date date NOT NULL,
    ending_date date NOT NULL,
    group_id bigint NOT NULL,
    shift_id bigint NOT NULL
);
 '   DROP TABLE public.web_shiftassignment;
       public         heap    fedge    false            G           1259    30521    web_shiftassignment_id_seq    SEQUENCE     �   ALTER TABLE public.web_shiftassignment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_shiftassignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    328            @           1259    30465 
   web_shifts    TABLE     �  CREATE TABLE public.web_shifts (
    id bigint NOT NULL,
    shift character varying(10) NOT NULL,
    shift_start time without time zone NOT NULL,
    shift_end time without time zone NOT NULL,
    extra_time time without time zone NOT NULL,
    shift_start_int integer NOT NULL,
    shift_end_int integer NOT NULL,
    extra_time_int integer NOT NULL,
    type character varying(20) NOT NULL
);
    DROP TABLE public.web_shifts;
       public         heap    fedge    false            ?           1259    30464    web_shifts_id_seq    SEQUENCE     �   ALTER TABLE public.web_shifts ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_shifts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    320            <           1259    30447    web_temperaturesensor    TABLE       CREATE TABLE public.web_temperaturesensor (
    device_ptr_id bigint NOT NULL,
    measuring_environment character varying(16) NOT NULL,
    device_io_module character varying(8) NOT NULL,
    device_port character varying(4) NOT NULL,
    critical_value double precision NOT NULL
);
 )   DROP TABLE public.web_temperaturesensor;
       public         heap    fedge    false            E           1259    30513 !   web_temperaturesensorvalue_id_seq    SEQUENCE     �   ALTER TABLE public.web_temperaturesensorvalue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_temperaturesensorvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    326            >           1259    30455    web_userprofile    TABLE     A  CREATE TABLE public.web_userprofile (
    id bigint NOT NULL,
    firstname character varying(250),
    lastname character varying(250),
    role character varying(100) NOT NULL,
    bereich character varying(1) NOT NULL,
    telephone character varying(15),
    employee_group_id bigint,
    user_id integer NOT NULL
);
 #   DROP TABLE public.web_userprofile;
       public         heap    fedge    false            =           1259    30454    web_userprofile_id_seq    SEQUENCE     �   ALTER TABLE public.web_userprofile ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    318            }          0    29740    cache_inval_bgw_job 
   TABLE DATA           9   COPY _timescaledb_cache.cache_inval_bgw_job  FROM stdin;
    _timescaledb_cache          postgres    false    261   �.      |          0    29743    cache_inval_extension 
   TABLE DATA           ;   COPY _timescaledb_cache.cache_inval_extension  FROM stdin;
    _timescaledb_cache          postgres    false    262   �.      {          0    29737    cache_inval_hypertable 
   TABLE DATA           <   COPY _timescaledb_cache.cache_inval_hypertable  FROM stdin;
    _timescaledb_cache          postgres    false    260   �.      ]          0    29350 
   hypertable 
   TABLE DATA             COPY _timescaledb_catalog.hypertable (id, schema_name, table_name, associated_schema_name, associated_table_prefix, num_dimensions, chunk_sizing_func_schema, chunk_sizing_func_name, chunk_target_size, compression_state, compressed_hypertable_id, replication_factor, status) FROM stdin;
    _timescaledb_catalog          postgres    false    223   �.      e          0    29445    chunk 
   TABLE DATA           �   COPY _timescaledb_catalog.chunk (id, hypertable_id, schema_name, table_name, compressed_chunk_id, dropped, status, osm_chunk) FROM stdin;
    _timescaledb_catalog          postgres    false    233   �/      `          0    29399 	   dimension 
   TABLE DATA           �   COPY _timescaledb_catalog.dimension (id, hypertable_id, column_name, column_type, aligned, num_slices, partitioning_func_schema, partitioning_func, interval_length, compress_interval_length, integer_now_func_schema, integer_now_func) FROM stdin;
    _timescaledb_catalog          postgres    false    228   @0      c          0    29430    dimension_slice 
   TABLE DATA           a   COPY _timescaledb_catalog.dimension_slice (id, dimension_id, range_start, range_end) FROM stdin;
    _timescaledb_catalog          postgres    false    231   �0      g          0    29469    chunk_constraint 
   TABLE DATA           �   COPY _timescaledb_catalog.chunk_constraint (chunk_id, dimension_slice_id, constraint_name, hypertable_constraint_name) FROM stdin;
    _timescaledb_catalog          postgres    false    234   1      j          0    29502    chunk_data_node 
   TABLE DATA           [   COPY _timescaledb_catalog.chunk_data_node (chunk_id, node_chunk_id, node_name) FROM stdin;
    _timescaledb_catalog          postgres    false    237   d2      i          0    29486    chunk_index 
   TABLE DATA           o   COPY _timescaledb_catalog.chunk_index (chunk_id, index_name, hypertable_id, hypertable_index_name) FROM stdin;
    _timescaledb_catalog          postgres    false    236   �2      u          0    29671    compression_chunk_size 
   TABLE DATA             COPY _timescaledb_catalog.compression_chunk_size (chunk_id, compressed_chunk_id, uncompressed_heap_size, uncompressed_toast_size, uncompressed_index_size, compressed_heap_size, compressed_toast_size, compressed_index_size, numrows_pre_compression, numrows_post_compression) FROM stdin;
    _timescaledb_catalog          postgres    false    252   �3      n          0    29573    continuous_agg 
   TABLE DATA             COPY _timescaledb_catalog.continuous_agg (mat_hypertable_id, raw_hypertable_id, parent_mat_hypertable_id, user_view_schema, user_view_name, partial_view_schema, partial_view_name, bucket_width, direct_view_schema, direct_view_name, materialized_only, finalized) FROM stdin;
    _timescaledb_catalog          postgres    false    244   �3      w          0    29707    continuous_agg_migrate_plan 
   TABLE DATA           ~   COPY _timescaledb_catalog.continuous_agg_migrate_plan (mat_hypertable_id, start_ts, end_ts, user_view_definition) FROM stdin;
    _timescaledb_catalog          postgres    false    256    4      x          0    29716     continuous_agg_migrate_plan_step 
   TABLE DATA           �   COPY _timescaledb_catalog.continuous_agg_migrate_plan_step (mat_hypertable_id, step_id, status, start_ts, end_ts, type, config) FROM stdin;
    _timescaledb_catalog          postgres    false    258   4      o          0    29600    continuous_aggs_bucket_function 
   TABLE DATA           �   COPY _timescaledb_catalog.continuous_aggs_bucket_function (mat_hypertable_id, experimental, name, bucket_width, origin, timezone) FROM stdin;
    _timescaledb_catalog          postgres    false    245   :4      r          0    29632 +   continuous_aggs_hypertable_invalidation_log 
   TABLE DATA           �   COPY _timescaledb_catalog.continuous_aggs_hypertable_invalidation_log (hypertable_id, lowest_modified_value, greatest_modified_value) FROM stdin;
    _timescaledb_catalog          postgres    false    248   W4      p          0    29612 &   continuous_aggs_invalidation_threshold 
   TABLE DATA           h   COPY _timescaledb_catalog.continuous_aggs_invalidation_threshold (hypertable_id, watermark) FROM stdin;
    _timescaledb_catalog          postgres    false    246   t4      s          0    29636 0   continuous_aggs_materialization_invalidation_log 
   TABLE DATA           �   COPY _timescaledb_catalog.continuous_aggs_materialization_invalidation_log (materialization_id, lowest_modified_value, greatest_modified_value) FROM stdin;
    _timescaledb_catalog          postgres    false    249   �4      q          0    29622    continuous_aggs_watermark 
   TABLE DATA           _   COPY _timescaledb_catalog.continuous_aggs_watermark (mat_hypertable_id, watermark) FROM stdin;
    _timescaledb_catalog          postgres    false    247   �4      b          0    29417    dimension_partition 
   TABLE DATA           b   COPY _timescaledb_catalog.dimension_partition (dimension_id, range_start, data_nodes) FROM stdin;
    _timescaledb_catalog          postgres    false    229   �4      t          0    29652    hypertable_compression 
   TABLE DATA           �   COPY _timescaledb_catalog.hypertable_compression (hypertable_id, attname, compression_algorithm_id, segmentby_column_index, orderby_column_index, orderby_asc, orderby_nullsfirst) FROM stdin;
    _timescaledb_catalog          postgres    false    251   �4      ^          0    29372    hypertable_data_node 
   TABLE DATA           x   COPY _timescaledb_catalog.hypertable_data_node (hypertable_id, node_hypertable_id, node_name, block_chunks) FROM stdin;
    _timescaledb_catalog          postgres    false    224   5      m          0    29560    metadata 
   TABLE DATA           R   COPY _timescaledb_catalog.metadata (key, value, include_in_telemetry) FROM stdin;
    _timescaledb_catalog          postgres    false    242   "5      v          0    29686 
   remote_txn 
   TABLE DATA           Y   COPY _timescaledb_catalog.remote_txn (data_node_name, remote_transaction_id) FROM stdin;
    _timescaledb_catalog          postgres    false    253   t5      _          0    29385 
   tablespace 
   TABLE DATA           V   COPY _timescaledb_catalog.tablespace (id, hypertable_id, tablespace_name) FROM stdin;
    _timescaledb_catalog          postgres    false    226   �5      l          0    29516    bgw_job 
   TABLE DATA             COPY _timescaledb_config.bgw_job (id, application_name, schedule_interval, max_runtime, max_retries, retry_period, proc_schema, proc_name, owner, scheduled, fixed_schedule, initial_start, hypertable_id, config, check_schema, check_name, timezone) FROM stdin;
    _timescaledb_config          postgres    false    239   �5      �          0    30794    _hyper_1_2_chunk 
   TABLE DATA           �   COPY _timescaledb_internal._hyper_1_2_chunk (id, "time", tempvalue, tempvalue_min, tempvalue_max, humidvalue, valid, temperaturesensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    343   �5      �          0    39058    _hyper_1_9_chunk 
   TABLE DATA           �   COPY _timescaledb_internal._hyper_1_9_chunk (id, "time", tempvalue, tempvalue_min, tempvalue_max, humidvalue, valid, temperaturesensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    350   I6      �          0    39069    _hyper_3_10_chunk 
   TABLE DATA           ^   COPY _timescaledb_internal._hyper_3_10_chunk (id, "time", value, valid, latch_id) FROM stdin;
    _timescaledb_internal          fedge    false    351   �B      �          0    30847    _hyper_3_3_chunk 
   TABLE DATA           ]   COPY _timescaledb_internal._hyper_3_3_chunk (id, "time", value, valid, latch_id) FROM stdin;
    _timescaledb_internal          fedge    false    344   �I      �          0    30783    _hyper_4_1_chunk 
   TABLE DATA           c   COPY _timescaledb_internal._hyper_4_1_chunk (id, "time", value, valid, latchsensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    342   �J      �          0    39047    _hyper_4_8_chunk 
   TABLE DATA           c   COPY _timescaledb_internal._hyper_4_8_chunk (id, "time", value, valid, latchsensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    349   }K      �          0    30858    _hyper_5_4_chunk 
   TABLE DATA           �   COPY _timescaledb_internal._hyper_5_4_chunk (id, "time", energy_value, energy_unit, power_value, power_unit, valid, energysensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    345   O      �          0    39036    _hyper_5_7_chunk 
   TABLE DATA           �   COPY _timescaledb_internal._hyper_5_7_chunk (id, "time", energy_value, energy_unit, power_value, power_unit, valid, energysensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    348   �P      �          0    30880    _hyper_6_6_chunk 
   TABLE DATA           b   COPY _timescaledb_internal._hyper_6_6_chunk (id, "time", value, valid, doorsensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    347   ��      �          0    30869    _hyper_7_5_chunk 
   TABLE DATA           b   COPY _timescaledb_internal._hyper_7_5_chunk (id, "time", value, valid, doorbutton_id) FROM stdin;
    _timescaledb_internal          fedge    false    346   ��      z          0    29732 
   job_errors 
   TABLE DATA           e   COPY _timescaledb_internal.job_errors (job_id, pid, start_time, finish_time, error_data) FROM stdin;
    _timescaledb_internal          postgres    false    259   �      �          0    30172 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          fedge    false    283   -�      �          0    30180    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          fedge    false    285   J�      �          0    30166    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          fedge    false    281   g�      �          0    30186 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          fedge    false    287   ��      �          0    30194    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          fedge    false    289   ��      �          0    30200    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          fedge    false    291   �      �          0    30286    authtoken_token 
   TABLE DATA           @   COPY public.authtoken_token (key, created, user_id) FROM stdin;
    public          fedge    false    294   7�      �          0    30258    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          fedge    false    293   T�      �          0    30300    django_apscheduler_djangojob 
   TABLE DATA           T   COPY public.django_apscheduler_djangojob (id, next_run_time, job_state) FROM stdin;
    public          fedge    false    295   ��      �          0    30310 %   django_apscheduler_djangojobexecution 
   TABLE DATA           �   COPY public.django_apscheduler_djangojobexecution (id, status, run_time, duration, finished, exception, traceback, job_id) FROM stdin;
    public          fedge    false    297   ��      �          0    30158    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          fedge    false    279   ǵ      �          0    30150    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          fedge    false    277   �      �          0    30365    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          fedge    false    298   ��      �          0    30605    web_buttonvalue 
   TABLE DATA           R   COPY public.web_buttonvalue (id, "time", value, valid, doorbutton_id) FROM stdin;
    public          fedge    false    341   	�      �          0    30375    web_cabinet 
   TABLE DATA           t   COPY public.web_cabinet (id, bereich, segment, anlage, arg_sps, pultbereich_sk, station, profinet_name) FROM stdin;
    public          fedge    false    300   &�      �          0    30383 
   web_device 
   TABLE DATA           �   COPY public.web_device (id, geraet, bmk, serial_number, manufacturer, profinet_name, module_type, io_module, port, plc_id, rack_id) FROM stdin;
    public          fedge    false    302   s�      �          0    30393    web_door 
   TABLE DATA           >   COPY public.web_door (id, direction, qr, rack_id) FROM stdin;
    public          fedge    false    304   3�      �          0    30593    web_doorbutton 
   TABLE DATA           o   COPY public.web_doorbutton (device_ptr_id, door_direction, device_io_module, device_port, door_id) FROM stdin;
    public          fedge    false    339   ��      �          0    30420    web_doorsensor 
   TABLE DATA           o   COPY public.web_doorsensor (device_ptr_id, door_direction, device_io_module, device_port, door_id) FROM stdin;
    public          fedge    false    311   )�      �          0    30579    web_doorsensorvalue 
   TABLE DATA           V   COPY public.web_doorsensorvalue (id, "time", value, valid, doorsensor_id) FROM stdin;
    public          fedge    false    338   j�      �          0    30401    web_employeegroup 
   TABLE DATA           8   COPY public.web_employeegroup (id, "group") FROM stdin;
    public          fedge    false    306   ��      �          0    30425    web_energysensor 
   TABLE DATA           b   COPY public.web_energysensor (device_ptr_id, measuring_environment, device_io_module) FROM stdin;
    public          fedge    false    312   ��      �          0    30571    web_energysensorvalue 
   TABLE DATA           �   COPY public.web_energysensorvalue (id, "time", energy_value, energy_unit, power_value, power_unit, valid, energysensor_id) FROM stdin;
    public          fedge    false    336   �      �          0    30432 	   web_latch 
   TABLE DATA           j   COPY public.web_latch (device_ptr_id, door_direction, device_io_module, device_port, door_id) FROM stdin;
    public          fedge    false    313   �      �          0    30437    web_latchsensor 
   TABLE DATA           p   COPY public.web_latchsensor (device_ptr_id, door_direction, device_io_module, device_port, door_id) FROM stdin;
    public          fedge    false    314   C�      �          0    30549    web_latchsensorvalue 
   TABLE DATA           X   COPY public.web_latchsensorvalue (id, "time", value, valid, latchsensor_id) FROM stdin;
    public          fedge    false    334   ��      �          0    30541    web_latchvalue 
   TABLE DATA           L   COPY public.web_latchvalue (id, "time", value, valid, latch_id) FROM stdin;
    public          fedge    false    332   ��      �          0    30442    web_led 
   TABLE DATA           h   COPY public.web_led (device_ptr_id, door_direction, device_io_module, device_port, door_id) FROM stdin;
    public          fedge    false    315   ��      �          0    30528    web_ledvalue 
   TABLE DATA           H   COPY public.web_ledvalue (id, "time", value, valid, led_id) FROM stdin;
    public          fedge    false    330   ��      �          0    30483    web_plc 
   TABLE DATA           �   COPY public.web_plc (id, funktionseinheit, geraet, bmk, ip_address, serial_number, mac_address, manufacturer, profinet_name, cabinet_id) FROM stdin;
    public          fedge    false    324   �      �          0    30409    web_rack 
   TABLE DATA           8   COPY public.web_rack (id, name, cabinet_id) FROM stdin;
    public          fedge    false    308   ��      �          0    30415    web_request 
   TABLE DATA           �   COPY public.web_request (id, description, servicelog, buttonstatus, cancelinghdw, cancelingfrnt, sendtomiddleware, sendtofrontend, datetime, cabinet_id, door_id, rack_id, user_id) FROM stdin;
    public          fedge    false    310   ��      �          0    30473    web_servicelog 
   TABLE DATA           O   COPY public.web_servicelog (id, description, datetime, request_id) FROM stdin;
    public          fedge    false    322   ��      �          0    30522    web_shiftassignment 
   TABLE DATA           a   COPY public.web_shiftassignment (id, starting_date, ending_date, group_id, shift_id) FROM stdin;
    public          fedge    false    328   �      �          0    30465 
   web_shifts 
   TABLE DATA           �   COPY public.web_shifts (id, shift, shift_start, shift_end, extra_time, shift_start_int, shift_end_int, extra_time_int, type) FROM stdin;
    public          fedge    false    320   O�      �          0    30447    web_temperaturesensor 
   TABLE DATA           �   COPY public.web_temperaturesensor (device_ptr_id, measuring_environment, device_io_module, device_port, critical_value) FROM stdin;
    public          fedge    false    316   ��      �          0    30514    web_temperaturesensorvalue 
   TABLE DATA           �   COPY public.web_temperaturesensorvalue (id, "time", tempvalue, tempvalue_min, tempvalue_max, humidvalue, valid, temperaturesensor_id) FROM stdin;
    public          fedge    false    326   �      �          0    30455    web_userprofile 
   TABLE DATA           x   COPY public.web_userprofile (id, firstname, lastname, role, bereich, telephone, employee_group_id, user_id) FROM stdin;
    public          fedge    false    318   ;�      �           0    0    chunk_constraint_name    SEQUENCE SET     R   SELECT pg_catalog.setval('_timescaledb_catalog.chunk_constraint_name', 10, true);
          _timescaledb_catalog          postgres    false    235            �           0    0    chunk_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('_timescaledb_catalog.chunk_id_seq', 10, true);
          _timescaledb_catalog          postgres    false    232            �           0    0 ,   continuous_agg_migrate_plan_step_step_id_seq    SEQUENCE SET     i   SELECT pg_catalog.setval('_timescaledb_catalog.continuous_agg_migrate_plan_step_step_id_seq', 1, false);
          _timescaledb_catalog          postgres    false    257            �           0    0    dimension_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('_timescaledb_catalog.dimension_id_seq', 7, true);
          _timescaledb_catalog          postgres    false    227            �           0    0    dimension_slice_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('_timescaledb_catalog.dimension_slice_id_seq', 10, true);
          _timescaledb_catalog          postgres    false    230            �           0    0    hypertable_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('_timescaledb_catalog.hypertable_id_seq', 7, true);
          _timescaledb_catalog          postgres    false    222            �           0    0    bgw_job_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('_timescaledb_config.bgw_job_id_seq', 1000, false);
          _timescaledb_config          postgres    false    238            �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          fedge    false    282            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          fedge    false    284            �           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 140, true);
          public          fedge    false    280            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          fedge    false    288            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);
          public          fedge    false    286            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, true);
          public          fedge    false    290            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 121, true);
          public          fedge    false    292            �           0    0 ,   django_apscheduler_djangojobexecution_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.django_apscheduler_djangojobexecution_id_seq', 1, false);
          public          fedge    false    296            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 35, true);
          public          fedge    false    278            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 40, true);
          public          fedge    false    276            �           0    0    web_buttonvalue_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.web_buttonvalue_id_seq', 6, true);
          public          fedge    false    340            �           0    0    web_cabinet_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.web_cabinet_id_seq', 2, true);
          public          fedge    false    299            �           0    0    web_device_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.web_device_id_seq', 22, true);
          public          fedge    false    301                        0    0    web_door_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.web_door_id_seq', 8, true);
          public          fedge    false    303                       0    0    web_doorsensorvalue_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.web_doorsensorvalue_id_seq', 12, true);
          public          fedge    false    337                       0    0    web_employeegroup_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.web_employeegroup_id_seq', 4, true);
          public          fedge    false    305                       0    0    web_energysensorvalue_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.web_energysensorvalue_id_seq', 2059, true);
          public          fedge    false    335                       0    0    web_latchsensorvalue_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.web_latchsensorvalue_id_seq', 112, true);
          public          fedge    false    333                       0    0    web_latchvalue_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.web_latchvalue_id_seq', 195, true);
          public          fedge    false    331                       0    0    web_ledvalue_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.web_ledvalue_id_seq', 1, false);
          public          fedge    false    329                       0    0    web_plc_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.web_plc_id_seq', 2, true);
          public          fedge    false    323                       0    0    web_rack_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.web_rack_id_seq', 5, true);
          public          fedge    false    307            	           0    0    web_request_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.web_request_id_seq', 1, false);
          public          fedge    false    309            
           0    0    web_servicelog_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.web_servicelog_id_seq', 1, false);
          public          fedge    false    321                       0    0    web_shiftassignment_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.web_shiftassignment_id_seq', 5, true);
          public          fedge    false    327                       0    0    web_shifts_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.web_shifts_id_seq', 7, true);
          public          fedge    false    319                       0    0 !   web_temperaturesensorvalue_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.web_temperaturesensorvalue_id_seq', 278, true);
          public          fedge    false    325                       0    0    web_userprofile_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.web_userprofile_id_seq', 3, true);
          public          fedge    false    317                       2606    30284    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            fedge    false    283            	           2606    30215 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            fedge    false    285    285                       2606    30184 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            fedge    false    285                       2606    30176    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            fedge    false    283            �           2606    30206 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            fedge    false    281    281                       2606    30170 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            fedge    false    281                       2606    30198 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            fedge    false    289                       2606    30230 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            fedge    false    289    289                       2606    30190    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            fedge    false    287                       2606    30204 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            fedge    false    291                       2606    30244 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            fedge    false    291    291                       2606    30279     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            fedge    false    287            $           2606    30290 $   authtoken_token authtoken_token_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);
 N   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
       public            fedge    false    294            &           2606    30292 +   authtoken_token authtoken_token_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
       public            fedge    false    294                        2606    30265 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            fedge    false    293            )           2606    30327 >   django_apscheduler_djangojob django_apscheduler_djangojob_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.django_apscheduler_djangojob
    ADD CONSTRAINT django_apscheduler_djangojob_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.django_apscheduler_djangojob DROP CONSTRAINT django_apscheduler_djangojob_pkey;
       public            fedge    false    295            ,           2606    30353 P   django_apscheduler_djangojobexecution django_apscheduler_djangojobexecution_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_apscheduler_djangojobexecution
    ADD CONSTRAINT django_apscheduler_djangojobexecution_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.django_apscheduler_djangojobexecution DROP CONSTRAINT django_apscheduler_djangojobexecution_pkey;
       public            fedge    false    297            �           2606    30164 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            fedge    false    279    279            �           2606    30162 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            fedge    false    279            �           2606    30156 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            fedge    false    277            2           2606    30371 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            fedge    false    298            /           2606    30364 ;   django_apscheduler_djangojobexecution unique_job_executions 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_apscheduler_djangojobexecution
    ADD CONSTRAINT unique_job_executions UNIQUE (job_id, run_time);
 e   ALTER TABLE ONLY public.django_apscheduler_djangojobexecution DROP CONSTRAINT unique_job_executions;
       public            fedge    false    297    297            5           2606    30613 >   web_cabinet web_cabinet_bereich_segment_anlage_a_d2140bad_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.web_cabinet
    ADD CONSTRAINT web_cabinet_bereich_segment_anlage_a_d2140bad_uniq UNIQUE (bereich, segment, anlage, arg_sps, pultbereich_sk, station);
 h   ALTER TABLE ONLY public.web_cabinet DROP CONSTRAINT web_cabinet_bereich_segment_anlage_a_d2140bad_uniq;
       public            fedge    false    300    300    300    300    300    300            7           2606    30379    web_cabinet web_cabinet_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.web_cabinet
    ADD CONSTRAINT web_cabinet_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.web_cabinet DROP CONSTRAINT web_cabinet_pkey;
       public            fedge    false    300            :           2606    30381 )   web_cabinet web_cabinet_profinet_name_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.web_cabinet
    ADD CONSTRAINT web_cabinet_profinet_name_key UNIQUE (profinet_name);
 S   ALTER TABLE ONLY public.web_cabinet DROP CONSTRAINT web_cabinet_profinet_name_key;
       public            fedge    false    300            <           2606    30387    web_device web_device_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.web_device
    ADD CONSTRAINT web_device_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.web_device DROP CONSTRAINT web_device_pkey;
       public            fedge    false    302            ?           2606    30603 9   web_device web_device_port_io_module_plc_id_fc6610c0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.web_device
    ADD CONSTRAINT web_device_port_io_module_plc_id_fc6610c0_uniq UNIQUE (port, io_module, plc_id);
 c   ALTER TABLE ONLY public.web_device DROP CONSTRAINT web_device_port_io_module_plc_id_fc6610c0_uniq;
       public            fedge    false    302    302    302            B           2606    30391 '   web_device web_device_profinet_name_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.web_device
    ADD CONSTRAINT web_device_profinet_name_key UNIQUE (profinet_name);
 Q   ALTER TABLE ONLY public.web_device DROP CONSTRAINT web_device_profinet_name_key;
       public            fedge    false    302            F           2606    30389 '   web_device web_device_serial_number_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.web_device
    ADD CONSTRAINT web_device_serial_number_key UNIQUE (serial_number);
 Q   ALTER TABLE ONLY public.web_device DROP CONSTRAINT web_device_serial_number_key;
       public            fedge    false    302            H           2606    30601 1   web_door web_door_direction_rack_id_6ad2611f_uniq 
   CONSTRAINT     z   ALTER TABLE ONLY public.web_door
    ADD CONSTRAINT web_door_direction_rack_id_6ad2611f_uniq UNIQUE (direction, rack_id);
 [   ALTER TABLE ONLY public.web_door DROP CONSTRAINT web_door_direction_rack_id_6ad2611f_uniq;
       public            fedge    false    304    304            J           2606    30397    web_door web_door_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.web_door
    ADD CONSTRAINT web_door_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.web_door DROP CONSTRAINT web_door_pkey;
       public            fedge    false    304            M           2606    30399    web_door web_door_qr_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.web_door
    ADD CONSTRAINT web_door_qr_key UNIQUE (qr);
 B   ALTER TABLE ONLY public.web_door DROP CONSTRAINT web_door_qr_key;
       public            fedge    false    304            �           2606    30599 )   web_doorbutton web_doorbutton_door_id_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.web_doorbutton
    ADD CONSTRAINT web_doorbutton_door_id_key UNIQUE (door_id);
 S   ALTER TABLE ONLY public.web_doorbutton DROP CONSTRAINT web_doorbutton_door_id_key;
       public            fedge    false    339            �           2606    30597 "   web_doorbutton web_doorbutton_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.web_doorbutton
    ADD CONSTRAINT web_doorbutton_pkey PRIMARY KEY (device_ptr_id);
 L   ALTER TABLE ONLY public.web_doorbutton DROP CONSTRAINT web_doorbutton_pkey;
       public            fedge    false    339            `           2606    30587 )   web_doorsensor web_doorsensor_door_id_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.web_doorsensor
    ADD CONSTRAINT web_doorsensor_door_id_key UNIQUE (door_id);
 S   ALTER TABLE ONLY public.web_doorsensor DROP CONSTRAINT web_doorsensor_door_id_key;
       public            fedge    false    311            b           2606    30424 "   web_doorsensor web_doorsensor_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.web_doorsensor
    ADD CONSTRAINT web_doorsensor_pkey PRIMARY KEY (device_ptr_id);
 L   ALTER TABLE ONLY public.web_doorsensor DROP CONSTRAINT web_doorsensor_pkey;
       public            fedge    false    311            Q           2606    30407 -   web_employeegroup web_employeegroup_group_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.web_employeegroup
    ADD CONSTRAINT web_employeegroup_group_key UNIQUE ("group");
 W   ALTER TABLE ONLY public.web_employeegroup DROP CONSTRAINT web_employeegroup_group_key;
       public            fedge    false    306            S           2606    30405 (   web_employeegroup web_employeegroup_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.web_employeegroup
    ADD CONSTRAINT web_employeegroup_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.web_employeegroup DROP CONSTRAINT web_employeegroup_pkey;
       public            fedge    false    306            e           2606    30431 ;   web_energysensor web_energysensor_measuring_environment_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.web_energysensor
    ADD CONSTRAINT web_energysensor_measuring_environment_key UNIQUE (measuring_environment);
 e   ALTER TABLE ONLY public.web_energysensor DROP CONSTRAINT web_energysensor_measuring_environment_key;
       public            fedge    false    312            g           2606    30429 &   web_energysensor web_energysensor_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.web_energysensor
    ADD CONSTRAINT web_energysensor_pkey PRIMARY KEY (device_ptr_id);
 P   ALTER TABLE ONLY public.web_energysensor DROP CONSTRAINT web_energysensor_pkey;
       public            fedge    false    312            i           2606    30564    web_latch web_latch_door_id_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.web_latch
    ADD CONSTRAINT web_latch_door_id_key UNIQUE (door_id);
 I   ALTER TABLE ONLY public.web_latch DROP CONSTRAINT web_latch_door_id_key;
       public            fedge    false    313            k           2606    30436    web_latch web_latch_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.web_latch
    ADD CONSTRAINT web_latch_pkey PRIMARY KEY (device_ptr_id);
 B   ALTER TABLE ONLY public.web_latch DROP CONSTRAINT web_latch_pkey;
       public            fedge    false    313            m           2606    30557 +   web_latchsensor web_latchsensor_door_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.web_latchsensor
    ADD CONSTRAINT web_latchsensor_door_id_key UNIQUE (door_id);
 U   ALTER TABLE ONLY public.web_latchsensor DROP CONSTRAINT web_latchsensor_door_id_key;
       public            fedge    false    314            o           2606    30441 $   web_latchsensor web_latchsensor_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.web_latchsensor
    ADD CONSTRAINT web_latchsensor_pkey PRIMARY KEY (device_ptr_id);
 N   ALTER TABLE ONLY public.web_latchsensor DROP CONSTRAINT web_latchsensor_pkey;
       public            fedge    false    314            r           2606    30446    web_led web_led_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.web_led
    ADD CONSTRAINT web_led_pkey PRIMARY KEY (device_ptr_id);
 >   ALTER TABLE ONLY public.web_led DROP CONSTRAINT web_led_pkey;
       public            fedge    false    315            �           2606    30497    web_plc web_plc_cabinet_id_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.web_plc
    ADD CONSTRAINT web_plc_cabinet_id_key UNIQUE (cabinet_id);
 H   ALTER TABLE ONLY public.web_plc DROP CONSTRAINT web_plc_cabinet_id_key;
       public            fedge    false    324            �           2606    30491    web_plc web_plc_ip_address_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.web_plc
    ADD CONSTRAINT web_plc_ip_address_key UNIQUE (ip_address);
 H   ALTER TABLE ONLY public.web_plc DROP CONSTRAINT web_plc_ip_address_key;
       public            fedge    false    324            �           2606    30489    web_plc web_plc_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.web_plc
    ADD CONSTRAINT web_plc_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.web_plc DROP CONSTRAINT web_plc_pkey;
       public            fedge    false    324            �           2606    30806 !   web_plc web_plc_profinet_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.web_plc
    ADD CONSTRAINT web_plc_profinet_name_key UNIQUE (profinet_name);
 K   ALTER TABLE ONLY public.web_plc DROP CONSTRAINT web_plc_profinet_name_key;
       public            fedge    false    324            �           2606    30493 !   web_plc web_plc_serial_number_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.web_plc
    ADD CONSTRAINT web_plc_serial_number_key UNIQUE (serial_number);
 K   ALTER TABLE ONLY public.web_plc DROP CONSTRAINT web_plc_serial_number_key;
       public            fedge    false    324            V           2606    30620 /   web_rack web_rack_name_cabinet_id_c24add45_uniq 
   CONSTRAINT     v   ALTER TABLE ONLY public.web_rack
    ADD CONSTRAINT web_rack_name_cabinet_id_c24add45_uniq UNIQUE (name, cabinet_id);
 Y   ALTER TABLE ONLY public.web_rack DROP CONSTRAINT web_rack_name_cabinet_id_c24add45_uniq;
       public            fedge    false    308    308            X           2606    30413    web_rack web_rack_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.web_rack
    ADD CONSTRAINT web_rack_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.web_rack DROP CONSTRAINT web_rack_pkey;
       public            fedge    false    308            \           2606    30419    web_request web_request_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.web_request
    ADD CONSTRAINT web_request_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.web_request DROP CONSTRAINT web_request_pkey;
       public            fedge    false    310            �           2606    30479 "   web_servicelog web_servicelog_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.web_servicelog
    ADD CONSTRAINT web_servicelog_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.web_servicelog DROP CONSTRAINT web_servicelog_pkey;
       public            fedge    false    322            �           2606    30481 ,   web_servicelog web_servicelog_request_id_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.web_servicelog
    ADD CONSTRAINT web_servicelog_request_id_key UNIQUE (request_id);
 V   ALTER TABLE ONLY public.web_servicelog DROP CONSTRAINT web_servicelog_request_id_key;
       public            fedge    false    322            �           2606    30719 N   web_shiftassignment web_shiftassignment_group_id_starting_date_e_0ae1ad92_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.web_shiftassignment
    ADD CONSTRAINT web_shiftassignment_group_id_starting_date_e_0ae1ad92_uniq UNIQUE (group_id, starting_date, ending_date);
 x   ALTER TABLE ONLY public.web_shiftassignment DROP CONSTRAINT web_shiftassignment_group_id_starting_date_e_0ae1ad92_uniq;
       public            fedge    false    328    328    328            �           2606    30526 ,   web_shiftassignment web_shiftassignment_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.web_shiftassignment
    ADD CONSTRAINT web_shiftassignment_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.web_shiftassignment DROP CONSTRAINT web_shiftassignment_pkey;
       public            fedge    false    328            ~           2606    30469    web_shifts web_shifts_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.web_shifts
    ADD CONSTRAINT web_shifts_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.web_shifts DROP CONSTRAINT web_shifts_pkey;
       public            fedge    false    320            �           2606    30471    web_shifts web_shifts_shift_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.web_shifts
    ADD CONSTRAINT web_shifts_shift_key UNIQUE (shift);
 I   ALTER TABLE ONLY public.web_shifts DROP CONSTRAINT web_shifts_shift_key;
       public            fedge    false    320            �           2606    30695 ?   web_shifts web_shifts_shift_shift_start_shift_end_9d3a0b50_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.web_shifts
    ADD CONSTRAINT web_shifts_shift_shift_start_shift_end_9d3a0b50_uniq UNIQUE (shift, shift_start, shift_end);
 i   ALTER TABLE ONLY public.web_shifts DROP CONSTRAINT web_shifts_shift_shift_start_shift_end_9d3a0b50_uniq;
       public            fedge    false    320    320    320            u           2606    30453 E   web_temperaturesensor web_temperaturesensor_measuring_environment_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.web_temperaturesensor
    ADD CONSTRAINT web_temperaturesensor_measuring_environment_key UNIQUE (measuring_environment);
 o   ALTER TABLE ONLY public.web_temperaturesensor DROP CONSTRAINT web_temperaturesensor_measuring_environment_key;
       public            fedge    false    316            w           2606    30451 0   web_temperaturesensor web_temperaturesensor_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.web_temperaturesensor
    ADD CONSTRAINT web_temperaturesensor_pkey PRIMARY KEY (device_ptr_id);
 Z   ALTER TABLE ONLY public.web_temperaturesensor DROP CONSTRAINT web_temperaturesensor_pkey;
       public            fedge    false    316            z           2606    30461 $   web_userprofile web_userprofile_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.web_userprofile
    ADD CONSTRAINT web_userprofile_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.web_userprofile DROP CONSTRAINT web_userprofile_pkey;
       public            fedge    false    318            |           2606    30463 +   web_userprofile web_userprofile_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.web_userprofile
    ADD CONSTRAINT web_userprofile_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.web_userprofile DROP CONSTRAINT web_userprofile_user_id_key;
       public            fedge    false    318            �           1259    30804 ?   _hyper_1_2_chunk_web_temperaturesensorvalue_temperaturesensor_i    INDEX     �   CREATE INDEX _hyper_1_2_chunk_web_temperaturesensorvalue_temperaturesensor_i ON _timescaledb_internal._hyper_1_2_chunk USING btree (temperaturesensor_id);
 b   DROP INDEX _timescaledb_internal._hyper_1_2_chunk_web_temperaturesensorvalue_temperaturesensor_i;
       _timescaledb_internal            fedge    false    343            �           1259    30803 4   _hyper_1_2_chunk_web_temperaturesensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_1_2_chunk_web_temperaturesensorvalue_time_idx ON _timescaledb_internal._hyper_1_2_chunk USING btree ("time" DESC);
 W   DROP INDEX _timescaledb_internal._hyper_1_2_chunk_web_temperaturesensorvalue_time_idx;
       _timescaledb_internal            fedge    false    343            �           1259    39068 ?   _hyper_1_9_chunk_web_temperaturesensorvalue_temperaturesensor_i    INDEX     �   CREATE INDEX _hyper_1_9_chunk_web_temperaturesensorvalue_temperaturesensor_i ON _timescaledb_internal._hyper_1_9_chunk USING btree (temperaturesensor_id);
 b   DROP INDEX _timescaledb_internal._hyper_1_9_chunk_web_temperaturesensorvalue_temperaturesensor_i;
       _timescaledb_internal            fedge    false    350            �           1259    39067 4   _hyper_1_9_chunk_web_temperaturesensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_1_9_chunk_web_temperaturesensorvalue_time_idx ON _timescaledb_internal._hyper_1_9_chunk USING btree ("time" DESC);
 W   DROP INDEX _timescaledb_internal._hyper_1_9_chunk_web_temperaturesensorvalue_time_idx;
       _timescaledb_internal            fedge    false    350            �           1259    39079 2   _hyper_3_10_chunk_web_latchvalue_latch_id_a4ab6b18    INDEX     �   CREATE INDEX _hyper_3_10_chunk_web_latchvalue_latch_id_a4ab6b18 ON _timescaledb_internal._hyper_3_10_chunk USING btree (latch_id);
 U   DROP INDEX _timescaledb_internal._hyper_3_10_chunk_web_latchvalue_latch_id_a4ab6b18;
       _timescaledb_internal            fedge    false    351            �           1259    39078 )   _hyper_3_10_chunk_web_latchvalue_time_idx    INDEX     }   CREATE INDEX _hyper_3_10_chunk_web_latchvalue_time_idx ON _timescaledb_internal._hyper_3_10_chunk USING btree ("time" DESC);
 L   DROP INDEX _timescaledb_internal._hyper_3_10_chunk_web_latchvalue_time_idx;
       _timescaledb_internal            fedge    false    351            �           1259    30857 1   _hyper_3_3_chunk_web_latchvalue_latch_id_a4ab6b18    INDEX     �   CREATE INDEX _hyper_3_3_chunk_web_latchvalue_latch_id_a4ab6b18 ON _timescaledb_internal._hyper_3_3_chunk USING btree (latch_id);
 T   DROP INDEX _timescaledb_internal._hyper_3_3_chunk_web_latchvalue_latch_id_a4ab6b18;
       _timescaledb_internal            fedge    false    344            �           1259    30856 (   _hyper_3_3_chunk_web_latchvalue_time_idx    INDEX     {   CREATE INDEX _hyper_3_3_chunk_web_latchvalue_time_idx ON _timescaledb_internal._hyper_3_3_chunk USING btree ("time" DESC);
 K   DROP INDEX _timescaledb_internal._hyper_3_3_chunk_web_latchvalue_time_idx;
       _timescaledb_internal            fedge    false    344            �           1259    30793 =   _hyper_4_1_chunk_web_latchsensorvalue_latchsensor_id_ffe98258    INDEX     �   CREATE INDEX _hyper_4_1_chunk_web_latchsensorvalue_latchsensor_id_ffe98258 ON _timescaledb_internal._hyper_4_1_chunk USING btree (latchsensor_id);
 `   DROP INDEX _timescaledb_internal._hyper_4_1_chunk_web_latchsensorvalue_latchsensor_id_ffe98258;
       _timescaledb_internal            fedge    false    342            �           1259    30792 .   _hyper_4_1_chunk_web_latchsensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_4_1_chunk_web_latchsensorvalue_time_idx ON _timescaledb_internal._hyper_4_1_chunk USING btree ("time" DESC);
 Q   DROP INDEX _timescaledb_internal._hyper_4_1_chunk_web_latchsensorvalue_time_idx;
       _timescaledb_internal            fedge    false    342            �           1259    39057 =   _hyper_4_8_chunk_web_latchsensorvalue_latchsensor_id_ffe98258    INDEX     �   CREATE INDEX _hyper_4_8_chunk_web_latchsensorvalue_latchsensor_id_ffe98258 ON _timescaledb_internal._hyper_4_8_chunk USING btree (latchsensor_id);
 `   DROP INDEX _timescaledb_internal._hyper_4_8_chunk_web_latchsensorvalue_latchsensor_id_ffe98258;
       _timescaledb_internal            fedge    false    349            �           1259    39056 .   _hyper_4_8_chunk_web_latchsensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_4_8_chunk_web_latchsensorvalue_time_idx ON _timescaledb_internal._hyper_4_8_chunk USING btree ("time" DESC);
 Q   DROP INDEX _timescaledb_internal._hyper_4_8_chunk_web_latchsensorvalue_time_idx;
       _timescaledb_internal            fedge    false    349            �           1259    30868 ?   _hyper_5_4_chunk_web_energysensorvalue_energysensor_id_f907147c    INDEX     �   CREATE INDEX _hyper_5_4_chunk_web_energysensorvalue_energysensor_id_f907147c ON _timescaledb_internal._hyper_5_4_chunk USING btree (energysensor_id);
 b   DROP INDEX _timescaledb_internal._hyper_5_4_chunk_web_energysensorvalue_energysensor_id_f907147c;
       _timescaledb_internal            fedge    false    345            �           1259    30867 /   _hyper_5_4_chunk_web_energysensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_5_4_chunk_web_energysensorvalue_time_idx ON _timescaledb_internal._hyper_5_4_chunk USING btree ("time" DESC);
 R   DROP INDEX _timescaledb_internal._hyper_5_4_chunk_web_energysensorvalue_time_idx;
       _timescaledb_internal            fedge    false    345            �           1259    39046 ?   _hyper_5_7_chunk_web_energysensorvalue_energysensor_id_f907147c    INDEX     �   CREATE INDEX _hyper_5_7_chunk_web_energysensorvalue_energysensor_id_f907147c ON _timescaledb_internal._hyper_5_7_chunk USING btree (energysensor_id);
 b   DROP INDEX _timescaledb_internal._hyper_5_7_chunk_web_energysensorvalue_energysensor_id_f907147c;
       _timescaledb_internal            fedge    false    348            �           1259    39045 /   _hyper_5_7_chunk_web_energysensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_5_7_chunk_web_energysensorvalue_time_idx ON _timescaledb_internal._hyper_5_7_chunk USING btree ("time" DESC);
 R   DROP INDEX _timescaledb_internal._hyper_5_7_chunk_web_energysensorvalue_time_idx;
       _timescaledb_internal            fedge    false    348            �           1259    30890 ;   _hyper_6_6_chunk_web_doorsensorvalue_doorsensor_id_04eda24b    INDEX     �   CREATE INDEX _hyper_6_6_chunk_web_doorsensorvalue_doorsensor_id_04eda24b ON _timescaledb_internal._hyper_6_6_chunk USING btree (doorsensor_id);
 ^   DROP INDEX _timescaledb_internal._hyper_6_6_chunk_web_doorsensorvalue_doorsensor_id_04eda24b;
       _timescaledb_internal            fedge    false    347            �           1259    30889 -   _hyper_6_6_chunk_web_doorsensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_6_6_chunk_web_doorsensorvalue_time_idx ON _timescaledb_internal._hyper_6_6_chunk USING btree ("time" DESC);
 P   DROP INDEX _timescaledb_internal._hyper_6_6_chunk_web_doorsensorvalue_time_idx;
       _timescaledb_internal            fedge    false    347            �           1259    30879 7   _hyper_7_5_chunk_web_buttonvalue_doorbutton_id_0701aa20    INDEX     �   CREATE INDEX _hyper_7_5_chunk_web_buttonvalue_doorbutton_id_0701aa20 ON _timescaledb_internal._hyper_7_5_chunk USING btree (doorbutton_id);
 Z   DROP INDEX _timescaledb_internal._hyper_7_5_chunk_web_buttonvalue_doorbutton_id_0701aa20;
       _timescaledb_internal            fedge    false    346            �           1259    30878 )   _hyper_7_5_chunk_web_buttonvalue_time_idx    INDEX     |   CREATE INDEX _hyper_7_5_chunk_web_buttonvalue_time_idx ON _timescaledb_internal._hyper_7_5_chunk USING btree ("time" DESC);
 L   DROP INDEX _timescaledb_internal._hyper_7_5_chunk_web_buttonvalue_time_idx;
       _timescaledb_internal            fedge    false    346                       1259    30285    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            fedge    false    283                       1259    30226 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            fedge    false    285            
           1259    30227 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            fedge    false    285            �           1259    30212 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            fedge    false    281                       1259    30242 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            fedge    false    289                       1259    30241 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            fedge    false    289                       1259    30256 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            fedge    false    291                       1259    30255 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            fedge    false    291                       1259    30280     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            fedge    false    287            "           1259    30298 !   authtoken_token_key_10f0b77e_like    INDEX     p   CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);
 5   DROP INDEX public.authtoken_token_key_10f0b77e_like;
       public            fedge    false    294                       1259    30276 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            fedge    false    293            !           1259    30277 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            fedge    false    293            '           1259    30318 3   django_apscheduler_djangojob_next_run_time_2f022619    INDEX     �   CREATE INDEX django_apscheduler_djangojob_next_run_time_2f022619 ON public.django_apscheduler_djangojob USING btree (next_run_time);
 G   DROP INDEX public.django_apscheduler_djangojob_next_run_time_2f022619;
       public            fedge    false    295            *           1259    30337 5   django_apscheduler_djangojobexecution_job_id_daf5090a    INDEX     �   CREATE INDEX django_apscheduler_djangojobexecution_job_id_daf5090a ON public.django_apscheduler_djangojobexecution USING btree (job_id);
 I   DROP INDEX public.django_apscheduler_djangojobexecution_job_id_daf5090a;
       public            fedge    false    297            -           1259    30324 7   django_apscheduler_djangojobexecution_run_time_16edd96b    INDEX     �   CREATE INDEX django_apscheduler_djangojobexecution_run_time_16edd96b ON public.django_apscheduler_djangojobexecution USING btree (run_time);
 K   DROP INDEX public.django_apscheduler_djangojobexecution_run_time_16edd96b;
       public            fedge    false    297            0           1259    30373 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            fedge    false    298            3           1259    30372 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            fedge    false    298            �           1259    30778 &   web_buttonvalue_doorbutton_id_0701aa20    INDEX     k   CREATE INDEX web_buttonvalue_doorbutton_id_0701aa20 ON public.web_buttonvalue USING btree (doorbutton_id);
 :   DROP INDEX public.web_buttonvalue_doorbutton_id_0701aa20;
       public            fedge    false    341            �           1259    30611    web_buttonvalue_time_idx    INDEX     [   CREATE INDEX web_buttonvalue_time_idx ON public.web_buttonvalue USING btree ("time" DESC);
 ,   DROP INDEX public.web_buttonvalue_time_idx;
       public            fedge    false    341            8           1259    30614 '   web_cabinet_profinet_name_f8233ef8_like    INDEX     |   CREATE INDEX web_cabinet_profinet_name_f8233ef8_like ON public.web_cabinet USING btree (profinet_name varchar_pattern_ops);
 ;   DROP INDEX public.web_cabinet_profinet_name_f8233ef8_like;
       public            fedge    false    300            =           1259    30710    web_device_plc_id_2ef6c780    INDEX     S   CREATE INDEX web_device_plc_id_2ef6c780 ON public.web_device USING btree (plc_id);
 .   DROP INDEX public.web_device_plc_id_2ef6c780;
       public            fedge    false    302            @           1259    30616 &   web_device_profinet_name_0a1981d0_like    INDEX     z   CREATE INDEX web_device_profinet_name_0a1981d0_like ON public.web_device USING btree (profinet_name varchar_pattern_ops);
 :   DROP INDEX public.web_device_profinet_name_0a1981d0_like;
       public            fedge    false    302            C           1259    30711    web_device_rack_id_743160c8    INDEX     U   CREATE INDEX web_device_rack_id_743160c8 ON public.web_device USING btree (rack_id);
 /   DROP INDEX public.web_device_rack_id_743160c8;
       public            fedge    false    302            D           1259    30615 &   web_device_serial_number_0fa9728a_like    INDEX     z   CREATE INDEX web_device_serial_number_0fa9728a_like ON public.web_device USING btree (serial_number varchar_pattern_ops);
 :   DROP INDEX public.web_device_serial_number_0fa9728a_like;
       public            fedge    false    302            K           1259    30617    web_door_qr_4c4838cf_like    INDEX     `   CREATE INDEX web_door_qr_4c4838cf_like ON public.web_door USING btree (qr varchar_pattern_ops);
 -   DROP INDEX public.web_door_qr_4c4838cf_like;
       public            fedge    false    304            N           1259    30709    web_door_rack_id_891dfe2e    INDEX     Q   CREATE INDEX web_door_rack_id_891dfe2e ON public.web_door USING btree (rack_id);
 -   DROP INDEX public.web_door_rack_id_891dfe2e;
       public            fedge    false    304            �           1259    30762 *   web_doorsensorvalue_doorsensor_id_04eda24b    INDEX     s   CREATE INDEX web_doorsensorvalue_doorsensor_id_04eda24b ON public.web_doorsensorvalue USING btree (doorsensor_id);
 >   DROP INDEX public.web_doorsensorvalue_doorsensor_id_04eda24b;
       public            fedge    false    338            �           1259    30585    web_doorsensorvalue_time_idx    INDEX     c   CREATE INDEX web_doorsensorvalue_time_idx ON public.web_doorsensorvalue USING btree ("time" DESC);
 0   DROP INDEX public.web_doorsensorvalue_time_idx;
       public            fedge    false    338            O           1259    30618 %   web_employeegroup_group_70b8cccc_like    INDEX     z   CREATE INDEX web_employeegroup_group_70b8cccc_like ON public.web_employeegroup USING btree ("group" varchar_pattern_ops);
 9   DROP INDEX public.web_employeegroup_group_70b8cccc_like;
       public            fedge    false    306            c           1259    30661 4   web_energysensor_measuring_environment_7386e8b2_like    INDEX     �   CREATE INDEX web_energysensor_measuring_environment_7386e8b2_like ON public.web_energysensor USING btree (measuring_environment varchar_pattern_ops);
 H   DROP INDEX public.web_energysensor_measuring_environment_7386e8b2_like;
       public            fedge    false    312            �           1259    30756 .   web_energysensorvalue_energysensor_id_f907147c    INDEX     {   CREATE INDEX web_energysensorvalue_energysensor_id_f907147c ON public.web_energysensorvalue USING btree (energysensor_id);
 B   DROP INDEX public.web_energysensorvalue_energysensor_id_f907147c;
       public            fedge    false    336            �           1259    30577    web_energysensorvalue_time_idx    INDEX     g   CREATE INDEX web_energysensorvalue_time_idx ON public.web_energysensorvalue USING btree ("time" DESC);
 2   DROP INDEX public.web_energysensorvalue_time_idx;
       public            fedge    false    336            �           1259    30750 ,   web_latchsensorvalue_latchsensor_id_ffe98258    INDEX     w   CREATE INDEX web_latchsensorvalue_latchsensor_id_ffe98258 ON public.web_latchsensorvalue USING btree (latchsensor_id);
 @   DROP INDEX public.web_latchsensorvalue_latchsensor_id_ffe98258;
       public            fedge    false    334            �           1259    30555    web_latchsensorvalue_time_idx    INDEX     e   CREATE INDEX web_latchsensorvalue_time_idx ON public.web_latchsensorvalue USING btree ("time" DESC);
 1   DROP INDEX public.web_latchsensorvalue_time_idx;
       public            fedge    false    334            �           1259    30744     web_latchvalue_latch_id_a4ab6b18    INDEX     _   CREATE INDEX web_latchvalue_latch_id_a4ab6b18 ON public.web_latchvalue USING btree (latch_id);
 4   DROP INDEX public.web_latchvalue_latch_id_a4ab6b18;
       public            fedge    false    332            �           1259    30547    web_latchvalue_time_idx    INDEX     Y   CREATE INDEX web_latchvalue_time_idx ON public.web_latchvalue USING btree ("time" DESC);
 +   DROP INDEX public.web_latchvalue_time_idx;
       public            fedge    false    332            p           1259    30738    web_led_door_id_ed3e81da    INDEX     O   CREATE INDEX web_led_door_id_ed3e81da ON public.web_led USING btree (door_id);
 ,   DROP INDEX public.web_led_door_id_ed3e81da;
       public            fedge    false    315            �           1259    30737    web_ledvalue_led_id_950da7bb    INDEX     W   CREATE INDEX web_ledvalue_led_id_950da7bb ON public.web_ledvalue USING btree (led_id);
 0   DROP INDEX public.web_ledvalue_led_id_950da7bb;
       public            fedge    false    330            �           1259    30534    web_ledvalue_time_idx    INDEX     U   CREATE INDEX web_ledvalue_time_idx ON public.web_ledvalue USING btree ("time" DESC);
 )   DROP INDEX public.web_ledvalue_time_idx;
       public            fedge    false    330            �           1259    30807 #   web_plc_profinet_name_98d179cc_like    INDEX     t   CREATE INDEX web_plc_profinet_name_98d179cc_like ON public.web_plc USING btree (profinet_name varchar_pattern_ops);
 7   DROP INDEX public.web_plc_profinet_name_98d179cc_like;
       public            fedge    false    324            �           1259    30707 #   web_plc_serial_number_a750f39f_like    INDEX     t   CREATE INDEX web_plc_serial_number_a750f39f_like ON public.web_plc USING btree (serial_number varchar_pattern_ops);
 7   DROP INDEX public.web_plc_serial_number_a750f39f_like;
       public            fedge    false    324            T           1259    30626    web_rack_cabinet_id_2c2a8a9e    INDEX     W   CREATE INDEX web_rack_cabinet_id_2c2a8a9e ON public.web_rack USING btree (cabinet_id);
 0   DROP INDEX public.web_rack_cabinet_id_2c2a8a9e;
       public            fedge    false    308            Y           1259    30647    web_request_cabinet_id_f6bc764b    INDEX     ]   CREATE INDEX web_request_cabinet_id_f6bc764b ON public.web_request USING btree (cabinet_id);
 3   DROP INDEX public.web_request_cabinet_id_f6bc764b;
       public            fedge    false    310            Z           1259    30648    web_request_door_id_fdca5e72    INDEX     W   CREATE INDEX web_request_door_id_fdca5e72 ON public.web_request USING btree (door_id);
 0   DROP INDEX public.web_request_door_id_fdca5e72;
       public            fedge    false    310            ]           1259    30649    web_request_rack_id_d737060f    INDEX     W   CREATE INDEX web_request_rack_id_d737060f ON public.web_request USING btree (rack_id);
 0   DROP INDEX public.web_request_rack_id_d737060f;
       public            fedge    false    310            ^           1259    30650    web_request_user_id_f52134a7    INDEX     W   CREATE INDEX web_request_user_id_f52134a7 ON public.web_request USING btree (user_id);
 0   DROP INDEX public.web_request_user_id_f52134a7;
       public            fedge    false    310            �           1259    30730 %   web_shiftassignment_group_id_d0db81d3    INDEX     i   CREATE INDEX web_shiftassignment_group_id_d0db81d3 ON public.web_shiftassignment USING btree (group_id);
 9   DROP INDEX public.web_shiftassignment_group_id_d0db81d3;
       public            fedge    false    328            �           1259    30731 %   web_shiftassignment_shift_id_1006d335    INDEX     i   CREATE INDEX web_shiftassignment_shift_id_1006d335 ON public.web_shiftassignment USING btree (shift_id);
 9   DROP INDEX public.web_shiftassignment_shift_id_1006d335;
       public            fedge    false    328                       1259    30696    web_shifts_shift_3d29dc0b_like    INDEX     j   CREATE INDEX web_shifts_shift_3d29dc0b_like ON public.web_shifts USING btree (shift varchar_pattern_ops);
 2   DROP INDEX public.web_shifts_shift_3d29dc0b_like;
       public            fedge    false    320            s           1259    30682 9   web_temperaturesensor_measuring_environment_09631ed5_like    INDEX     �   CREATE INDEX web_temperaturesensor_measuring_environment_09631ed5_like ON public.web_temperaturesensor USING btree (measuring_environment varchar_pattern_ops);
 M   DROP INDEX public.web_temperaturesensor_measuring_environment_09631ed5_like;
       public            fedge    false    316            �           1259    30717 8   web_temperaturesensorvalue_temperaturesensor_id_9f28af1f    INDEX     �   CREATE INDEX web_temperaturesensorvalue_temperaturesensor_id_9f28af1f ON public.web_temperaturesensorvalue USING btree (temperaturesensor_id);
 L   DROP INDEX public.web_temperaturesensorvalue_temperaturesensor_id_9f28af1f;
       public            fedge    false    326            �           1259    30520 #   web_temperaturesensorvalue_time_idx    INDEX     q   CREATE INDEX web_temperaturesensorvalue_time_idx ON public.web_temperaturesensorvalue USING btree ("time" DESC);
 7   DROP INDEX public.web_temperaturesensorvalue_time_idx;
       public            fedge    false    326            x           1259    30693 *   web_userprofile_employee_group_id_46a1fb99    INDEX     s   CREATE INDEX web_userprofile_employee_group_id_46a1fb99 ON public.web_userprofile USING btree (employee_group_id);
 >   DROP INDEX public.web_userprofile_employee_group_id_46a1fb99;
       public            fedge    false    318            �           2620    30610 !   web_buttonvalue ts_insert_blocker    TRIGGER     �   CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.web_buttonvalue FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();
 :   DROP TRIGGER ts_insert_blocker ON public.web_buttonvalue;
       public          fedge    false    2    2    341            �           2620    30584 %   web_doorsensorvalue ts_insert_blocker    TRIGGER     �   CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.web_doorsensorvalue FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();
 >   DROP TRIGGER ts_insert_blocker ON public.web_doorsensorvalue;
       public          fedge    false    338    2    2            �           2620    30576 '   web_energysensorvalue ts_insert_blocker    TRIGGER     �   CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.web_energysensorvalue FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();
 @   DROP TRIGGER ts_insert_blocker ON public.web_energysensorvalue;
       public          fedge    false    336    2    2            �           2620    30554 &   web_latchsensorvalue ts_insert_blocker    TRIGGER     �   CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.web_latchsensorvalue FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();
 ?   DROP TRIGGER ts_insert_blocker ON public.web_latchsensorvalue;
       public          fedge    false    334    2    2            �           2620    30546     web_latchvalue ts_insert_blocker    TRIGGER     �   CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.web_latchvalue FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();
 9   DROP TRIGGER ts_insert_blocker ON public.web_latchvalue;
       public          fedge    false    332    2    2            �           2620    30533    web_ledvalue ts_insert_blocker    TRIGGER     �   CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.web_ledvalue FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();
 7   DROP TRIGGER ts_insert_blocker ON public.web_ledvalue;
       public          fedge    false    2    2    330            �           2620    30519 ,   web_temperaturesensorvalue ts_insert_blocker    TRIGGER     �   CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.web_temperaturesensorvalue FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();
 E   DROP TRIGGER ts_insert_blocker ON public.web_temperaturesensorvalue;
       public          fedge    false    2    2    326            �           2606    39072 Q   _hyper_3_10_chunk 10_10_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_3_10_chunk
    ADD CONSTRAINT "10_10_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_" FOREIGN KEY (latch_id) REFERENCES public.web_latch(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_3_10_chunk DROP CONSTRAINT "10_10_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_";
       _timescaledb_internal          fedge    false    351    4203    313            �           2606    30786 N   _hyper_4_1_chunk 1_1_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_4_1_chunk
    ADD CONSTRAINT "1_1_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch" FOREIGN KEY (latchsensor_id) REFERENCES public.web_latchsensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_4_1_chunk DROP CONSTRAINT "1_1_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch";
       _timescaledb_internal          fedge    false    342    314    4207            �           2606    30797 P   _hyper_1_2_chunk 2_2_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_t    FK CONSTRAINT       ALTER TABLE ONLY _timescaledb_internal._hyper_1_2_chunk
    ADD CONSTRAINT "2_2_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_t" FOREIGN KEY (temperaturesensor_id) REFERENCES public.web_temperaturesensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_1_2_chunk DROP CONSTRAINT "2_2_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_t";
       _timescaledb_internal          fedge    false    4215    343    316            �           2606    30850 P   _hyper_3_3_chunk 3_3_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_id    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_3_3_chunk
    ADD CONSTRAINT "3_3_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_id" FOREIGN KEY (latch_id) REFERENCES public.web_latch(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_3_3_chunk DROP CONSTRAINT "3_3_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_id";
       _timescaledb_internal          fedge    false    4203    313    344            �           2606    30861 O   _hyper_5_4_chunk 4_4_web_energysensorvalu_energysensor_id_f907147c_fk_web_energ    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_5_4_chunk
    ADD CONSTRAINT "4_4_web_energysensorvalu_energysensor_id_f907147c_fk_web_energ" FOREIGN KEY (energysensor_id) REFERENCES public.web_energysensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_5_4_chunk DROP CONSTRAINT "4_4_web_energysensorvalu_energysensor_id_f907147c_fk_web_energ";
       _timescaledb_internal          fedge    false    312    4199    345            �           2606    30872 H   _hyper_7_5_chunk 5_5_web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_7_5_chunk
    ADD CONSTRAINT "5_5_web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb" FOREIGN KEY (doorbutton_id) REFERENCES public.web_doorbutton(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_7_5_chunk DROP CONSTRAINT "5_5_web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb";
       _timescaledb_internal          fedge    false    339    4265    346            �           2606    30883 L   _hyper_6_6_chunk 6_6_web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_6_6_chunk
    ADD CONSTRAINT "6_6_web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors" FOREIGN KEY (doorsensor_id) REFERENCES public.web_doorsensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_6_6_chunk DROP CONSTRAINT "6_6_web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors";
       _timescaledb_internal          fedge    false    347    4194    311            �           2606    39039 O   _hyper_5_7_chunk 7_7_web_energysensorvalu_energysensor_id_f907147c_fk_web_energ    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_5_7_chunk
    ADD CONSTRAINT "7_7_web_energysensorvalu_energysensor_id_f907147c_fk_web_energ" FOREIGN KEY (energysensor_id) REFERENCES public.web_energysensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_5_7_chunk DROP CONSTRAINT "7_7_web_energysensorvalu_energysensor_id_f907147c_fk_web_energ";
       _timescaledb_internal          fedge    false    312    4199    348            �           2606    39050 N   _hyper_4_8_chunk 8_8_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_4_8_chunk
    ADD CONSTRAINT "8_8_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch" FOREIGN KEY (latchsensor_id) REFERENCES public.web_latchsensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_4_8_chunk DROP CONSTRAINT "8_8_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch";
       _timescaledb_internal          fedge    false    314    349    4207            �           2606    39061 P   _hyper_1_9_chunk 9_9_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_t    FK CONSTRAINT       ALTER TABLE ONLY _timescaledb_internal._hyper_1_9_chunk
    ADD CONSTRAINT "9_9_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_t" FOREIGN KEY (temperaturesensor_id) REFERENCES public.web_temperaturesensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_1_9_chunk DROP CONSTRAINT "9_9_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_t";
       _timescaledb_internal          fedge    false    4215    316    350            �           2606    30221 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          fedge    false    281    285    4097            �           2606    30216 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          fedge    false    4102    283    285            �           2606    30207 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          fedge    false    279    281    4092            �           2606    30236 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          fedge    false    4102    283    289            �           2606    30231 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          fedge    false    4110    287    289            �           2606    30250 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          fedge    false    281    4097    291            �           2606    30245 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          fedge    false    287    4110    291            �           2606    30293 @   authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id;
       public          fedge    false    294    287    4110            �           2606    30266 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          fedge    false    279    293    4092            �           2606    30271 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          fedge    false    287    293    4110            �           2606    30346 ^   django_apscheduler_djangojobexecution django_apscheduler_djangojobexecution_job_id_daf5090a_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_apscheduler_djangojobexecution
    ADD CONSTRAINT django_apscheduler_djangojobexecution_job_id_daf5090a_fk FOREIGN KEY (job_id) REFERENCES public.django_apscheduler_djangojob(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.django_apscheduler_djangojobexecution DROP CONSTRAINT django_apscheduler_djangojobexecution_job_id_daf5090a_fk;
       public          fedge    false    4137    297    295            �           2606    30773 C   web_buttonvalue web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_buttonvalue
    ADD CONSTRAINT web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb FOREIGN KEY (doorbutton_id) REFERENCES public.web_doorbutton(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.web_buttonvalue DROP CONSTRAINT web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb;
       public          fedge    false    341    4265    339            �           2606    30503 3   web_device web_device_plc_id_2ef6c780_fk_web_plc_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_device
    ADD CONSTRAINT web_device_plc_id_2ef6c780_fk_web_plc_id FOREIGN KEY (plc_id) REFERENCES public.web_plc(id) DEFERRABLE INITIALLY DEFERRED;
 ]   ALTER TABLE ONLY public.web_device DROP CONSTRAINT web_device_plc_id_2ef6c780_fk_web_plc_id;
       public          fedge    false    324    4237    302            �           2606    30508 5   web_device web_device_rack_id_743160c8_fk_web_rack_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_device
    ADD CONSTRAINT web_device_rack_id_743160c8_fk_web_rack_id FOREIGN KEY (rack_id) REFERENCES public.web_rack(id) DEFERRABLE INITIALLY DEFERRED;
 _   ALTER TABLE ONLY public.web_device DROP CONSTRAINT web_device_rack_id_743160c8_fk_web_rack_id;
       public          fedge    false    4184    308    302            �           2606    30498 1   web_door web_door_rack_id_891dfe2e_fk_web_rack_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_door
    ADD CONSTRAINT web_door_rack_id_891dfe2e_fk_web_rack_id FOREIGN KEY (rack_id) REFERENCES public.web_rack(id) DEFERRABLE INITIALLY DEFERRED;
 [   ALTER TABLE ONLY public.web_door DROP CONSTRAINT web_door_rack_id_891dfe2e_fk_web_rack_id;
       public          fedge    false    4184    308    304            �           2606    30763 E   web_doorbutton web_doorbutton_device_ptr_id_ec1b8c41_fk_web_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_doorbutton
    ADD CONSTRAINT web_doorbutton_device_ptr_id_ec1b8c41_fk_web_device_id FOREIGN KEY (device_ptr_id) REFERENCES public.web_device(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.web_doorbutton DROP CONSTRAINT web_doorbutton_device_ptr_id_ec1b8c41_fk_web_device_id;
       public          fedge    false    339    302    4156            �           2606    30768 =   web_doorbutton web_doorbutton_door_id_cd37f08f_fk_web_door_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_doorbutton
    ADD CONSTRAINT web_doorbutton_door_id_cd37f08f_fk_web_door_id FOREIGN KEY (door_id) REFERENCES public.web_door(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.web_doorbutton DROP CONSTRAINT web_doorbutton_door_id_cd37f08f_fk_web_door_id;
       public          fedge    false    339    4170    304            �           2606    30651 E   web_doorsensor web_doorsensor_device_ptr_id_4b6faf1d_fk_web_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_doorsensor
    ADD CONSTRAINT web_doorsensor_device_ptr_id_4b6faf1d_fk_web_device_id FOREIGN KEY (device_ptr_id) REFERENCES public.web_device(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.web_doorsensor DROP CONSTRAINT web_doorsensor_device_ptr_id_4b6faf1d_fk_web_device_id;
       public          fedge    false    311    302    4156            �           2606    30588 =   web_doorsensor web_doorsensor_door_id_6e3e7656_fk_web_door_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_doorsensor
    ADD CONSTRAINT web_doorsensor_door_id_6e3e7656_fk_web_door_id FOREIGN KEY (door_id) REFERENCES public.web_door(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.web_doorsensor DROP CONSTRAINT web_doorsensor_door_id_6e3e7656_fk_web_door_id;
       public          fedge    false    304    4170    311            �           2606    30757 K   web_doorsensorvalue web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_doorsensorvalue
    ADD CONSTRAINT web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors FOREIGN KEY (doorsensor_id) REFERENCES public.web_doorsensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.web_doorsensorvalue DROP CONSTRAINT web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors;
       public          fedge    false    311    4194    338            �           2606    30656 I   web_energysensor web_energysensor_device_ptr_id_de675ece_fk_web_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_energysensor
    ADD CONSTRAINT web_energysensor_device_ptr_id_de675ece_fk_web_device_id FOREIGN KEY (device_ptr_id) REFERENCES public.web_device(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.web_energysensor DROP CONSTRAINT web_energysensor_device_ptr_id_de675ece_fk_web_device_id;
       public          fedge    false    4156    302    312            �           2606    30751 P   web_energysensorvalue web_energysensorvalu_energysensor_id_f907147c_fk_web_energ    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_energysensorvalue
    ADD CONSTRAINT web_energysensorvalu_energysensor_id_f907147c_fk_web_energ FOREIGN KEY (energysensor_id) REFERENCES public.web_energysensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.web_energysensorvalue DROP CONSTRAINT web_energysensorvalu_energysensor_id_f907147c_fk_web_energ;
       public          fedge    false    336    4199    312            �           2606    30662 ;   web_latch web_latch_device_ptr_id_2ad80e48_fk_web_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_latch
    ADD CONSTRAINT web_latch_device_ptr_id_2ad80e48_fk_web_device_id FOREIGN KEY (device_ptr_id) REFERENCES public.web_device(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.web_latch DROP CONSTRAINT web_latch_device_ptr_id_2ad80e48_fk_web_device_id;
       public          fedge    false    302    4156    313            �           2606    30565 3   web_latch web_latch_door_id_c7f2a266_fk_web_door_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_latch
    ADD CONSTRAINT web_latch_door_id_c7f2a266_fk_web_door_id FOREIGN KEY (door_id) REFERENCES public.web_door(id) DEFERRABLE INITIALLY DEFERRED;
 ]   ALTER TABLE ONLY public.web_latch DROP CONSTRAINT web_latch_door_id_c7f2a266_fk_web_door_id;
       public          fedge    false    4170    313    304            �           2606    30667 G   web_latchsensor web_latchsensor_device_ptr_id_5209f886_fk_web_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_latchsensor
    ADD CONSTRAINT web_latchsensor_device_ptr_id_5209f886_fk_web_device_id FOREIGN KEY (device_ptr_id) REFERENCES public.web_device(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.web_latchsensor DROP CONSTRAINT web_latchsensor_device_ptr_id_5209f886_fk_web_device_id;
       public          fedge    false    302    314    4156            �           2606    30558 ?   web_latchsensor web_latchsensor_door_id_fae2e3c6_fk_web_door_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_latchsensor
    ADD CONSTRAINT web_latchsensor_door_id_fae2e3c6_fk_web_door_id FOREIGN KEY (door_id) REFERENCES public.web_door(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.web_latchsensor DROP CONSTRAINT web_latchsensor_door_id_fae2e3c6_fk_web_door_id;
       public          fedge    false    4170    304    314            �           2606    30745 N   web_latchsensorvalue web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_latchsensorvalue
    ADD CONSTRAINT web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch FOREIGN KEY (latchsensor_id) REFERENCES public.web_latchsensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.web_latchsensorvalue DROP CONSTRAINT web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch;
       public          fedge    false    4207    314    334            �           2606    30739 J   web_latchvalue web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_latchvalue
    ADD CONSTRAINT web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_id FOREIGN KEY (latch_id) REFERENCES public.web_latch(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.web_latchvalue DROP CONSTRAINT web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_id;
       public          fedge    false    313    4203    332            �           2606    30672 7   web_led web_led_device_ptr_id_2177842e_fk_web_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_led
    ADD CONSTRAINT web_led_device_ptr_id_2177842e_fk_web_device_id FOREIGN KEY (device_ptr_id) REFERENCES public.web_device(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.web_led DROP CONSTRAINT web_led_device_ptr_id_2177842e_fk_web_device_id;
       public          fedge    false    4156    315    302            �           2606    30535 /   web_led web_led_door_id_ed3e81da_fk_web_door_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_led
    ADD CONSTRAINT web_led_door_id_ed3e81da_fk_web_door_id FOREIGN KEY (door_id) REFERENCES public.web_door(id) DEFERRABLE INITIALLY DEFERRED;
 Y   ALTER TABLE ONLY public.web_led DROP CONSTRAINT web_led_door_id_ed3e81da_fk_web_door_id;
       public          fedge    false    304    315    4170            �           2606    30732 B   web_ledvalue web_ledvalue_led_id_950da7bb_fk_web_led_device_ptr_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_ledvalue
    ADD CONSTRAINT web_ledvalue_led_id_950da7bb_fk_web_led_device_ptr_id FOREIGN KEY (led_id) REFERENCES public.web_led(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.web_ledvalue DROP CONSTRAINT web_ledvalue_led_id_950da7bb_fk_web_led_device_ptr_id;
       public          fedge    false    315    4210    330            �           2606    30702 5   web_plc web_plc_cabinet_id_1e556896_fk_web_cabinet_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_plc
    ADD CONSTRAINT web_plc_cabinet_id_1e556896_fk_web_cabinet_id FOREIGN KEY (cabinet_id) REFERENCES public.web_cabinet(id) DEFERRABLE INITIALLY DEFERRED;
 _   ALTER TABLE ONLY public.web_plc DROP CONSTRAINT web_plc_cabinet_id_1e556896_fk_web_cabinet_id;
       public          fedge    false    324    300    4151            �           2606    30621 7   web_rack web_rack_cabinet_id_2c2a8a9e_fk_web_cabinet_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_rack
    ADD CONSTRAINT web_rack_cabinet_id_2c2a8a9e_fk_web_cabinet_id FOREIGN KEY (cabinet_id) REFERENCES public.web_cabinet(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.web_rack DROP CONSTRAINT web_rack_cabinet_id_2c2a8a9e_fk_web_cabinet_id;
       public          fedge    false    300    308    4151            �           2606    30627 =   web_request web_request_cabinet_id_f6bc764b_fk_web_cabinet_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_request
    ADD CONSTRAINT web_request_cabinet_id_f6bc764b_fk_web_cabinet_id FOREIGN KEY (cabinet_id) REFERENCES public.web_cabinet(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.web_request DROP CONSTRAINT web_request_cabinet_id_f6bc764b_fk_web_cabinet_id;
       public          fedge    false    300    4151    310            �           2606    30632 7   web_request web_request_door_id_fdca5e72_fk_web_door_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_request
    ADD CONSTRAINT web_request_door_id_fdca5e72_fk_web_door_id FOREIGN KEY (door_id) REFERENCES public.web_door(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.web_request DROP CONSTRAINT web_request_door_id_fdca5e72_fk_web_door_id;
       public          fedge    false    4170    310    304            �           2606    30637 7   web_request web_request_rack_id_d737060f_fk_web_rack_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_request
    ADD CONSTRAINT web_request_rack_id_d737060f_fk_web_rack_id FOREIGN KEY (rack_id) REFERENCES public.web_rack(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.web_request DROP CONSTRAINT web_request_rack_id_d737060f_fk_web_rack_id;
       public          fedge    false    4184    310    308            �           2606    30642 8   web_request web_request_user_id_f52134a7_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_request
    ADD CONSTRAINT web_request_user_id_f52134a7_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.web_request DROP CONSTRAINT web_request_user_id_f52134a7_fk_auth_user_id;
       public          fedge    false    4110    287    310            �           2606    30697 C   web_servicelog web_servicelog_request_id_cc613eca_fk_web_request_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_servicelog
    ADD CONSTRAINT web_servicelog_request_id_cc613eca_fk_web_request_id FOREIGN KEY (request_id) REFERENCES public.web_request(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.web_servicelog DROP CONSTRAINT web_servicelog_request_id_cc613eca_fk_web_request_id;
       public          fedge    false    310    4188    322            �           2606    30720 Q   web_shiftassignment web_shiftassignment_group_id_d0db81d3_fk_web_employeegroup_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_shiftassignment
    ADD CONSTRAINT web_shiftassignment_group_id_d0db81d3_fk_web_employeegroup_id FOREIGN KEY (group_id) REFERENCES public.web_employeegroup(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.web_shiftassignment DROP CONSTRAINT web_shiftassignment_group_id_d0db81d3_fk_web_employeegroup_id;
       public          fedge    false    328    4179    306            �           2606    30725 J   web_shiftassignment web_shiftassignment_shift_id_1006d335_fk_web_shifts_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_shiftassignment
    ADD CONSTRAINT web_shiftassignment_shift_id_1006d335_fk_web_shifts_id FOREIGN KEY (shift_id) REFERENCES public.web_shifts(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.web_shiftassignment DROP CONSTRAINT web_shiftassignment_shift_id_1006d335_fk_web_shifts_id;
       public          fedge    false    328    320    4222            �           2606    30712 Z   web_temperaturesensorvalue web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_tempe    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_temperaturesensorvalue
    ADD CONSTRAINT web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_tempe FOREIGN KEY (temperaturesensor_id) REFERENCES public.web_temperaturesensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.web_temperaturesensorvalue DROP CONSTRAINT web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_tempe;
       public          fedge    false    4215    316    326            �           2606    30677 S   web_temperaturesensor web_temperaturesensor_device_ptr_id_0b2f7e45_fk_web_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_temperaturesensor
    ADD CONSTRAINT web_temperaturesensor_device_ptr_id_0b2f7e45_fk_web_device_id FOREIGN KEY (device_ptr_id) REFERENCES public.web_device(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.web_temperaturesensor DROP CONSTRAINT web_temperaturesensor_device_ptr_id_0b2f7e45_fk_web_device_id;
       public          fedge    false    316    4156    302            �           2606    30683 G   web_userprofile web_userprofile_employee_group_id_46a1fb99_fk_web_emplo    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_userprofile
    ADD CONSTRAINT web_userprofile_employee_group_id_46a1fb99_fk_web_emplo FOREIGN KEY (employee_group_id) REFERENCES public.web_employeegroup(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.web_userprofile DROP CONSTRAINT web_userprofile_employee_group_id_46a1fb99_fk_web_emplo;
       public          fedge    false    318    306    4179            �           2606    30688 @   web_userprofile web_userprofile_user_id_3dea3d05_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_userprofile
    ADD CONSTRAINT web_userprofile_user_id_3dea3d05_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.web_userprofile DROP CONSTRAINT web_userprofile_user_id_3dea3d05_fk_auth_user_id;
       public          fedge    false    318    287    4110            }      x������ � �      |      x������ � �      {      x������ � �      ]   �   x����
�  �>�h���Ş� j�UfcѸѷ�c�.�$���i��5��A	�m/)z������ �A��¢�A��2��Y��=7�#j2K�$z�������I1߾��.? -( �J�z"%� �V��Z�⾒r��(��J{���9_,����*9,P�Ju�p�?�-1�      e   �   x���M
�0����aJ�|�%za�6�Ԇbu��7�YLx�<�>�w��Ӟ��ʙ�2�����{&�׫�0ޱ�b1H7ĝ4N7�N���P�	�t��&"�&�	��ߒ4}�u/��n=HC���T���_���      `   X   x�3�4�,��M�%��
�%
 �BU~P�3���L,� .�e�iD�ƜƔa�iB�����a�iF������� �      c   X   x���A
�@����0���y���(+h5���@x��g8?wQ���RhCfCMDC9���>���c|j�%*k���)�؈�ٰDX      g   D  x�ŔQn� D���T���K��V��m�Ԏl���o�(5Q���H�H���^�i\��c"�ݻ`�"E���!��s��2��p8�r��=C�N׎�����BC�@��X�I���q�4ǜ�o"��A�0�������D����U+qR�
&�M��H}<�H����	�00%�a(2��8����0�o�K�����ul��u�T3j�sY{Jio���i��9PZ�B���W��#4%D�,h��++��u�CM�6m�`�OX��2,�]��+�#���{I�{��3<������~�)�)�#)�����T��ބ���v      j      x������ � �      i   5  x����n� ���a@|�&T���ڸ���}��`,�1����;��P��K��Bٌ�'|�.ʔ�Mw�~��˨��Wm��8:�c	\�<�k�K��? �l���VvF_mQ�q��]P�z�-C���~Byͤ�i���<�cs���$(Љ�̟����
*������kvX�����=�����r"(e�"4�����β����
�b0U���� T)F<P�g�Ef��������Q;����p])Ƌ �/��]�8�D#�{)҅�<%%c�'�d�,?=%����������圌�����o�_�c��      u      x������ � �      n      x������ � �      w      x������ � �      x      x������ � �      o      x������ � �      r      x������ � �      p      x������ � �      s      x������ � �      q      x������ � �      b      x������ � �      t      x������ � �      ^      x������ � �      m   B   x�K�(�/*IM�/-�L�L6JK�0�0�50H2�5I13�ML22�57I5�4ON�0IL�,����� t!      v      x������ � �      _      x������ � �      l      x������ � �      �   n   x�mͱ�0Dњ��}`�w$I�����)���ф�؁�}�Obz=�Za��|�x�)ǗvaJP�-E�ɱ!'sz3�֑�6�j%�R���0�]�����ٽLU�C"�      �   �  x���Y��:E��U����8�Zz����̼%R�QN�uL�:dTJ�#I�ߜ���ON?�?��$�z�O�$���������W2�d�"��Ia҃q�yO*�%H���@�5H�&��I?Ig��ҫ�~�B�bnW+�����7Y�� MR�r^mc҃t�V��L� �H+�1�r�ю�-MHv�K�.�zߓ�� �e�#�ɱAނ�*]#��D� �A6����o��O��GҔ��=fa���v�iOr�Y��A�I��w�H�$�-H3Llݓ��d��k/�'-��Y�A�O�.�N23��������&�I	�Yǝޓ�j�Is���ØƤ��V��=���[��0C�P����RlO�C��Q{J���I�C��l-��=YO�B<����g�1ϧ���HM����I�C�G -Yk��Zg��@zr(O�+��!�AW���d�9�>g�4�Ѻ�^>g�T���
���Wz�KN���O��Wzѽ�(�E�B�J/z���ړ,�����R�u��
+�#��ǕR� �EIy�P&�i�&U�oB��dK�lO�@+�� �ۓl�!�#�R��>� � s��c�AfAJj�v��
d�fx�_b����L���l�� =_��;�q,���JVd&{��d�ֳ�"��d�<�r;H�&�y��j�;=W�'�9*�V��$� � s��+e�l�[����Os�lRb�*�yO66)1H�ͤRN�BJ�4��{2�$;��dA��}���b������vH~R
���W�z��d�w�U�da)����.4�2�AB����1iA�F.7)�ٙ� ���{�y�=1Y�4D��(&���Az��&[�5�^{�$��$�QՇ1١ѿ@<���u'�
�t��/j�I�B����=�
���T'�ʣ�	����d���Xje�G8ɜء<��;-�)ʉ%B����"�P�(�@kV���'큶�ҞP�H��������&I�G�U����FY%�@�J��z�F٥��y�w
�BY�h���ޢ�6E��k&��f�)�o~x�v��}�lS���(���_q9�M(��":=ڔ�&�6%*ؾ\sy�l�%:��U^u�l��$#@ek�Ew�lSTZJ�>�lS�Z!��a�g�)J��e֟���V�%�Xs�z�e�b� H�2��i��R[%b��}�� ��VA��zۃ�Q�ZJ5�A�(J���A��e�����%����e����3��3�
E���6!=�nd��Ԫ��M��>@�'*����cKف��D�����~�&��e�֪�N�k���v9�lP[�ɴܷ&�E�U���m��q��P[���E�?A6(j-��z~��E���H�.��j����د���E��P4e��}h�lQT[5
�����-�b��d�~�(�/�آ���Q�����e���jG���6��@�=�Qo��j��)�@��<�/$��ꌎ�,�~�Y}��QT*��	V-@U3��c6F=PS+���	vK����>�Q�ZG���?�Ը�Qsu�G��v��o����؍z��Ȯ��=&{5W�G�<T��٣Ѽ�G���셲G##;_۪r׉�G���Yt�ԽFe�Pxi7���fz�l*/����9�5&���	�G�0/�:�-l�'���]���@٤8�IGE�x��B٥8�I�T!?��.��#��Ө�* �Y��'Bm��X���Ge�P<Ւ��ߣS��.�xjE�/ �Pv	�P/(l���&O@Q�׾��9je�Pm��-�i�_�&�"9��ը�+ۤA	Yoyx8�mB�]�+ۄ:(��|��B�&�1@խ���5Ml����>,X��6��ꎲx!ⅲM:Nu��� Se�l��֒�E�m,rǚ��(˄��Z���J�x�!o9e.�)G�-���H��bz�4'�i`������`���x݃�A����Ә`c��6�������\�uj�[�N�E��0�3wf{���~k�dk�M��(%��"�Zϝ��T�(�vV;{�K�q&�i�l� l���l����0;lN� �.���_�;����Y������>Hl�b{�[}"_z��X d'@�U�[�;��I��g��L0$�Be02�^�~s� ��`�-D���$vIP$pR�{�l���#A�Y$�-Br�v���q��Kb����͋�덲G�K�"QM�4*{�q��oчI��F:��]a�Qf��π�/­L�5B>��j�|F2��|hm�/6�7�"!��>j��!��Q��}%�MB:�~$D@٧3B�k0�H��zq�׳i��n'��e�팎~�86�ų�(u�}�����������x� _��_�0:z�������㗊t���+ns����L4��/�	��}�ԣ����BB=l�/�@�X�b�f�vIG�3��}ϏQ�%}O�TӢ�p�0����)ȫ��QVIG��4}g��]RvIG��5���o�M�ѼD{7��(���yY��Ꝙ9��&�h^6��tP6�F�kt�P6�����ʢ�5MR6�F�2[ٿI(�&�����H�Fe�l�/�4�ŽN�X%L���݊�K�j`"9���&L��z�O�m��¬��5M���U��G�YK������D�+-�,6��^���ԗ/�^het4�����G��mL��$���s�����.QAE��⍞����Z�%j��uYZ~m�M43�G�˲?|WB��]F�8�o����_�2:Z�-yY}�eN5��h���N-ݼшS`g��h�T��p:����BY�<G�ҫ�@z22���k�G��Y�;9v�׏��r������~?A������˕�9[��&�e,�R�'�L��-lQt�%ވ��]"x�||�/M�-=��:*�g������$��Xs�zb1V��咶�>2:�-�������'�{}ayd��8^���.�H�;d{���x��G�p�e~�%����S9���q��Sloe����:��Le�E�Ouxa��U������Om+�hT�<�$��1���*�����#���Qt\ޤG'g�Wٟh`����si���m^e���:\"�=�z�5�)Ce���:\z9����ST٣�_+�R>�J���-й@+��k�Hqʼ�~�=�i�:\�k�7�d)��{L}<	�n����wO^���ݞ��m��/K��o�n�c�|���������d      �   �  x�m�=�%���S�ߘ
���t�5�YC�,i��JT�"�t'2r��@0{�s��K�������v����mȏ�����~��#~N�J]�Md�����_R�R�k�6%Sg�������i�q���6̓r_�"��tw�k��^/�5�R�4��/]r�N�}��<(J]d�@A���t�۴�Z�T_�_�@A*W�L�� ��#l�@�^_:�� 
ub�J�P�kΰ��@Y���6�(ۨ>*~m��3�~�REi㤟�.�9}h�����q��Q|[�����9�|ä�I��c�M&��G�.2m� �KƖ�6��I��Q����[�du�:"׻�a�r]�*Q#��	RG�e�6NP&~~NnRk��#v��7��
ʍv�A�ieψ�[�3�((��j4������iD{eE��Z����0�TF����	�l��s��y��ё��#�'3YAe�N��&kR���Fj7�'���#�ݥ~���77�I���W���-ަ�8A91xpCҌ����*'����U�cϤ2�ʫ��i��8A���N��y�����h���i�$L�0�gb��I҉6LP��c۩J�i*V����<`�n��ͽ<`B;c�ͽ<`�ym��S0��2���n�<pZr���*�'\z�p���� j):_�*��aHߠ����gܹk���*>�~2�����
ʅ&�*��@�S�1�L��k�FN���xj߃V��@�]�� ����*����@�]���u�>�B�/����	��>g�<p�^ŷ�m*� j��7ӗq �F��g���ܗ�l�Rh)�;���8�ZU~b���J��I�TP���74*��y�#Tȵ��j��1�]��gܲ�N+��-�kP[�4Z���+aDK��u5��]��o�����@�[���I��+kM܆7
l�u�
�����ɸ0�S��A�m�4�1�רg
��1H��=)�@L��M�`P��îb��h�T:ڞRdX�)r���(��|`Ru ހ��"knc�*m*�3�!�ܸ=���F
=��G�T�3&B�*��<f^Bd{ �1/6�e�1L�i����@ҍ�s4��Y��r����-�_���0�1���J��-E/N�A�3��a/���۵g��j�!ӞYd�Zכ"��-Ū5��2�5�;�"(��[�;2�k��آ��+Zq��⑦a�M�e\��%6��ZtQҍ/��m[Zv-V��C+�[���~M���j�Ei��t�-�x�xmp�(-�()��S������ ��m�E)�>�_�rV�(����u�[�桊mFI�u��ݷ�`��[e���L��a�R�Ÿ�s."�a<�yU��
(�x��\K*-��6.�����1龿��o
2�
�hl&"��A:/L)��e<�U�{���A�e�޳���>�+)�hĞ���D#����ZT�шymH���D#��6(��0�m#�71,^��E#���.���hĢ�D׶sP�Q�s��_��7�$��ڥK�j'�Y�O����ΥX�j�w(���/<��(�x���G�)�x��(D*J6n%� ��8��6nm�a�'�(۸�x�_��w[&��.�q��0�z��Ui�e�L��y����LR�kNT7.�-��R�Z�0|��)����|q`~g�1�ŝ߸�q<ҨY��p	�~�=iI+��ϟ?�a��r      �     x�m�9RC1���S�3�h_| J*�4PQ��'d&��7��_����Dt�x l48\��������Sml�<0YY�f���90]�Y�4���ʮժH��G&
"��#S�T͕UC��{��y۾;�#$��	�
h9͒��Rʹf9B�	c.euܔ�,o�ݥ��/�!j��Iڴ 4��f髴���~�O�_7:�#�5��:�V�h�x��Bk��(�2�B�SR���y3�K�E��^o�ɗa�e�� �v�#վ$aF�<þ�߻��      �   �   x�m�A�0�s��ܫ X6<�/�9/��UWQd)���vy�QW���'�2�^���'ʩE&�wT����}(-���ꦧ�"}�XD�-UI�vVj��2O��Z1����-lN�\YK����>�+�iF����(�ۨ��.	A|      �   �  x�m�I�9@�ߧ�}#�Βu� �GS�
LK�1���HJ�?Ŀ1��p\�C3@�_���~��ȋd��,�C�H�sc�`3����_�^�G�Y��E���������sN��DcX1���:�'�ia0�������wy�c�b|i�$&��ɂ!M,��a�bq!WA8�fFxiV��1_1���H�V��1�)d|�-W,/Ƒʦͩ���j�0<`���s�^Y-ܘ"[�&&���E[-����F��Ba�pV�E�,��ڭg�Y�)]��o4{�f�eaԜ�jaN� �{|��jab\�J���j��)B�,�j�ƴꖭn�Z��"iG��Z(�u;�F��Ba��LZ�t�P���4쉮$��ܡ�:�)rg�v��Aab�gq-O[�T'm�V��̀�gZ�٪@�e�v4[Vk���l5pST�m��j�����x��w�v�M�sM���6o,��Q[Z�9xcYe�v6�ܘ�~��&!禄L��$����==I(,�i�;Y�!�}�d�F��lN���b���5�qi����]�L���o�����+Km�<����E���bռS��4�0��MBЁ��$�U7���\mAm�B��$^Ѽ2m�����'�-��#CC?�(�%T�m�
t��>�J�6[��[T�U-�X�b^����;���c%ں(�Y]I}�%�XuQm�6�)�v�r����sSJ��T�w��L�R3ڏGL5�?�2W�/�!�|�6.��7Wfk#�MCL�(��=���ͩ ��տ#���m&���,�:�f⍱���A�\��z�� �&���u���a�Q\=��z���V��-k,�����W�[������JG��6(�ʩ,��`����-��      �   �  x�}�=N�0�=;��ol�
H�,̈p�����y���]�Y^�^؟�;b'A�g��q{}���zپ���
0R�}��xl��$A83����i�_py���RHSm�D�J:jg�\'@4�6"@3_+�Uth�m(֍���nV��2�Q��мQ:+�ʠ��t�쁵��E���W�QY&���(�Utmt��!m��33R��jr��,���rf:����l㬬����;E�F|���V<�Q�5�U���4 ��ף�:��^
ꨱ�-�YYg���ͷ�YU��x���Ə5�$��_L���(�u��_�sFլY�����gU�$P�XY��<<� i\�Z�%���\cI]e��YU�ƪ�n����7d$�      �      x�}�͎m9��9�x��� ��$��I������-Ͻ�Ȍ��??���٤�(��_k,��s�O����O�����9�����_��_�_�����_S�MR#g	s�lD�~��8����ө	�fM�/�����k���e��?���"��%A��ޚ�H��Û% �U�*	t�4!���v&Y�Ĳ�'��e�<v�#�3/Q�%�˂��&�,�=�ć�cO���Y���V�	9!�,x��`^�F�;��󳯼g"�u	<� �GB�k�;���#k����e�sOĞb�J
��Y�g�ֵ �u��O�
+~H�܃X4hƷupY��9cnjx�����G����O��
"�����K�NX����|�~�Z����y�ɛ�P\<�$���v��������z���ǲ��'�Ϡ[�෋~��^������|2�^,�c�џ?c�ȵߣ+�'�^wn)����򣼏J�<���g,��?%>}"&��K
�����#�&K�<�@6iB�g����l˪��g������'�L��0���'byA�@���?<-�:���u]x�A(�s� ��'q�[��ސ�3�e��}�9�Ⱦc׊���� ��j����?K�ݧ@��>�$�����������3��#�P����r��4|�Oސ9���@����qv�|�4~Ԃ��r��s�l������Öy�!�rH[<� �V�a <��G�G�%�Ũ�Ѓ���h����W-�IT �,x�Al�%r�s�|y̲�c�Y�v�ΒY�k_�c���n�~�zoF��lx�˓5���v<yC�}�HnP0����m�Ƕ:*�?�~"z-ckx��X�#��c�6<��h�E�]g_s��9W&� �smK`_u�6�s&H ���,/P��"�#L�N��	��|Z4�&S�ڹ[��4� �8e�8����s@	���Zd ��`��	Ӫ\� �}�"KD`��ai�Z�� +$c�qa $�@��ǉU$c��2fY /�WG@��?�����,`�̥���7��6	��~k��+��I�! Clk�cJ��ٞ�?��m��@;h �RnL�	⻪L�1DM	C�hpǀ��:H��&����"����R2���&}%��ڎD�l61�=c��*��{������9�p�F���+�j�1�2�*��+c�q��:��`�=�ʝ����3�ecA?߃ŏ |>����7�+��&�|�GW�o:
�ڦ�	���ܝF���7�u�j�+���>��*��]�������';L�qij�v����,�����xq.w$�����K��Y�e@;|[>�T&�/�Ƚ�T&�# �@,�ݳq�&�~�L{���1�&�~r��D��?n��������-�%ҫN���{�eѳI"��3�����]��7��3�mb���&��/�;t���t$p��G�x+�r;���-�kBp rW�{��݁�K�F��9����j���&{<�1��8�2��[x��{���3 �3Lk�Oq���*�0gm� ��*H�r��ؙ�aou�m�6������Ϙ�+`Z���背��-[�Jm|i�F��qk�i~�@����>�
wy����l�yrY1��M���U�-���"�~�T-�B�}���<����_�m#��FƏ�8h�^Ҽ��D��&��  �_��f��pq^P@�i��ۻ�S�	$Ã:S*H 6�{�旦��@쥾�Oq��������%'����1 ���snx.��T�;
w�,��2���������1 ��|{n[�L�� c�����w6�l-il�5��G^wɭ}�5��'bቪ,�x�۽$�]�TIj��~2��(O?7ě��Rn_<�����θ׀���|Z�V�@����c/ơ�9�<���%����X���w��1�]��	��6S�ٯ	8���L��	$�y�*�4p�G��4{}i��D6I<h�����N�=�	d-��Mŀ����e[�:}^$�Ȗ���\?����.y^$�.�ӥ�k��=���Y���h ���
$���/�Gc��f�}�4}-Ad��#t����*Hf���_T��>Z�DM�]�U��Ö
�aҩ}�E_<�/�:�]�Հ!sڮ���&G[���1�]��ϭ�����+��L|.,Oz�Հ����K�0|�Wa}��@�
����hgd^_���+�Dtط�)������Bzv�meH��I,���I�B��X~pq�o���������������s-Cl��������#�� �g²��:y^dۖ���.Pd��`ʓ�X��Jy֛n�$rm�Rg�K@ Y�E�2���	( /�hNT��82a8��L@I�C@ 6��u�]�@0�`F��[
���p��P@ j�l6	�� ēa���.�W�H&ݖ�6�k�$���#�4��ܠ�D��T�C�� $�a~�D�+p��%�g4գk��g�g���U�+r��!��'a���X�k� ��1�e@�sa��_�{�P@0b�����1����{9���u@�\^��(P�����Y]�$��彺���gÇ�ʀ����Muh ��H,?i��x�θY'D�1�O0��U9�ഴv����l���c�o%|ŀԣ��:��0=��G#ޓ)bX��X�v����!⩣��I�|��[��'p��Tګ3k���,������`� C�!�iᵆD��߯�l{��>����%��՛�S�`�
X�wvw\UZ�K�*�!|�+�@�pD�NV�ր%��Z�,��y2֜M��K�1l�qx��Ɛo�Áw �-�f*k1	��$�g����|��$VH�|�qlc{뼖�L�ހ�9� �W���fT� ��b�~u���`�SZ���K��|{�\���"CKj�+x ���F�w�-跛������A�
>�/!t �7�e�e�i����@ǀ↓e�C뼖�|��-�+N&�?��Lƒ��oUh ���;ubK`>��[;������Sg��2p��ҹ~]g����d�Ք���yo�~�{�Y*�+��VU'�H n.�g07%��`2g8�1��f�6	T߀/$�%)�$��`^^��i�֣/\�Y�w��\_0/0�$>�gK`�����Z���|̾�TE��
�r�%�յ�\� �=��b�/28q�REi��	����SG�`@q�I,�XM> ��CLmM�5�W���M��o}e�>�O���#�`^4�`�\}k�4���k�& o��^�Дx���J�3D�.uw|������|����&0�/��Y���o ��D�R�t�	��*,�yW��|�Z�i��z4����/$�ș�R.��h��²��90��cΔ�h���/��'0�йl�� _Pl���K�E�o0���ɷ<%� �I����b
�`"�)�Y�iޠߝ�^�����	��c�u|�� \6?G�����W�?����<�鑃��g9bi���<z��8����g��2m���w� $"��C@�K���������Q�vQ�Ac�&IRBp���)�#p�����R˛���9�4���Dq\��U��d��Wˀ�};�WZ��y�@2"��K�2 �[���<�M{�!"cuBc,�=�Y���C��͍ 0/�����#V���4�O���G���.�$�)����u�C�1r���A�W�e���T �D�r��A����2�?��+͵M��o�ŵMm���9ʻI8��(�w��\�$�)����a��tƞ��]:�4�@"��u������V���A�_�b�ChM?+���:|m��D�K����`"~i]oW-��R����0�K�!�k=׮��2����I$�v���Y�>���������)���� �C���v��z>Z�v��c�%�-����K    �,�����mA��z�a{�.2��0��Z4��/�0�{y��3��(��۞ss���!L�z��+$��K�lN�,�dh�"P7Ռ9��γ� �G]����+>oS	�`R���?:�)��{ۜ+o[� �C��]t�+Վ|5�Q����ra��Ȳv��]{0��d�.�A��?���?�`>���V����_o��E�����|Ȗ��(���g/����L�5K�>�zF�ct���A�������n��Ld�߶'��7�Q���ڜb2��ɜa�u��c0y�	+�ߋ���LD,ږŖ�����^�c5{Bs�1�pY7�`e/�C�a!�;��[>g6���3�Y�-8���AG4n�j}P�`2�/`_�)�4_�����`�2�d ����_צ@@QmIC�N��cd�4<w�/�����1 s�!�ku(���AuJ��&V
`������	��1�.ۭrs3��|�Lm��Y�v�8�*�A��Yz��<!ǉ�ֹg��g01��i�0����`��L��%�t��f$�C��\�j4 ���6RM�=��cb�d�4F���N���x�~�!tHD�e�"� LĢn�\�� ���|�ݾ�������������O�K$�䫚G@�m/��2��e�^�I2��|<�[�mr0� {�!Jܴc�Y���k�;*d���3���\0 ���Я��M,|i��@쏙���`����i�mB�^��F7��sk ��["=�_�	�`:c�ôa۲p�"����#;���߃�D5�3�)�c�s���(@�;�[~������Fw��`r����՘�>DeR}���4��Dj���F� |�I@��B�a{ٜ�t'�r�]�Y��?(#�l��"��A�/mK����D�#�a��?��=g*�S�J����ζ��C��}J��X�"�(��H��z�P�ߨE�6~
X���/��T)���&6m��
8��8:�\@� ��ۮh�4C��1�k@:49��j��}i��DȲ��8B�!t�K���1�2@2d�o���1�ѧ�����C��Y��Xޝɶ��־��A��m/Q ��($k-i�H����zyWh��usxʪ�&�q�.�����?���	8�����1΀E����M;d�#�v�����;t�Fba��`�4�<[	$��w�_+��0�3���<N���.z�C��\�.�1�b��R&�Cx�v���A�]�3W�$�0�r}��1� ���޶M-��A�̶O�Ƴp������Łĭ�Ҙ��c�֤��`zk��>1���S�!|35F��ChH\��]�~��!מA��p��}F��gy���ɦ���Ch�)�o�v]��ǰ��C ������}��Qa":��`���?�>��sv�|���ٳ�"`z�>�U�sP�r�?���18��y�ƈ����ru�o����ު��WH´yk�C��>����a�����D ����ֹ_�AL�Lb�s�>&0��pr�A���c콩��P@�ۍhs$)�>��ݵ0�w�m������
�L�}��谡�V�4F�����L�|+�����~��0tR����i	M�IS��Z>�a�1�@|��_d{�~}P"{0�<Ug��.VF%s��T�ۡ����n�|��d��������L�Rz�]������:�¦��o�N���QЀ2���f�?OD�����b@�O�՝��n�(� �ǕWR,/������tQ�@2���]�U�@�˲�-nz��V􁲭�K5EA��o���.
 OT�Mx���f�K��� �ܹN�A�
�6�M�=@ �r>*�	l{� �Մ��� ����S����"J���<����>��	�{��O��l�ȁ �~�9gե{��Ϲ��҄��;O��{������6��'��[6e@{�8n�[%�=�=A�4}����/8�<�,��2P@B�1���	����hn���@�X�x���݊�9��m�	$#��
�nL��I3Yk/����$ޞ��,�	2�[p�i�GU���"撎�GU0����%cJ�e�h {���F�D�]�2H��o{�
N����r�=l$��ם>h ��LR��M��d�njv��@1U��8u&�	4���uSf\��N�Y�{	$��=��V]0 �(=�^ZG�M��@l���C@ ����n�'���ͣ)���^�J���e��A����O�� �[	�^��%�$�=���b@q&{�kV;	�{6��;��\�A���م ��$���U�� �����t�[@�S�6�u���@"������������8��#_<f��ܪ��b|�{�k�5�[�H�7��p�|%�]Q��/���ce_<�@9�*��
ft6�jeU�/���D�O������U��~}�����J �E�j��{�b|���bd� �@ΰ��6(���*�5n.��	�lG�̨�$��3q2���co�@0㊶( ˺_��"xn�@2���ڷ��YY���4��	�6����V\u��cM�r@��%�궗#���'��X�6"V�(��j�&�8��j��_!`���}�5h�� |�������B����/6����rG�A@���'*�-�������]��\ ���x�rݨj�7�h�?�J��;�
H��6���zZ���]0��9�[u�%�58��Dj�����������a�o0�k)G9i�P����6��`>�6w66x�3NJ�:����`2+N�:4��d�����xK��֠!1�yJ���@��c;���h�i�Hp�L������(���7��ǜ�R��7է����{0�EkK]eq��>�yvMp����ל���8`>��c��������y���j�٩O؃�ؖhxk��(�=�e��]K���C�ތ�\/��^7���`"��R:cּ�4{����I5і�J��1;��@�n�)g���м�b?�:8`θ�j[5���#�@t�W�Uw�X*4�	����a���#_xS]�E�^3��d�9��b�"��s���/�+�D���[Z _�s� �����y^(p��n�MѺ2�;�[Z�!p��-��)���+J{�S���`"w�v-P����j9,#V
HF��Ă	xBhQ��0ނ9��m��n�� �G�;%<`&c��]�����L!m�^�qn�`���Z�����5���G}E�3����ZBM%�gлOgw��,�1���!=�4��P��uC��P�&�k��t];`f#�=fY8i+g�<�v�� �O��G�Q�����{D������f��o�!<�5��ACl���ca��D�7'x��%Ѵ�7uW���CxM�� X�+4Z�9�iy�L�?�8�+�u_��WWpѵN���3��|�ە�p�����@`^�e�`@��E�;�;`:sM�Mr9�>���>�8`�����-��.~�Cŀ b������K؂����f�[0��i�^؂����
8n������>�>�����?n��_be �d.w-s؂+::ٯ�;l���}�n/q�4D�ޚ�q�|����+p}��w[V��+���!��o4���+$��ͨ�P��Rx��k5u�L��N*M9�[Й�E��w�L����zT��V-O�!8�띭�o�9%<�:�1<��Iq�|��n�!0W���DuC��+�Z�l�mYJ]�p�|���Oݟ�/�]��-��^����A^��k����#u�[�!W���\AoZl�-�r�E,������q���E2ߠV�7.؂Q��� ��}8яx?���`&    �-y�ͭ�� EE�o&2�\�G�xB���q��w�M���`2���n��[�b½}�K�!�`>Ă�����`"*�Wsc�-�������� �q'��% ��S��9�^�.����ϙF�i�+Hq�uz��0D]pc	�hn ^p�Y�3��.���
>�ۍ�U\A�>��UȮ#a,D��}�m��_�b����ȐA\���m}nq�����g[n#͕���c<�n<���1�BϢ�����cl��c�3h�w��l`���>&baǀ$n"��L��>B�4C<.��x/��]���:�\l��E\p��j��S���D���N8.��X�Ꝿ�
��`2�Թ����A���h��o�1z���l����$`>D75n/���c��W<\D60�YtV���7hG��Әt�5���Oa.8����O��I�k0o���V/X�#D}d��G^0"��2
�����o�pp����Xe3@�x���G����{X�o�RO�c{��ܺ�`�}��������|��6R[|AGԿ3n�k\p���A�Ac�۸��\ۼ`>�$pj��3��5�H{��5Hq�,����`>�w�..X��P�d�M����C�c��:��5�]�%,Xi�k.����4m47�/��<���p�����c�|����wG柽�������
�/o�\�y���\ո`>����\�=��c���f5^�����+�`r�ڻ�y�L��Z�A���?�6��T�\���N��M�9!�`&2��؃�-��:u���X �M';��)>���a���D�^���,�tD�- �mu�|���j�H`�69�T�^0ck-X^��[���d_x���Ը�Z�h n�n/Qn#��	�Nݳ7 PA�ƥ�Gy&�D�c�����)�c)�6��
!�h��,��O0B�	�j;�f��`:�>	�qT�A��L��v��.�@">��>�P��~��u\S�Ybn�hZP+���uK�x��-��.˭c]��%���ط��+؃��w��@�x��XjW_����?hL���V1��8��;_c��?�6m4�JBc��������� ( ���!���OJ�GQ�|��>i�=h�@��L�P��c:p\�zf�u*��ٰ�W�ݠP�9F�0�������x�|�� bX����4[/o0���MPS09�,ٓѺ礂9�����Q
� �h�'��,�]X��,9i�zm�������SQe�	�Ag��4�j	�Ac�H27m���5��AV/g�BoZ��|�}|9�.@_ں����c\�k��C^pϷ��a_X�9<�+�
Π���֚�� ǥU�jc,��d�t�=�I�|����s*8��z���#\�4p%f������>�:� Cl�n��`&C�Ww�P��l�t6ws-��d,�6KwИe	��۵AS����j6x
��D�z������=���;b�@@3&k�y'�E${�1��R���
��ܻ���t[؃9�+�]{��T����H��!����=�S��F|w�O� 4H�{���n��?�ĵ���jK{P�
�m;�l���Ac�����]�����Cx�YF ���?�t&��=��Y݅)�%��ث�4#4����{�.eP����{c��c]�����L���-�A��G���[���@ �2��#)x��7ۯ6t���d��$�O0� �|�6ì��D�>PSӨ`b/ub��M(o�1w�ޖ�m�=��$ �4x�Y���\���M����v��>�s�3?oP�4r7����9cޮ���;�{��\�T0�f3�S����J��6��
�`2l	>7gx
ޠ1�~�{�QcE��c�7=��l%<�m?����c�}� (oPb�κ2��
�`"1����T��}�o�4�3�+%�I����@	�l��[�3x�d�\��%\�!��|6�ퟀ��2�!����$�[�5�Xh!�+���E�LĞ�:k� PC@�~���a�A�>���>�`&�^W���Ђz�빖6 1䡦%]p4�[&^��LԠ9Sr����C2{�ԩ�1�]�r�o�F7Û7�5��~�>40��̾��j�(2��k7�b��i�˜�[�\B��-�s��
Ƭ��uo3��BF���� .!���%HoK󅢝Һ����1 �`�?��y4�0c��Yҙ���&w�=�����B0�4w�r�9�0��=�A����o�!Ê;����~\C�Uinj�)_@����5���%�d����A���]J��������
QR2ے��C�1 rG`{�~S�2�"�9�]�A��W��{cw � ȭN{|�lI聢E�,6��OQ�B�a��nsa�!�I���-c@�V��AS��f��ﻛF�%�Y�܉�[ƀ�Qz[F@3Mr�i�A��(��f>��ZH�)CR��G/�K��"�RZ��9��tWcu�ɑs�ZWR�����bRh���-���u�]㳀 b�93aw�%=��̤vh�9@���޳�a�! &Y]�k�@;zwz����C2��)�u�1D�_{�gv��9$������=�����]�A�ȑS�E�q@'�Dz^S�b�!!/.n�K��7B~�Q��� �C@l�v5'�n�m�������3�J%�W�R�X�!	���*�p��l����Đ����TAԠqr=�j��!\�X�&��1���˖C���Z��N�QޢK��̹Z6N����ơI.(!U��˧��]\ε}���}�=��Z��~���s�%�a���}�=����*�W
ާ�~��򚋎�|��7ờ�~�`�X�ȓ�h}�� �%�f̽A_)��4�������|�`�7>�D���@�?�B �(��eP�Đ�w�� �s���oPCPw�XS��ؿ)[rW��L���(�tKc@ޠ��Ҝ��9@~ d����|s�V��G�&��r�h���ؽ� ��ovK7I��C0j���4B��聢)���^gNPC2��5����������u�bc@�X��zc@-�����(1'h��Z��]؛�@&r}fc}a�PG�9۫Ss� PB��λ�15��	�c�G�7X�Μ����M0�;�m�,@��$cۜ��]0��M�������2�e�5�"�r�A���m7-,��]]��`A:�e�:N}�oH!ot�2 ������(�~w ��d���{0!�����i"�2��@[�p��<�Y	��@	�u�����o�*{놉ƀ��A�r0������g�6g�����Z&��!���nMx�q^w�X}��0��w��@Q�ze=/���?>FY�;4��n�#��k<mhAc��tcE�@	�T��B�A���q�n���@	���Y�@q����"mD�AB��fxK��>�p�>�`A>�~��l�'x�+n<z�f�י`A�M� c�jHf���k�����^r��/����ڞUM� �ӭ="�� p �9�r*��;������ʥ�ŗA_)$�i��	}�����?�U�F4����n� Z��D��Ǻ��@QN*���1bHƋ���љ�}��a���@	�!�1UB �'��k�����cD�^Bތ� |*ܖՆ00d?���0��±4]u�z|�^	��e4-ZX�M�O�l�?x���%u?��2iY��:&؏:�]�.!��Ht6Wm�ZH�>�v[p�k.كkv����[�ڃ�WP�2����T6����7��hk���m�Ǿ�Ug��A����������"��m�:��X	�2S����1$�iFs�>�tF����Ua��W\-�.��t�z2�1��`������dhA���}o�s��-$d$M�1�@;;���.C��F��/�m�?؏��e��&aX`?z�Zo��    ��gh!�m_P����ȋeP]��]�jƄJ-b�����j*�1���I8��L�^��g���; )����O(!PiG��x`H�f�{�6}�L&���"77�%b��Rh�F74{�殴A��#D{;��T�-p�1ikټ7P�F{3�����\hAc ����~�������:O�/!��쓸�\/0�����<���mC�����A��(%�U�A�9��`�"�.�d�����!�����ژ���� ���IM�\`?>fom���U�7e%wng�K��rx���}4�+�|���7����1����=L�9iy��.L��HQ89�䴱����,/�m������Uu=��ش,p)v:rƻU�#p����Aŀ�I�O�|Z�0�#y����{�«W>؏	-�i�pX�Z��V/��Q���3���Bm�E$'�8��7�8�BB�����������@n��bH�"���2���?�G=��u��G�i�W�^Bc�|LF�7Q���^tzvs]��M����ﻻںޣ�C��ķ)[�=&Þ�tH��!u��%pv�X���@
�M�=6�ލ)$㗤���֣1k��8⮐a��� ����<�${d3u��,{-����=c{���Zo��Hq�vmq�n@�}|��]a�����rW���{Lį�wU��G��{B������Q��@��@�د����=&��ʵޣ7<�*�jV!�Ǆl���-�`L1���2VRf����)?'�zN��ŁR���VB����k�<�5)���xiVy�h���_��B%��YU͍��c22��n�-0����-ZNsI� �B@d1�-�[�>�Fl����)[�>>�]~P0��RA=�U{�\hA�}��\�zI�ж_,���G�دs��i���9W�JFg�|�·������M�޹�q�x�!{-��v��J����e�J�ע؏���5ү���b���|=%� ��d�m2�^��|��3���o��*����볂Z諆�j�����b�GO�@�so������#0 tgd	H�B�i[��*'p e���N��w~�W�]+0��zp�^�矷޿���!�mѼ��	�+c|C��ɖ_�W��`���ӝ�3�^y��*�+c|���C�5��:g�f��A_1H�,��ޥNLL����L��-��=�s������|�}�v��&�Al/��M-6�pb;�vm�-ļ�y�u?�I�A&�,k�u�[c@���;pwٛ��|���v3Q֯�"]�T���Ǩ�f�Z�N]eMy.�����v�jX���qaiK:	�GѼ����O�=&�G��"g�{4������2�1!�o�����ƛ����3��|�.O���;����,�K�h�����h�"�����s��]�@�17���c�,�~�#N���C����Z��	<�>�c@�Mܖ���c@g��f�>�/s��9��&��ʶ(�8PC@gәmcPÊS��Xر:PC0�
�o�jF��<�*�0�aE��-��e�! ��˝�KjXQ0��h��:C2g�6�b��Lu�����J�z+�nCJj���#�������Yþ�f�Ob��[�w=�
b�~�k�l�!�,�]��B0g����� ���78�n�-�Ќ}����-��˹��8�`��Nh�5�v-�o%d��]C�Zf[���B�}�����AIٷPo��9��>�w���}}�������5�,lo%�9l7�li���=$d_��@;nR�ƼL��O9#޻�� �aG���T� sq���d���%j���Ī����@;{��^w�j8�p��U��5$�-���Q	�N�#��[dĐ�����/Z��݀U�@��>�^��t���$���K�c@�/s�Ż߼]����C�� )$��.eP���/�v��p�0a���fQYA
�����2g0 �`���:�������")hA�:�폄��DRCBgI{k�Ԡqk۶���| �d, u��^yM�����r�~kYUsh�㫆ǜ�g�c�������R7oZ�oJ��褍��㫅�
���n7<�R�#���)�{sm_)<�v���㫅9�U��S������c�Om*y����ס��"��)L�f8*W����̵�BW������o&X�/�����ݶ�=ZX�5jz{�&$�1d�^݁OC@r쓺�%OC@ޖ����5��$-��`�!��K,�r|^ �dl;��U<^ �}�[���5$t�f�	�(�-����@������1P��2[�Ł�?Fwŀ�!��T�LT}uZ��-h��&e`-p�Q=���@y����=����s��-�Fǀ8.��6Q�X	dR��ܶ�������#����E,�1���rF7xo(�n�H��Q������`@&�kv���C�׺��H����;�?Yr;��-�!��ޏ���?>��[����}/�1�R1��� ��OYWJHf�;��5��<QCc���-�1�e���fh!���}�׊P��c�+;�Z8ѵ���68a��������:>�1!��g��Ho~`�d��]�`p �݁�9��@ƵP�4�ap ��r�݅rp g4E_CV{o���|�	��mM�p�0�6T�l��9���T;���WZֶ��@	��R�	�ԻF���1�`BzO���ûout�!����Y�`@�w��GE�wq�@>�w��wL��:��X��c�H3IϘ���$��Lt�p��!!���v��i}�g�q����&�U�W�x�V���@>�Z��Kp ����NR�����L�l�X Z�k7� ܶ��iP���[�]�1c;�7�b@�L��{����`@&�K�M	�V�
�bM-��̢�2��-�i�v������ޏ�H`A&��j�����>Sj�iE
 �ct��,���~�x���d�2bA����A>H�n�(�a���*��� �-;e� �±=���X�!!�eR3��h^#�g{�&�A>J�k�����<MՀ�	���Rˀ8�hd�T'�6��DA��MwX�1��ll�!z���}N\Ȅl���9��A�����a`p!��>����-"�������J�����E��|K���~3��HS�/�C>FIWӽ^��4�o詛���@	��n�|H�g�����	ؐ��.�x��D',�Mp� �{�-c�༻�/`B>FΛ][1���ek�������<hH�p<G#ۉI�<�Ǩm(��/�Az�����W1�8PB����ZX�!UV��p ��B�t�=�����E;R��4�k�݉���dB��wH\B ���[Ym5��@I��m��=h\���ƠW	L�C���煐�zHfO���p!��vXc��%Ul��-�e\��a\�Ǩ�.��i��oJ}d2!��u-���wh�i�6ey.�cx̮&_��4&�ʌ�]-��� ��}D	}�@�㞽���;cu_-8��ʗʠ����h�҉�X	.dB4�}u%j�~c���n����=�5+_���襮���6��� ��v��\HZY�m;ߦ�O��|�k���x�θEJ���0!���&`BR�'.��LL��|���9K����u���C���͡��I�&׻&��U��@�׏�f��1��d6���@�kp�{��@
	���ֻ���#Ԟ��o�p �%�M;>�8���3�.R����몷�@.S��8� 2�3Xۣ��Gx���7]��!�oa���M��$�=����x�����t�X�=�O��|K� /��Os0/�A>fX�� X�S�M��\�!�7���@q9|\B����N��ݸ[�1grs� �@����l��8���a[����/`@>��h=    ��D��qy�����9�ݻ��M�����`@>f��M��h���Ϯ3-�G�,��&`?#��e]P,���V]M�����-�g�_ӻ
{�>&t��v��������q�����d�}7�G��|Om���[-x�zC0(o0#�����=RL��6�w�sq��"���f����d��6��ö����7���>T�e�����m���Վ���RC��}�ǀ�t�h����Q����Lt2 ��ݷ���B:N��.������9��������G_�������!]����/䗈;Ky/�B��w7ur{�����i0��3��Цێ�ZH�^fei}B ����j|�M0R�ZFc�|ǀVxW��r�b��v{7c/PC�<��ۘ�{���W��(�S^w���!!]o�B	�bN�7Dom5�-7�I7�@�/i��@q��#ڄa�!%/O��}�&C2��k��M�����7�b��>��69�A��ٺ�A
7aĔՎ��ZHJ�yO��nx���|3�!�{��o1HQ�͕�\�!��_W�.�m5$${���6��@��;�|3�AbX;m�=lcz��qY@9*�K-���- �hpn�n[no1cZ�m�C0��Z�[@�&��9��rR򼓛��[@�N_�_&��N�*7a	�N��'�X�A
9'yz�1 �����ޠ�����+>*!C�If��4�u{��9zK1Z�q��t�A9�xׅQ�9����Io[9�7h!!�uC��)� b/O)����H!�At�����>��Q{I~�B@gx��B �*l{�՜��R�^\�R��u{��q,C�-�k����+�a�c�?b@_9Л`�:���|���)wh���!����2�.�ܯ29���������E���W�d4.��_1x���qn����UÃ~����j�bN���>�)����tY�0]�����o��1$d�C9?4 5�dK���s[A��s}��*���|f{{���
jxc��v�d���ѹ�[r[A���/TVLA��oĺcѭ ����o;}n+h!�m����(�^/�i�� ���||�wWssh! ��;�<����]]�?���~�0J�7Zw��trm ���j[��Z�i���i&֝R����;��n�{жU:g��N��a����H9ƙ���l�؏���H�B@S����Q���cd��.!PC���ҝ���2p�������{��m�\h! ^��μ>`?R��>�R���@
��M�Ǝ?`>zc�('?�+ :�>>�o$t;��c�����n>���1!�������术������,�B���r�3�*�m%j�Y/�v�C<�>&c�]vgf�$k����ޱ���5���y�|���δ<�?:$��L]�Y��1�9��풃9���OO�U��1�뭫��IB ��1-�[
�����1&���b0���9'�&�UP��1緜����s��}�����}7}x؏�N>n�������b�4������1������}�v���N�}������E��5��g�۝2��Q����3���O޲[{ݕӶbq�>&$��e�j��=T�h�*����w��Q��1!���͘���c,���#�|���-��3���cB������s.���;/�����������wC��>4�G~#��)����������b@���si�������n��#�\j�RI9�'VbHƞѩl�`@ˋ{�k{c��`	dB�o�	��\껵���|��W]A`A䷁Ƹ���A>���V	�bb��p �|+�]�v�����s��ɀb��=����9�@&dOv�3�9P6���ъ��G���?�ݽ��$�CR�������E����|}�A>��u�PC\��>T���&䃼�x����N�G�����ڧKP��4F|���.��$�i�Q�ŋ5$s}�Z�CSi922���ф@9��;�4e,��\���1 ��#�x���,H���̧;�8`A>殮���o��Qɹ2B �z}t.��c������.y��|�]{v'Ȅ���
�:JƧ�����q6:�aR.�����J)!��ɞֿsa0�_� ��;�Wh�%o�-Y�Y��A>^�;���Ar�����<�� ��]���c�_i�n/8��x[��>gB ����ۺ��<Hg��v�'��i�_�15ԙS�䐔%�}7�>$k�y�:�`C&��e�jP/��ݶ]Q/��	�W�v�x.ؐó/��XG�.�c���l�`@�$���΋��B&��}%%�����l/�(;&�UCB��g`�p��4��[��4�b\�ݻ˄&��$��,M߿.d2g��.0!%ns��r�q�<�������>��7;��]�o�c\�B^?�u2 wiT��p�5H�x�H&�ʽ����Q��N���/t~�����B�͓��kF�܏��Qy�D�1!����;�J5>.�_�BR�82!x�q�gx�V��2((���ݾZ���}����eCB�Z��!��X���o-$㥠-R8^�������Z�N�J�b�n�\1$tvۛ�
h���#��z�����s������m;��Gr1u���gj�[A���v%�>PC0b{��J<PÍ	U�v�m  ����ޝ�|�p��Q}���1��#˛n�J�nC$'��*��54g{|{7�!���X�2�XH!���J}7A���6 m��A	]��֝�����w��^�:��z��}���{��b�B0f�~��2w��|�� �廡��|�0Õ�5��z�坯�풺[��|�0#��}t_�W��9���=_5�h}x�Z�;��竆�Ll�5 �5L���V ��1������b2k��8�vA�_?4�=�"Ǹ��Dx��b@�gL���j��!$d�<I����~��z��J&��5n� ��C�����8BBL�=�����_�%��.��A�]��
J�8��³��
bJ�����9��:��?�1�UPC0�ʢrZB0 rgb.�ѹ�WA	m�򺋣WA�u�t�گ���{FT�!�`K+�MA.��9
�^�`� =p��{�n���CB,uG��@������,��]g@ɰ�4%l:@1Nn�麸�Ԑ��E�O)!P���k�3˹��:P��+�t��u�$n%��:�:@�ܱ���h�$�8�ߞ����)$��t�at�$ڔ���^]u�v\q��])�N�BB����:A;�/h"�N�BB�EU-b�qc��P֜��@�طw��k:A��mϮtWGu�bk�ۻ9P�jH�/�V��/�lO�;"�jHȲ��2!PC�`�p]2��!����z
��ʉ�}�4m�rHf�CS1 �������0��p3Rm떔@1*��|]�1�P=$s~�FW���eF����Qp-����j��ǩ1s����1hާg7���Gc�`�<S�%��:�m�KĠq���7�a�����eu�3�?㣽h��U���Ag�6����]��`?>�L�Ƽ+؏�Lˊ�/��S�`?&$�F��P�\#�`[���*������脏��w�]EXp$oR1`>��c�������z�獮��]�}\1x}���.� �q���&�UQ��d|H`πf^�m��+X�"���'�@	+f?������=z/�ڣ92Qp�>m�a�z�"��B�n����Q��woR���E*��6����d|L��r����e��l����?>H�'�FW��#���QM���1^4��(؏��\��V[}��?zG���9�`?>�X��\ySpW���s��W��� ���1p�,��F`?>��pڰ��1��k�^d`?>�G6�
���L���X�4�om�J'�@ɬѵ�W�}@�ps���G��1�#*'�&Z��Ƿ��6�n����k�l�(A��ֲ&�+� )  �l;���8��C��%My����]G,s��c�a�>>H��V<	��WS����(���ا����O�=��M��|\�C��B]CRH���rɀ���I��֨���(�҇=���ehkk�G^�\1�|y���\B�|̵��骣`?z����UH���?��R��f���PC2w�rX0 ����m��#A�@	����K�Q$o�+���@�lZMі1 ��Y~C�1RȻY�j;�hA���ܺ(Rd��>�棷�^>��_�4'z�4[0��b�"�RoJ��J��i1�t�'�|���}o��r`�2��-��Z�Bp5櫄d,�y�n��3;&
jS:c�Wr��E�J��3�]�Ue``����Y�؅0�9�W�w=aڿ��Q{5��>����D�q��,�F���{P�q��0�Z����������4�1��ü�w
h�� ���˖WGr��A�x������;�x K�ߔ�ZF�>M3"c@+F��Fb5�x�@�u�-�@ �`�U�]���AǾ��t� P��f$�1��d,�X��1��	`��'�B%8���gȘ�@��c�H��J0������z�<&�m�O*�z�hNi��mE�p�ヶ.�!PC�5�M� ��c�iCL��@���h�! ?�i.�b��#�Ë������|s�*� q��?������K���4������T(a{���ߡ8U���A�6�m��1{���Q�3���̥u��7S��{��Gy���)��I��h�_?������0�       �   �   x���A�@��+�o44��#|�g_����&�nUt�%a�=�K��Cs�|iIkB!�s	Ӎ�O�;א}�jD�m 8r4����8��[=����@��'�M��	h�>�rx���� �Q8J      �   p   x�eͻ�@E��S9�h>;�"��1пX�`X���]ބDw�]���M��^�w��5W ���L���U�a�T�<�X�Hv>��
�_e3��ԅ��f�QX1.��+�      z      x������ � �      �      x������ � �      �      x������ � �      �   3  x���]��8���Sp�l����>n���f�靾�ڪ*U�dfް�%Nѕ*�+��[��խ��B7_�r��?�s|�uDN�����!���-�Ґ��~^���
m��{>��ǵ�\���Ys �;��?`٠aj���pmry���5�`�쫵5'�싑�z��0R���n���#n�}����Y~=[�v�����<_M����Sߍ�_m5~݃�F<4���`�d0���2��Y�^�͌�v����G���.�'_C�+�>ծ�K��u����h������G?����P�2�^���}0b�Y�聧���;��������,���Գp�s���RC�he��O/�W��7�Fk40=��@�gX�w`٢aM�mn��r~��s����& �ӌo��Q�/����ՠ>_��7��k������څ�U�6��o F��92��\8$CQ���$����\E���¤���LA���_�))e��bBSu���U���~y�i�	H��!&C2O���q��_A�KE-BF��l!F���e"�S)b������dM�p<�p5����B�d��)��Ebgr ���j���gxLeG��*�@bC8�tÉ�L��,	��ښZK��+`�J�F�n��aM�	�ϫ���?`	8U����Ѕ��Xj64���Q�R� ��)E�� *D�5Q��xzw���������Kb�xL��G"�dL�{t!�뵚Ç��3��?#�6YpXgf���$����|�g�+M��yo4/v�y{��Yz�<�I�}%��9��������e�J1�hY,g�Rl2�,��R)Ԅ����t��v�W7�J�C��|崹"$�+�+C�l�x�B$X��x�~��EO��l)"Gr� ]Jɉ�)�/e�@΄&l�8���N��-�dķ/D�eAi���ΐ�jm��0�����N���4}�� X<+�@���pL�x���q�W�Z}o���_NX����79�oy�6���dN��U��~�?���ʗ�Xѫ�t׻t�-���m���`If��UQ���f �u��L�� Ucwr�IZ���7�? �{���l�WV�yaw��+){�py�$�1�RȅF�`�'�_蓉�m���h���.)l����k��ˋ�.��+ˎ/�\O..���7��ri~��p�a]�E{���Q�S��/�En�����(R���Ɏ�i��b.+N�,n���8Ћ2�Y��l/�V�z{�c߹f�F#���d`���o��,"�;�o�d=��KА,��=��
a��q6�
�)r[���L�G������;X      �   <  x�m��n�@�3<E܌���"�xh���E!&
(�UY��O_i6�s�d��N�<J�݅�(���u��g�ѐw���q]��LXD�!
��p[݀-^����k98�i����r����B�q�	�pVXl�[��0�R���'PtDtYeDT	Zxx,�Kߊ��1Wf�,�LX�
�,���g�`L-#�8�ԍ���6� �Nd�r�j�y�>�=aБ�#$  �6|��_ic,����"b��Ty��y����9�鑱�]p��h�)*նǈ�oU��y�vMZ�K/Y���9���W����$7�����7x�w�      �      x������ � �      �      x�3�4洰����� U�      �      x������ � �      �   )	  x���[o[�ǟ�O!���:�^��X�tc�V��H�Bk˶GZ�
��b�{���,�r�m`�!��Ù�\H�	
�� �Q@A5�H"�Q�	���Z����O��h:M�����b�X�=�_�#�=���/�O��_���	�w���P�F8"��8��G�5�(�١�F*�څ��B'��d<��F���u���Be��
�L G3~3򿵅��G�hIJ�-=���������s�
#)݆*�Cn
pՀVV9�n��b��z�F�9]�>���]��Y�j�y�O�
pՠִ��������r�X��(�mc,���}p6٬W��$�'�t7�=܁����͑���P�v���0���͑)�$�t�؋g��N�閧�8�;L~�N���[��db�I\c��`�&��,�������@��Oa�d��)2a��QR
�
۾�};�H卜ID#�0��x?���ŴF���FJݠ�Bp���Ng5 �"f�rjP��_�+��8�WW��`���h�2<�����t�zYof������-?�*�y3�����
+$�0P�b�����$X��:T�R�J�Cu#	��;Z��:�Xs�#�PX^�46���N�����&�ϛ�@�yG-Ș�?-����̷�7�7[�gK��Բ�%)C�H�_թtd��^G\� �ҧ��ǥ��%�@w�!�V@p������v��$*0�$��z`� �A��w=0} �
�F�ꃩ%0I���\¡
{���d:+֘��٤>'� UPJHD���Ȼ2�
Ǻè�C]�8gd2upL:8p��	G���\zr�h��e��d�?��f��K�~�`�sz��RN���X��J� Y�@�R����z�/�c^�pr:Ɇ���}A����P,�!�%E[�A�������JK����`���)qr{9����J�9Q"w6ք�!K�W�.���U�ʁ�4�k7K�`	����vr��J�)�3�lX�� 8�x�޼�9���I�J��M��X���}�9T�y��&�N5h9۷P�@�|f�
T�T��/o?�կkQQkJ��.�
�Ď�Qt�6�(H�\�6�*N�ݶ��[aa�C�!��CTE�G�
��.�=A��i2X-�P.��dvY���)� ��1 ���_�I�Gg��=dU'��b��6%�7���*�<e�⟛*��DRqr�^��1��ہp����%.v�5��c/C)��A��d](tjв`Z(�P�m��ڕ'œ�;��2�R6Tt5���M&P��{�L�GjܕvZUhNk��<���2�q*t1L��� g*8@�c�����Vp�1~��� �*8�`^���p�gRy�p24���X�*v,�����jR5�`4UH�=���T;��+��AME{�[Z�=�H
�j"q�A���RC�(�@�9]7�RDg�����&���˱�\J�1L�>]|UӚ�9�4k�ʆֶ���lc�q9�1���lh$kP[�Z�@��
Ce�PW�	�[^��@5V0v�1U�[Q�b�����h�W��HT�rԍ�R��\'������)�A�2'H���)���mIKP)Aqq�X�]�zr��|�?�|���
�V9O�>�7w���h����`���z��e���f��|�;�j���@�.��E�L�������q�m���@}�o]�J�	#�._�7ϥ��v��H�sk�e��(Iw>$z���|���������|z�~^�~�?��t���d�sw�3��7[r~?�.N������/�=r��o����"�ح]/�J.a�����	ن��x̺����������GD�m�?���d�-m{�![�R���D���EQm�v�}H] pסj	>�g-��ަ�t��f���<@r���λ�*��R�� D:D���9+�cu��?:#�LƟ�(���G�?����S>�7s$$�3�N��y��G �,�m��A�i�A�G�i��F�tPU���n����N����)u�m3OGk�,�RS�#�t�AC���Q��2��:)� �y���[�Z>��ԓ��荷H�۪J-C�TH���
nF��h38���|�8��Zw��ߑ) 0���W$�D�t���HQ\7h���t�e���/�� @�ù8��h!�е(��ο-����KX`�@�P[��ݛ'����0x�r�����'��R`D����,���;��{�.�Ѳ�]0��F�?R�E`��� �9�'��u�#�d��!�{��[<�H}���8O@!}����gz�KBLƖ9�5H�C�꼹}���y����҂�      �      x������ � �      �      x������ � �      �   6  x�}R[r� �F����]:��X�I1Pi|�bd'����v%-+ɜ�nԖףMa�dN�F�vb�ಇ-�1��)gSiK���`�"��p���}�e��W�w��ĺ�����>��l0,�ŵ�7���*��A��7�L�V[L�E�^�B�!��m�q��M�4(�U2H�	|O1~e�E�p�h�p$���V�T9#�@l`��g�A�Rq�A�p�!���n�� 2}N�,�y�rD�����U�\��!YN�۱\�i�Ee͓�᯳,����%Ѽ�k��w��)�MC���� �Vz�C      �   y  x����r�8������V�n�ųL�J�������WH��	��7�����U�ׅ�uv� ��]j����B�3�TIEAQI��|";��"4W��z�Ƕ��0��.!�4�)&꿌wm��L|o��� pB��^1��*�}g�{2�{_WQ�m�:��7�Ȓ���LOLg[�M�b�T�\�#�6�ysv���a�h�7��4��N�_�(&8�J�(:��!^\k��.�SP��z��k�tI��簣W�S"+�_3;�I�:V66;-��$2�JQ��c�Wy��fm"yr^�)�L>lSm���z��i�0��^�%��+�+MmjsOd%E�:����)�JsAEB��0�N��a8P��RbŠ�Q!gξ�����<��LV/#�.��V�Q��f�/����T1���o�HP ! dr��|��"�I?�ۡ8�)ǟ�;�it�ww�H_3!Rل� .u(�n4 ��a)Art�E���&є�,�Y΋���KF�Y�a6,�;,n���'�%�Dl�=҅D�y���X�q~����qX ���;8�g��6K�h��R;,�-5��1��!X�v�������[̱���L�7�O�9
���g��}%A��:�u��dA	(�RY"���T��y�;�Z��^ĳ�:�L�BX���B��1�u4R�}���w����G�Ѵ��}�*����d�mF��e'�ƹh���54-�L>#� K���E���d� ����YIY���s�Ă3���z�KR�9������!/J*��[V7>5��8�5�������ǣ���S��77��~�0�� �>-6� �/�/��&��|�We�����3�����ƏG�Db�I�/P��4����~OOO�X(�      �   c  x���ɒ�@ ���sO��w�!`
Y�B�ʒe@������Or�;���'=S�B�Ǖ*�8�b����J�S�o���lL�s�iAX^tR�u��s�̽��k��F@%�������.����;�����3�h�h��e��Lm8i�9v��c���j�	`��1��8u�u[�����`�_���/��Ĝۯ�:���iM_��;��YT<J��Q�{��V�`j����<9{�3����Qvl�� &�w,��Se+�Ȼo�7�򬄬�����^d� ����-�t*���EJ�XT�/5�]��ѩB��&YՀ"��a������EXx'XA؊�`B���n6��|��      �      x������ � �      �   =   x�ɱ	 0�Z&�l n\Te�9b��9�����B�H�UD?�pOe!4�|��#qt      �   �  x�}��n�0���"O�Z�$m/]9�j����E���.�Pa��o���IZ`��|�43��<�Q��8�
~t�����(ih��E#7vxnV�l}�C]�'�ŝ ��$���,)(�F��8�q�(�IGk-��g Ap��B^Z2��:c�B��:�Q-x�۵�Ys}� 6����Y��6�v��=A���eņ�mr��v�vu�]]�blז}�o�/�?��K��}�NK��O��K(�BhT���h��[T�����0t-�\Db���
�>�r+�1�������	�8KCᇾ�C�m�5g)���t��S��I3�2� (|�4����Ҍ�E՚S��!�I�U�҃��g����i^�n�s%~��@&�]�wE���'i#Y��Z�v�n}dt}{Cg����>bw�u�1�(
�03}d�{�����WE���      �   �   x�-ϽjC1��Y��bI�-�ڱC�.��38J���^^���~{P���'� *7[�J�7��⼱��9��8�QE�k��j�U4����������3��U�s��B��8.OB��,@���@H�~�����=<�4Zv����`��\Las԰3�/�y��|�S0k�j~��~����?q      �   !   x���t+��+�t�4�74�0�4����� Q�R      �   1   x�3��JM,�t�4�74�04�4�2��t�K-J�D�p�r��qqq �
�      �      x������ � �      �   %   x�3�t/�/-�w�2������,g.(˅+F��� .�y      �      x���t�5�xC.CS mbq��qqq QZK      �      x������ � �      �   +   x�3�t+��+�t�74�0�4�22D�Yp�qs��qqq �^	�      �   ;   x�3�t+��+�t�4�74�0�4�2F3�4�2�JM,�s�s��
�p�q��qqq 1DA      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   p   x�E��
�0D����!��Q�%�AS����B��G8C�����m_,�gN�=�&�Ϗ;�~t����c'��X���J���؁���9�c�c��'jTJ5c3���dy'� ��&�      �   <   x�3�tMIO�w�4�2�0��LcN�Ԓ���l ۄ�5/�(��4�t�����K�c���� �s      �      x������ � �      �      x������ � �      �   7   x�3�4202�54�5��2�@LCNS.crF�f\&8�9͹Lqșp�p��qqq ��C      �   {   x�3�tM,ʩ�40�20 "NC#(H��@ln�9m�s���3�J����8}KR:�е��`�k�闙�Q���]3T#�&�~�E��9�0W��tB&��f�f�c���� ܉5�      �   4   x�34�tMIO�w���LI�I�����7�0�47�2�ɕ��$A1z\\\ ��      �      x������ � �      �   m   x�M̱
�0����W$�&J;f���r�`KC��]|z�"n���+�ۚ-S����X��r��0�Dj7������<��O*����q��r�������QD>VN�     