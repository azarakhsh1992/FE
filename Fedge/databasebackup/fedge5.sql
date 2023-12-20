PGDMP         6    
            {            fedge    15.5    15.5 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
                   fedge    false    4550                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    5            F           1259    30514    web_temperaturesensorvalue    TABLE     ?  CREATE TABLE public.web_temperaturesensorvalue (
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
       public         heap    fedge    false    5            a           1259    39126    _hyper_1_12_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_1_12_chunk (
    CONSTRAINT constraint_12 CHECK ((("time" >= '2023-12-07 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-14 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_temperaturesensorvalue);
 4   DROP TABLE _timescaledb_internal._hyper_1_12_chunk;
       _timescaledb_internal         heap    fedge    false    5    326            W           1259    30794    _hyper_1_2_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_1_2_chunk (
    CONSTRAINT constraint_2 CHECK ((("time" >= '2023-11-23 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-11-30 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_temperaturesensorvalue);
 3   DROP TABLE _timescaledb_internal._hyper_1_2_chunk;
       _timescaledb_internal         heap    fedge    false    5    326            ^           1259    39058    _hyper_1_9_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_1_9_chunk (
    CONSTRAINT constraint_9 CHECK ((("time" >= '2023-11-30 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-07 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_temperaturesensorvalue);
 3   DROP TABLE _timescaledb_internal._hyper_1_9_chunk;
       _timescaledb_internal         heap    fedge    false    5    326            J           1259    30528    web_ledvalue    TABLE     �   CREATE TABLE public.web_ledvalue (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    value integer,
    valid boolean NOT NULL,
    led_id bigint NOT NULL
);
     DROP TABLE public.web_ledvalue;
       public         heap    fedge    false    5            `           1259    39099    _hyper_2_11_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_2_11_chunk (
    CONSTRAINT constraint_11 CHECK ((("time" >= '2023-11-30 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-07 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_ledvalue);
 4   DROP TABLE _timescaledb_internal._hyper_2_11_chunk;
       _timescaledb_internal         heap    fedge    false    5    330            k           1259    47340    _hyper_2_18_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_2_18_chunk (
    CONSTRAINT constraint_18 CHECK ((("time" >= '2023-12-07 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-14 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_ledvalue);
 4   DROP TABLE _timescaledb_internal._hyper_2_18_chunk;
       _timescaledb_internal         heap    fedge    false    5    330            L           1259    30541    web_latchvalue    TABLE     �   CREATE TABLE public.web_latchvalue (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    value character varying(8),
    valid boolean NOT NULL,
    latch_id bigint NOT NULL
);
 "   DROP TABLE public.web_latchvalue;
       public         heap    fedge    false    5            _           1259    39069    _hyper_3_10_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_3_10_chunk (
    CONSTRAINT constraint_10 CHECK ((("time" >= '2023-11-30 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-07 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_latchvalue);
 4   DROP TABLE _timescaledb_internal._hyper_3_10_chunk;
       _timescaledb_internal         heap    fedge    false    5    332            j           1259    47329    _hyper_3_17_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_3_17_chunk (
    CONSTRAINT constraint_17 CHECK ((("time" >= '2023-12-07 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-14 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_latchvalue);
 4   DROP TABLE _timescaledb_internal._hyper_3_17_chunk;
       _timescaledb_internal         heap    fedge    false    5    332            X           1259    30847    _hyper_3_3_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_3_3_chunk (
    CONSTRAINT constraint_3 CHECK ((("time" >= '2023-11-23 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-11-30 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_latchvalue);
 3   DROP TABLE _timescaledb_internal._hyper_3_3_chunk;
       _timescaledb_internal         heap    fedge    false    5    332            N           1259    30549    web_latchsensorvalue    TABLE     �   CREATE TABLE public.web_latchsensorvalue (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    value boolean,
    valid boolean,
    latchsensor_id bigint NOT NULL
);
 (   DROP TABLE public.web_latchsensorvalue;
       public         heap    fedge    false    5            i           1259    47318    _hyper_4_16_chunk    TABLE     	  CREATE TABLE _timescaledb_internal._hyper_4_16_chunk (
    CONSTRAINT constraint_16 CHECK ((("time" >= '2023-12-07 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-14 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_latchsensorvalue);
 4   DROP TABLE _timescaledb_internal._hyper_4_16_chunk;
       _timescaledb_internal         heap    fedge    false    5    334            V           1259    30783    _hyper_4_1_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_4_1_chunk (
    CONSTRAINT constraint_1 CHECK ((("time" >= '2023-11-23 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-11-30 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_latchsensorvalue);
 3   DROP TABLE _timescaledb_internal._hyper_4_1_chunk;
       _timescaledb_internal         heap    fedge    false    334    5            ]           1259    39047    _hyper_4_8_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_4_8_chunk (
    CONSTRAINT constraint_8 CHECK ((("time" >= '2023-11-30 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-07 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_latchsensorvalue);
 3   DROP TABLE _timescaledb_internal._hyper_4_8_chunk;
       _timescaledb_internal         heap    fedge    false    5    334            P           1259    30571    web_energysensorvalue    TABLE     N  CREATE TABLE public.web_energysensorvalue (
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
       public         heap    fedge    false    5            b           1259    39140    _hyper_5_13_chunk    TABLE     
  CREATE TABLE _timescaledb_internal._hyper_5_13_chunk (
    CONSTRAINT constraint_13 CHECK ((("time" >= '2023-12-07 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-14 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_energysensorvalue);
 4   DROP TABLE _timescaledb_internal._hyper_5_13_chunk;
       _timescaledb_internal         heap    fedge    false    5    336            Y           1259    30858    _hyper_5_4_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_5_4_chunk (
    CONSTRAINT constraint_4 CHECK ((("time" >= '2023-11-23 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-11-30 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_energysensorvalue);
 3   DROP TABLE _timescaledb_internal._hyper_5_4_chunk;
       _timescaledb_internal         heap    fedge    false    5    336            \           1259    39036    _hyper_5_7_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_5_7_chunk (
    CONSTRAINT constraint_7 CHECK ((("time" >= '2023-11-30 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-07 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_energysensorvalue);
 3   DROP TABLE _timescaledb_internal._hyper_5_7_chunk;
       _timescaledb_internal         heap    fedge    false    5    336            R           1259    30579    web_doorsensorvalue    TABLE     �   CREATE TABLE public.web_doorsensorvalue (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    value character varying(8) NOT NULL,
    valid boolean,
    doorsensor_id bigint NOT NULL
);
 '   DROP TABLE public.web_doorsensorvalue;
       public         heap    fedge    false    5            c           1259    39151    _hyper_6_14_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_6_14_chunk (
    CONSTRAINT constraint_14 CHECK ((("time" >= '2023-12-07 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-14 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_doorsensorvalue);
 4   DROP TABLE _timescaledb_internal._hyper_6_14_chunk;
       _timescaledb_internal         heap    fedge    false    5    338            l           1259    47363    _hyper_6_19_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_6_19_chunk (
    CONSTRAINT constraint_19 CHECK ((("time" >= '2023-12-14 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-21 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_doorsensorvalue);
 4   DROP TABLE _timescaledb_internal._hyper_6_19_chunk;
       _timescaledb_internal         heap    fedge    false    5    338            [           1259    30880    _hyper_6_6_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_6_6_chunk (
    CONSTRAINT constraint_6 CHECK ((("time" >= '2023-11-23 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-11-30 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_doorsensorvalue);
 3   DROP TABLE _timescaledb_internal._hyper_6_6_chunk;
       _timescaledb_internal         heap    fedge    false    5    338            U           1259    30605    web_buttonvalue    TABLE     �   CREATE TABLE public.web_buttonvalue (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    value boolean,
    valid boolean NOT NULL,
    doorbutton_id bigint NOT NULL
);
 #   DROP TABLE public.web_buttonvalue;
       public         heap    fedge    false    5            f           1259    39178    _hyper_7_15_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_7_15_chunk (
    CONSTRAINT constraint_15 CHECK ((("time" >= '2023-12-07 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-12-14 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_buttonvalue);
 4   DROP TABLE _timescaledb_internal._hyper_7_15_chunk;
       _timescaledb_internal         heap    fedge    false    5    341            Z           1259    30869    _hyper_7_5_chunk    TABLE       CREATE TABLE _timescaledb_internal._hyper_7_5_chunk (
    CONSTRAINT constraint_5 CHECK ((("time" >= '2023-11-23 01:00:00+01'::timestamp with time zone) AND ("time" < '2023-11-30 01:00:00+01'::timestamp with time zone)))
)
INHERITS (public.web_buttonvalue);
 3   DROP TABLE _timescaledb_internal._hyper_7_5_chunk;
       _timescaledb_internal         heap    fedge    false    5    341                       1259    30172 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    fedge    false    5                       1259    30171    auth_group_id_seq    SEQUENCE     �   ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    283    5                       1259    30180    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    fedge    false    5                       1259    30179    auth_group_permissions_id_seq    SEQUENCE     �   ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    285    5                       1259    30166    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    fedge    false    5                       1259    30165    auth_permission_id_seq    SEQUENCE     �   ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    281    5                       1259    30186 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
       public         heap    fedge    false    5            !           1259    30194    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    fedge    false    5                        1259    30193    auth_user_groups_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    289                       1259    30185    auth_user_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    287            #           1259    30200    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    fedge    false    5            "           1259    30199 !   auth_user_user_permissions_id_seq    SEQUENCE     �   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    291    5            &           1259    30286    authtoken_token    TABLE     �   CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);
 #   DROP TABLE public.authtoken_token;
       public         heap    fedge    false    5            %           1259    30258    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         heap    fedge    false    5            $           1259    30257    django_admin_log_id_seq    SEQUENCE     �   ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    293            '           1259    30300    django_apscheduler_djangojob    TABLE     �   CREATE TABLE public.django_apscheduler_djangojob (
    id character varying(255) NOT NULL,
    next_run_time timestamp with time zone,
    job_state bytea NOT NULL
);
 0   DROP TABLE public.django_apscheduler_djangojob;
       public         heap    fedge    false    5            )           1259    30310 %   django_apscheduler_djangojobexecution    TABLE     P  CREATE TABLE public.django_apscheduler_djangojobexecution (
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
       public         heap    fedge    false    5            (           1259    30309 ,   django_apscheduler_djangojobexecution_id_seq    SEQUENCE     	  ALTER TABLE public.django_apscheduler_djangojobexecution ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_apscheduler_djangojobexecution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    297                       1259    30158    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    fedge    false    5                       1259    30157    django_content_type_id_seq    SEQUENCE     �   ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    279    5                       1259    30150    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    fedge    false    5                       1259    30149    django_migrations_id_seq    SEQUENCE     �   ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    277            *           1259    30365    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    fedge    false    5            T           1259    30604    web_buttonvalue_id_seq    SEQUENCE     �   ALTER TABLE public.web_buttonvalue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_buttonvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    341            ,           1259    30375    web_cabinet    TABLE     v  CREATE TABLE public.web_cabinet (
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
       public         heap    fedge    false    5            +           1259    30374    web_cabinet_id_seq    SEQUENCE     �   ALTER TABLE public.web_cabinet ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_cabinet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    300            .           1259    30383 
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
       public         heap    fedge    false    5            -           1259    30382    web_device_id_seq    SEQUENCE     �   ALTER TABLE public.web_device ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    302            0           1259    30393    web_door    TABLE     �   CREATE TABLE public.web_door (
    id bigint NOT NULL,
    direction character varying(32) NOT NULL,
    qr character varying(32) NOT NULL,
    rack_id bigint NOT NULL
);
    DROP TABLE public.web_door;
       public         heap    fedge    false    5            /           1259    30392    web_door_id_seq    SEQUENCE     �   ALTER TABLE public.web_door ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_door_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    304            S           1259    30593    web_doorbutton    TABLE     �   CREATE TABLE public.web_doorbutton (
    device_ptr_id bigint NOT NULL,
    door_direction character varying(32) NOT NULL,
    device_io_module character varying(8) NOT NULL,
    device_port character varying(4) NOT NULL,
    door_id bigint NOT NULL
);
 "   DROP TABLE public.web_doorbutton;
       public         heap    fedge    false    5            7           1259    30420    web_doorsensor    TABLE     �   CREATE TABLE public.web_doorsensor (
    device_ptr_id bigint NOT NULL,
    door_direction character varying(32) NOT NULL,
    device_io_module character varying(8) NOT NULL,
    device_port character varying(4) NOT NULL,
    door_id bigint NOT NULL
);
 "   DROP TABLE public.web_doorsensor;
       public         heap    fedge    false    5            Q           1259    30578    web_doorsensorvalue_id_seq    SEQUENCE     �   ALTER TABLE public.web_doorsensorvalue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_doorsensorvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    338    5            2           1259    30401    web_employeegroup    TABLE     n   CREATE TABLE public.web_employeegroup (
    id bigint NOT NULL,
    "group" character varying(10) NOT NULL
);
 %   DROP TABLE public.web_employeegroup;
       public         heap    fedge    false    5            1           1259    30400    web_employeegroup_id_seq    SEQUENCE     �   ALTER TABLE public.web_employeegroup ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_employeegroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    306    5            8           1259    30425    web_energysensor    TABLE     �   CREATE TABLE public.web_energysensor (
    device_ptr_id bigint NOT NULL,
    measuring_environment character varying(4) NOT NULL,
    device_io_module character varying(8) NOT NULL
);
 $   DROP TABLE public.web_energysensor;
       public         heap    fedge    false    5            O           1259    30570    web_energysensorvalue_id_seq    SEQUENCE     �   ALTER TABLE public.web_energysensorvalue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_energysensorvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    336    5            9           1259    30432 	   web_latch    TABLE     �   CREATE TABLE public.web_latch (
    device_ptr_id bigint NOT NULL,
    door_direction character varying(32) NOT NULL,
    device_io_module character varying(8) NOT NULL,
    device_port character varying(4) NOT NULL,
    door_id bigint NOT NULL
);
    DROP TABLE public.web_latch;
       public         heap    fedge    false    5            :           1259    30437    web_latchsensor    TABLE     �   CREATE TABLE public.web_latchsensor (
    device_ptr_id bigint NOT NULL,
    door_direction character varying(32) NOT NULL,
    device_io_module character varying(8) NOT NULL,
    device_port character varying(4) NOT NULL,
    door_id bigint NOT NULL
);
 #   DROP TABLE public.web_latchsensor;
       public         heap    fedge    false    5            M           1259    30548    web_latchsensorvalue_id_seq    SEQUENCE     �   ALTER TABLE public.web_latchsensorvalue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_latchsensorvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    334            K           1259    30540    web_latchvalue_id_seq    SEQUENCE     �   ALTER TABLE public.web_latchvalue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_latchvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    332    5            ;           1259    30442    web_led    TABLE     �   CREATE TABLE public.web_led (
    device_ptr_id bigint NOT NULL,
    door_direction character varying(32) NOT NULL,
    device_io_module character varying(8) NOT NULL,
    device_port character varying(4) NOT NULL,
    door_id bigint NOT NULL
);
    DROP TABLE public.web_led;
       public         heap    fedge    false    5            I           1259    30527    web_ledvalue_id_seq    SEQUENCE     �   ALTER TABLE public.web_ledvalue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_ledvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    330    5            e           1259    39163    web_ledvaluecases    TABLE     �   CREATE TABLE public.web_ledvaluecases (
    id bigint NOT NULL,
    description character varying(24) NOT NULL,
    functionality text NOT NULL,
    value integer NOT NULL
);
 %   DROP TABLE public.web_ledvaluecases;
       public         heap    fedge    false    5            d           1259    39162    web_ledvaluecases_id_seq    SEQUENCE     �   ALTER TABLE public.web_ledvaluecases ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_ledvaluecases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    357            D           1259    30483    web_plc    TABLE     �  CREATE TABLE public.web_plc (
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
       public         heap    fedge    false    5            C           1259    30482    web_plc_id_seq    SEQUENCE     �   ALTER TABLE public.web_plc ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_plc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    324    5            4           1259    30409    web_rack    TABLE     �   CREATE TABLE public.web_rack (
    id bigint NOT NULL,
    name character varying(16) NOT NULL,
    cabinet_id bigint NOT NULL
);
    DROP TABLE public.web_rack;
       public         heap    fedge    false    5            3           1259    30408    web_rack_id_seq    SEQUENCE     �   ALTER TABLE public.web_rack ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_rack_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    308            6           1259    30415    web_request    TABLE     �  CREATE TABLE public.web_request (
    id bigint NOT NULL,
    description text,
    servicelog boolean NOT NULL,
    button_pushed boolean NOT NULL,
    cancelled_by_frontend boolean NOT NULL,
    sent_to_plc boolean NOT NULL,
    sent_to_frontend boolean NOT NULL,
    "time" timestamp with time zone NOT NULL,
    cabinet_id bigint NOT NULL,
    door_id bigint NOT NULL,
    rack_id bigint NOT NULL,
    user_id integer NOT NULL,
    access boolean NOT NULL,
    status character varying(128)
);
    DROP TABLE public.web_request;
       public         heap    fedge    false    5            5           1259    30414    web_request_id_seq    SEQUENCE     �   ALTER TABLE public.web_request ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    310            B           1259    30473    web_servicelog    TABLE     �   CREATE TABLE public.web_servicelog (
    id bigint NOT NULL,
    description text NOT NULL,
    "time" timestamp with time zone NOT NULL,
    request_id bigint NOT NULL
);
 "   DROP TABLE public.web_servicelog;
       public         heap    fedge    false    5            A           1259    30472    web_servicelog_id_seq    SEQUENCE     �   ALTER TABLE public.web_servicelog ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_servicelog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    322    5            H           1259    30522    web_shiftassignment    TABLE     �   CREATE TABLE public.web_shiftassignment (
    id bigint NOT NULL,
    starting_date date NOT NULL,
    ending_date date NOT NULL,
    group_id bigint NOT NULL,
    shift_id bigint NOT NULL
);
 '   DROP TABLE public.web_shiftassignment;
       public         heap    fedge    false    5            G           1259    30521    web_shiftassignment_id_seq    SEQUENCE     �   ALTER TABLE public.web_shiftassignment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_shiftassignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    328    5            @           1259    30465 
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
       public         heap    fedge    false    5            ?           1259    30464    web_shifts_id_seq    SEQUENCE     �   ALTER TABLE public.web_shifts ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_shifts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    320            <           1259    30447    web_temperaturesensor    TABLE       CREATE TABLE public.web_temperaturesensor (
    device_ptr_id bigint NOT NULL,
    measuring_environment character varying(16) NOT NULL,
    device_io_module character varying(8) NOT NULL,
    device_port character varying(4) NOT NULL,
    critical_value double precision NOT NULL
);
 )   DROP TABLE public.web_temperaturesensor;
       public         heap    fedge    false    5            E           1259    30513 !   web_temperaturesensorvalue_id_seq    SEQUENCE     �   ALTER TABLE public.web_temperaturesensorvalue ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_temperaturesensorvalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    326    5            h           1259    47295    web_userlog    TABLE     �   CREATE TABLE public.web_userlog (
    id bigint NOT NULL,
    request_id bigint NOT NULL,
    servicelog_id bigint,
    user_id integer NOT NULL
);
    DROP TABLE public.web_userlog;
       public         heap    fedge    false    5            g           1259    47294    web_userlog_id_seq    SEQUENCE     �   ALTER TABLE public.web_userlog ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_userlog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    5    360            >           1259    30455    web_userprofile    TABLE     A  CREATE TABLE public.web_userprofile (
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
       public         heap    fedge    false    5            =           1259    30454    web_userprofile_id_seq    SEQUENCE     �   ALTER TABLE public.web_userprofile ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.web_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          fedge    false    318    5            �          0    39126    _hyper_1_12_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    353   :W      �          0    30794    _hyper_1_2_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    343   IY      �          0    39058    _hyper_1_9_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    350   4Z      �          0    39099    _hyper_2_11_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    352   yw      �          0    47340    _hyper_2_18_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    363   �w      �          0    39069    _hyper_3_10_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    351   �w      �          0    47329    _hyper_3_17_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    362   E�      �          0    30847    _hyper_3_3_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    344   ��      �          0    47318    _hyper_4_16_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    361   _�      �          0    30783    _hyper_4_1_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    342   a�      �          0    39047    _hyper_4_8_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    349   ~�      �          0    39140    _hyper_5_13_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    354   �      �          0    30858    _hyper_5_4_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    345   ��      �          0    39036    _hyper_5_7_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    348   �      �          0    39151    _hyper_6_14_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    355   -W      �          0    47363    _hyper_6_19_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    364   X      �          0    30880    _hyper_6_6_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    347   �X      �          0    39178    _hyper_7_15_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    358   �Y      �          0    30869    _hyper_7_5_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    346   �Z      o          0    30172 
   auth_group 
   TABLE DATA                 public          fedge    false    283   �[      q          0    30180    auth_group_permissions 
   TABLE DATA                 public          fedge    false    285   �[      m          0    30166    auth_permission 
   TABLE DATA                 public          fedge    false    281   �[      s          0    30186 	   auth_user 
   TABLE DATA                 public          fedge    false    287   :b      u          0    30194    auth_user_groups 
   TABLE DATA                 public          fedge    false    289   �c      w          0    30200    auth_user_user_permissions 
   TABLE DATA                 public          fedge    false    291   �c      z          0    30286    authtoken_token 
   TABLE DATA                 public          fedge    false    294   fd      y          0    30258    django_admin_log 
   TABLE DATA                 public          fedge    false    293   e      {          0    30300    django_apscheduler_djangojob 
   TABLE DATA                 public          fedge    false    295   �u      }          0    30310 %   django_apscheduler_djangojobexecution 
   TABLE DATA                 public          fedge    false    297   �u      k          0    30158    django_content_type 
   TABLE DATA                 public          fedge    false    279   �u      i          0    30150    django_migrations 
   TABLE DATA                 public          fedge    false    277   �w      ~          0    30365    django_session 
   TABLE DATA                 public          fedge    false    298   }      �          0    30605    web_buttonvalue 
   TABLE DATA                 public          fedge    false    341   e�      �          0    30375    web_cabinet 
   TABLE DATA                 public          fedge    false    300   �      �          0    30383 
   web_device 
   TABLE DATA                 public          fedge    false    302   ��      �          0    30393    web_door 
   TABLE DATA                 public          fedge    false    304   g�      �          0    30593    web_doorbutton 
   TABLE DATA                 public          fedge    false    339   ��      �          0    30420    web_doorsensor 
   TABLE DATA                 public          fedge    false    311   ��      �          0    30579    web_doorsensorvalue 
   TABLE DATA                 public          fedge    false    338   ц      �          0    30401    web_employeegroup 
   TABLE DATA                 public          fedge    false    306   �      �          0    30425    web_energysensor 
   TABLE DATA                 public          fedge    false    312   m�      �          0    30571    web_energysensorvalue 
   TABLE DATA                 public          fedge    false    336   �      �          0    30432 	   web_latch 
   TABLE DATA                 public          fedge    false    313   �      �          0    30437    web_latchsensor 
   TABLE DATA                 public          fedge    false    314   ��      �          0    30549    web_latchsensorvalue 
   TABLE DATA                 public          fedge    false    334   �      �          0    30541    web_latchvalue 
   TABLE DATA                 public          fedge    false    332   8�      �          0    30442    web_led 
   TABLE DATA                 public          fedge    false    315   R�      �          0    30528    web_ledvalue 
   TABLE DATA                 public          fedge    false    330   ��      �          0    39163    web_ledvaluecases 
   TABLE DATA                 public          fedge    false    357   ډ      �          0    30483    web_plc 
   TABLE DATA                 public          fedge    false    324   ��      �          0    30409    web_rack 
   TABLE DATA                 public          fedge    false    308   ��      �          0    30415    web_request 
   TABLE DATA                 public          fedge    false    310   )�      �          0    30473    web_servicelog 
   TABLE DATA                 public          fedge    false    322   ��      �          0    30522    web_shiftassignment 
   TABLE DATA                 public          fedge    false    328   ��      �          0    30465 
   web_shifts 
   TABLE DATA                 public          fedge    false    320   M�      �          0    30447    web_temperaturesensor 
   TABLE DATA                 public          fedge    false    316   (�      �          0    30514    web_temperaturesensorvalue 
   TABLE DATA                 public          fedge    false    326   �      �          0    47295    web_userlog 
   TABLE DATA                 public          fedge    false    360   �      �          0    30455    web_userprofile 
   TABLE DATA                 public          fedge    false    318   .�      �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          fedge    false    282            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          fedge    false    284            �           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 148, true);
          public          fedge    false    280            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          fedge    false    288            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);
          public          fedge    false    286            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, true);
          public          fedge    false    290            �           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 194, true);
          public          fedge    false    292            �           0    0 ,   django_apscheduler_djangojobexecution_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.django_apscheduler_djangojobexecution_id_seq', 1, false);
          public          fedge    false    296            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 37, true);
          public          fedge    false    278            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 52, true);
          public          fedge    false    276            �           0    0    web_buttonvalue_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.web_buttonvalue_id_seq', 9, true);
          public          fedge    false    340            �           0    0    web_cabinet_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.web_cabinet_id_seq', 2, true);
          public          fedge    false    299            �           0    0    web_device_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.web_device_id_seq', 34, true);
          public          fedge    false    301            �           0    0    web_door_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.web_door_id_seq', 8, true);
          public          fedge    false    303            �           0    0    web_doorsensorvalue_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.web_doorsensorvalue_id_seq', 25, true);
          public          fedge    false    337            �           0    0    web_employeegroup_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.web_employeegroup_id_seq', 4, true);
          public          fedge    false    305            �           0    0    web_energysensorvalue_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.web_energysensorvalue_id_seq', 4473, true);
          public          fedge    false    335            �           0    0    web_latchsensorvalue_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.web_latchsensorvalue_id_seq', 161, true);
          public          fedge    false    333            �           0    0    web_latchvalue_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.web_latchvalue_id_seq', 245, true);
          public          fedge    false    331            �           0    0    web_ledvalue_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.web_ledvalue_id_seq', 158, true);
          public          fedge    false    329            �           0    0    web_ledvaluecases_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.web_ledvaluecases_id_seq', 9, true);
          public          fedge    false    356            �           0    0    web_plc_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.web_plc_id_seq', 2, true);
          public          fedge    false    323            �           0    0    web_rack_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.web_rack_id_seq', 5, true);
          public          fedge    false    307            �           0    0    web_request_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.web_request_id_seq', 117, true);
          public          fedge    false    309            �           0    0    web_servicelog_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.web_servicelog_id_seq', 1, false);
          public          fedge    false    321            �           0    0    web_shiftassignment_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.web_shiftassignment_id_seq', 5, true);
          public          fedge    false    327            �           0    0    web_shifts_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.web_shifts_id_seq', 7, true);
          public          fedge    false    319            �           0    0 !   web_temperaturesensorvalue_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.web_temperaturesensorvalue_id_seq', 574, true);
          public          fedge    false    325            �           0    0    web_userlog_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.web_userlog_id_seq', 50, true);
          public          fedge    false    359            �           0    0    web_userprofile_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.web_userprofile_id_seq', 3, true);
          public          fedge    false    317            �           2606    30284    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            fedge    false    283            �           2606    30215 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            fedge    false    285    285            �           2606    30184 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            fedge    false    285            �           2606    30176    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            fedge    false    283            �           2606    30206 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            fedge    false    281    281            �           2606    30170 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            fedge    false    281            �           2606    30198 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            fedge    false    289            �           2606    30230 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            fedge    false    289    289            �           2606    30190    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            fedge    false    287            �           2606    30204 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            fedge    false    291            �           2606    30244 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            fedge    false    291    291            �           2606    30279     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            fedge    false    287            �           2606    30290 $   authtoken_token authtoken_token_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);
 N   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
       public            fedge    false    294            �           2606    30292 +   authtoken_token authtoken_token_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
       public            fedge    false    294            �           2606    30265 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            fedge    false    293            �           2606    30327 >   django_apscheduler_djangojob django_apscheduler_djangojob_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.django_apscheduler_djangojob
    ADD CONSTRAINT django_apscheduler_djangojob_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.django_apscheduler_djangojob DROP CONSTRAINT django_apscheduler_djangojob_pkey;
       public            fedge    false    295            �           2606    30353 P   django_apscheduler_djangojobexecution django_apscheduler_djangojobexecution_pkey 
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
       public            fedge    false    277            �           2606    30371 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            fedge    false    298            �           2606    30364 ;   django_apscheduler_djangojobexecution unique_job_executions 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_apscheduler_djangojobexecution
    ADD CONSTRAINT unique_job_executions UNIQUE (job_id, run_time);
 e   ALTER TABLE ONLY public.django_apscheduler_djangojobexecution DROP CONSTRAINT unique_job_executions;
       public            fedge    false    297    297            �           2606    30613 >   web_cabinet web_cabinet_bereich_segment_anlage_a_d2140bad_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.web_cabinet
    ADD CONSTRAINT web_cabinet_bereich_segment_anlage_a_d2140bad_uniq UNIQUE (bereich, segment, anlage, arg_sps, pultbereich_sk, station);
 h   ALTER TABLE ONLY public.web_cabinet DROP CONSTRAINT web_cabinet_bereich_segment_anlage_a_d2140bad_uniq;
       public            fedge    false    300    300    300    300    300    300            �           2606    30379    web_cabinet web_cabinet_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.web_cabinet
    ADD CONSTRAINT web_cabinet_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.web_cabinet DROP CONSTRAINT web_cabinet_pkey;
       public            fedge    false    300            �           2606    30381 )   web_cabinet web_cabinet_profinet_name_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.web_cabinet
    ADD CONSTRAINT web_cabinet_profinet_name_key UNIQUE (profinet_name);
 S   ALTER TABLE ONLY public.web_cabinet DROP CONSTRAINT web_cabinet_profinet_name_key;
       public            fedge    false    300            �           2606    30387    web_device web_device_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.web_device
    ADD CONSTRAINT web_device_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.web_device DROP CONSTRAINT web_device_pkey;
       public            fedge    false    302            �           2606    30603 9   web_device web_device_port_io_module_plc_id_fc6610c0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.web_device
    ADD CONSTRAINT web_device_port_io_module_plc_id_fc6610c0_uniq UNIQUE (port, io_module, plc_id);
 c   ALTER TABLE ONLY public.web_device DROP CONSTRAINT web_device_port_io_module_plc_id_fc6610c0_uniq;
       public            fedge    false    302    302    302            �           2606    30391 '   web_device web_device_profinet_name_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.web_device
    ADD CONSTRAINT web_device_profinet_name_key UNIQUE (profinet_name);
 Q   ALTER TABLE ONLY public.web_device DROP CONSTRAINT web_device_profinet_name_key;
       public            fedge    false    302            �           2606    30389 '   web_device web_device_serial_number_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.web_device
    ADD CONSTRAINT web_device_serial_number_key UNIQUE (serial_number);
 Q   ALTER TABLE ONLY public.web_device DROP CONSTRAINT web_device_serial_number_key;
       public            fedge    false    302            �           2606    30601 1   web_door web_door_direction_rack_id_6ad2611f_uniq 
   CONSTRAINT     z   ALTER TABLE ONLY public.web_door
    ADD CONSTRAINT web_door_direction_rack_id_6ad2611f_uniq UNIQUE (direction, rack_id);
 [   ALTER TABLE ONLY public.web_door DROP CONSTRAINT web_door_direction_rack_id_6ad2611f_uniq;
       public            fedge    false    304    304            �           2606    30397    web_door web_door_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.web_door
    ADD CONSTRAINT web_door_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.web_door DROP CONSTRAINT web_door_pkey;
       public            fedge    false    304            �           2606    30399    web_door web_door_qr_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.web_door
    ADD CONSTRAINT web_door_qr_key UNIQUE (qr);
 B   ALTER TABLE ONLY public.web_door DROP CONSTRAINT web_door_qr_key;
       public            fedge    false    304            O           2606    30599 )   web_doorbutton web_doorbutton_door_id_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.web_doorbutton
    ADD CONSTRAINT web_doorbutton_door_id_key UNIQUE (door_id);
 S   ALTER TABLE ONLY public.web_doorbutton DROP CONSTRAINT web_doorbutton_door_id_key;
       public            fedge    false    339            Q           2606    30597 "   web_doorbutton web_doorbutton_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.web_doorbutton
    ADD CONSTRAINT web_doorbutton_pkey PRIMARY KEY (device_ptr_id);
 L   ALTER TABLE ONLY public.web_doorbutton DROP CONSTRAINT web_doorbutton_pkey;
       public            fedge    false    339                       2606    30587 )   web_doorsensor web_doorsensor_door_id_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.web_doorsensor
    ADD CONSTRAINT web_doorsensor_door_id_key UNIQUE (door_id);
 S   ALTER TABLE ONLY public.web_doorsensor DROP CONSTRAINT web_doorsensor_door_id_key;
       public            fedge    false    311            	           2606    30424 "   web_doorsensor web_doorsensor_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.web_doorsensor
    ADD CONSTRAINT web_doorsensor_pkey PRIMARY KEY (device_ptr_id);
 L   ALTER TABLE ONLY public.web_doorsensor DROP CONSTRAINT web_doorsensor_pkey;
       public            fedge    false    311            �           2606    30407 -   web_employeegroup web_employeegroup_group_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.web_employeegroup
    ADD CONSTRAINT web_employeegroup_group_key UNIQUE ("group");
 W   ALTER TABLE ONLY public.web_employeegroup DROP CONSTRAINT web_employeegroup_group_key;
       public            fedge    false    306            �           2606    30405 (   web_employeegroup web_employeegroup_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.web_employeegroup
    ADD CONSTRAINT web_employeegroup_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.web_employeegroup DROP CONSTRAINT web_employeegroup_pkey;
       public            fedge    false    306                       2606    30431 ;   web_energysensor web_energysensor_measuring_environment_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.web_energysensor
    ADD CONSTRAINT web_energysensor_measuring_environment_key UNIQUE (measuring_environment);
 e   ALTER TABLE ONLY public.web_energysensor DROP CONSTRAINT web_energysensor_measuring_environment_key;
       public            fedge    false    312                       2606    30429 &   web_energysensor web_energysensor_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.web_energysensor
    ADD CONSTRAINT web_energysensor_pkey PRIMARY KEY (device_ptr_id);
 P   ALTER TABLE ONLY public.web_energysensor DROP CONSTRAINT web_energysensor_pkey;
       public            fedge    false    312                       2606    30564    web_latch web_latch_door_id_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.web_latch
    ADD CONSTRAINT web_latch_door_id_key UNIQUE (door_id);
 I   ALTER TABLE ONLY public.web_latch DROP CONSTRAINT web_latch_door_id_key;
       public            fedge    false    313                       2606    30436    web_latch web_latch_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.web_latch
    ADD CONSTRAINT web_latch_pkey PRIMARY KEY (device_ptr_id);
 B   ALTER TABLE ONLY public.web_latch DROP CONSTRAINT web_latch_pkey;
       public            fedge    false    313                       2606    30557 +   web_latchsensor web_latchsensor_door_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.web_latchsensor
    ADD CONSTRAINT web_latchsensor_door_id_key UNIQUE (door_id);
 U   ALTER TABLE ONLY public.web_latchsensor DROP CONSTRAINT web_latchsensor_door_id_key;
       public            fedge    false    314                       2606    30441 $   web_latchsensor web_latchsensor_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.web_latchsensor
    ADD CONSTRAINT web_latchsensor_pkey PRIMARY KEY (device_ptr_id);
 N   ALTER TABLE ONLY public.web_latchsensor DROP CONSTRAINT web_latchsensor_pkey;
       public            fedge    false    314                       2606    39208 %   web_led web_led_door_id_ed3e81da_uniq 
   CONSTRAINT     c   ALTER TABLE ONLY public.web_led
    ADD CONSTRAINT web_led_door_id_ed3e81da_uniq UNIQUE (door_id);
 O   ALTER TABLE ONLY public.web_led DROP CONSTRAINT web_led_door_id_ed3e81da_uniq;
       public            fedge    false    315                       2606    30446    web_led web_led_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.web_led
    ADD CONSTRAINT web_led_pkey PRIMARY KEY (device_ptr_id);
 >   ALTER TABLE ONLY public.web_led DROP CONSTRAINT web_led_pkey;
       public            fedge    false    315            r           2606    39173 =   web_ledvaluecases web_ledvaluecases_description_030e0196_uniq 
   CONSTRAINT        ALTER TABLE ONLY public.web_ledvaluecases
    ADD CONSTRAINT web_ledvaluecases_description_030e0196_uniq UNIQUE (description);
 g   ALTER TABLE ONLY public.web_ledvaluecases DROP CONSTRAINT web_ledvaluecases_description_030e0196_uniq;
       public            fedge    false    357            t           2606    39169 (   web_ledvaluecases web_ledvaluecases_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.web_ledvaluecases
    ADD CONSTRAINT web_ledvaluecases_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.web_ledvaluecases DROP CONSTRAINT web_ledvaluecases_pkey;
       public            fedge    false    357            1           2606    30497    web_plc web_plc_cabinet_id_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.web_plc
    ADD CONSTRAINT web_plc_cabinet_id_key UNIQUE (cabinet_id);
 H   ALTER TABLE ONLY public.web_plc DROP CONSTRAINT web_plc_cabinet_id_key;
       public            fedge    false    324            3           2606    30491    web_plc web_plc_ip_address_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.web_plc
    ADD CONSTRAINT web_plc_ip_address_key UNIQUE (ip_address);
 H   ALTER TABLE ONLY public.web_plc DROP CONSTRAINT web_plc_ip_address_key;
       public            fedge    false    324            5           2606    30489    web_plc web_plc_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.web_plc
    ADD CONSTRAINT web_plc_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.web_plc DROP CONSTRAINT web_plc_pkey;
       public            fedge    false    324            8           2606    30806 !   web_plc web_plc_profinet_name_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.web_plc
    ADD CONSTRAINT web_plc_profinet_name_key UNIQUE (profinet_name);
 K   ALTER TABLE ONLY public.web_plc DROP CONSTRAINT web_plc_profinet_name_key;
       public            fedge    false    324            ;           2606    30493 !   web_plc web_plc_serial_number_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.web_plc
    ADD CONSTRAINT web_plc_serial_number_key UNIQUE (serial_number);
 K   ALTER TABLE ONLY public.web_plc DROP CONSTRAINT web_plc_serial_number_key;
       public            fedge    false    324            �           2606    30620 /   web_rack web_rack_name_cabinet_id_c24add45_uniq 
   CONSTRAINT     v   ALTER TABLE ONLY public.web_rack
    ADD CONSTRAINT web_rack_name_cabinet_id_c24add45_uniq UNIQUE (name, cabinet_id);
 Y   ALTER TABLE ONLY public.web_rack DROP CONSTRAINT web_rack_name_cabinet_id_c24add45_uniq;
       public            fedge    false    308    308            �           2606    30413    web_rack web_rack_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.web_rack
    ADD CONSTRAINT web_rack_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.web_rack DROP CONSTRAINT web_rack_pkey;
       public            fedge    false    308                       2606    30419    web_request web_request_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.web_request
    ADD CONSTRAINT web_request_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.web_request DROP CONSTRAINT web_request_pkey;
       public            fedge    false    310            -           2606    30479 "   web_servicelog web_servicelog_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.web_servicelog
    ADD CONSTRAINT web_servicelog_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.web_servicelog DROP CONSTRAINT web_servicelog_pkey;
       public            fedge    false    322            /           2606    30481 ,   web_servicelog web_servicelog_request_id_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.web_servicelog
    ADD CONSTRAINT web_servicelog_request_id_key UNIQUE (request_id);
 V   ALTER TABLE ONLY public.web_servicelog DROP CONSTRAINT web_servicelog_request_id_key;
       public            fedge    false    322            @           2606    30719 N   web_shiftassignment web_shiftassignment_group_id_starting_date_e_0ae1ad92_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.web_shiftassignment
    ADD CONSTRAINT web_shiftassignment_group_id_starting_date_e_0ae1ad92_uniq UNIQUE (group_id, starting_date, ending_date);
 x   ALTER TABLE ONLY public.web_shiftassignment DROP CONSTRAINT web_shiftassignment_group_id_starting_date_e_0ae1ad92_uniq;
       public            fedge    false    328    328    328            B           2606    30526 ,   web_shiftassignment web_shiftassignment_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.web_shiftassignment
    ADD CONSTRAINT web_shiftassignment_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.web_shiftassignment DROP CONSTRAINT web_shiftassignment_pkey;
       public            fedge    false    328            &           2606    30469    web_shifts web_shifts_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.web_shifts
    ADD CONSTRAINT web_shifts_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.web_shifts DROP CONSTRAINT web_shifts_pkey;
       public            fedge    false    320            )           2606    30471    web_shifts web_shifts_shift_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.web_shifts
    ADD CONSTRAINT web_shifts_shift_key UNIQUE (shift);
 I   ALTER TABLE ONLY public.web_shifts DROP CONSTRAINT web_shifts_shift_key;
       public            fedge    false    320            +           2606    30695 ?   web_shifts web_shifts_shift_shift_start_shift_end_9d3a0b50_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.web_shifts
    ADD CONSTRAINT web_shifts_shift_shift_start_shift_end_9d3a0b50_uniq UNIQUE (shift, shift_start, shift_end);
 i   ALTER TABLE ONLY public.web_shifts DROP CONSTRAINT web_shifts_shift_shift_start_shift_end_9d3a0b50_uniq;
       public            fedge    false    320    320    320                       2606    30453 E   web_temperaturesensor web_temperaturesensor_measuring_environment_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.web_temperaturesensor
    ADD CONSTRAINT web_temperaturesensor_measuring_environment_key UNIQUE (measuring_environment);
 o   ALTER TABLE ONLY public.web_temperaturesensor DROP CONSTRAINT web_temperaturesensor_measuring_environment_key;
       public            fedge    false    316                       2606    30451 0   web_temperaturesensor web_temperaturesensor_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.web_temperaturesensor
    ADD CONSTRAINT web_temperaturesensor_pkey PRIMARY KEY (device_ptr_id);
 Z   ALTER TABLE ONLY public.web_temperaturesensor DROP CONSTRAINT web_temperaturesensor_pkey;
       public            fedge    false    316            x           2606    47299    web_userlog web_userlog_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.web_userlog
    ADD CONSTRAINT web_userlog_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.web_userlog DROP CONSTRAINT web_userlog_pkey;
       public            fedge    false    360            "           2606    30461 $   web_userprofile web_userprofile_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.web_userprofile
    ADD CONSTRAINT web_userprofile_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.web_userprofile DROP CONSTRAINT web_userprofile_pkey;
       public            fedge    false    318            $           2606    30463 +   web_userprofile web_userprofile_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.web_userprofile
    ADD CONSTRAINT web_userprofile_user_id_key UNIQUE (user_id);
 U   ALTER TABLE ONLY public.web_userprofile DROP CONSTRAINT web_userprofile_user_id_key;
       public            fedge    false    318            j           1259    39136 ?   _hyper_1_12_chunk_web_temperaturesensorvalue_temperaturesensor_    INDEX     �   CREATE INDEX _hyper_1_12_chunk_web_temperaturesensorvalue_temperaturesensor_ ON _timescaledb_internal._hyper_1_12_chunk USING btree (temperaturesensor_id);
 b   DROP INDEX _timescaledb_internal._hyper_1_12_chunk_web_temperaturesensorvalue_temperaturesensor_;
       _timescaledb_internal            fedge    false    353            k           1259    39135 5   _hyper_1_12_chunk_web_temperaturesensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_1_12_chunk_web_temperaturesensorvalue_time_idx ON _timescaledb_internal._hyper_1_12_chunk USING btree ("time" DESC);
 X   DROP INDEX _timescaledb_internal._hyper_1_12_chunk_web_temperaturesensorvalue_time_idx;
       _timescaledb_internal            fedge    false    353            V           1259    30804 ?   _hyper_1_2_chunk_web_temperaturesensorvalue_temperaturesensor_i    INDEX     �   CREATE INDEX _hyper_1_2_chunk_web_temperaturesensorvalue_temperaturesensor_i ON _timescaledb_internal._hyper_1_2_chunk USING btree (temperaturesensor_id);
 b   DROP INDEX _timescaledb_internal._hyper_1_2_chunk_web_temperaturesensorvalue_temperaturesensor_i;
       _timescaledb_internal            fedge    false    343            W           1259    30803 4   _hyper_1_2_chunk_web_temperaturesensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_1_2_chunk_web_temperaturesensorvalue_time_idx ON _timescaledb_internal._hyper_1_2_chunk USING btree ("time" DESC);
 W   DROP INDEX _timescaledb_internal._hyper_1_2_chunk_web_temperaturesensorvalue_time_idx;
       _timescaledb_internal            fedge    false    343            d           1259    39068 ?   _hyper_1_9_chunk_web_temperaturesensorvalue_temperaturesensor_i    INDEX     �   CREATE INDEX _hyper_1_9_chunk_web_temperaturesensorvalue_temperaturesensor_i ON _timescaledb_internal._hyper_1_9_chunk USING btree (temperaturesensor_id);
 b   DROP INDEX _timescaledb_internal._hyper_1_9_chunk_web_temperaturesensorvalue_temperaturesensor_i;
       _timescaledb_internal            fedge    false    350            e           1259    39067 4   _hyper_1_9_chunk_web_temperaturesensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_1_9_chunk_web_temperaturesensorvalue_time_idx ON _timescaledb_internal._hyper_1_9_chunk USING btree ("time" DESC);
 W   DROP INDEX _timescaledb_internal._hyper_1_9_chunk_web_temperaturesensorvalue_time_idx;
       _timescaledb_internal            fedge    false    350            h           1259    39109 .   _hyper_2_11_chunk_web_ledvalue_led_id_950da7bb    INDEX     }   CREATE INDEX _hyper_2_11_chunk_web_ledvalue_led_id_950da7bb ON _timescaledb_internal._hyper_2_11_chunk USING btree (led_id);
 Q   DROP INDEX _timescaledb_internal._hyper_2_11_chunk_web_ledvalue_led_id_950da7bb;
       _timescaledb_internal            fedge    false    352            i           1259    39108 '   _hyper_2_11_chunk_web_ledvalue_time_idx    INDEX     {   CREATE INDEX _hyper_2_11_chunk_web_ledvalue_time_idx ON _timescaledb_internal._hyper_2_11_chunk USING btree ("time" DESC);
 J   DROP INDEX _timescaledb_internal._hyper_2_11_chunk_web_ledvalue_time_idx;
       _timescaledb_internal            fedge    false    352            �           1259    47350 .   _hyper_2_18_chunk_web_ledvalue_led_id_950da7bb    INDEX     }   CREATE INDEX _hyper_2_18_chunk_web_ledvalue_led_id_950da7bb ON _timescaledb_internal._hyper_2_18_chunk USING btree (led_id);
 Q   DROP INDEX _timescaledb_internal._hyper_2_18_chunk_web_ledvalue_led_id_950da7bb;
       _timescaledb_internal            fedge    false    363            �           1259    47349 '   _hyper_2_18_chunk_web_ledvalue_time_idx    INDEX     {   CREATE INDEX _hyper_2_18_chunk_web_ledvalue_time_idx ON _timescaledb_internal._hyper_2_18_chunk USING btree ("time" DESC);
 J   DROP INDEX _timescaledb_internal._hyper_2_18_chunk_web_ledvalue_time_idx;
       _timescaledb_internal            fedge    false    363            f           1259    39079 2   _hyper_3_10_chunk_web_latchvalue_latch_id_a4ab6b18    INDEX     �   CREATE INDEX _hyper_3_10_chunk_web_latchvalue_latch_id_a4ab6b18 ON _timescaledb_internal._hyper_3_10_chunk USING btree (latch_id);
 U   DROP INDEX _timescaledb_internal._hyper_3_10_chunk_web_latchvalue_latch_id_a4ab6b18;
       _timescaledb_internal            fedge    false    351            g           1259    39078 )   _hyper_3_10_chunk_web_latchvalue_time_idx    INDEX     }   CREATE INDEX _hyper_3_10_chunk_web_latchvalue_time_idx ON _timescaledb_internal._hyper_3_10_chunk USING btree ("time" DESC);
 L   DROP INDEX _timescaledb_internal._hyper_3_10_chunk_web_latchvalue_time_idx;
       _timescaledb_internal            fedge    false    351            ~           1259    47339 2   _hyper_3_17_chunk_web_latchvalue_latch_id_a4ab6b18    INDEX     �   CREATE INDEX _hyper_3_17_chunk_web_latchvalue_latch_id_a4ab6b18 ON _timescaledb_internal._hyper_3_17_chunk USING btree (latch_id);
 U   DROP INDEX _timescaledb_internal._hyper_3_17_chunk_web_latchvalue_latch_id_a4ab6b18;
       _timescaledb_internal            fedge    false    362                       1259    47338 )   _hyper_3_17_chunk_web_latchvalue_time_idx    INDEX     }   CREATE INDEX _hyper_3_17_chunk_web_latchvalue_time_idx ON _timescaledb_internal._hyper_3_17_chunk USING btree ("time" DESC);
 L   DROP INDEX _timescaledb_internal._hyper_3_17_chunk_web_latchvalue_time_idx;
       _timescaledb_internal            fedge    false    362            X           1259    30857 1   _hyper_3_3_chunk_web_latchvalue_latch_id_a4ab6b18    INDEX     �   CREATE INDEX _hyper_3_3_chunk_web_latchvalue_latch_id_a4ab6b18 ON _timescaledb_internal._hyper_3_3_chunk USING btree (latch_id);
 T   DROP INDEX _timescaledb_internal._hyper_3_3_chunk_web_latchvalue_latch_id_a4ab6b18;
       _timescaledb_internal            fedge    false    344            Y           1259    30856 (   _hyper_3_3_chunk_web_latchvalue_time_idx    INDEX     {   CREATE INDEX _hyper_3_3_chunk_web_latchvalue_time_idx ON _timescaledb_internal._hyper_3_3_chunk USING btree ("time" DESC);
 K   DROP INDEX _timescaledb_internal._hyper_3_3_chunk_web_latchvalue_time_idx;
       _timescaledb_internal            fedge    false    344            |           1259    47328 >   _hyper_4_16_chunk_web_latchsensorvalue_latchsensor_id_ffe98258    INDEX     �   CREATE INDEX _hyper_4_16_chunk_web_latchsensorvalue_latchsensor_id_ffe98258 ON _timescaledb_internal._hyper_4_16_chunk USING btree (latchsensor_id);
 a   DROP INDEX _timescaledb_internal._hyper_4_16_chunk_web_latchsensorvalue_latchsensor_id_ffe98258;
       _timescaledb_internal            fedge    false    361            }           1259    47327 /   _hyper_4_16_chunk_web_latchsensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_4_16_chunk_web_latchsensorvalue_time_idx ON _timescaledb_internal._hyper_4_16_chunk USING btree ("time" DESC);
 R   DROP INDEX _timescaledb_internal._hyper_4_16_chunk_web_latchsensorvalue_time_idx;
       _timescaledb_internal            fedge    false    361            T           1259    30793 =   _hyper_4_1_chunk_web_latchsensorvalue_latchsensor_id_ffe98258    INDEX     �   CREATE INDEX _hyper_4_1_chunk_web_latchsensorvalue_latchsensor_id_ffe98258 ON _timescaledb_internal._hyper_4_1_chunk USING btree (latchsensor_id);
 `   DROP INDEX _timescaledb_internal._hyper_4_1_chunk_web_latchsensorvalue_latchsensor_id_ffe98258;
       _timescaledb_internal            fedge    false    342            U           1259    30792 .   _hyper_4_1_chunk_web_latchsensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_4_1_chunk_web_latchsensorvalue_time_idx ON _timescaledb_internal._hyper_4_1_chunk USING btree ("time" DESC);
 Q   DROP INDEX _timescaledb_internal._hyper_4_1_chunk_web_latchsensorvalue_time_idx;
       _timescaledb_internal            fedge    false    342            b           1259    39057 =   _hyper_4_8_chunk_web_latchsensorvalue_latchsensor_id_ffe98258    INDEX     �   CREATE INDEX _hyper_4_8_chunk_web_latchsensorvalue_latchsensor_id_ffe98258 ON _timescaledb_internal._hyper_4_8_chunk USING btree (latchsensor_id);
 `   DROP INDEX _timescaledb_internal._hyper_4_8_chunk_web_latchsensorvalue_latchsensor_id_ffe98258;
       _timescaledb_internal            fedge    false    349            c           1259    39056 .   _hyper_4_8_chunk_web_latchsensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_4_8_chunk_web_latchsensorvalue_time_idx ON _timescaledb_internal._hyper_4_8_chunk USING btree ("time" DESC);
 Q   DROP INDEX _timescaledb_internal._hyper_4_8_chunk_web_latchsensorvalue_time_idx;
       _timescaledb_internal            fedge    false    349            l           1259    39150 ?   _hyper_5_13_chunk_web_energysensorvalue_energysensor_id_f907147    INDEX     �   CREATE INDEX _hyper_5_13_chunk_web_energysensorvalue_energysensor_id_f907147 ON _timescaledb_internal._hyper_5_13_chunk USING btree (energysensor_id);
 b   DROP INDEX _timescaledb_internal._hyper_5_13_chunk_web_energysensorvalue_energysensor_id_f907147;
       _timescaledb_internal            fedge    false    354            m           1259    39149 0   _hyper_5_13_chunk_web_energysensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_5_13_chunk_web_energysensorvalue_time_idx ON _timescaledb_internal._hyper_5_13_chunk USING btree ("time" DESC);
 S   DROP INDEX _timescaledb_internal._hyper_5_13_chunk_web_energysensorvalue_time_idx;
       _timescaledb_internal            fedge    false    354            Z           1259    30868 ?   _hyper_5_4_chunk_web_energysensorvalue_energysensor_id_f907147c    INDEX     �   CREATE INDEX _hyper_5_4_chunk_web_energysensorvalue_energysensor_id_f907147c ON _timescaledb_internal._hyper_5_4_chunk USING btree (energysensor_id);
 b   DROP INDEX _timescaledb_internal._hyper_5_4_chunk_web_energysensorvalue_energysensor_id_f907147c;
       _timescaledb_internal            fedge    false    345            [           1259    30867 /   _hyper_5_4_chunk_web_energysensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_5_4_chunk_web_energysensorvalue_time_idx ON _timescaledb_internal._hyper_5_4_chunk USING btree ("time" DESC);
 R   DROP INDEX _timescaledb_internal._hyper_5_4_chunk_web_energysensorvalue_time_idx;
       _timescaledb_internal            fedge    false    345            `           1259    39046 ?   _hyper_5_7_chunk_web_energysensorvalue_energysensor_id_f907147c    INDEX     �   CREATE INDEX _hyper_5_7_chunk_web_energysensorvalue_energysensor_id_f907147c ON _timescaledb_internal._hyper_5_7_chunk USING btree (energysensor_id);
 b   DROP INDEX _timescaledb_internal._hyper_5_7_chunk_web_energysensorvalue_energysensor_id_f907147c;
       _timescaledb_internal            fedge    false    348            a           1259    39045 /   _hyper_5_7_chunk_web_energysensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_5_7_chunk_web_energysensorvalue_time_idx ON _timescaledb_internal._hyper_5_7_chunk USING btree ("time" DESC);
 R   DROP INDEX _timescaledb_internal._hyper_5_7_chunk_web_energysensorvalue_time_idx;
       _timescaledb_internal            fedge    false    348            n           1259    39161 <   _hyper_6_14_chunk_web_doorsensorvalue_doorsensor_id_04eda24b    INDEX     �   CREATE INDEX _hyper_6_14_chunk_web_doorsensorvalue_doorsensor_id_04eda24b ON _timescaledb_internal._hyper_6_14_chunk USING btree (doorsensor_id);
 _   DROP INDEX _timescaledb_internal._hyper_6_14_chunk_web_doorsensorvalue_doorsensor_id_04eda24b;
       _timescaledb_internal            fedge    false    355            o           1259    39160 .   _hyper_6_14_chunk_web_doorsensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_6_14_chunk_web_doorsensorvalue_time_idx ON _timescaledb_internal._hyper_6_14_chunk USING btree ("time" DESC);
 Q   DROP INDEX _timescaledb_internal._hyper_6_14_chunk_web_doorsensorvalue_time_idx;
       _timescaledb_internal            fedge    false    355            �           1259    47373 <   _hyper_6_19_chunk_web_doorsensorvalue_doorsensor_id_04eda24b    INDEX     �   CREATE INDEX _hyper_6_19_chunk_web_doorsensorvalue_doorsensor_id_04eda24b ON _timescaledb_internal._hyper_6_19_chunk USING btree (doorsensor_id);
 _   DROP INDEX _timescaledb_internal._hyper_6_19_chunk_web_doorsensorvalue_doorsensor_id_04eda24b;
       _timescaledb_internal            fedge    false    364            �           1259    47372 .   _hyper_6_19_chunk_web_doorsensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_6_19_chunk_web_doorsensorvalue_time_idx ON _timescaledb_internal._hyper_6_19_chunk USING btree ("time" DESC);
 Q   DROP INDEX _timescaledb_internal._hyper_6_19_chunk_web_doorsensorvalue_time_idx;
       _timescaledb_internal            fedge    false    364            ^           1259    30890 ;   _hyper_6_6_chunk_web_doorsensorvalue_doorsensor_id_04eda24b    INDEX     �   CREATE INDEX _hyper_6_6_chunk_web_doorsensorvalue_doorsensor_id_04eda24b ON _timescaledb_internal._hyper_6_6_chunk USING btree (doorsensor_id);
 ^   DROP INDEX _timescaledb_internal._hyper_6_6_chunk_web_doorsensorvalue_doorsensor_id_04eda24b;
       _timescaledb_internal            fedge    false    347            _           1259    30889 -   _hyper_6_6_chunk_web_doorsensorvalue_time_idx    INDEX     �   CREATE INDEX _hyper_6_6_chunk_web_doorsensorvalue_time_idx ON _timescaledb_internal._hyper_6_6_chunk USING btree ("time" DESC);
 P   DROP INDEX _timescaledb_internal._hyper_6_6_chunk_web_doorsensorvalue_time_idx;
       _timescaledb_internal            fedge    false    347            u           1259    39188 8   _hyper_7_15_chunk_web_buttonvalue_doorbutton_id_0701aa20    INDEX     �   CREATE INDEX _hyper_7_15_chunk_web_buttonvalue_doorbutton_id_0701aa20 ON _timescaledb_internal._hyper_7_15_chunk USING btree (doorbutton_id);
 [   DROP INDEX _timescaledb_internal._hyper_7_15_chunk_web_buttonvalue_doorbutton_id_0701aa20;
       _timescaledb_internal            fedge    false    358            v           1259    39187 *   _hyper_7_15_chunk_web_buttonvalue_time_idx    INDEX     ~   CREATE INDEX _hyper_7_15_chunk_web_buttonvalue_time_idx ON _timescaledb_internal._hyper_7_15_chunk USING btree ("time" DESC);
 M   DROP INDEX _timescaledb_internal._hyper_7_15_chunk_web_buttonvalue_time_idx;
       _timescaledb_internal            fedge    false    358            \           1259    30879 7   _hyper_7_5_chunk_web_buttonvalue_doorbutton_id_0701aa20    INDEX     �   CREATE INDEX _hyper_7_5_chunk_web_buttonvalue_doorbutton_id_0701aa20 ON _timescaledb_internal._hyper_7_5_chunk USING btree (doorbutton_id);
 Z   DROP INDEX _timescaledb_internal._hyper_7_5_chunk_web_buttonvalue_doorbutton_id_0701aa20;
       _timescaledb_internal            fedge    false    346            ]           1259    30878 )   _hyper_7_5_chunk_web_buttonvalue_time_idx    INDEX     |   CREATE INDEX _hyper_7_5_chunk_web_buttonvalue_time_idx ON _timescaledb_internal._hyper_7_5_chunk USING btree ("time" DESC);
 L   DROP INDEX _timescaledb_internal._hyper_7_5_chunk_web_buttonvalue_time_idx;
       _timescaledb_internal            fedge    false    346            �           1259    30285    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            fedge    false    283            �           1259    30226 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            fedge    false    285            �           1259    30227 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            fedge    false    285            �           1259    30212 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            fedge    false    281            �           1259    30242 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            fedge    false    289            �           1259    30241 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            fedge    false    289            �           1259    30256 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            fedge    false    291            �           1259    30255 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            fedge    false    291            �           1259    30280     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            fedge    false    287            �           1259    30298 !   authtoken_token_key_10f0b77e_like    INDEX     p   CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);
 5   DROP INDEX public.authtoken_token_key_10f0b77e_like;
       public            fedge    false    294            �           1259    30276 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            fedge    false    293            �           1259    30277 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            fedge    false    293            �           1259    30318 3   django_apscheduler_djangojob_next_run_time_2f022619    INDEX     �   CREATE INDEX django_apscheduler_djangojob_next_run_time_2f022619 ON public.django_apscheduler_djangojob USING btree (next_run_time);
 G   DROP INDEX public.django_apscheduler_djangojob_next_run_time_2f022619;
       public            fedge    false    295            �           1259    30337 5   django_apscheduler_djangojobexecution_job_id_daf5090a    INDEX     �   CREATE INDEX django_apscheduler_djangojobexecution_job_id_daf5090a ON public.django_apscheduler_djangojobexecution USING btree (job_id);
 I   DROP INDEX public.django_apscheduler_djangojobexecution_job_id_daf5090a;
       public            fedge    false    297            �           1259    30324 7   django_apscheduler_djangojobexecution_run_time_16edd96b    INDEX     �   CREATE INDEX django_apscheduler_djangojobexecution_run_time_16edd96b ON public.django_apscheduler_djangojobexecution USING btree (run_time);
 K   DROP INDEX public.django_apscheduler_djangojobexecution_run_time_16edd96b;
       public            fedge    false    297            �           1259    30373 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            fedge    false    298            �           1259    30372 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            fedge    false    298            R           1259    30778 &   web_buttonvalue_doorbutton_id_0701aa20    INDEX     k   CREATE INDEX web_buttonvalue_doorbutton_id_0701aa20 ON public.web_buttonvalue USING btree (doorbutton_id);
 :   DROP INDEX public.web_buttonvalue_doorbutton_id_0701aa20;
       public            fedge    false    341            S           1259    30611    web_buttonvalue_time_idx    INDEX     [   CREATE INDEX web_buttonvalue_time_idx ON public.web_buttonvalue USING btree ("time" DESC);
 ,   DROP INDEX public.web_buttonvalue_time_idx;
       public            fedge    false    341            �           1259    30614 '   web_cabinet_profinet_name_f8233ef8_like    INDEX     |   CREATE INDEX web_cabinet_profinet_name_f8233ef8_like ON public.web_cabinet USING btree (profinet_name varchar_pattern_ops);
 ;   DROP INDEX public.web_cabinet_profinet_name_f8233ef8_like;
       public            fedge    false    300            �           1259    30710    web_device_plc_id_2ef6c780    INDEX     S   CREATE INDEX web_device_plc_id_2ef6c780 ON public.web_device USING btree (plc_id);
 .   DROP INDEX public.web_device_plc_id_2ef6c780;
       public            fedge    false    302            �           1259    30616 &   web_device_profinet_name_0a1981d0_like    INDEX     z   CREATE INDEX web_device_profinet_name_0a1981d0_like ON public.web_device USING btree (profinet_name varchar_pattern_ops);
 :   DROP INDEX public.web_device_profinet_name_0a1981d0_like;
       public            fedge    false    302            �           1259    30711    web_device_rack_id_743160c8    INDEX     U   CREATE INDEX web_device_rack_id_743160c8 ON public.web_device USING btree (rack_id);
 /   DROP INDEX public.web_device_rack_id_743160c8;
       public            fedge    false    302            �           1259    30615 &   web_device_serial_number_0fa9728a_like    INDEX     z   CREATE INDEX web_device_serial_number_0fa9728a_like ON public.web_device USING btree (serial_number varchar_pattern_ops);
 :   DROP INDEX public.web_device_serial_number_0fa9728a_like;
       public            fedge    false    302            �           1259    30617    web_door_qr_4c4838cf_like    INDEX     `   CREATE INDEX web_door_qr_4c4838cf_like ON public.web_door USING btree (qr varchar_pattern_ops);
 -   DROP INDEX public.web_door_qr_4c4838cf_like;
       public            fedge    false    304            �           1259    30709    web_door_rack_id_891dfe2e    INDEX     Q   CREATE INDEX web_door_rack_id_891dfe2e ON public.web_door USING btree (rack_id);
 -   DROP INDEX public.web_door_rack_id_891dfe2e;
       public            fedge    false    304            L           1259    30762 *   web_doorsensorvalue_doorsensor_id_04eda24b    INDEX     s   CREATE INDEX web_doorsensorvalue_doorsensor_id_04eda24b ON public.web_doorsensorvalue USING btree (doorsensor_id);
 >   DROP INDEX public.web_doorsensorvalue_doorsensor_id_04eda24b;
       public            fedge    false    338            M           1259    30585    web_doorsensorvalue_time_idx    INDEX     c   CREATE INDEX web_doorsensorvalue_time_idx ON public.web_doorsensorvalue USING btree ("time" DESC);
 0   DROP INDEX public.web_doorsensorvalue_time_idx;
       public            fedge    false    338            �           1259    30618 %   web_employeegroup_group_70b8cccc_like    INDEX     z   CREATE INDEX web_employeegroup_group_70b8cccc_like ON public.web_employeegroup USING btree ("group" varchar_pattern_ops);
 9   DROP INDEX public.web_employeegroup_group_70b8cccc_like;
       public            fedge    false    306            
           1259    30661 4   web_energysensor_measuring_environment_7386e8b2_like    INDEX     �   CREATE INDEX web_energysensor_measuring_environment_7386e8b2_like ON public.web_energysensor USING btree (measuring_environment varchar_pattern_ops);
 H   DROP INDEX public.web_energysensor_measuring_environment_7386e8b2_like;
       public            fedge    false    312            J           1259    30756 .   web_energysensorvalue_energysensor_id_f907147c    INDEX     {   CREATE INDEX web_energysensorvalue_energysensor_id_f907147c ON public.web_energysensorvalue USING btree (energysensor_id);
 B   DROP INDEX public.web_energysensorvalue_energysensor_id_f907147c;
       public            fedge    false    336            K           1259    30577    web_energysensorvalue_time_idx    INDEX     g   CREATE INDEX web_energysensorvalue_time_idx ON public.web_energysensorvalue USING btree ("time" DESC);
 2   DROP INDEX public.web_energysensorvalue_time_idx;
       public            fedge    false    336            H           1259    30750 ,   web_latchsensorvalue_latchsensor_id_ffe98258    INDEX     w   CREATE INDEX web_latchsensorvalue_latchsensor_id_ffe98258 ON public.web_latchsensorvalue USING btree (latchsensor_id);
 @   DROP INDEX public.web_latchsensorvalue_latchsensor_id_ffe98258;
       public            fedge    false    334            I           1259    30555    web_latchsensorvalue_time_idx    INDEX     e   CREATE INDEX web_latchsensorvalue_time_idx ON public.web_latchsensorvalue USING btree ("time" DESC);
 1   DROP INDEX public.web_latchsensorvalue_time_idx;
       public            fedge    false    334            F           1259    30744     web_latchvalue_latch_id_a4ab6b18    INDEX     _   CREATE INDEX web_latchvalue_latch_id_a4ab6b18 ON public.web_latchvalue USING btree (latch_id);
 4   DROP INDEX public.web_latchvalue_latch_id_a4ab6b18;
       public            fedge    false    332            G           1259    30547    web_latchvalue_time_idx    INDEX     Y   CREATE INDEX web_latchvalue_time_idx ON public.web_latchvalue USING btree ("time" DESC);
 +   DROP INDEX public.web_latchvalue_time_idx;
       public            fedge    false    332            D           1259    30737    web_ledvalue_led_id_950da7bb    INDEX     W   CREATE INDEX web_ledvalue_led_id_950da7bb ON public.web_ledvalue USING btree (led_id);
 0   DROP INDEX public.web_ledvalue_led_id_950da7bb;
       public            fedge    false    330            E           1259    30534    web_ledvalue_time_idx    INDEX     U   CREATE INDEX web_ledvalue_time_idx ON public.web_ledvalue USING btree ("time" DESC);
 )   DROP INDEX public.web_ledvalue_time_idx;
       public            fedge    false    330            p           1259    39174 +   web_ledvaluecases_description_030e0196_like    INDEX     �   CREATE INDEX web_ledvaluecases_description_030e0196_like ON public.web_ledvaluecases USING btree (description varchar_pattern_ops);
 ?   DROP INDEX public.web_ledvaluecases_description_030e0196_like;
       public            fedge    false    357            6           1259    30807 #   web_plc_profinet_name_98d179cc_like    INDEX     t   CREATE INDEX web_plc_profinet_name_98d179cc_like ON public.web_plc USING btree (profinet_name varchar_pattern_ops);
 7   DROP INDEX public.web_plc_profinet_name_98d179cc_like;
       public            fedge    false    324            9           1259    30707 #   web_plc_serial_number_a750f39f_like    INDEX     t   CREATE INDEX web_plc_serial_number_a750f39f_like ON public.web_plc USING btree (serial_number varchar_pattern_ops);
 7   DROP INDEX public.web_plc_serial_number_a750f39f_like;
       public            fedge    false    324            �           1259    30626    web_rack_cabinet_id_2c2a8a9e    INDEX     W   CREATE INDEX web_rack_cabinet_id_2c2a8a9e ON public.web_rack USING btree (cabinet_id);
 0   DROP INDEX public.web_rack_cabinet_id_2c2a8a9e;
       public            fedge    false    308                        1259    30647    web_request_cabinet_id_f6bc764b    INDEX     ]   CREATE INDEX web_request_cabinet_id_f6bc764b ON public.web_request USING btree (cabinet_id);
 3   DROP INDEX public.web_request_cabinet_id_f6bc764b;
       public            fedge    false    310                       1259    30648    web_request_door_id_fdca5e72    INDEX     W   CREATE INDEX web_request_door_id_fdca5e72 ON public.web_request USING btree (door_id);
 0   DROP INDEX public.web_request_door_id_fdca5e72;
       public            fedge    false    310                       1259    30649    web_request_rack_id_d737060f    INDEX     W   CREATE INDEX web_request_rack_id_d737060f ON public.web_request USING btree (rack_id);
 0   DROP INDEX public.web_request_rack_id_d737060f;
       public            fedge    false    310                       1259    30650    web_request_user_id_f52134a7    INDEX     W   CREATE INDEX web_request_user_id_f52134a7 ON public.web_request USING btree (user_id);
 0   DROP INDEX public.web_request_user_id_f52134a7;
       public            fedge    false    310            >           1259    30730 %   web_shiftassignment_group_id_d0db81d3    INDEX     i   CREATE INDEX web_shiftassignment_group_id_d0db81d3 ON public.web_shiftassignment USING btree (group_id);
 9   DROP INDEX public.web_shiftassignment_group_id_d0db81d3;
       public            fedge    false    328            C           1259    30731 %   web_shiftassignment_shift_id_1006d335    INDEX     i   CREATE INDEX web_shiftassignment_shift_id_1006d335 ON public.web_shiftassignment USING btree (shift_id);
 9   DROP INDEX public.web_shiftassignment_shift_id_1006d335;
       public            fedge    false    328            '           1259    30696    web_shifts_shift_3d29dc0b_like    INDEX     j   CREATE INDEX web_shifts_shift_3d29dc0b_like ON public.web_shifts USING btree (shift varchar_pattern_ops);
 2   DROP INDEX public.web_shifts_shift_3d29dc0b_like;
       public            fedge    false    320                       1259    30682 9   web_temperaturesensor_measuring_environment_09631ed5_like    INDEX     �   CREATE INDEX web_temperaturesensor_measuring_environment_09631ed5_like ON public.web_temperaturesensor USING btree (measuring_environment varchar_pattern_ops);
 M   DROP INDEX public.web_temperaturesensor_measuring_environment_09631ed5_like;
       public            fedge    false    316            <           1259    30717 8   web_temperaturesensorvalue_temperaturesensor_id_9f28af1f    INDEX     �   CREATE INDEX web_temperaturesensorvalue_temperaturesensor_id_9f28af1f ON public.web_temperaturesensorvalue USING btree (temperaturesensor_id);
 L   DROP INDEX public.web_temperaturesensorvalue_temperaturesensor_id_9f28af1f;
       public            fedge    false    326            =           1259    30520 #   web_temperaturesensorvalue_time_idx    INDEX     q   CREATE INDEX web_temperaturesensorvalue_time_idx ON public.web_temperaturesensorvalue USING btree ("time" DESC);
 7   DROP INDEX public.web_temperaturesensorvalue_time_idx;
       public            fedge    false    326            y           1259    47315    web_userlog_request_id_4abbdada    INDEX     ]   CREATE INDEX web_userlog_request_id_4abbdada ON public.web_userlog USING btree (request_id);
 3   DROP INDEX public.web_userlog_request_id_4abbdada;
       public            fedge    false    360            z           1259    47316 "   web_userlog_servicelog_id_fb909b4e    INDEX     c   CREATE INDEX web_userlog_servicelog_id_fb909b4e ON public.web_userlog USING btree (servicelog_id);
 6   DROP INDEX public.web_userlog_servicelog_id_fb909b4e;
       public            fedge    false    360            {           1259    47317    web_userlog_user_id_1df0f752    INDEX     W   CREATE INDEX web_userlog_user_id_1df0f752 ON public.web_userlog USING btree (user_id);
 0   DROP INDEX public.web_userlog_user_id_1df0f752;
       public            fedge    false    360                        1259    30693 *   web_userprofile_employee_group_id_46a1fb99    INDEX     s   CREATE INDEX web_userprofile_employee_group_id_46a1fb99 ON public.web_userprofile USING btree (employee_group_id);
 >   DROP INDEX public.web_userprofile_employee_group_id_46a1fb99;
       public            fedge    false    318            �           2620    30610 !   web_buttonvalue ts_insert_blocker    TRIGGER     �   CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.web_buttonvalue FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();
 :   DROP TRIGGER ts_insert_blocker ON public.web_buttonvalue;
       public          fedge    false    341    5    5            �           2620    30584 %   web_doorsensorvalue ts_insert_blocker    TRIGGER     �   CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.web_doorsensorvalue FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();
 >   DROP TRIGGER ts_insert_blocker ON public.web_doorsensorvalue;
       public          fedge    false    338    5    5            �           2620    30576 '   web_energysensorvalue ts_insert_blocker    TRIGGER     �   CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.web_energysensorvalue FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();
 @   DROP TRIGGER ts_insert_blocker ON public.web_energysensorvalue;
       public          fedge    false    5    5    336            �           2620    30554 &   web_latchsensorvalue ts_insert_blocker    TRIGGER     �   CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.web_latchsensorvalue FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();
 ?   DROP TRIGGER ts_insert_blocker ON public.web_latchsensorvalue;
       public          fedge    false    334    5    5            �           2620    30546     web_latchvalue ts_insert_blocker    TRIGGER     �   CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.web_latchvalue FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();
 9   DROP TRIGGER ts_insert_blocker ON public.web_latchvalue;
       public          fedge    false    5    5    332            �           2620    30533    web_ledvalue ts_insert_blocker    TRIGGER     �   CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.web_ledvalue FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();
 7   DROP TRIGGER ts_insert_blocker ON public.web_ledvalue;
       public          fedge    false    5    5    330            �           2620    30519 ,   web_temperaturesensorvalue ts_insert_blocker    TRIGGER     �   CREATE TRIGGER ts_insert_blocker BEFORE INSERT ON public.web_temperaturesensorvalue FOR EACH ROW EXECUTE FUNCTION _timescaledb_functions.insert_blocker();
 E   DROP TRIGGER ts_insert_blocker ON public.web_temperaturesensorvalue;
       public          fedge    false    326    5    5            �           2606    39072 Q   _hyper_3_10_chunk 10_10_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_3_10_chunk
    ADD CONSTRAINT "10_10_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_" FOREIGN KEY (latch_id) REFERENCES public.web_latch(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_3_10_chunk DROP CONSTRAINT "10_10_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_";
       _timescaledb_internal          fedge    false    313    4114    351            �           2606    39102 M   _hyper_2_11_chunk 11_11_web_ledvalue_led_id_950da7bb_fk_web_led_device_ptr_id    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_2_11_chunk
    ADD CONSTRAINT "11_11_web_ledvalue_led_id_950da7bb_fk_web_led_device_ptr_id" FOREIGN KEY (led_id) REFERENCES public.web_led(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_2_11_chunk DROP CONSTRAINT "11_11_web_ledvalue_led_id_950da7bb_fk_web_led_device_ptr_id";
       _timescaledb_internal          fedge    false    315    352    4122            �           2606    39129 Q   _hyper_1_12_chunk 12_12_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web    FK CONSTRAINT       ALTER TABLE ONLY _timescaledb_internal._hyper_1_12_chunk
    ADD CONSTRAINT "12_12_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web" FOREIGN KEY (temperaturesensor_id) REFERENCES public.web_temperaturesensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_1_12_chunk DROP CONSTRAINT "12_12_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web";
       _timescaledb_internal          fedge    false    316    4127    353            �           2606    39143 Q   _hyper_5_13_chunk 13_13_web_energysensorvalu_energysensor_id_f907147c_fk_web_ener    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_5_13_chunk
    ADD CONSTRAINT "13_13_web_energysensorvalu_energysensor_id_f907147c_fk_web_ener" FOREIGN KEY (energysensor_id) REFERENCES public.web_energysensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_5_13_chunk DROP CONSTRAINT "13_13_web_energysensorvalu_energysensor_id_f907147c_fk_web_ener";
       _timescaledb_internal          fedge    false    312    354    4110            �           2606    39154 O   _hyper_6_14_chunk 14_14_web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_6_14_chunk
    ADD CONSTRAINT "14_14_web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors" FOREIGN KEY (doorsensor_id) REFERENCES public.web_doorsensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_6_14_chunk DROP CONSTRAINT "14_14_web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors";
       _timescaledb_internal          fedge    false    4105    355    311            �           2606    39181 K   _hyper_7_15_chunk 15_15_web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_7_15_chunk
    ADD CONSTRAINT "15_15_web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb" FOREIGN KEY (doorbutton_id) REFERENCES public.web_doorbutton(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_7_15_chunk DROP CONSTRAINT "15_15_web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb";
       _timescaledb_internal          fedge    false    339    4177    358            �           2606    47321 Q   _hyper_4_16_chunk 16_16_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_4_16_chunk
    ADD CONSTRAINT "16_16_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch" FOREIGN KEY (latchsensor_id) REFERENCES public.web_latchsensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_4_16_chunk DROP CONSTRAINT "16_16_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch";
       _timescaledb_internal          fedge    false    4118    314    361            �           2606    47332 Q   _hyper_3_17_chunk 17_17_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_3_17_chunk
    ADD CONSTRAINT "17_17_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_" FOREIGN KEY (latch_id) REFERENCES public.web_latch(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_3_17_chunk DROP CONSTRAINT "17_17_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_";
       _timescaledb_internal          fedge    false    4114    362    313            �           2606    47343 M   _hyper_2_18_chunk 18_18_web_ledvalue_led_id_950da7bb_fk_web_led_device_ptr_id    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_2_18_chunk
    ADD CONSTRAINT "18_18_web_ledvalue_led_id_950da7bb_fk_web_led_device_ptr_id" FOREIGN KEY (led_id) REFERENCES public.web_led(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_2_18_chunk DROP CONSTRAINT "18_18_web_ledvalue_led_id_950da7bb_fk_web_led_device_ptr_id";
       _timescaledb_internal          fedge    false    363    4122    315            �           2606    47366 O   _hyper_6_19_chunk 19_19_web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_6_19_chunk
    ADD CONSTRAINT "19_19_web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors" FOREIGN KEY (doorsensor_id) REFERENCES public.web_doorsensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_6_19_chunk DROP CONSTRAINT "19_19_web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors";
       _timescaledb_internal          fedge    false    311    4105    364            �           2606    30786 N   _hyper_4_1_chunk 1_1_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_4_1_chunk
    ADD CONSTRAINT "1_1_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch" FOREIGN KEY (latchsensor_id) REFERENCES public.web_latchsensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_4_1_chunk DROP CONSTRAINT "1_1_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch";
       _timescaledb_internal          fedge    false    4118    314    342            �           2606    30797 P   _hyper_1_2_chunk 2_2_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_t    FK CONSTRAINT       ALTER TABLE ONLY _timescaledb_internal._hyper_1_2_chunk
    ADD CONSTRAINT "2_2_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_t" FOREIGN KEY (temperaturesensor_id) REFERENCES public.web_temperaturesensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_1_2_chunk DROP CONSTRAINT "2_2_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_t";
       _timescaledb_internal          fedge    false    4127    316    343            �           2606    30850 P   _hyper_3_3_chunk 3_3_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_id    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_3_3_chunk
    ADD CONSTRAINT "3_3_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_id" FOREIGN KEY (latch_id) REFERENCES public.web_latch(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_3_3_chunk DROP CONSTRAINT "3_3_web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_id";
       _timescaledb_internal          fedge    false    344    313    4114            �           2606    30861 O   _hyper_5_4_chunk 4_4_web_energysensorvalu_energysensor_id_f907147c_fk_web_energ    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_5_4_chunk
    ADD CONSTRAINT "4_4_web_energysensorvalu_energysensor_id_f907147c_fk_web_energ" FOREIGN KEY (energysensor_id) REFERENCES public.web_energysensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_5_4_chunk DROP CONSTRAINT "4_4_web_energysensorvalu_energysensor_id_f907147c_fk_web_energ";
       _timescaledb_internal          fedge    false    4110    345    312            �           2606    30872 H   _hyper_7_5_chunk 5_5_web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_7_5_chunk
    ADD CONSTRAINT "5_5_web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb" FOREIGN KEY (doorbutton_id) REFERENCES public.web_doorbutton(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_7_5_chunk DROP CONSTRAINT "5_5_web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb";
       _timescaledb_internal          fedge    false    4177    339    346            �           2606    30883 L   _hyper_6_6_chunk 6_6_web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_6_6_chunk
    ADD CONSTRAINT "6_6_web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors" FOREIGN KEY (doorsensor_id) REFERENCES public.web_doorsensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_6_6_chunk DROP CONSTRAINT "6_6_web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors";
       _timescaledb_internal          fedge    false    347    311    4105            �           2606    39039 O   _hyper_5_7_chunk 7_7_web_energysensorvalu_energysensor_id_f907147c_fk_web_energ    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_5_7_chunk
    ADD CONSTRAINT "7_7_web_energysensorvalu_energysensor_id_f907147c_fk_web_energ" FOREIGN KEY (energysensor_id) REFERENCES public.web_energysensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_5_7_chunk DROP CONSTRAINT "7_7_web_energysensorvalu_energysensor_id_f907147c_fk_web_energ";
       _timescaledb_internal          fedge    false    4110    312    348            �           2606    39050 N   _hyper_4_8_chunk 8_8_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch    FK CONSTRAINT     �   ALTER TABLE ONLY _timescaledb_internal._hyper_4_8_chunk
    ADD CONSTRAINT "8_8_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch" FOREIGN KEY (latchsensor_id) REFERENCES public.web_latchsensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_4_8_chunk DROP CONSTRAINT "8_8_web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch";
       _timescaledb_internal          fedge    false    349    314    4118            �           2606    39061 P   _hyper_1_9_chunk 9_9_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_t    FK CONSTRAINT       ALTER TABLE ONLY _timescaledb_internal._hyper_1_9_chunk
    ADD CONSTRAINT "9_9_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_t" FOREIGN KEY (temperaturesensor_id) REFERENCES public.web_temperaturesensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY _timescaledb_internal._hyper_1_9_chunk DROP CONSTRAINT "9_9_web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_t";
       _timescaledb_internal          fedge    false    316    350    4127            �           2606    30221 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          fedge    false    4008    285    281            �           2606    30216 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          fedge    false    4013    283    285            �           2606    30207 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          fedge    false    281    279    4003            �           2606    30236 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          fedge    false    283    4013    289            �           2606    30231 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          fedge    false    4021    289    287            �           2606    30250 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          fedge    false    4008    291    281            �           2606    30245 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          fedge    false    287    291    4021            �           2606    30293 @   authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id;
       public          fedge    false    4021    294    287            �           2606    30266 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          fedge    false    4003    279    293            �           2606    30271 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          fedge    false    4021    293    287            �           2606    30346 ^   django_apscheduler_djangojobexecution django_apscheduler_djangojobexecution_job_id_daf5090a_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_apscheduler_djangojobexecution
    ADD CONSTRAINT django_apscheduler_djangojobexecution_job_id_daf5090a_fk FOREIGN KEY (job_id) REFERENCES public.django_apscheduler_djangojob(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.django_apscheduler_djangojobexecution DROP CONSTRAINT django_apscheduler_djangojobexecution_job_id_daf5090a_fk;
       public          fedge    false    295    4048    297            �           2606    30773 C   web_buttonvalue web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_buttonvalue
    ADD CONSTRAINT web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb FOREIGN KEY (doorbutton_id) REFERENCES public.web_doorbutton(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.web_buttonvalue DROP CONSTRAINT web_buttonvalue_doorbutton_id_0701aa20_fk_web_doorb;
       public          fedge    false    4177    341    339            �           2606    30503 3   web_device web_device_plc_id_2ef6c780_fk_web_plc_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_device
    ADD CONSTRAINT web_device_plc_id_2ef6c780_fk_web_plc_id FOREIGN KEY (plc_id) REFERENCES public.web_plc(id) DEFERRABLE INITIALLY DEFERRED;
 ]   ALTER TABLE ONLY public.web_device DROP CONSTRAINT web_device_plc_id_2ef6c780_fk_web_plc_id;
       public          fedge    false    324    4149    302            �           2606    30508 5   web_device web_device_rack_id_743160c8_fk_web_rack_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_device
    ADD CONSTRAINT web_device_rack_id_743160c8_fk_web_rack_id FOREIGN KEY (rack_id) REFERENCES public.web_rack(id) DEFERRABLE INITIALLY DEFERRED;
 _   ALTER TABLE ONLY public.web_device DROP CONSTRAINT web_device_rack_id_743160c8_fk_web_rack_id;
       public          fedge    false    4095    308    302            �           2606    30498 1   web_door web_door_rack_id_891dfe2e_fk_web_rack_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_door
    ADD CONSTRAINT web_door_rack_id_891dfe2e_fk_web_rack_id FOREIGN KEY (rack_id) REFERENCES public.web_rack(id) DEFERRABLE INITIALLY DEFERRED;
 [   ALTER TABLE ONLY public.web_door DROP CONSTRAINT web_door_rack_id_891dfe2e_fk_web_rack_id;
       public          fedge    false    304    308    4095            �           2606    30763 E   web_doorbutton web_doorbutton_device_ptr_id_ec1b8c41_fk_web_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_doorbutton
    ADD CONSTRAINT web_doorbutton_device_ptr_id_ec1b8c41_fk_web_device_id FOREIGN KEY (device_ptr_id) REFERENCES public.web_device(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.web_doorbutton DROP CONSTRAINT web_doorbutton_device_ptr_id_ec1b8c41_fk_web_device_id;
       public          fedge    false    302    339    4067            �           2606    30768 =   web_doorbutton web_doorbutton_door_id_cd37f08f_fk_web_door_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_doorbutton
    ADD CONSTRAINT web_doorbutton_door_id_cd37f08f_fk_web_door_id FOREIGN KEY (door_id) REFERENCES public.web_door(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.web_doorbutton DROP CONSTRAINT web_doorbutton_door_id_cd37f08f_fk_web_door_id;
       public          fedge    false    339    304    4081            �           2606    30651 E   web_doorsensor web_doorsensor_device_ptr_id_4b6faf1d_fk_web_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_doorsensor
    ADD CONSTRAINT web_doorsensor_device_ptr_id_4b6faf1d_fk_web_device_id FOREIGN KEY (device_ptr_id) REFERENCES public.web_device(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.web_doorsensor DROP CONSTRAINT web_doorsensor_device_ptr_id_4b6faf1d_fk_web_device_id;
       public          fedge    false    302    4067    311            �           2606    30588 =   web_doorsensor web_doorsensor_door_id_6e3e7656_fk_web_door_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_doorsensor
    ADD CONSTRAINT web_doorsensor_door_id_6e3e7656_fk_web_door_id FOREIGN KEY (door_id) REFERENCES public.web_door(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.web_doorsensor DROP CONSTRAINT web_doorsensor_door_id_6e3e7656_fk_web_door_id;
       public          fedge    false    311    4081    304            �           2606    30757 K   web_doorsensorvalue web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_doorsensorvalue
    ADD CONSTRAINT web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors FOREIGN KEY (doorsensor_id) REFERENCES public.web_doorsensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.web_doorsensorvalue DROP CONSTRAINT web_doorsensorvalue_doorsensor_id_04eda24b_fk_web_doors;
       public          fedge    false    4105    311    338            �           2606    30656 I   web_energysensor web_energysensor_device_ptr_id_de675ece_fk_web_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_energysensor
    ADD CONSTRAINT web_energysensor_device_ptr_id_de675ece_fk_web_device_id FOREIGN KEY (device_ptr_id) REFERENCES public.web_device(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.web_energysensor DROP CONSTRAINT web_energysensor_device_ptr_id_de675ece_fk_web_device_id;
       public          fedge    false    302    4067    312            �           2606    30751 P   web_energysensorvalue web_energysensorvalu_energysensor_id_f907147c_fk_web_energ    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_energysensorvalue
    ADD CONSTRAINT web_energysensorvalu_energysensor_id_f907147c_fk_web_energ FOREIGN KEY (energysensor_id) REFERENCES public.web_energysensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.web_energysensorvalue DROP CONSTRAINT web_energysensorvalu_energysensor_id_f907147c_fk_web_energ;
       public          fedge    false    4110    336    312            �           2606    30662 ;   web_latch web_latch_device_ptr_id_2ad80e48_fk_web_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_latch
    ADD CONSTRAINT web_latch_device_ptr_id_2ad80e48_fk_web_device_id FOREIGN KEY (device_ptr_id) REFERENCES public.web_device(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.web_latch DROP CONSTRAINT web_latch_device_ptr_id_2ad80e48_fk_web_device_id;
       public          fedge    false    302    4067    313            �           2606    30565 3   web_latch web_latch_door_id_c7f2a266_fk_web_door_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_latch
    ADD CONSTRAINT web_latch_door_id_c7f2a266_fk_web_door_id FOREIGN KEY (door_id) REFERENCES public.web_door(id) DEFERRABLE INITIALLY DEFERRED;
 ]   ALTER TABLE ONLY public.web_latch DROP CONSTRAINT web_latch_door_id_c7f2a266_fk_web_door_id;
       public          fedge    false    304    4081    313            �           2606    30667 G   web_latchsensor web_latchsensor_device_ptr_id_5209f886_fk_web_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_latchsensor
    ADD CONSTRAINT web_latchsensor_device_ptr_id_5209f886_fk_web_device_id FOREIGN KEY (device_ptr_id) REFERENCES public.web_device(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.web_latchsensor DROP CONSTRAINT web_latchsensor_device_ptr_id_5209f886_fk_web_device_id;
       public          fedge    false    302    314    4067            �           2606    30558 ?   web_latchsensor web_latchsensor_door_id_fae2e3c6_fk_web_door_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_latchsensor
    ADD CONSTRAINT web_latchsensor_door_id_fae2e3c6_fk_web_door_id FOREIGN KEY (door_id) REFERENCES public.web_door(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.web_latchsensor DROP CONSTRAINT web_latchsensor_door_id_fae2e3c6_fk_web_door_id;
       public          fedge    false    304    314    4081            �           2606    30745 N   web_latchsensorvalue web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_latchsensorvalue
    ADD CONSTRAINT web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch FOREIGN KEY (latchsensor_id) REFERENCES public.web_latchsensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.web_latchsensorvalue DROP CONSTRAINT web_latchsensorvalue_latchsensor_id_ffe98258_fk_web_latch;
       public          fedge    false    4118    334    314            �           2606    30739 J   web_latchvalue web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_latchvalue
    ADD CONSTRAINT web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_id FOREIGN KEY (latch_id) REFERENCES public.web_latch(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.web_latchvalue DROP CONSTRAINT web_latchvalue_latch_id_a4ab6b18_fk_web_latch_device_ptr_id;
       public          fedge    false    4114    332    313            �           2606    30672 7   web_led web_led_device_ptr_id_2177842e_fk_web_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_led
    ADD CONSTRAINT web_led_device_ptr_id_2177842e_fk_web_device_id FOREIGN KEY (device_ptr_id) REFERENCES public.web_device(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.web_led DROP CONSTRAINT web_led_device_ptr_id_2177842e_fk_web_device_id;
       public          fedge    false    302    315    4067            �           2606    39209 /   web_led web_led_door_id_ed3e81da_fk_web_door_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_led
    ADD CONSTRAINT web_led_door_id_ed3e81da_fk_web_door_id FOREIGN KEY (door_id) REFERENCES public.web_door(id) DEFERRABLE INITIALLY DEFERRED;
 Y   ALTER TABLE ONLY public.web_led DROP CONSTRAINT web_led_door_id_ed3e81da_fk_web_door_id;
       public          fedge    false    304    4081    315            �           2606    30732 B   web_ledvalue web_ledvalue_led_id_950da7bb_fk_web_led_device_ptr_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_ledvalue
    ADD CONSTRAINT web_ledvalue_led_id_950da7bb_fk_web_led_device_ptr_id FOREIGN KEY (led_id) REFERENCES public.web_led(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.web_ledvalue DROP CONSTRAINT web_ledvalue_led_id_950da7bb_fk_web_led_device_ptr_id;
       public          fedge    false    4122    330    315            �           2606    30702 5   web_plc web_plc_cabinet_id_1e556896_fk_web_cabinet_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_plc
    ADD CONSTRAINT web_plc_cabinet_id_1e556896_fk_web_cabinet_id FOREIGN KEY (cabinet_id) REFERENCES public.web_cabinet(id) DEFERRABLE INITIALLY DEFERRED;
 _   ALTER TABLE ONLY public.web_plc DROP CONSTRAINT web_plc_cabinet_id_1e556896_fk_web_cabinet_id;
       public          fedge    false    4062    300    324            �           2606    30621 7   web_rack web_rack_cabinet_id_2c2a8a9e_fk_web_cabinet_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_rack
    ADD CONSTRAINT web_rack_cabinet_id_2c2a8a9e_fk_web_cabinet_id FOREIGN KEY (cabinet_id) REFERENCES public.web_cabinet(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.web_rack DROP CONSTRAINT web_rack_cabinet_id_2c2a8a9e_fk_web_cabinet_id;
       public          fedge    false    308    4062    300            �           2606    30627 =   web_request web_request_cabinet_id_f6bc764b_fk_web_cabinet_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_request
    ADD CONSTRAINT web_request_cabinet_id_f6bc764b_fk_web_cabinet_id FOREIGN KEY (cabinet_id) REFERENCES public.web_cabinet(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.web_request DROP CONSTRAINT web_request_cabinet_id_f6bc764b_fk_web_cabinet_id;
       public          fedge    false    300    4062    310            �           2606    30632 7   web_request web_request_door_id_fdca5e72_fk_web_door_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_request
    ADD CONSTRAINT web_request_door_id_fdca5e72_fk_web_door_id FOREIGN KEY (door_id) REFERENCES public.web_door(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.web_request DROP CONSTRAINT web_request_door_id_fdca5e72_fk_web_door_id;
       public          fedge    false    304    4081    310            �           2606    30637 7   web_request web_request_rack_id_d737060f_fk_web_rack_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_request
    ADD CONSTRAINT web_request_rack_id_d737060f_fk_web_rack_id FOREIGN KEY (rack_id) REFERENCES public.web_rack(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.web_request DROP CONSTRAINT web_request_rack_id_d737060f_fk_web_rack_id;
       public          fedge    false    4095    310    308            �           2606    30642 8   web_request web_request_user_id_f52134a7_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_request
    ADD CONSTRAINT web_request_user_id_f52134a7_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.web_request DROP CONSTRAINT web_request_user_id_f52134a7_fk_auth_user_id;
       public          fedge    false    4021    310    287            �           2606    30697 C   web_servicelog web_servicelog_request_id_cc613eca_fk_web_request_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_servicelog
    ADD CONSTRAINT web_servicelog_request_id_cc613eca_fk_web_request_id FOREIGN KEY (request_id) REFERENCES public.web_request(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.web_servicelog DROP CONSTRAINT web_servicelog_request_id_cc613eca_fk_web_request_id;
       public          fedge    false    4099    310    322            �           2606    30720 Q   web_shiftassignment web_shiftassignment_group_id_d0db81d3_fk_web_employeegroup_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_shiftassignment
    ADD CONSTRAINT web_shiftassignment_group_id_d0db81d3_fk_web_employeegroup_id FOREIGN KEY (group_id) REFERENCES public.web_employeegroup(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.web_shiftassignment DROP CONSTRAINT web_shiftassignment_group_id_d0db81d3_fk_web_employeegroup_id;
       public          fedge    false    328    4090    306            �           2606    30725 J   web_shiftassignment web_shiftassignment_shift_id_1006d335_fk_web_shifts_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_shiftassignment
    ADD CONSTRAINT web_shiftassignment_shift_id_1006d335_fk_web_shifts_id FOREIGN KEY (shift_id) REFERENCES public.web_shifts(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.web_shiftassignment DROP CONSTRAINT web_shiftassignment_shift_id_1006d335_fk_web_shifts_id;
       public          fedge    false    320    328    4134            �           2606    30712 Z   web_temperaturesensorvalue web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_tempe    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_temperaturesensorvalue
    ADD CONSTRAINT web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_tempe FOREIGN KEY (temperaturesensor_id) REFERENCES public.web_temperaturesensor(device_ptr_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.web_temperaturesensorvalue DROP CONSTRAINT web_temperaturesenso_temperaturesensor_id_9f28af1f_fk_web_tempe;
       public          fedge    false    316    326    4127            �           2606    30677 S   web_temperaturesensor web_temperaturesensor_device_ptr_id_0b2f7e45_fk_web_device_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_temperaturesensor
    ADD CONSTRAINT web_temperaturesensor_device_ptr_id_0b2f7e45_fk_web_device_id FOREIGN KEY (device_ptr_id) REFERENCES public.web_device(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.web_temperaturesensor DROP CONSTRAINT web_temperaturesensor_device_ptr_id_0b2f7e45_fk_web_device_id;
       public          fedge    false    302    316    4067            �           2606    47300 =   web_userlog web_userlog_request_id_4abbdada_fk_web_request_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_userlog
    ADD CONSTRAINT web_userlog_request_id_4abbdada_fk_web_request_id FOREIGN KEY (request_id) REFERENCES public.web_request(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.web_userlog DROP CONSTRAINT web_userlog_request_id_4abbdada_fk_web_request_id;
       public          fedge    false    310    360    4099            �           2606    47351 C   web_userlog web_userlog_servicelog_id_fb909b4e_fk_web_servicelog_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_userlog
    ADD CONSTRAINT web_userlog_servicelog_id_fb909b4e_fk_web_servicelog_id FOREIGN KEY (servicelog_id) REFERENCES public.web_servicelog(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.web_userlog DROP CONSTRAINT web_userlog_servicelog_id_fb909b4e_fk_web_servicelog_id;
       public          fedge    false    322    360    4141            �           2606    47310 8   web_userlog web_userlog_user_id_1df0f752_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_userlog
    ADD CONSTRAINT web_userlog_user_id_1df0f752_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.web_userlog DROP CONSTRAINT web_userlog_user_id_1df0f752_fk_auth_user_id;
       public          fedge    false    4021    360    287            �           2606    30683 G   web_userprofile web_userprofile_employee_group_id_46a1fb99_fk_web_emplo    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_userprofile
    ADD CONSTRAINT web_userprofile_employee_group_id_46a1fb99_fk_web_emplo FOREIGN KEY (employee_group_id) REFERENCES public.web_employeegroup(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.web_userprofile DROP CONSTRAINT web_userprofile_employee_group_id_46a1fb99_fk_web_emplo;
       public          fedge    false    4090    306    318            �           2606    30688 @   web_userprofile web_userprofile_user_id_3dea3d05_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.web_userprofile
    ADD CONSTRAINT web_userprofile_user_id_3dea3d05_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.web_userprofile DROP CONSTRAINT web_userprofile_user_id_3dea3d05_fk_auth_user_id;
       public          fedge    false    287    4021    318            �   �  x���Mk1���nI�#43��ͩ�i�v�q{]����9��Wc$;�.a%0�ؗ����W��6��7����?�׏������O��������v#���������������:v���	����ؖBK����Za��Z��v����)}c>��WgC��;ۨσ��E�=]u�����:l��bl�٤�����}iI����օY	c��&օ9	���*���E_ybA�b묮̊��0j/���|k�о=1�aq�3��'́�!�l6�ay�<�	f�3�,2�y��1,dWY`b��'�?Ģ�*��O�T1�kl���j��6ϾoFٳ_ 6�!�l�U��1����_��e��N~�����W���	+ �ه�Lz]��{Y}$vQ�R]``��h��) ��G���H\��>z�U(e�10,V���e�12�����RfS-B�f��&��>vav��,��0�*o2��2�V��~���ʫ�ᧆa�[���*^       �   �   x��бN�0��=Oq��p-�k_��	��*[���
Ũ!Bi:��	CU������8���5�| ��״]�]zz��~LC�v2����1R\�w�<\.��K8A+`B��qJ%��	k�g
'�s*W
`0�$����Y��7k�*�ͭ�7���|��/J&��3��7��#)K*@S����hm���dɟ$�al%��j�K�T
�҇\�m��Vc��      �      x�ŝˮl�q��~�=s��D�I��I+�
���F!�e���}v�ڬnN��9����X?/�W}��o~��߽}��w߾}��?����o��?���?������oL�������?~����������o�����_���o�z�9�/����N�N��j�;���F�hx�d_����������۷߼���o���_�����o����������F2q2$�j'�(����d<IƑ̜�)�%�H��L�P�	��&�HV�L�f�cf���ܔ�6��17yxn ˑL�L0�Ȗ����ɔPO��HfNfD�N�GP}��ަ>J5@�ɔ��z�,j�f'k�$H/��j�� Z�+3U�����Q�:YaR���rT |z���&�rØ�
���K"�
3��c6*@#�N�Bz.2�C6*@#+N&�&f>I6*@#�N���Z{?��
��mz62��ds ���&����e���V�Q9Y�ھ�	��9j@#�>7���Q���&��3`+Y� ���£3 j ����1�n%��M�)�
����,j ����mB�W�E nÖ��I�c�:jh� 'c��w��,j ��	H)t�mj� 2'S�&���+G�@��LY�(Y� '���`�Ш�!-��tR�4J ���*|9�:@%�o���dz!�=dQ�v|\5���MdQ�v|\s���\MfQ�@�'A%���^iXT ��8]h,����20��M�Ep�BzrAkQ �W������ɢ���2�΢;B><fQD���4�<��� �N��t��(Gs2idp�m� ��L�9��n� Ź���#�MdQ�:YF��O�xYT '+�Qg��ɢ(:Y�,�����6y5YT m
@	�`zx��,*���!V.���r�� *NF�Vg�l9YT U'cbœd%*��������V�E��dJ�����j��Z��(�Tϗ�E��d���c6j �8Y������d�42t�Z���@��F�~Q�	*�t�|n����ɚX=�6Ghd�dT�^\�o"5����q�Zgk��o��@�v�Ȥ�l����d���42��1�$5�<���e��gk��d���4����E��ǩm5q���,J@�K M�g�J�ɢ�?��r�mꖓE	���J�O�(سU
��p% {��@�i�j2����U�}ivr
 D��3i���Q��X-#����Q�:ZA�r-� ��#U��� *y�A����-J��!V��֝]hQ�U�~�r��9����;���7:
�^�����$EH��aT��hҢ��^eZT��h�b��\!F5��h���j�Q�ml��:_��#F5�rk��[�G�j�>I�A+�E�z����c	+>���Sq,Q9���(��c�Y=;�x.���lM��}�0�dKZs��,�R��8�g0����`Q<�R��:	e�sq,U`��`Q<'�	�N��r�(���&N�v�E�d���r��Q<''�29Z�Sq������l���3qrR�m�},���'��d����؆�?؅�����p���ղ^3�_�z2NNM0�&�����x.NNmE��:{c����8%Z�%�.�
�8�3�5؎1�
��8%�
g_g� ��)�����ˈ�-����$�N^6�S�S��)I�xv�,8��'�d�ur��e�0�l��2	M�Y�@�*��8%2ίo.v��:�=��J9��)�m��	95�i�Q�Q	�K鈶L����h�pOɩ��I���q9ب�3rjb��G�;�l��)95	��*�,u�{FNM�&4��\���a�)9�������`枓S�~�T:8�o�{JNm���a�r��m����S�������nn:Paj�\�u�ߨ$l+�if&/G�:��p�VH<3u���(�Ƥ<-���=؇�3s��N딬���L����:��z9Z��'�44�$���hQ	�T	�\�\��Z��U�� ����n�jrvԢP�j�ZP�K�KD[m!��"�,HG#�zxԢ�:T��m�L�_^;�_Ğ@�Z@��Ԩ����Հ���Y��i�|Ԃ���V�s�M������i�.O��-��N̞���@�h�~b�4��ֶ3&G�*���8����	��l��*6�k�ATΎ&*W���Q�j���T��L�֣E5�^�δ�Q1�b�d��gpM�<�\��g���D\�0Z��ƒ��.�@�D��y![<�5��q|�RQ��6���a|3�I4[�5*��A|��R��_����/~������l������Je�D��`c�?�W_�i>����_�^}i���Ă�X�^}a�Wg�~�1ꋟ��/����c?X��^)�/�^�����b0�{�B�2<8+��X���q�&	tpZ���v+6;]#?�������c��`9��D<�m�.b����DR_oIv���������_��4X�F�F�5X�K�t.hP0{i@�Rq&���)���f��i�9\���( �f�,�.��Q�����r%ʳ׹-� ������T���س1�U䂳��a̢Pu�65q�5ـu��Ѩ ��Q�:�^�ν��G'A0�ɱ�IɓU��9�����K�:;�[�ܦ�?ooh�fN��Sp���7�\r�m�7�E!`s��)W�Y��NVK[v����`?nWMPI��q;��9���S[;F%�^���<a��+����-ji۬�b�r���^����j�3�v��R���F[�a;��G�?���FN�%������o�dZ˴��}T�k/��"��-N6t��!�^~#�bX����!�^~#��F�̦��Ä�"�^~�$0��ݎQ�Z��w״ �,�v��Z��wG��dj2+��%	C��ܪ�I���EI��|
��J���fL�f�.����m��Nk�/���I���EI��h�^b�.J��.��hQ	�K_��4��,W��%�^�& :٩���X{��ݵ���Q�J ����h�om9Z�k/wQ�4�z�/&?���5��J>� 
~b�/j2Q�� ^}'E�O���EMYڂh�W����K���K^�T� ��`�mT��w\�e�m��k���065�ys��h������f����s���y��8��9�
�b����W���v��Z�����D>u!�he9�(�=����:s�o�Q�{P=����<���F1�n��T@�f��O�`*�n��T����_�\.��Rl�
�Nȏ�|�/���c�֣E)�n@�wK�A������cE�n ���<��˳���~��
`�0B���aJ4�a����_�;�u�)%����r��ſ�/���������ݧ���++����~����!�{@P?�`����Ϭ����Il��y����U��Ŷ^4��غ#�R��چ#<������El��B������.t�C��/,F��z"$�{�M���_n��b�w7��A�����������a��Ep7,'"zt��Jt���ޑ<�~��h���{�
��{d3x��u9	������''��
b�m:��M������2�KS0[7s2*Z����oP������o=�h��;��`����Ü
U��~����)����Ü*�}���/h��-_���u��$��~��z��e}������o�K���p��B�\9��`qߐ�µ'�oa)�E��c\:K{?�>�+��A�c�{ޔ�s��σ�x������{�ﱿ|3�������?9�,���0~�S�r�%�-IG퍥��TO�,�RO6�f]<�h춯T��Rx����o��j�h~P腓����������U|� ��`�����#Su&D+��C-�H���0�G���P5B�C1���jy|���#i[�õ��o�⢽�yQƶDg�0Z۰��޻M4,#�K����E�@/�`�.�Ѵ�@/~��V�\.�um���@/�kPۈ�my��1�K��V�P/��O�Z��m��мF>�#[64j��r�xb�����ḦJ��
�wN��`�e�:�^ 0  7)���Y�'3Vc>&�Q
T,�q9�ze�2�~�왒qM�%�2���ٙ�@��K��P1�k���@��T��Z
���^W�2�Ѿ5(?���P�Gj��D�b�ǖ�ޟ�F�(�;J40~�`���1����+ޝ�g��0�{J44�,�5�z�1���,K�	���!�c��=%ZQ�˕�	�1����*<��g�Ƹ�{J�$P�u�BW_�3�ѿw�hhm�Z�n�� F*��+j �c���#��.-����$�+Rp����jH����f��{}�dhϏ�C�p�s�����y=T���_*�n��c��G5)�{��h=X��C	�}�u��]�<���j����h1�:{E����<��	��a��%�XO�f&)\���F{ƌc�'����5i@��h1�:Zno��=��?y:yj������o-j eG�����#hQ	�)�%`�Զ8�>�Pu2�6���Z�G#.�ϢE)��hU�����E)���@��h����sۼ^�۝@�b��^L���5N�E1��z/&$XϾ�(~i��	!������=ߨ��L����J���rB�ю�ZT���)k!x�&Z�c�j���^N.��*Q����	��v6xD5��{/'�Pf���h��/｜P�6�E�j���%�IoT?�Z֣E5����ج����44��_ޗ$fy�F��,���ݗ�V-�2֣E1�����*N�O�jQ�������,�f��E1�+��J��b��R���%yUs9���o�k�̌����h����k�,��'�F)��e��,�(�I��KX�����BЛT��4�Ó�F%荪��xT�lT�ުʭ��Hg�o��F%�ͪZ.�r�P�F%���Z�rvz�R�V�_��~����U	J�i��r�<JAoZ�V�J�G/Yr�G�R+}�9J��q�,G�=G1@r4�x-�u-�A�nLZ����Z��V(eD��;����9G1����Lݗg��(�؋��)tTrT̎Vk���t���Zk����[��h���Ѫ����{������Z)��$�������r���̢9���$ܮ�:�M.0T�l?׃E��2��� X� op�����~�� ��½ܵ��z�^�ފ�(5E���q�����=$(2��ʂ'��!#�)'&_�za
��ކ������"h������#��\���/ץ`�m��ʕ�F�`�M�X&ȓl����8؂{2��uy�r��uF	���_��>����ܻ����W���K���-���J�</`�M��,���וS�'�!%���w��rm�4K�Y�e�;[pϻ�{Ѣx�N�x)s-*������'����%x�����T��Ǵ]`Q	�'����#[	6a�9&���c�u��ށ�@nF�j�򥍕�w�E-�^�(c}^6Z��U�Q��'тuX<���_���GG-X��7w��-|q A�Z��Z���d�^�׷0�ߺ����%vCk[O�o��W}�^��[6�ڨ������_�Zފ6���]qC��e����۔;��������+�r?H�.|�%˷Q\��W���z����t���E�*�~M
�{R�9�x��z�'�:�~�	j��5���.>~���� �c��e��{��F�Q����TS}��?Fp1ڨ��3s��B���g��-����i�TI�ם�ЖǴ�,�|xG�U�2Csx��Ѣ
`�un�4�K\��-*��Q-��Oі�8����MXϢE5������ãՀ�Ѳ1���Ж�{�����z�;�Հ��K�I�P���gh�����z�q-_�֏ZTFG�]��hXy,��1����"�^�Ϙ�Ѣ���&˒/��'�YJ���5FC+�����]������pv��K��u����VJ����.����s@���>v�vܰ����e��Q��n݆��_xsqo2^��^3���k	���ɹ�i�L���㹃,��xnw��}�->gТ�w�M�T�h\u?���hQ���� R��ɞ��-�-�����(Zo�a�Yr}��<oh��)x��O��Ԭ&O�xZ��"��ZP�o?ϠE-Pu����Bixn@�bu`C��
����1���h���T�)�?u��;����D�E�(�(~4�x�݃G�a�2л���Z�v:��S�/ӂ��w��P�rM�֏�(�]xC#�|y�7�>-ׯ����������˥�V�֏�( ��וG�����ZO5��ވ۫�x�-~��<�#�uG���U��[\�yq����6�5��@�6��ً#��E���z��r-��.�I.Ͼ�}h1�S�vQ�����{�����E��qFF��ڞ@�@��LV�e�Q.�]hQ����b����т�$���x���-?�
N�ގح����g��ɖo҃��w�u;=g������O]�����u?���M;�ŀ�[r���*'Тpw�ve����֢pw�r[xT=:jQ��uEp��~Ԣp���v�zQ�|A�<�p�ݐ��Ҏ�@\Fb�H��K��hQ��n�V��h˧A������r��0ZT�]b����ZT�ݶ5�4���hQ��v��_KF�@�j ݹ��9?_��=˵`*6�����(:1jQ��n(\˰��.rףE5�^"���r�,��т�����'Ǆ�h�~-��v�.	W��Z֣E5��J�2�,�.���[l���R���h\�b�i��-��Q�j���H�^|k��F5�t}G(jϗ��6��]�����
35X�6��'49ZF��|�4� �5D<�[��JR��8�]�p�&�ߧ{q��2��|�޽_�5؋�ߗ54�jtR�����.$��ȁ2��_�g{��nF���e�\C[]4A?���j�)��I��F�"Z�F<γQ[�y���ZwV���Hռ��%��SSP���>���c��o���XO��g����>��i�o�����-�"���~�(���A۹3�&��O�x5<�2�Z��lh�u
�x=�����<5G��b�Q�"^�>0|�:_(n�(^���K	^v���N�Q�R@��>�����)X{�zC�b��+ǄD�S��Ĵ�����Q�;�+��	@Q�ʣ�6h���wE`�]�����m^�n����� JQ�o�fԞ�ў�FQnW�j5����IQnW�V�Q!;�цu�vE�&A��I���[�:���i�Z.T���&��\M���z-*���e(\�'��a�(������Us`�8�������_��oA�j ^�ϫ��̓��|W�Q�gB"�P��.����
�s�f��`�aG5��hmG�W�П����8�l      �   
   x���          �   
   x���          �   �	  x���O�]����o�XMUuUw��*8v"03+��#��"�,/��S���<�[�@�Y-u�u������/�������������x�÷o޽��_������o޵����Ϸ���ӷ�������?���W�?�|&$�%��N��U���r��g�^��m��>��__._<>|���/^_~�xyx|��W��W����ho�o�򓒯޼���/�*)f�t�B�2�J������-�,���i�*�(^*Ym湠EY��n��ՁE�T)Qi]��Бҹ�b1�Ǡ�,��Jf(��Z��!śEQ#�R��_����;R
ІnL���I�4M�#��i�)-J	�胦S]�E)Ak�u�,�����EY4�E����0C͛��+q�Y�vd-8����0�(g��5����)#��RdC�����Md`'O�YM�*�"A���&�º�vhQ
̆oL��(V`V�maRȠ��
�Z�MizG�|��l(鍣�A�Rp6����>Z�����c��`M���+[���ӧ m(Y�܈��-JZ;���R��
І��U�n1YZ���_�-�Q�֮�m�ޡ&��Uk�4'�&%g�/���cLMJ�jx|rH�����X���ڔQr�z��.P�?J��9���lx7��t���lx7fˡE)8;һuZ6�E�gC��´Ӏ��g�ّ[��Y���hGn�;-q�M�hGz���AkRp6����І<Άo����ig�p(fg��q�Xc���l(�S[�Rf�Y�6�����l�6�:A���l,7��5@N/1+���g��l�h�D�\�x���mw�K�=f����,J	ڮ��a��Z/@;s�kR 	Z/@;�/����n^�v^9����)� m(�a�O�u[h�aݦhQ
���݌\��g���wz5e��ۼq| h�Yhg����*@;�y��CPG�JІy����Ur6��pMJ��Hs�&�(L%hew���>L%i�HFY�#�h�J��j�\���ai'w�)S�ڞ��\���=�B��X����ɲ�'���Z|��T��.����Z�}@a���Ⱥ�`Ⴖ[������mCK.�4(m����qx�Z8���w�;�C���R�����\���Ĳ����p=w�9�nC\��wg�2(&�/HY&��e)���(�IB�"%qCJ|!�}t�����c	��rb)�J�*1��U)�˖V���*%��B��W)��2�r]������m)#�
�UN�s�iE�Ě�*(�W��R&��WI���%gh����ؖ�1�;�����6X�̈́�ο
�yn���.�h��b�;ab}�,%qCʒ�.K�\ɋ+}�?W��-e'���D��\>/�v�*2�����.�̘�f�N��2c[��"�(Uf���4r�UhlK�`���rn�}bsB�@\���~��{��El,�$n'�9��C��b�^��"9�Z��i�m�Et,���B���N\d�BK��DsM�)<᱔2�t�x.�c�e����P��C��}"���XJYm
;�9�����w,X��X*�<H�r�����v��k`\���~h�3AK K)y;�	��J����|�d���g9Eȶ����\�2d�i��Ղv�S��+�e��`ʧ١e6#b���)GvHY{����NA�t	;ڽ���)IvH��Xc�>�)Jvh�Y�������Ͳ����)Lvh��ݡ�T>��%y_�J<��-��s�ږS�lKaj��;�Ny��%le4��9�,q�&�� ,qO��\��$:��S�쐲�P��)S���wк?��垷=�O������d��mh�㹓h�P���R4��T�:��-��$�:�S��2��"�-�S��в�Q���S�l+�6+3æ��-�ZrW�`o˝�e[J�|V��*�,g���}L#�:7�'��iolޛO�C��0
/�S�lK1o"�/���0��P�7blϘÔ垸������$:E�,�J��|`���2f���{-�M8�)d6��f,��{�z�2��d?���-�n�R�Y��Ɯu}~������=�ə}R�r*֏�h�����#�b�gb�`����J�X��+ز�Y��dkh�)$7A�OR�NĳNldGn�f7ZL�$�;�r�4;����'%X�C!B����W,F��]�h��_(��X�
�Ww"$0�6�}H螸�)T5{�Q��zՙ?�z���$|Oܭ$��{|",q����e��s��F����Ǫ���T���%|O���YR��g�'�"�?!1x����bm�24R+|O�C�j*7������k�9��:�?�)e�!���Q�{⦭�+6,c@W�"��=��F>��O��#7�5�B٤M���#wK�N����"?#��M�0���r���LU�,e�����8ia�����ǢEf%�{ןN�����ſ0      �   I  x���=O�0@��
o�Z��9�̈́J��D��5
%R+B��1��q�� �M�����{r�������a����uۼ<W���캺�����UX�Zo�ݫx�Y>�W��N��T�T�����$Z�WJ��B�;6a��R���b��Jq[��(���z��	��8I��eQ���gA��W�˩�����W�8���i�}`ġ�W|0�D{ ��B� ��`����	��t�eB��5����4�WH��_$��B��&�)��X�P��g��T�xO�⨢��d���8�'#�aG5| 0�65�B���2��BF�O�Z�)      �   �  x���Mk�0��{>�niY*��鑴S���lX�]Cڹ�4#M��SVV���D���I�_n��˯�iھ3�����n��߮��a�]o�����a����=�l�̷����9����C:8C5�irjYQ=}p0_��f�\����yX=5]k.��j�\��Sgڮ�Ҵ�?Κ�g����P��2c5�y7�zE�P��#�H�h��TdȘ�g7bF���SbK��j�b���@�ޡ�1#&笨��_�~�2�u��c9�ز�X�n
�d9z��4C�l��1V��1�� Xt��~�1�L$�5�
��i����(8ǡ"�*�I�r��[R&5C$9����/�ꐱcKʪRf$���
J�))��*��|t�kJʴ�ᾂ��	���|��h�m����h�q�a$��[	!OJ�C�)
�O�|o�A2��)�J6      �   �   x���AK�0��{?�{�b���$�dN�\��lX�t��o�`��փ��<������+��#nWM__¦b�5-�����j�����f�4_�*��DpQLQL� TV���e�W'9�5�6�0����K�<�*�p�n+�U����u��$)�J�q�����@�g��!�h�d�t�j���L�NBX!�"e�r����$1�Y1��fDAGF��O�*͈��A8�(��bd�7�~�      �     x���1O�0�=��[A���|vl3�R R�H4e�B	jE�P��{(*��)]n��޻�/�%�|Y��o��ݺj��m��k�����G�
֛}�ƞn��b�.`�&(P� fH�Ct\�2R^	�LY���ÅKVx6/�]��Kv[0_����N��+0��<�V�2���kc��k��~4
���	I+�0�I̱�2 '�#��j5,e�4�ځ�4��6�a��1�r�Ej��Ɓ0t�N� ���Wy>���ߏbR:n�Gs$_ГW�      �   �  x���Mo5�����5��rBP J$Z�F�@�
����g�K���B;R�Ky4?3c{��_<�����������/�ݽ������������o^�.�?�����[�m�?��Ǜ_/�}����_\>$~z�����3��F�	��~���ӫ���^޿�#~�G����g7�_|}�����7�뛗_]]�ɓ���!3�l �5�<]q S��� 8�N=�Lf�z�=�a,H����f�R�H���0��-+3oĥQZ8'(���Ln?�+�0F�oڊ�4�Q��!u�֘a��'a���!ǖe��GO�=��[EZ��=5֥XkΖ&�ѣ;���)�ѣ��cq�ieEF�TP�5L�5z`�VQ6�k�d����ȵ���ю!�+ռp�"=8�E$���,���V*�M���I��x�y�eaR�BG���9F��JwJ+,2��7�s���p�����0�����1���@*�y*�Y���;<�:��#O[!mī�8�cVip�büz��JC���*y��Y�����W��+�I���
�A�V�Ez`�����,���[%8�J�EJ�Mӎ����NC$�H��t�٣���dM!-9����@,����Y�E���c�:{����W=�c���1�)�e�B�;��#晴.L�s4��>퐡.L�cx���&=8��jV8l�R�G?�Δ��4i` 3�'Gƪ�U��}�ڥT�[�$mY�*��P�+-6��6�!:�h���lt�=G�\²�*��Jk�5O�6�����VOSzUцu�k�Ni�h�K*�bi*m�J
)��5OamT���������N�M�Ů���f�Ǩ�{�j��,	�Mʛj��h�)z�l�F��C8D�O;j�F�?.�XWZ]{��Ѣ��(��-Zc��۷j�0�&l-�s��]4����у�u���5�cD��)R�7
'q�=8(�Ԕ�Z5z`p?���$5z`D���y��G�ZPc\IL�Ѥ�����h���k���a���
��{��K[/-(��7V#,d��� ��#��#�[ި���i����� ��,���1�B�;�TH�Fm��T�.�J/X�+L��G��J���E�d!�J=8���T"�J%�g��D��Tj}��DeN��Q*=�gbQ�b�m�'������(�p8WYͶg�CW�Ek�5b}�M�j����'��l/���=�! ��zTD�9��Xqh��b	V �ռS$|�#j{�L�D��Hk�'�gq�Fe�KL�Ҟ�#�F����W/�Ί�lT�b���8��l�bLh���,�Ѩܿ�^��@�^!�N�Q6��itjph�yqn��2�z���9�)�ѩ;G����ؙ���P+n�7���T���3P��R�!����G�ʆ��5��Xuy������J��W��I�G�H� �ba��\ �R�dz�N�8��(պ�_JuI{�2:u?\	���=�@�ɡ�4�(�,/?dTj�F�T`���eTj�yJ�+�*y�_F����~q�������j�-ޢOM̏	����"u���Y6q�{�=�WK�G[q��]�2�C�%H$*G��La�؟��{�Y�����\�j�-O��[�\      �   �
  x�͝Mo����{s�ȍ��Ϝ�I�$`+ɑp2��"���=�rWۯ�$�*@2���3����ss���߾9�ܾ�;�������������}xx������������}�|���_��t�������~%!�ׇ/��K_��o|������_��oo��O?��>��������pw{������|�������ݛ?����n�7�:!�oT���<#Տ�B\��T��/�H�WW%0����?�i�?}��V
�˵HQ#��z��ɧ�Β?AF\%M2Ad\\_R|$�*d�	;N!�k|��'�� cN�`y�泋%���?fR�eAd�	_����}U�Tx_�K�G��1��o8_%��3|��n������qrQ�#UU!�,���|�f�'�f���~�T�d��Ufo�� ����ґ��.�b�7@�Q�z6��?B�xX��yr�x�~��B,�xX��i��<��KϺO<p�*���8t�z�;�������w�+�t�Y6�
�Z�����8�p|nA\�����(� 0|nTNx����&�E��TV`���8��1M���_WԲ6����L@�)�,��w�e��@6���K��\T�n�@����7�|��F�GȽ6⓯4�#�������BW���<P�6S j�-W�fhD��ץ��wU�|�����¥�mP]�}�"ﲯz��K������Ų��a�/�n�����T�����#��,�t|�
�'��Ͳҥ�mP���)o�H؈��-`Ç&�*���o���P�w��rU��"���O-ē4"�ǍH{X�aŔ��Hb�xX���D\(��1p|�*'m)D��@����:=�V��8�p<7��������q�wܖ�� �[����+I�ـ ��~�m/~Ǧ���[���F�ю���fo�
�]F��k����Mp�Ǳ�U�\Q|�7@�~V����F��-`�Ǳ�M;*)�f�1�J.������؎e���*`x}(��4��E��@rק�
��X7/�o֍p��nXr�
��n�*��<���OwTҬ��j�=�p�
��:�*`�<ֺw�N�� �{nѻ���l�S���{��I5����F�����e�I1랚�6����Xfc�@r*���/c�\3꞊�&����X�N��S��
0|m�]$Ŭ{�ڠ~�c��UC���jk6|�͋�\ΟJ�&�f�w�~�;zW8���l���g-5��{�ڠ��ީbpyǓ�u#�*�F�f��0eVœhh��ڠvc^D3��*�F����Xœhh��ڠ~c�y�N#���ڱ�����O=�#V�U-���j�
��Ʈr��y_8B xX��4.Ң��S���;�Me�؈��,`xn$��z�q�����4sOe�A��p<�X>nX|������n���Q�8����'�E1�fPf�@/c�I1�d�e�!�|�2�,3�Z����f�b�Ǡ�ک���YeePe5��aeŅs]VT@�GIj��1��n_zN�!
�2�&�*Pd�8�^WɎ@��|jO�!
�2��*��<>٨��"�	, ��Bu�;�j�����X즣T�?Pc��j�+�)*�ȕA���{�zU�U65VX��o*nv3h�v*>;[%d5֎��=v/��߸8h&���j8�6ʮO�S�h@���|mL��.�Z����t����	�Y��O�#p5\�c�@5�SQ�}��*�	����멮��+�.����*�=�TI�@���lx
-��	.�Z�~�*շ}0��vrc�Q�]���7@���դ��2�,Pf%K�t=h[H�Q�=jUVT@�۩�yG��p������i\�����,�*�*�w��\4-�e�X#t�pA�U�	�X;S�<��~��j�
�]�뇟oe4"ePb�@�.�=}{r��#f���.��\ݳ �n������el*��"��v�(��͠�j�
>>ninׁ�	,��8ާ[4K���&�����T��o�^���ׇ~ߎF���LPc��m~Z��ȓA�U�J@��Sqq���Z-VX��i�zi���>0{�
�涘��	,��<^���
Pa�@ܞ��j�'��j4X;V�NqsZ@� 0{�΁�R@{���v*bT\�P_�T̮h�~ګTǂk>?���c�[����[+�Bn�Uu&P\��D���&!��������qh�Z�r�c8�8�r���-`�vg?��[5O�P]5�5۽c�g����	�v,9{��B�,��j�
tW;ULN��F����	�Y���FUq=Y@w��l�N�m'+��A@w�0�v� +�=-��j�
�=�#��
h�Z��U�����D%5��G��x(����* ���A�<�L@{�0<�{JU/S�UT@�<N'��g��.�x��͚�2(�Z�����0�X�Y7BP^5���-���MM���ZAy�P|ٶ̫fZ
ګ&���K��jV��
ʫ�@y�SI�y`ʹ�W�n[�Y��!(�Z�~�c3�Tͬ�WM`�����u�u#~ׇ��i�ʱF���]X���.Р��z���	**^�Aq��,��Eޕ|k�g��_�^��/��      �   .  x���Mo�@�{~��
��|yw�	��#��Q(A�J����I#�Fj���|x䝙w<n��>�ܸ�M�|w�}y�X/�|��mv��f������v�s�߮6���W���k�L��y��
���F��Y^x<;w���k�?��hw����ay��s7m��y3_���k��w�������a�QXE�57��v8�����~0Y8&�L)%,)��d Rᣬ�e��H*RQA���k/5!PĔJ�?b.����UCI�XC�b�[Fb/!��3#�'��iPg4�Z�����$�Q-"!,J�g@U{���&�����v �#�k�'�֒U;b��P��j(Z8FSeLEi1��Z��O�C�RN���Q
!j�aF>��?Ę��{2mے"M)Ē2�em��j���H��d!*�P2�I2Y��	H�K�f��Lk"l�Y���c��������?��u�Jѻ�G�]����S�l�_�'@[b��l5�O�J�~��vF뀢�<�m��l��4�g@����M� \����̦����<�~�Z��      �      x�ĽM�-�n�7ϧ83'�ը�[�+��q�`+��BqȰ"�=ȷ�o��]��jQ:��#z�j���Ň��?���o���������o�/�������������?������?�������������?�ǟ��?���O�������������E����h���_a����?�5���o�_�K�����������C�w���������������o��o��?����W����7���o����?�/�����?��/a`�2,ɰ7en�WX�����v.]�5���B/��><6rb���f,��� ����O��_�BE0-���FB|R��ϐ�/Pq���3,j��'d���3LB��&�eXI��y�x}������<}:m����_`�����?���zV����-d<��������e�F'!O�(߹�b-=DNB~��-*�JR�>���'Q��I�X���VV�����u���CLR��R&�է�+I��a?���1I�k�.X���<�6%�a�~+I�KE�����$Iy�0m��q�K����%�|jeXI�˧���?�T��3LB��w�2�$���u��_}�מa����Z�����s����Q��)&)p���@W������ϧ��/��cLb~��.\�5���Λ��"�Hb~|����/�ڏ+������/WW���C��A'�*S�$�w,��e�ӑ�~�nD~�e�����v�
����O���~Ux[{�I�Xjt=�`%1��Z���?ĥ��I��X�c��¼&1`��z��C�$��֕Hʰ�����Y�I�o��!b��s�����G�E��9�*Di���.՜��?6��W���?�:g��5d�=?����6pt�G�5ghsğTC^|V���w(l�uA����9�O*ҲGK���n���z�&�S�=V���p����"W�@[�;��A����t��h��a�;��#)=ߜ/�J���}�ޫ�\{K�}�|��J>�O�zՏ~���{K�z��6��Jޱ�?-�m�����%�����[��V}\I�X�ذ+��K����~��$�1�� Y�n{K�����W+����w.�T<&��q�׫'Q`��5���u-V���,�^u��{�;���(�J��<��I����ŷ~�1&QO���?���|��J�� �G	�B�$���<��_�~us�� ��߱�9���Bq-V��������c�k�)&apI�_�k� I{��mA��Q\z���������UXI��t�ߠ�~���`�$�.�e��I�˧��8 ���_u�I�X��값�w��X�s٥b�$��C�5U)*�vH���j��W��k���߱��j�~�c�;b�:�$�GX֐��3�d��E��}���G�sò�Ξh��e[��'�s1��*3�e}���XD2�Wa�Q�t�1�s�.;�9�O.%�ͮ��޹`�12FսgOL�KY{�Ocb�:V��׻l�N�²�̶�I�2�~�����a�|�
+Iz>~��A"�aO.��ͨ�J���A�Ě>w��:�$����y�f`V��&?�dR�4�ذ,�ȃ�ح�J/�aO,���4&6,�/���4&:���0@����}� Ϛ�cL���Rm�Y�]����e���Ϟ����H��	�=1by|�m�TZ���%��"�T��J�~�G2�T��_�&N쉥�zمq��:V��k?�٧=�b�+&2�g$e7��{`i3�g|V��i���+�?/�\x1���s�ݩ���D�=�z����
+�zu����ċ=�=��1ֹ�������Eǘ��'�����U\I�ۧ�o������瘤��V�wS��˼�{bq�UrRO�X�B�Y���'5�Z�'B�=����9�w.­cy�
Zu�?G��%��_%��ɍ�+J%���wc�co.1�&�Vp��;W��nH�Vޢc���K����q��A�c���@?ǲ���˟��l�h��؝���/ت��>��7�u²��I�u,����P6�O��s�׌��*�|���+����֍��$�s!l"ͨ�ip�d/��<Z�������H<>�z'O�����j��b�$�9
%Mz��쏵ǘ$����(|1�|V��U'�W��N1���K;ۯ�_/�J�~oȎ;����I�����*(�\��qӡ�e6L��s�w�
�Z�a����X����$�����������b}�)&)p���T`%)4�>�m�:�$�Ϟg���ڀI�ݱ�o /��e�����寷��q�TY��n�B�Ws����^X�H����������\�$�\I��(�e].0��;��d�k����`reo.!��˸�����b ��cL����k\V����1�TuG�$�^X ��OPW�k��cU{L��%,WCcV��ӱT�Z]sL��f�6��I`2e̢�DTy�0��6WO}V�-g���V���d�^\�D��I`2ew.�m�6�_�U瘤��%�6�os%ioqU�M����*�?�ŕlo�3T��d��X��U��0��;V�	[+�c�ɔݹ�m<dhUA&Q6ƤF�s�ï6�-��欏bߛޗS�/�N��Ev�p
���pl:���RP)�<�˚�5�	.0y�;�>eC���Nq�do,�{�oV�wf����7�&�cA��|4�UUS'M����<�՞'M6R+��v{1x`�)&9�s)4.|��<ٝ�fCĪ�#`�d/,ie�0y�;VtGxp��������g��4b/��&O���ZՅ �'�c�m?���
{�)N���k"�&Q����\х�U�,8i�7�BV����Q-��I���<�Z]7#L��s�݉P��:Y�����e�$�c��"�sI^c'K��b�vI٨z�4ٝ+Z����O��%{cv~s�
+	z�;�^�U�;Y�7��h��q%Q/q�>�X�_�W�b��;����2�$�*vec`Rdo.k�
�����C �Ã�>�ɑ����c��y1W���7��ۨj|L�썥׻FV��c� �7��N1���KI��Ab�dw.�m���<4e�1&Q`�ZuXI��4�;�0n��b����&�X5�G��걹�+Qd�}z����N��D�=���r%QoQ�Fu��"{P�s�b%AoQ�q�;�
j]�"{p��ZW�KY��&�S,�&N��H�����b�:2
��@�!�\06l������R"ȞX$xm-*��sbz���x3�s�)&�lp�H��?�q�I=��)���U�8'��E�~�/���>�8� 2��@�"{r����RJYؗ�r���6 @�Ȟ\Ԅʦ@b�:F��^_��D�=�����UXI�Ç���nPٽ:&���E��w+����hU�]���1�d,����E�h���n5!�y�z��ē.�b�_/{��D�u.j��x�,��C=&��IE�]�+��}�����h�W�Y�;&�,Pt���E/�X�'��:�$��rcA|��|�)&IpA<��q%QOQJ�&ͪ��1�dO,X��=}�U���M�����Up%Y���0��.�1�dO,��U�?&�l`E7�xs#��Kֹȶ�1��I����V�p*����x��X���uL,�˿��dV���De��1�d����+�z����֯:�$�w,kbe��8���,��B)^u��%{����Q�,I��i}��4�L4Y��h���'{r���<�~W��#�(K�nzLD���X�������J�~�(�:�l�9&���%�M�rW��W��PV�OT��˖`��:V�5��/��W�b�ʞ\1��y��2�$폆���U��D���O�IY�>qe�S��V�b�ʞ\bXfPa�ʂ�$�v�Z/��%��ɥֹlj*&�lpq����'��	�,{`����*�$�-�]�����Y�䲦ZȕD�E�_��������?�F��5`�Q�-�� v��o0�eO�ѹn�,&��sl:P�f�`"�T����Y�F=�e&�l`��:鋩�˸��إ��y�    '�~�!qe,��z�ψ�+�1�;vX޳6ꩉ,{r|�uV�����ӱW�b��V���`%1ߣ���_d�sUi�1&I��E5�F�b��"|n���8����[��b��J�b���0�����Ė=���ω.�\���n���eb�X��L_�\[6�ĹȮ����Kb˞Xÿ�eWA�-�7Tl���Qab�\�/�PȕD=��I����q�9&����������J�����zP-([&���ܠ�ʛ��E��H���1fO�!bUӱ1�e�u3�7���b���$��Ѫ&b�˞T�{V�F_�ͭbZ6�	_���A����0�\ܶ-K��"c"�XڕG�����HGǨn�2&���Ŧ��+Iz� m�fX�2a��FRv������nmچ<�a/;�$����"��>������M^���1����Cz]�`Q�����cT��ߒc�s�:%Ƭsa��}<���1����{��A�0�X��m�T7��c���������\I؏�2\u��)fO,�M�n(1fq��)��*�}�<H�2{r��u��J�Y犋Y�[��z��c�Ē�ø�*	�}O*B׺a���'�t���E�1��p�(/V��:�$�w,���[@����'�!i]͒aֹ�6�V�яa��R%xs-��+I�}!�����U���h��y��2�$�����{٤sJ�ك�NW�R�s��t��>1fO,i�3�Va%Yo���S��g�)&i��#�5��G�2�\�4���W�)1f,���`�YO�BR���:%Ƭc�R%e���8%��A���)���c��ݭ�l3Z�#N�,{r�Â+��w.V�fkU�\)qeO,��U� k�y�����Uv�1�9O�n����E��2�9�)z�����X�c�W���0�UM3�ĕ�}o:��	��Ȳ�h�eM��Ȳ1i�T�g߯�'��� �Œ�UXI��ہ�AY�%%���%�^��\ƕ�=�``�pKJl�࢘*>z�0PJl���F*��m|�!�e��koUß(�e	��޿��θ�[ֹz\�*��b}"˞X��
*�J�~���hԕ�Y����\��H�-�\ě�U��S"˞X�C�.�J��b�Y�����-\=�[�[@*���������I�_>�ė=��[�K��:�&�F{^���a��`��ʩ�1K�TW�.����a���_Fe��D�,�0�ߔM)�Ę%އ�[W�ja�Ę=�:ؽ�� +�z��ֻ��}���'�v�\�/�\�a�K�IJ�ٓkt���eb��ml?�6|�&!f,��%XI�K���X���2fO���|lJ�Y�B��@�nf����'�����΍UXI�K<I������ė�}u,�J�/K#*���}7y}�!�eO,Cz�rcV�#����@�hKJtك+f,Y�%N�/�\h���T������z���@�.�X���3�l[%�,i��6�^�Y��'�'��Q%A��vf�ߏ�-]6��_��e�l(%��s�l��w}�*���'���W�����~�hV���]����9Q�q%Io1I_P�EH,�J����7�������/�g�2A"�eO,�~�`%Yoq�C�nY'����Qoe�-9�e���_���s�f�1r�˞X�C�lf'�,�x�1S|a+-;�9�+�Q��U�2�9�����UC�8�e,O[|��e���Eq���ʼ���Z`u���(������{�ׯ781f���RXO�D�=�<$���eXs�s��G{Q*Yu�I�T�zY��a���}kЈ�.91fO.�= u\I�ç�X��۳3����?��:U��Ę�X���Ŭ�e������XS�6ˉ1�\8BiyJ��+I���Z���*�����/P�C�	N�����*��a�1�\ p�:qN�ٓK��}˸���x��V5p"̞Xچ=�뫰���x���(#ɉ1{rI/fe��J�Y�"݀�f��np�̞T��8��H��J���D@�7X�1I��+&e��I��+�z����(���np��X��)���Jr�G���&�����,�^ƕ$=E�^oa��9fO,��ݖ��a�9�J���g?�:�ė=�4:�븒���.^�/�;��0{p�ZV�Gpb��m����O�� ���h������(�'W�M���&�,˧A�G�V��c��"�2q�cֱ@<U��+��11fO,�)��Ęu��(&���r�SL��+v*��f�UXI�K<IPѲnKN�ٓ�����+I��T�;Ͼ����5i/f���Jr~��Л�^�5�r"̞\4�?��/�J�~�m16Zv���'���貎��W�Tω.{pi\�u�r�˲�k�^I��J}b˞T�{�U�'��cA���m��Ė=�d��B�2�$�5��w�V�S�[���6��F?q"�:�p��EA|�!&������V��ˉ,�������s)�&��ɥ*ה�
�$�-v���hمK"�X�ٽ� +�z�~2 -S�9qe��e�!W�$���'A��Q���Bh��M��c�9�/�����&]v�<ךV�<���&P5��']v�"چ�{TVA-u�e/.���
���޹zSm�ً���s�9�.�Zo\(nL����q#���ʩ�0{sYu;�x2fw.��;�ݼ�/�O��E	�fR�d��X[g��\�\u��1{sُS��J�b���a��׸���?�X��6&cv��'�-z��ɘ���u�\I��3p��ő�*��1�s�І�Uk�y2f/,����2�$�1.]�mV���R&c���1�l��L����/B�aT�"�$�^Tc�<_Q��J��1b���L����w���T�lٝ���<���:�$�,C�*9B&[ֱh���BZVN�I���<P��P�e\I���#b@�Z�TًJ;�1�
+Iy
�s\�VUSeReo.c�e+�d�ew.t1~ޡ����?�X�ʍ�I��=.QT���u�T�\��?���L��΅m�.}��Zu�I��X���|S���c����e��L����?f�Tp%Y/�Xߙo����A�\ك+��@�!�+{a��eV���Ì���R&W��R�ϯ�˸���0��?0,�#d�e/.�[{�qW����FYuP&[6�HDu�����A&Y��2O���O2ٲ;V�C@+3�e�eo�a�e]�2�;�F�FU�^&Y��bzq��
+��S�����l�e��D���y5ʺ-e�ec�˧�McewUE\&[��2h�uXI�kTJ���
���.{qy\A{~�_ƕD��>xT�\��Y&]��"��4��$�5���?��s?ܲSL�~��xG+S�e�e�;��j�Q&c���X��������'U��2�/���J�ޢ���9���z���^`�@
��d��`�}�j{�L��% V�m�$�F�F4�{�ޏ��ɖ����˞�͖q�Y�\��ņV��Y&[��R�煖���w,ǒ���l9�7�Ǉ��Zʤ�:W�{ٮ$/6G�:�9�, ��|��k�ew�����X7pS&]��b@��P�tٝu?�k����-{a�FZ6bI&]v�"�E�V66U&_�� y��+�������WP�tً�)[!V��;��sD~	Zv�I�\����+�VqM���E�3uT�-'a���'-P*�0{p�&��U6�I&_���+T���Ǹ	���EkвSL���p��.&_����_��%�XI�c<H(ie.fO.?��2�$�1ꖤ��Z5�H[��b��+Iz�m,����jjb�:�f`����Y�Ē�˰���h�0ƺe�Ȳ'��ZXNMlYc�bE0<w#�:�$�,?�~�D��}g����]�1Iz���c8MY�9qe,����R}��n��ڵl�$���Ž_��*���ߧ��ѭ��7�D�=�`��XǕd��j�Ǯ:!qe,�v��,�J�^��ݿZ��a�)&Y�s� �B�$�%��aб�a$�쁥�z��������7T��8Y��?V�Up%Y?bHI7j��y`�1&Q�c�p����ز�������/�Ėu,���ģ��~$���5�1lXIҏ�����x���~up$�l�(Ù�-��	8#�e���l    ��Ht��bz&,+Ė=�	�T�ز�Ÿ+�esyFb�X�$R���F�:@.��-ۏA��?�/f�-K�~�})\�af$�l�y���w�U߯$�-�����TU��.�X���v�ˇ��'�%B���B�E���+oW��!T�!�D�u,�[Y�E��׻F��\}�{�_��΅���۾�zQ|$��e(ҫ�)�D�u,�MG��U���Ȳ��q�o
�[z��S�YՄ��ز'���UXI���x��\�_�,�\�6�� ��Gb�X��ݺQ��$}��t�V�b�Ė=�x�[I+�����٭��P��o"�T��˺�G"�X:��Z�D�=��H��+I�}8)�u�E�ĕ=����eXI�C����%���3U������l`%9����X�]f$��cA���uh]�>QeO.��/��U\I����!��U�W��2h����*�D�u.�MZ�Ly�)&��IE�B]��=�Dx�6
wb�D�=���Q	��=��g����~�U����E�Q�~�������ACx��/;�$�,�Fe�G��Z�(����"���'A����#Qe+�gu��HTك���r$��c�>��Y���������3S6�x�!�u+�Gb�\�Z���1�T�CY��HLك {��ȑ������t�=�� 1eO,B�1F#e+z���݌D�=��<��J�^B�Ue����#�d,���Ub�H4Y�p�\Ye0�dO.���+I��@�	�s��cL���"Բ;�D�u,l��!��FA)5�dO.%���&��c�n�$Hu}��&{b��eX`%A?b����b�k�L<ٓ�G'vV���yݿ\PV�O,�K���+�y��<i
/���b��ħ:�$����¨~7��ǘ��% �ec�G������k�9&�����&+���?G�+,Z&�,�3f���l��HL��2�{�^f�$�쉥�C���Ľ�� �o6,;�9��!�WmB�({b���x�
kN{��g	�C,k��ē=���?5�dٟSmp��bM4�K�ƻ
k�y��6.��jbɞXb`�}�˸��7��]��L�U�8���e���R�UXI���>�:c���&{p	6��3y�q%A�?Sf�Um,�Ē=���m�XI��(�@t��R�&����\��"��+I�����L��J�&���p�e,�J�~�2��3�N1I��Kͤlۺ&�,�RI:>7�/�J�b��@ ���%{`��3���EX�%���i��jbɞ\�ܞg�,�J�c[W��Q�JYK���L�U[4�d�$I�T-�c���D�
qM<Yc�I ҫ� h�ɞXq�_5�HO���&�?���b�Wtn�9��x�΅mk�%Q6�HQ���ܡL&�Ĕu.jv�����TMLٓk�[�q%yϟ���6���Ś��'�=�� +�z�&�����$�����,�ߢr]�71e�%&H@�`ML�ː��.64ekl2�1�lC�&���5���7P��$�>`�mzM\ٓ�<Q�
��,�\����Zv��Ȳ'��m*`%Q/q�m�5�j"�\���˰���}�����|�r#QeO,���	Y���8��F���	�����uŲ�YMTYǊ�7���ªCLr��b��D��&�X�5x�+-;�$��q[��U�߿CH<�ˢ�U��ļ�� hwUA15�dO�a TǕ�F+J�ٵ�Q��25�R64�d��o��n�&��	f����D�u.��pպMT�ˣ~T�������� e[�5Qeq{
��pMTٓ���l��&��sa߰u���O���'�\��7hV��:��s�~ MdٓK�^��\s�SA<޼&���?���;x+��w.� �2�_]��bE���˸�w�c�p�B�˞Xa�Vͣ�D�u,��R��m��D�=���n��&�,���X�����;�D�=�F�*9B]ֱ ��:b��"MtY�"ޚ�(����.{`���B��:�ض/�ᖝb�;�h|�\I��"��D�ʊω.{`����2="�e�������eW�b�˞\Jw3oW�-���Ȳ'��c+�J�b��	�������+X��HT�eCW�0Z����
+��-{�y؏���lX����pH{1�|�A&i��,� :�jq�/{r	+Pj�0�\��B�Q5��a�(6�����AK�����u*3�-�e�
c��`�Za�/{b��^5b�]ֱ<Q�A��>h�/K�i���)*�Zb˞P�B�Y���<�{(ϽLŶD�u.��a-�^�D�=�D{{1�|W�;��k��Iϖ���Emk��;cW����T�V֤g�/{b��
`W��I������ڳ%���?AZ��d�D�3��e�%��E/ƀ.�J�^b�X�m@�~Kt���J밒�� a��ؖز�u������D�u�nae���'ֈ�JeXIЏ�/ÿ\emz�����y�-�e��aSO.{ޯ����߱�AQ�͛UTI�k���7���y�!&��s�l%U^KL�q��3�*�$�5��̈�ZZ"�lq�	eC--e��-48��QF��1I���W���D�%���hXWLLٓ�?�^��S��Ѥ~��5�D�=�"�ˌgK\Y�B�L%��w�E_�D�=��O�XI�[��ۈ�`Yu01e�K����4��k�zn�$(��
��){b��}ؖ�����7���Yb�:W�,��ӪJ��){b��� kNz�b��D��E�U��Bhe�-qe�ǅ,!y���Y����\x�ز�����O�sL���2��5A���E1�rܺ��k�.{bu�^5C�]ֱb��=	��j��'�����e\I��چ�h<��,:�D�=��*Vu�[��Vܮ�;#
���-���R�ލ�Y���'XO�B�$�!l���σ�V}���ߩԿ�T���]�1�E:�������c������]V}\I�X�F�j��Ėu,��F�\l�.{r���\I��^"��.yߵ�[���w٪����N�es�^��U6�v�Y�gKTY�Bښ'����c�){`udĲK�Ĕu,�M��+[&����/f�b��2�$����F�����W�U��b�Q��Uֱ:�+PT��ʖ�+{r)t�kM\Y�[@=S�U�ѷĕ=� �?o�]��$=GS�?ϛ�u�&��ɥ���u\I�S@��
�e\I��\�ume�-�e��<%�y>ܢ�}"�X�i�a%Y/�V�B`e�-qe.j�T6��Wֹ��L�ˆ�["˞\�<
�����߀��Y����?_�.�J�~DAԟl�f�X��X8F��bKTY�B��i������O"%�QJ�$��״mw�Z=����2Vr%���#�2w|��;�$�w���Ǖ`I��t��v�x|�h�\I�\�V6O?d��k�}	�)������Y�VZ��Ŭe�q�Q���Bo�<{p�96x��-�J2�b3�Ё���� {����C����`I��`�G��KR�b�E�(���\I�\"�U�0��s�㧵�j�q����9�.�_oc���\?g��%
R%s8�ϑ�sA\��x޳��'�����=ʺC������o�֥j�s���������߹xlh�Y����s�_`��U�(�9���]2�i���p�$�w.��j�s%��Ch�N w�$�{&�ܭ��\I��\�#�j�}o�N�sE��7�+:X��X�_�`I�C�9��e��������_Ls\��>D�=Zo�b����Lb'#�ʺ9�N��11tH��$�`���>���J���1�n�+	~�nw1l\����ɮ���3ua�n�k0��?1���O���c�qՌ!�Jr��bf�V�`I�S���P˦�8W��;a<��q%�Oъ�_�n�3��d���gE/S�,	}�J�2�ZH�\I�\�l�[|VqM���E�����<�`I����Y^���>�$��A\��D>GY��D�[�םc�;3�'�v#���0̗�d��;�@4��L�\I�s��7���J�$�^`��M[�d�>�t �(,�M��&q���5?�K��������+�|��>��U��<M��F��b%�:�$�%�@�!�jC�s%�p    �ۆ�q%�?���cw����'���Af~���~�x���m����:W�U+z��۝u���l%��%��� }�]�����x�je�~,���<^�lڏ�%������*k���{��ݒd	X��5D�됖�c���ٝa\I�kt�w�YXٜ$�̳�Z�Y6i�f���֠l5�s%�p�u�E�\I�[�WB����I���7���S��q%�p�˞)K"�K%�hʊ���{s�Q]����?��H���V�;؜��o ]@��Z�#���{՘��&w���	wCE=l�qw0�M���E�-����?�b�H]w����\l���L_v�9�O0�(σ�ׁ͑�����C��a�Nr�|�r�l���%����$2
+�����q۸�=��<I�7�{�������\�P�o�VX@쓒{�)���J�$��^?#4��!�\I�\�͞W�/�Jbb�5��+ �������I*U�>I�XT����D�')׹0Jԃd�Q�$��`��*�����f��܋�����U`����qߨI���ꓔ{s���:��$�:E}D��`�e���΅-�&븒Чh
�vQ
�;}Rrw.��Օ{b�X�D�y�2�$�)l#�����sL_a�U����/��D�=�hب���>�+.w��wzb���K��eS�>�$�.wI��+�{���>�I]sXO�����N=1r�>dPcH]�SO����;=Qr�K�F�F�Hs�J"���XȕD�D�FC}�K.;���=ȸ�(��$R���s�h�eמ8�7C+�JbDO����"�u�����e�w,����vU��:k�I&�pq�#��q%�?b2�r���'>�	���K��q%�?b)u2-����k�Fd��\W�Kt����*����w�+����[��2�[>*����h�R�R⺃L2�b�g����'��#ǋn�e`I�[,	6}�%�;�$�0��u�iO�ܾ���X��`�\�����ܷ���}������{r����5+��Ʌ�_5�h]VO�\���鞾SP�N�܃��ĺ�yb�:�f��X������?�Y�̵�(�Fa��YE����=���6���۞������z�Y%���=�����u`s�;X�-b�����d���`�����΅mCG~a��;�$��U��r�
����{r�2ɲf������c$P��~�I�`��Ÿ�u`I��>�����=�qO.���˨�ćXg��z��2]"�`�֞�ׁ%��%�RP�L�ȸ�X;S�d>�� �Au����=�l�=O�^ƕd>�W�Fu�$z��`c�v�%:��ś�=8����ظ'�bZ�r�ظ����ڠ�٥=�q��|��jTX�Olܓ�����J2�����z���ȸ΅����t0,��������r݌�����m3ځ��=�qO�aPY�L�\�Wh���Ͻ�N2rO��j(��7�l���N�쉐{����uXI��e���*�O':��%�����2�$�9z���_�O�2���?0~��^�d�> џuxTv &>��A;ȗ�������e}Ht\� �u�$$6�	&�gQW��D�u0a�/U�!�qO.���B�$�GTU�U|�>��{p ���!1q���[���u��$�G�v7{�`������-���@���\�o����؝eX��:⦍F�PeHL�k�Vȕ�F;0jyN�u�$�ŨȮҠl�$&�����j�����e[�iu�t����cc��

$2�& ���Kׁ%�o�7��5*C"�\��s�*�D��U` ��AX�ظ'��@]g$:��u�]�&C��`�\�f�2�9�,v�w0�[{	���`����XVքD�=�D�b��kN}�1�V�?�N҇D�=�HT^�Q�#���ɠm
f\VڄD�=�D�Ev\I���_F �+�$>.��{{��.���{pA,l/+lB��"�۷�m�4;Ab��ޅţ!����=����Cb��m,VXwJl\c���du=E�����K|\��[����U_�D�=�bb�r%��{�a\߰�O��`�P�珬KB������x��Yv�I�\��O\I��y\�?�*O����:5��\�Y��%��s�����J2�����[>*
b��{�At1�햄��u�XI8��l�$.��EqsS��D>�ͣ�H�<Qy�1&��sY=������4Cb{�:-;�$����븒��t��&�Ϻ*]��`ׂ��$��&,�E��Ӫ�Ld�++ԉ��\�6hR�pB"��>�O� ���(�qO�A��%!�q���(Ũn�$.��Q/�e\I�KT��٫n�?$2�	f�MyzX��oF}�u]}:qq.��TQ��G4�2]Ӌ+�t��{�u�7S�d���A�E/
��N2�����
���1�Zm�}��2	�̐��)%`I�k,$l����~b�\���Լe\I�khF�:
�������;$V}`��{pq��
�����U�#�k�@EY3�q0�
W�Bb�}ZEQ�-��N2	��K�����q%�o��Ԇ��{��d��6.���� r��
bb�:��M�^5$2����b�*�Dƥ���V��Ab�:X�ͿUZ6���B̇:�9�e3P+��%:�I�]z��	���dd�?r�+�'>���o �յ�':.���,�'Yhq&6�	�M�lN}�Œ[��nL���Z��L�\C�пcW婠����{���Qa�#����׍����e��M�̭n�
&J�	ƤP	6�~�������0qr.�l/v�,�c߹���w�Z�'9Ǿ���Qk�����(��������X�5��sE�-�{�kAU)����͡��z*��4z[v�I�\��ˮ0�r���69���H�'�`V��)���_tA^\�,;�$����ںQ�bL�\�}��P���.�>���=���w���|W������6蹉z�A&J�	FlWsd	X��͑1����11rO.3���2�$�w.�v7}T�11rO0
���L�\�hx".\����X��ae[0qq���M���׹�mM�^m_P��D�=�z�.u[]0�q,�D�����>N2.}Z��5[W.\s���{�.�l�����0Ƈ�{���K�8��W�[�TW����ݹb8�XW�|\�1���i�ŭѲO��ؿ� ���q�qw�h����6	�;�>��ו'!��R?I.ۓ����sEkd������4�����L7	��Dq}5b�I&��s�K�bY�9N>���Mǋ��2I}�.�&����u`I��`��:y'#� ���q�ض��+6	�7׀��2�$�1Z��r��fR���L�O���''w���B����qRr/.h�e}�8)�;W�l6Һ)�8)��?Qֹ�8)�;X,[R�VW9��܋k ��qMB�s�޲���<�v�ANF���׵w���^\�����\I�StF*�ʅ 8��7Xs0-K2��u�eȋ����L2�&��+�|�;��!�r�%NF�M���7��Ȓ��(!�*��k�Ug99�W�
uU�Iɽ����[v���	CL�c�=�������`�`I�K��"�'��-�89���p��Jb_>�7R�/��2���A�y��:�$�%׫`�Tq���,V8����8I�1�.�,��궻�$��\��k�@	X��#&b!�ׂ�����\b��Mrrw.��@���[LB�f����ݹhlc�W�ʊ���{qi3�B�$�Ǉc�Ie�ߤ�F%�� ��b��D=)�7W4�֕�'#��ڇu*, NN�ƴ���|�-Z��%��syP��%+���߹,���M�IȽ���v NF���pcƺ��8)�7� ��7�u`I�[�zG��i�˾�I�\���&!w�b��i���T��h2r��[��gD��a24	�7�xէ��kN}�]8Q�ۊ�����VS�5��s���@+��B��{`Ţ1".�;���ݹ�b��>?�t�lPo��N�����=.L�߽�l�)M:���w�S�tܝ��3���Ȃ�!M:�F}�jeu`�l܋K����d�\���    �--���d�^\{]*��̇��]^��N2	������ǽ�x�'VױI��{�Igu[�hrw0�(;]E��rMB�����ѵlO(M>��5ƽ2��+	}�Q�J�Kzh�qo��:��t4	�;@���VV���ǽ��+��D��+	}ܗ�򋎏u���ƨ�=g\������^\|�:��ɽ�ĳ���O���\�ֶu�{�WA��&%�T�:W�'���[I3���J��ಘ��y��2�$�)FN�4�ʺf��d�����H���?�W��]��e�5y~�_���>Gw� ja"%F��!o����P"�\�x�
�$�9���q�n�'%Bn�O#?G�^7�!7�l�Jԉ�{riWx~YƕD�Dk7��Eu��(r��q��z�)�qO�ڞ��/�J"�;g��Q��`�!���P���c�WS���N2�qO.����Ū��΅ѩ��o��d��c�eS����I��{�	А��y"�:X�w��|���(��?�b�D݀:J�ܮ�UԔ@��-;�$�w�X�,u%���.����#��G���ׁ%��1����j�((�&J��%/�u\I��\��/���;�$�0���bX����LͰP0�D�u2�h����c��}ǒ�?��P�;��+I}��`h����>���=�� ��ͱ��p�6 �F�Pb�\4X�m�e\s�;�?�}q1�� ��?�,�(��%F.�ct���EA-81rO.�B�9󝋻���:#�#�S�VX�L�\����]ӂ�ԉ�{p!|1@lW��}���/d�e��F1��T��dS"�\z]�<r�KÑ\ظ�����s�J��ЇO[�vO�)�R'F���
�$�w.�f��Hb�A&��������D�=� �*+u���`�6�6ZټsJ�ܓ�:p�jUJ�\���`HR���'�����M�E7ʲO,I��zu��)qr��ٿ�P��'����+�)qr!�gm����^��$��߹{�+�s��B4���$���y�8�'�9[aq�+��p�LG�$vN����Y��+�}��Nqc~�
������y���׃�����X�'ZY��+7��C��`�2	�L��o�ց%���`�]���9�r�K����?�}`��{��V�d��Jc��ǉ��`�o�I����W�9�rO.C����e\I�K4���5N���$��&Ɖ��`D֠l'''Z��eu5jN�\���:��WN��̤A%X��#Juf���!$�H�'�~��J�{����ٲ���?���Cnց%�?�����j�8�'����l�����SB~��\�2I�}m�`Ѳ>jN����]�/�J�\��]0�Q׷Ɖ�{�a�Sr9Qr��Z�G]7'J��Gy�-KB��"|Ӫ��,��?����r� 'V.X���W��Z�:�$�-F�K�=e�sN�ܓK�=���+	~��`l ��I�� +[l�iQ�{޾��K�ܓˬ�U�+ױ�\Ͱ��X���2�M����u0�C�/[}ɉ�{r��+=��-�#߹7�wo��q���{�����h�أ~�o���c^v�s�l�u|Q^ŕX�����,,�k&V���?��$���xC��1��B�h��G���(�X��ű?��yE1�rO�xn}n�^��>ĐYm�G�RNN�ܓ��1���'7�B��睺DN��L���;�D��}n$Ψ���=����r	X��+���Z�UP�O������a2�(��q��[�ˉ��`�������yb�\���/rW����0�fnź�L"� #T|��pY���+��s��sN�ܓ��.�+��̧}�E'J]U31rO�&o�%�KR?�ߟ*���n�9'J�6Y�N�\��b��8u���0�J�P7׏)9��z�{D|A�<qrO.ϊQ��(���{쳣�9��8��1�Id�����=��0�<�D�u.j��ׯdE]3QrO.򇡺� �8���l�3i�u���u���
���!QrO�ѩl�'F�c���ϱՉ����E�Q���(��'i+��O|\��MI
�N��{��P����-����
���{r�*=�_ƕ$�ؗƣa�(̉�`�?E:
�����\�zο�k�� ��?���֗r"��,,?�VT�� ����`�踸���gVU�D�=��?0*$#���\�ڍ��-$�q�>�m����\���^��S7���D��U%�ql�ޕ���Ib�`��y�D�u.���;*�_����=�F�Y�e\����8?�fX��Z&�3��?�����b5[��/�d��X���
�m��#�c�Yc���vqU$Ť��`ֆ�-ӖI���b��转{Z&����"�|�˸~N��c�6�������`<������9f�FW)��(��{s!�K/+��ćX93bU]��L.��rZ7B&w����-���ǲ�L2犙y\V���ݹ0\\�V7�S&�#D�J�$�!����$-<"��{s1�9�U\���1�߼�W��bF&�3��h(KRc��`�~��,I�L���[�KB��b.��I��s�!�RaA_&�c4]�����~`�Dܛ+�%�F��$��\ [�C
��e2qw0�M��֕['���p�L�Ŵ	���}� '�&3�EO�:�$��!�͹�l�L*��ջu+�S�I�ݹ w��׭������6�C�ŗ�'������_Kb�cP��PX��d���� �����C�l(ւ'����X�P��R&w��߷gTQ��\܋�����9��;���ھL.�Fڈ�ڔeRq/.��N��˸��?�ڽ$���3��7�)�h�[�d�8����SP��\܋˟�F]��L.��E��6σR����^`���,	���u�6Z�jI�lܛk���e\I�k<�`纆`�l�lSy��k��d���↦��e�qo�֯���$�-�5cE	��ѐIŽ��a���ˤ��\=�Ҹ4�+�M*�6Z\��%�o���E
e3�e2qo.��b)�2�$�-z�P��Ƭu'�d�NF���+[�'�c�Zo[�C���`s�`�����}���?���f�d��9cp4 *��M*���n�L.��q��#xRqo,!he�4d2q9晵��t��TT�&����/�3?f2��)��-���Ž�z�z��nX�=�+<�nq��~8ٸ7��GaCݤ��9d0Z�l�L6����*X�?ɸ#��Jt��q2ٸ;�f��u�ݓ�{sY�+u\I�Cx3(wY��J7ɸEC]�8R�l�,V���<�|/;�$����뚻'�c�Y����3e��1ɸ;6ЏŒe��1ٸ��Kf���1ٸ��B]�|L2��%�V�
�$��I~���g����?���u۽�$�r�Y�͸:l<?T,;�$�w.�(
�q%�K�6S#*��3&� SQ���H|�~86%<,k���{r�="�+�|�KI�:{y$6���m�0�,I�}� ��5\��%��ظ'��2����������%a�k���{��j�`���1a��A�/�:-;�$�.O�Q6zd$2�sq�˞uK�Fb�`�yq]W�Htܘ|�[l�e��#�qO.5�+�D�u.}��U��#�qO0f��2�Ht\�^�~�,��D�=��@�"Gb�\b��Nj��{�1�����G�v7����ˎ2�qO�(�Չ�#�q��&ݠlf�Ht܃��X�]Ǖ���ic��`QQ�L|�L;>���Kb��^�k]�2����Vf5���E��e���QQNtܓk�X�W���ǼȆ�uw #rO�(W<?�/�J"_�Gߟ��
Kԉ��"��y���,���k�RW�#͆sIe%8�q2�d��,I}�~:5ֺ	7#�q.C"(�Fb�:���q<>�-;���=��Se�:�q�������m��{�u�{u	�����X�-H��\���֍e\s�;�m�h�%���=��l� c���~�.�I|܃K��n2�Ht\�1~��_r�����u�n[,E�2�a$>��ez�O��J2��SE�Jג��f��`�/�5���u0�M���y#�qO.ϰ��-    �J2bq��9R�3�G"�`����S�:�$�a���*VX�O���ҋ����%���7���f��`D�φ�:�$�!�������yb�FK]G�+\+J���{��J�$�q_���I�#1r0OW��n�D��X����+��'>.Q��!jJ�
�H�ܓl�Y%Y"�Yl�l֞��Ug�8�'c�T��(�΅�|w{qg�� ��?��Q�g�,��X!�d�YL\v�I��X�PF�EH��:���?=�'�8��a�FT�%���8�:�$�c�����]%�21rO0�{>D	X���6#P6~$J�ɥؠl��H�\��㒹p%�H�\ڧv�Q7h$J�ɥP��s$Fn`E�7=�׺SL�R���L�������AQg0���=���m���=�D��f�E�|M�܃k4�^6�H!������\�E'M���^HP�����P�DZ/�����{p�ƽ��5hb�:�͉�fFj��`��`I�k�[����fi��`Q��[?����`=���p��&F�����Z��$�5
�Fch�L M������(�� ��+	}�~x��s���$��?�H��udI��1�nȋ޵eg����E�����JR�b�� y^�����������,�r,:�(�תʹ&V���T�y'�2�$�-���Q�|tM��L��c�K�����籰a����D�=�`��%��5}M�\�"��(����B�&V�	�*/.gցͱ`c1�禺e'9���5�?�=�ի�)�{!�fV�G'����^(��~W��Xm{����o�$_`����Or�rw��g,�약�LR��e[C��w}|����߹�7@��J��?��6��aY'+��$d�}����e'�s��\��¥�I�ݹb�mg���:Y�7��:i�;�fa��w��ʽ����Ͻ˸�̗�#��]��+�&-�c;*�JB�%W�?O,Zv�I�\���+���!w���f�2��{/�A�y$�2��ɽ���������\k�I�:)�7{䗍����u.��k2�ѱ�B=9�وG�ʪ�d��d�nd&P�7N')��b��[����F���5,,�OR��Q!ut�rw0�t����b:9��eq��p������ݹb-��/X��,���,��B�$�-.��ig���Xv�I�\�4���q%�o���ֹ�aRr/0�d��ٷ:)���-��~�x�;MF��%mh]�$��\=zI�P�$��`1��y �:�9��>����(lw�����na(�S��l�1\Xo��ܛ�z������u�L� ��A�:���4���s�����m�*�����#��.�e\I���2"����I�ݹ������3L.�E��{��J�}m�ۋE���1	�̃�Ũ�u`I�CPC^t�,;�$�w.m /��q%��UU!�PO2�F�կ�/�����1m �uX��{aaC��Uv:��΅��[aꕵ�Iƽȸ!�R�$�1�uc\u�q/.]�Q&��d��\H[�V7B'���|��Y���>��	�
����{q�F&eS\ur.�Y_4Ȭ;�$�w0�&�g�a�MB��}�&peEA��&#���\��>EXH�_�}�m2ro.bⲵ�6	���qe�ۀ��d����^<��KR�㭭��R&��d�^\~��l-�M>���Z8�&���&�b��2�I���(z����<�U9�7��2u�&w�����|XPm�I�u�H���&H^L�[��%��9�V�%�/� �[�a/���d��`��
��З��S��N�e'�������u\I�Kx�Q���{�AN:�����#)R6,�&���W6*��m�q������k��{���%������;\;٫��Ȓ�?�zg*\Qe��{���� ϯ�˾�I�\bJe46���z�8?<΂R�MB���j�;�l2r0=���ol2ro.ɥB�$�5��oX�d^w�I��`�᪞�p%�oQ�죿y�]v�I��\�O���/�J"��%���u����=�F���K��зX�!ɞ��,;�$�.y��|W��:�:@��)`��{�h��Dǅ;�����������#߹:o1FF�iX��`�аn��%>.�-��y�h[v�s�\�e+�,�q����������=���*��Jd\�1BG4�Օ7�x����j���\1��nL�%6�sQ�d�[Ne��{p����J��ok��f�Ҳ�L� CR�`I�C��ƕu���u0�5c���'Yb�X։�׹b���r��i�A&2�I�g�_�O�ȒԇXT����!�q.�RX�H���,^���ښ��'��ta�5�ql<ڋʲ�LR���� V6��׹��"���u��>}n=�^�	��'��gOxW�[U���_3�qO0�1��`I��>� ka5,�qO0�QX>L|� �MP�ʆ�Z��\c���*�����D�M���u0il�����KB���Fu����X�b��M����=��!L*��̏�����s�߲�L"���W��O��J����@u�5-�qA��Q	.�O':�%M��W��+	|���.�n��%6�	fv�K��ė�2F�/{٘"K|܃�?�fec�,�q�Kb�&�gw`�A&2.�]����f�Ҳ,���K����e\I�;�O�Ԫ-�qO2i��dY�c�) b�<FfX��# `+��c��{rio�<�sW������sx�9��'.��ǰ��5���?LR��R��y��2�$����C��n,��%��I-��`I�[Tú�J��:�s%�p	B�R6�J"ߎM�\V�s�$�w0 yn�^�d�}pl�o�-;�$�w,l/rW"�:��fe���%�����T�J�`s�c�"�)i�tǚ#?�����z�4 �?���q��#�_�s�9�qo�C$U�V���"�{�_���%���ކ����́���[�T;����BW������h��L��tQ�J������>xJ"�2��d�
�$��q�0���et�$�0��eM~N��~�#�v/#�z�܁��?��_ت8P�����oE"e�0GJb>@� ?ʪ
�%�p�6�2���u�X;.
e+p�+���˚��9븒̇����������� ����2�$�1l1��l_W�LL�l�_d��CKRcȠ������'����%�P5�ƹ�����})S�,	}�!������@���'W,���X�\I�Sl����	�����=����²f��:�Y��6ҊrX��`b`�`I�S�s��˾�I�\j�����lV'�:X��;X�z^*��+	}����F�Օ���ޮn�
�$�ٟ]=�G:W���!�wo ����\I�\�c6WW���׹�oѳ��� ��?��D
�����o6�\��d�;�"��2��d\ض>����� �����{�m��;���o���c�e,�+��N����	7�U�[������U���?N+�!e+{�20�_q���o��3q²�V�.;��\{C�t�*��l�%0�/~a���T�1��Fi|��9��q�9�K6 �Q5¹��?�����w.n1�L�To�#?�lc��ɺ����`����Xs��kQt",�1s�`�Q��t�q͉\���z�,;�$�9D��A_�Xƕ�=b�s��&q�q{٠z�J�~�N�b`�2�$�c��&He!,��l�=����J�>�P�ah��Ⱥ� ��߹4f�U͂w�$�%�{ao�&�?���� Y�z�5	����sˑ$ױ�� �!J1��]R2��L�s�B�>�U��.��f9��*1q�|��l���8v�D�ͫ"k&����>�"r��&�5Ź@��l;��+m ���ȟ`��Y"���}Q�����Nd������� �?�Ȭsڤ�p������E��>��,�h�ԟ�C�-��5ܜj���lԒ5<ƹ@��E�[M���` �'X��yޥL- ��O����Yn��Mݵ��_\�a��B�c�R��&��@�X��c�e��E2��K���%�k})�:�䛭��r}��^���ŦZ�Կ��    S�B�8�Ǿ���7V�UԺǾ���9��W��>�=�o.)�0��=����>)-o������ِ�3u
؞��t�^)�ʻ�=���dˬ)��Br�R}|�A�/0�3�-�@�S4��Xx�B�������ӿ_r�2qIa}��c\ �i��I�iK��T���z��8�0���z����C�2q�*_̵9�BZ���J��T��Qx~�icG*��_X=nҸD>�P�'��t�P�"���9H[��` �y^�u�/���Nd������h=�"���Yc����{���|�zXw��Wqe�����H��\ �e6uk���N���(_aӴ���T�������U@�O.���5d����k�=oԭ������'�_΁��_`]zb{k���&�3�>���w�����f�>��H}�6�A�l�(�	���S�UK���+QH�&�'�T�+ǣ�[ڻ�{�(��k��Ŕ�s` ����ԍ5M�
br5ɥ4��*H�������s	R�bCb!k�fT�o�f��YZuU���6͘&N9�
R�5���p�
Rߢ��wzM%^����b(���QW`��z�v��
"Pq���3�~��|�ׯ\��{sE�@��m��?Fy��d~��z�y�*pqؠ�9N�7���ޅ��@�]\qi��F�T��ʈi���(�"dܛl�:�XLu���� �cCZ�y:��4��^�c\ �G<WP�ǊĒr,�R�W�ҦvW��..��_�?Ƶ�������_e<w�{�/0��������FvY��K��#wau=����+pFy��l��ָh��Z���5���X'M+#��R��H�q^��\mq�MI�@ɽ�F�X�J���\mp�f�䱣�?���Kb�9�r�P���<�*�ro0�1��w�s` ��D��=?G�:��X��RK��V��U�%m0JR�s1]�������A��_`Əڐr?����G��Z⁕���H�B �\�1�#���ꀔ����b��)0V��U���_��;t��ܛK�t�dp�����oT��H�&���㳚������ť��\ �y��q��m�2�����ρ�З�9�YIk=' ��\C�g�`�|�F�P�K��ON�f��E�s\ ��Gc`���6N���{s�V��a8�"r�Z�SPrX�l)�` ���H�o�g4cB����{��QR^	���`���y�M�! ��\�J��'׹���F%ox'W�O�w�j"�F�>0���\ڤ�/�8�B��SE��~1���A��_`ډ3�@��j����xoG9v� �'W�}�������r�u pr�Ή�8�j1�j,�K+��ro�:��`@�u����h|:�
�����#�F�k�$`�:�����y���ܛ��%�mǸ@�[t��V��������~�rS�@��h</�����c	Ba���4������������
���u0ү囫�cd��յ;����0�sd ��l\�O՟GĄ�>�rW<G�fp�������$�$��&����&�r�hΓ�[^J�ʽ���6����\�\!��T��R�rL=��ߍ��>�ro.���l�S\�����_��h=v���;�h\�B_�v�>�3��j�����;�x\�3'�ߠ�����Y���o�;X����)m&Ԃ7'����n�/�>��o�/��	����Q@ܔ��+Y��M��;���Kn��n �:�M��pYѧ�4�D~�~�5�����:Ŧ?H�y�$hSr?`~���F���N�Z�Қ}ܙ���&�~���[(m�mN��b��Y���F�����IL���Os�Q����M�}���ʾ�_O�mV���?��h��ǎr�r'؜�a��5�Ӧ�..�=*V�Ӧ�N.����L��<u�$A�O2��$�B��ʝdZ<�l�����Y���b��U�q�ܗ�<g���6+���`��}�f�N0�k��{�ة�ܴ܇K������]X�*2j͛I����u��/�Y��K-���X
ެ܇�~_sq�ĲF�:�Q�ܤ\��6����Qۤ��
9Oc�Mʝ`\�^��{���W$�⒮#m�mJ����$_�'V�6%��A%�R�)����%�-J^O����b±<�aSr'�?S����*u�����ת�͍�Mɝ`�?G�zZUSr?\����[��q��osŤU��˙s	B�I-�Xr�M�u0���Ꟙ�o>t��)�������3�@�[4�#ռ�&oJ���b5o'oN��Z�o_�*����>\ZU�.xSr׸�Y���:w� ���p��jޜ\��w�y#�ysr?\�VW1�&�>dʦ��7oZ�$�
�Bo^�f��ͯ����?Z/ei��*�7/��2�M��?b؇q�/�ܜ;H�̄��l8��Z��m�6�7-��R)��~��O<�}1���AnZ�L�,q{5o^�S�=b�y-�y���sϖ��g~-�_T��	EW޴�lh��hK�S���^�j��`�Nr��K����޴��%�2���&G��>`C��+lO�Z���?���7�f�>\j���ެ��U��[��͛���i�DU�7-w�q��A=m�?oZ�.yK|y�r�2�����s	B�b��U7J,"n^���y3o^��tU��X�` ޴�W�C�4�7)wrq�l�jy�#ysr0�V��y�r'X��2K�ě����GK����W�簑�}�&�~�j�^�Cb�cI�R[�MȦ�>\6Z�M�f�N.f�P�����A����U*�h0�ro�V���u0���ׄ*�{���Q1�k%����ZbSs^�h�7�?߷���\��zU*-q[-�k��<S����`:.�Z�F�0�ro��͘�cX �'�������ǎX���S��`���93U��[ͫ�-����&�r�c�*=�.�������.g���\j�[��Ж�:�rX�/���b�����8.H�7{;I����U����\�"�n��L�@�]X�TM� �@�u���%�(���ǈ�<,�-v�
ɳ�!��
��������s` �-����:��$H����F���q��8*;��+����]ڥ��́����Y�����u.��C����<!w��"VW�30rk�䥩R^��75�b��1.��K�;&�&�$�	��5q�'��A��7��S΁�؟`�Zy�<'���cn���bf���\]�Ҷ60pr�Y2����lɨ'w�uR��B�\�v�n;�=:v� �'ؠƒ	r�3�tJL,m+�J�l�g�bi[H�7Wo�6߉���XU�y��ϝ���{�5lO}c����MQ���\�=3[2���w.	�!5�cS����z�8X@��K5�验�	��K��ܛ�[�i�8��U�M�+�U6H�7X��v	�rL��hXI+�pro��)Mk��V\��b��sF��E(O� �Ŷ1��7�s\ ���UUJ�$@�]\~�$���Ǹ@�S4里���ǹ��OaV˨�\��/��q�z�����R�b�$E�ߋ�$��	V�3(�~<"^��K�%>����{�v"@�u�X�j�t�%���,f�er���0e&iwtܛ+��Nl\��P�yo=�|(@ǽ��Z�+�
�qIJ�B+�b`˱����LD�Z����ּ�C:��e�z^5L��Ks.��/�΁�П`��B�����&�ȗ/�wN}���{sn������ѫL�O�gQ��K-vAUV����>0��˸���:�5j���&�ǽ�Tl��:�\������v�
�qW�_I~�9�2���K5��:#��]`�����I�oQw�����q�K��V��^>�2ߢ�ڿ^�%g��.2��-q8� !��$�tY�2Z6�Me�t;%p׹����,�\ܛ�i�V-�ť#����Q�2��򜯚W2np��z��(�ƥ9��,��UQ��{��ɛ�(��0�5�Q�}W豯H��5:ռ�9�qi�Ȋ!$4�	�qo0�����H��k����N�N�    ���xhޠ6�s�S�����3t���}�?�؞�\b�F-1�/��Z���\�.������E������#b�',��u0�K����V��{��h߼�J�����Q퉮� %��1�� tl�}n�0qH��S���7X�,�`�:�p4����By�rq����2�@���<GR+<@˽ɢy-���\�X��2��ʄ ��\���oxs���'\��w��A/�粞ѭ}�%���{s�Б�y�\��ݡU����A��_`�H{��<b��l��.�i��$���%�>��3�@�;��xQM�=)���JZ�S�(Y +��?=<`@��6�r���S_1`�.�|;�nh���cе��׹��������IR��q���_eڠN�ͥ�+�8�Υ%�LR}_y|� A�/0��]u�ʕ�S8>1�������7�ҳ���H��U��b�p�:HV���]��7SĎ}`{��\+C���w.�1}���1R�6D9o�+W�8����@ʽ�F,���3?��GX�>���A�̯ӓWɫ�+�ro�!���m0��X�7�/>�cg	��E�ٚ�C��+��Iy/��O�д�-�U`�..�b��Y��}����YЖPyR ��`�31�$���u0��/QZ�Z��{s��b?v�Ew�h��@̕0��V޷I�����{c��$�D~��^�;����
���ڳ�+d>ǈx�?ȴA�
��k��!�$������"�N�@�]`�[׼.1^��q�<譥�<W���܇Sjg��Znp���T�F�)�r�}�[��|S�cv�eU�H��Kj���z��V¡��<�U��{��^�}�90���bnuXM��+���5d�FT�VZMے��ʽ��W{�Oq)WZ\5p���yu:`�:X�Q�w����"a�i�\ �[<S����Z�ro�^�a9d ��?Y\-�ٽo9v� �'���t�dp�з�ܨ�ͷ���k~��` �������t�e�ro0��sx��E�͛n��˽���B��*se.�Q"��d>v� �W��Ӷ�*�r��_�������������Q���\M����+�r��y��{�����?��гt)x�2Ef.�Gbx��=���y	%}���X�z&����Cb+H^=h�7X�gE[
�� �Kd_��>v� �'W�}�yX �Ǐ�ՊH�39H�7��I&؞�Z��X{+5m�'wqQ�MH��߹��O��O'iF�(�7��7�΁���`��q��u�+0r��~�:?ƵG�si����G^]�:�����W>���>�:T{�U|�(�_V`�.2+����h��N&�O����y�0���`�j�SB�R4+{V(牯
�� �WL����n ����yO�c\ �iV�����k
|ܛ��|a���O�@�}�1�S��I���`B�4�>Gk7��̨� !���qp
�\�����;����F�����Y2
�\�f�p!�[۠@Ƚ���/�~�\���4g�+0ro�6��FǸ@�KHcV��Q�B��1]�����s ��\����}�|��ki�SOc:��ՇJ&�|�)-�u������������isd�q��_���wM��5���`�~"�|���IQ?ɚPvj��]\Vk��Q���6.e�y�tܛ���&�7`�j��>3I��5`��d{_3�@취mf��>�lܛ�꠴F�l\�b��Nܮڀ��`�������>0��c��L�ZZ��c%������������}�踋�W�i�B�q�����o ���7X�r�` �熗j�_�V>v� �'U�/�z��ߣ��T-�7�Wg;��A&nWm@�]`���#���!7�bͅXy�K�%���Ӟ���#��4Ƣ��y��Pr�V���8r̸`�H+�7���\&Li��(��E����'�Ā�`�s�d����@��Xi��0���yN��a�yT �Gl�oV���ѶM��k��fgS˫�oB��e�ʻr�kr'W���J��׶	��Z��ρ��L��x��Һ�ۦ�~�ؓ��ܴMȝ\Zc�ӥ�R�ۄ�EF1%�an���`5z+����K(oF��!�i\ ���i0���ṃ�?[c����>���]\�bf�y�mrlf콲�/G?R��:���΁�ا��K����1m����R���J盏;�$�U��~�����V�7?���@���]]���a�mr.)��@��OՋ��$��6���$�ѯm>���^B=o�xۄ܇�?��>�����9��Hb�nr�^td��ԏ���ߌ�F����f�>`�߾������N�JW#*�KL���N0���ԚW	ޔ܇���Ƶ)��K�E���ymsr?`\������:���GDO��J��~��O��h�8�R߹FL����9�X�V��Mʝ`����M�#�?�B��$���L�����o?���UI��w���ڴ\�j�$�,oH]۴���H\V�6-w�U��K��$��ɥ1C;���Y����_Cth޲��i��h����˝`�n�Ƃ������:�� o�=2z_rq��?�ZdK��nZ���P�RζY�W��U�c\ �-���>#�3����;�T.+2�N�Y�WS���&��ꍟR�a�?���"�&�>`�s�'��П]�U�%��oV���X�}&�1.��=֨��$���Y��?Ӷ��Mۼ�	޷�=����X��61��F���?S5~��o����j�_��5�Ǹ@ꏸ	�e��G8w� �GT]G����� �:Yޅ�mb�Ӹ�O�'��ls?`�#o��mfn���[��F����܇K�(�s׎q���\�p)�ưm^F}^�s���w2���X��Ҿmf��%��E�c\{�;W�~�6�<c�63���8o�mf���h��됳�Զ�������R��]15�ӎ�PC�M͝`�/������S�f�>\�'��gp�Я�~N�a%���63���'9�Gڦ�F�G8郕-o��mj��ɪ��~��63�����B�cX �)�"դ$꯶y��V���@�Sl,Q��KZ��mZ��5��2�@�s4�wӼM��i��������y���5�3�$�|�}c���5m �mV���ߢ�� �Y��+FxW�b��90����niU}^���_�E������5����LUz��b���zu�gxEB�x�7����0|�D�DS<sk-o5�1�35�S�x�u�m�v��X�^�6���H}�5�c�[Sbۦ57�hn�D�ڀ��dRb:P���o�9��pʳ�ȹF�=s���{S���w?���",��E�}J��c�����џ]U	E}��.��m�����\�b��u��
"0s,�e�^�#��&��1���6��$����8���q3�Zj��-o��3�����x�Z�����W�c��`Հ��\3�{���Hf��Cz^w�3���]B�����c'	Bqi�����ߣ#��.��&D���`R�d����Q�쭴O!%�x�ܛ+^��@���=c��/��;G���`R�3�)��l�dϰϋQF����WL�yE}��..�⑶�ր��\�9:�ݷ�����sO���p�s` ��\�B���N(�'��j�[�epr�K�Մ��ŏ�#pro�N"�3H�Tbw\%~v�&T���{s�W���1�=�k�R���!�ro��v�`{�;��[��WV�k�����XW�2Z��m�ɽ�$��<0 �R����;�SH��e~��9mx�'׹(�\�����ro0��E(�~��r	i�<�$�΁�{s5)��5 '7������QpR��︉�``���q-~��}$�90������y8�k�����O��Ğ��	e��������s` �i.�iVҮ:PrՑ6�#�8�.�ny�#;Pro0��w
�|��{֣��UCF��%���-��%����\q� ��K2�@��im������>Q������ߢ�4Q'�5;    �qo��/�5��D+��Q�h;?v� ��x��<.����g~�}���7Y��E��90�����_��&t ��\\���Q��������\;ro0�'����\�����E�s` �W'i��La8b��$F�y�=:�����dJ[z܁�K-��ٿ_��(p� A귨�ZM��?���ԟ`����̯��ط���Gז�Jځ���j--���%�z��F�������jO�Hہ��`\/�R)m�cJ�ͥD�}C�1.�=F���{�ǹ������u
H��������s` ��`I\�Ё�`��<Fڠ��ܛ�H�&}t��:�U�6+���)�&��;�d �G�3lb=m�GV�����ד���>���J�j�ȵ����[Hޢ��\�󏬾7,;�=�W�"�W�B�s��o��O�~��7ro0����]ql�}Q~����S'	�ܛ�O�G�c\{�;�|���༺ PrX����m�H��ScT���6T�'�����;D~���ߞ������֫����p�~�Q@����Y8���ƙ1���^b�J�~��\��,�9QM��ʽ����;�b�b ��^�Fjt ��\�����1,��V�|1���9��_`j�Ų�s` �)�+�M�݁�X#W<�Y	\@�e�۳�3K�@�]`R{�y�7:�r���������\�<�72�@�st���>qb)8��L�N��r�p� �ܛ˟u�Ɗw��r闵�l�I)l'��x\D�1���'Bq�h�}��). �:���ߪ��Ա�R���+����9ӯ	Iyw��$���k-y}����v�VGb[PrW-u��	u(�<���jˬ�%�k�Y�ĵ�� k������c�|����Z���\n?���^�{oűsJ����^߷����Qaλi F�����l\ �[����\�V\t`�.�J$5o\J��)]�K^I��ŗ�+i�B;r٢ޚ�x�v� A�[\5p���,�C�� J��7�8Qc '����H�pb�� N��\��)pľEѺ��ݗH��+�(YZA )���E���c\ �W����1.�}��2� N�륕�ױ9���#�t��i�ͨ�`�.2�Ɖ�h�r��Q�b�_�@˽�z�#m%� V.�]ߥ7�y�� V���F�F��@��$Q�iIS�rW�?IN+� �J�%Uֺ}����A��`Q����6�a )�����R�sq�'j����� ��`bBy���\����������kĴ���(�R��DCޠ���VK����w )���\Q\̫Q��..�'�d~�U���ۗ��7�����䩈e�'W��<�%mD� N���Ƴh/�d~�b��
$�Pro���g��ԧbL��]���N������M�@��X5V[�,����U��_3�@�ӏ��LM�'ן���X���o�;��b@�]`�[�H��\�X���-�T��&�j�[s1���`Q�-m�� J�s-G�$���\��b+��5x���\��g*o���5���7��A�ܟ`V�%N@ʕx�̟�Z^18���3K������1V���(��K����#���SW����j�@�]\��,m�� Fnp��x揼m�(�7�I�ۍ0��+����;2��'�d����h<o����%T���{s�����������C�ӊ�$0rX��YߛB��I�F/�B�?��a�r�N�|\��U�ņs�2�q����s` �{���a���@�]\��a_LA<�"�Ǭ�>4� ��,*b�\ �{�x�*��VL �..��kZ�� B��hW���ryKr0ro0�ʉW`�j�ApV�i�w0ro.]�����u6�����7X�R����9D�מ7�f %��f����c`{�;�plL,�O��Y'�&���5�9�=��,�}tz�&&T�����*�Oe�C �\���*���r�;H��Y���r��\�<��7U��w�\��C�߱�"ro.���f ��5N����ǽ��,����%��T��^���.��i`�:��)���� ��\��:O B��l_���IE�D�S��ښB�EM������������#�3�ˇ��\�Q���X �'�($��B���~�տ��_?G��ג���\ �{x3����N�ר���{���c���ny#�d�,��Z�f=�;��ťU򰀋�S-�F<��'�?���V�ۜ΁���&JdY��D��
9��H���vf����A��_`�7�}��90��#�>�8k��s�̟\��+k"�s���SJ�*��4��������biz�f�N0�.�i��s���b�\�f��b�J�*���w��V-�gl����8ֿ����,����>�3�3�f,�9�3�9H�'�o�O.��j�}�߹��3)�6��@���I'�m���O�eSq?X��V�G���_碥Ѩ�5	8��	F�jK��d>E�ZW�-K�v.��kh�Z1�X �Y:�����d>�H��l���턤�������s�D>Ş�Xa�7��@�O��F�X5�T\�Pf��(m�����_`����1.���ȿa�X��L�W{F��������k|���I�؟\��ּ��&�N��������Q��L�lt-i���ؗX��j�/D�c'	Rq�(�5*5���Xʖg�9��}PZ����ԏj7r�w��H�f1�>����'�3�!�asq.aN����V�%��ιs�?�*��߇����S����v��I�П\Q:i���Oqm&���lF���M�}���Ư;B���g���n;H�+��wFǸ@�XM%uJ��D��o~f�zSq'�%�~��Nd���R�To���~$)j�®;w� ��ga�f�:���(e|��J����p�W���q�ķ��BE�9�E֩r���d �-�SI�g�cBUsq?\Z�&b��_X�T��Hϝ#���(�����u��SkxF�"�����>`���'.����bu)?/ 	�3�����ٲ��9���hL_��$��>�����'"�5�K�u0��#܁V*�4���@���Q���\ ��k�԰������ǰ^67�}�3�6w�i��{/-�d�q?\�[�i����S��X16Z{_�~� ��0��.:Fb�u�q'�X�g%�t�ɸ.�A��1�=��jԊ&�57�kj#mE����_�(Ь��>s�=�WT(K����=�o�n��`H(l�����	�����s` �k��槜6���@�׹������=������g6]}�+$�[��R����k��` �)���f*iU���.��9J����;�(�Ȍ�X�������n=�ܯ��;�d�l5��_7��բ�5�չ@�S�E�j^a�nB���O����5(չ@�/���#
gp���b�]^�f�t܇��L0��]k1ש�_�;H����J�]q\��\�yJ��R��?�$
,y�~:n�s�F,�ɫPW���\����c` �'X��I(lV ��`���۰΁�ԏ���s}�<p�����ny.zFn�Yl�{�n��mCB�ͥD���\���s�a��;�(�7� �ܳ�����X=Ѝ���Y�N����bD��Ǹ@�k<���GM��%���.:�d�Ju.����h��aXǸ@�9}�����7�1i��_���`K]8�����r���4T �:�إ�@�2˭@ǽɔ�k�2�6��L�%�	�s��.��O�������ȷh��������@�O��]I��` ��G�j�I�*�@�]\��SK[��` ��F+ir���M)��!�3J� !7��寸���p�t�K�Q�3�@��h�/F�;G�������9.��Gk�e{o�8v� �'W�:4Mk��ƭs%�P+y~|6��5�S�� :���^�<>�ȸ7�Z�����y?�I�5���Q�6��i�W#
��T��{��u�����    �T�I��s��R�3�3%l}��e�?��5�W���X6h�I���朢��{W��X�U����ρ��O5��Ş�;	�i��.,��>�2���_\V;�<���dY����j�q�.�̾H �Y,.-_5;��?����}��dp�Ч�>2z�/��;G���S)Ftqjv�:���K�w'��|�a��H,���U�H�s` �)�|�x��@ǽ�z1z�%�q���h�g��yz*�qo�VZ��
l\�B����I(�wq1�y� �q���U��[bUȸ�"ɛcY��Ks����6���j$_l�8�"��3�#Hb]ȸ7X���	l\��9��Oa-�@lܛ��X�; d��%�
�@ƽ�S˛HZ��Ks�k�ӗ	�7X,�˛�I@��qy�Vzo;��'`��\���]��q)���T��	ظ�|U�b_L�;����_`MZ���sľƃ�����:w� �X�N�` �[�i�=k�~��O��]\���_�v9�t\�z��~�����A�����d�b��������{w�1.�-��uj���	ظ7X���D0�s&���	踋K�}Q�9�ߢ7LK��K�k�qo01��~M:���F�#�U9'`��X1�(��O��.�W\���5	ظ���2�@����W��,�_&`�.�A=Q�& �:W���|����Uwq��(m|׹D<ZGI\<N@Ž�zמW�$��:X���?׸��@�Ž�Zhy\ �G<���h�Pqo�ֻ�6	��F�6D��@���K�KO�M��u.����-��	d� ����Q��$`�r�;���/�;�=�׈��i{�	ȸ�U��<�w�c	|�f�<�p���e�j/m�΁�{s��abA���5.�9Ϗ' ��`��p)`{�s]+�Pޜ"6�6bl|"��@��c)�`���dZkO��	������xތMB�fT�}"�90��5�X�jڨ">��5��4�$?M�ap�b�ι��?��c�@"H~��r��/����$��5b�X�%F�s�sQ[�yݤ�\�~������ܛkH�y\��e���닲���N��̚������`s�=�/�\��$��co�V0Pr��c�7N,�%����	B�-����\0ro�!�M�|�
O��K,�'�3yl�0��:�&��i�%��ʔw���5X���*��
����y�R	H�<�˪�z���&prYJ��6��`��\�QK���X�o���ϝ#�ťM�}f�90�:�����N�}Pr�?�=U�.������ݞ���Bpr��^(q�8)�[7��V����.��־(����Bm�a�M��.01Ҟ�~�\�	u�מ�\ +w�1w�ě��:��'�[I�,@@�e��:�QU^�c�>0`��\�K�� �\��7�&�6��{���bߢW��`J�vL��]\΢���.�������P�(m-���O�?'̆X�Ǌ����Z�A��\�-PKa|��@�]\1v��@��i7t���RVn��U��e����⾶j����d����b7�1,�#vZ�����!��1�E=U[�%:����i7t\��|�M+j2�qW�Q�}��9�=��N�R��ײ
�|ܛK��(����޹��j�'�3�qo0�N4���2���+���|ܛ��H�p'B�sI���~�"d5�7���0�C�Ǿ��/�٠���sJ�ª�RDi�(��KD�����&%���zK�_�#��V9�a����`�ݾ購��+��ܛKd�9�\�h�7�g�yB�����`��<M��3pr�(�#oi5'����E-�1���{su�<K����\Z.Ч/Fɜ:G���\Ҩ��00r��>&�%����\ė���}b˱�D����V��50r����"{�2*t@Ƚ������s\ ��W*f=����{s��[NqW$:�t�y͇��L������\���ς�"0ro,�o&w��/���.��f����j2��֌��qo��%q�7W4V�W-�dXB�ظ7W���eP�ď	7`J�p=v�@ŕ���TK���Ľ�F���L\����/�j*��X<^�����e`��\}���Ǹ@�X�iVk�3����Wz�"D~��?�W�&�����2m'׹�?/���u���{s��>�?S�@��I��V��0qo.?���4q�����R�h.30q����!0qL��
�?�;J�L�lJ�?��0���!pqe�$��ɑ��2pqL��".x���@�]\��Y���R�G/pR4o "w���o�` �{��槜W8*��"�����L\?u5k_,�:w� ��
��y���B��֞W�.��5�w�q������X?.��ʔgU3�q�ĥd5iY,�DT��ED����Ǹ��w��\�V2�逋�ȸ6����l\'�~5{���b0pq�U^}w��q���\��������qO�lh��n:��j���՟�4�xLܛ�$�py�q�П\~��������:�kR��Y�*�������H�[ѵ��I(���R{�b\ �ivv~��d�Ā�`�֟e�	�s`�׸J�'��)�D\���5qʠ w������G���`J����n�:I*������NǸ@�s�vs+�n��;G��kt㼊� ��(�y����s�$A�/0흿�^z�>Gkw��$.����`�m�@�s4b�`����W��{s5��5��qU����_�;v�@�]`�	b_~����!2�ܛ�՚��X��\|9���������l�*���#���G�oF2���� �C>����/�r��MVIS����<#���(�7��3>�~��xe���*�0ro�F}�7�������;WޘAF��$6n
Pr���
"HL�%#�Ƚ�Zl"���ߢ)�J�'I�m
ro�N#ѭ`�:����I~����I#wqY���y\ �[���[^�U��{sI,�N�?'�.Z�f�PrW%��TX��\zi��[P�d��>mi��ݴ;���̟\!��4�@��\n����c��ܛK����0����Ԓg�
0ro.������@���?^H��wb���'��j���F�ci��߻[ޠAF��X����H��#w����Y�$}J����7S�k�`��`+���6)�������؈%��;��b�Y��
v��I�.%n��6���N.Η�����信�`s=�(�,�I��oR��������:W�$��
��~�w� ���/��Z�nٜ�W�Iyג���\mM����j٤���Y�`F٤�	V�5������ȟ�mP�"m٤��3n��C��$������^��6'���N�\ �[�3��%�?�M�}���f��90�ӓ�<�J�U�f�~�ji�e3r'�\��/�yn�lJ���=��uSr'X��F�9�]emF��5�Ӿ��2���꿒�u�M�}������Z6%7�Jα@�8oa�lF����6�.���kT{L�z��N0W�5ϭ�M�}�Fm_�+:R�ώ��ż�S_�M�}����6AL6%׹ƜrSi$n*���}��M,�nB��V�A����p�����uP�%��;�������I�؟d#� 1��ٞ���N����6���~�(>�<jsr'W�Q�j�\-��;�8v��j�E���>`�����ɝ`���<��Ku�r����JO��nVnT6�1ծyV�&�>\C��+�oR�Ⲑ�k��H٤��cn؈�&b���>\&ϓX���Ԩ��_���}�F��Ok�N��>L�}Z�w�oH�?�1��~�����;��Ǖ��c/D>��R;��	1ݔ�L[I\;���;���T�}���/���l1���?�oJb�9��Z�E��:���]Xv�i�Ϡ��1y�;Yy�U�;E�2u���+����W�	�ml�M�]\#�Y��yºٸ,F�[Q��H�d�	�����6�&�>\��qm2���    ��{�>a�l\'k������|$�²�_t�����^ܿ���}�@�/,�h�5�c\ ��&	����:�������DGX7��,�����W�\܇�Fi�\ ��&	���b	'�T��S�ȓ�usq'�e����^�7���/E��y��?;w�.y��n*�f�)i������L��_�?�c'	2q�b5��������{��+�m.�lP-��Lw�~���I��-��ɸW/dy����]\�R����Q��d�����\�s` �GtW�*i+t�q�^��?�q�̟\�Q!�s!�$��R���u�q'�4O�F��/�f�N��;����M��p��U(m���z钹Z������\3ˇ��u0���?s�~��N��{s����DQ �:�?V��&���!�qo2�1ʜ�@�u2���#��{я���7��kެs>.���_r3+�@�u0�4��O��Ks�@!��/�[���ԟAwK,l����]������������6���(q���j�,H�?�[�Ҟ�H(P���_��������հs	��{���h��j6.����ӿ�Q6.�~�u5�r\���#X�hl..�\�Gb5ȸ7�X�bz�90�� �w �Nd����8�d�\!1Zܖ����`z�H�~�@�u���;���9pq�P�k�*.�N'���R�c	\\S�,�i�wqu��C&�d�ܸ�4����d�k�>χ)` �5zø������N�����y͇��u.�W��2��@�]`���C���� aZ��'0�:J���\}hK[y���]\�
�X<&.�E����s\ ����
�R��s׼�4�po(J����u,5ϯ���0 ��`Ztd��ķq`J����?t�h�7����3��pi����5VB1����\Q���h�7��I�	�X�4�4� ���a�S��)�~�M�|1���I��_\�[M�hh@�u��俍_�;w� ������^޷e�����{s��g+t��~uj���w���a��Pqi�i�x{o�9R�����t���q�Y��\\�q��lSM(:5��:�r��:�����\bގ���}��z��S�u����N6���]���V�n�Ž��N[�؀��\1���gFpBu��S��m���\c�AWy~|:���1�����cU��'�kYk��u.��Wɴi���7W�bi�Hpq�Kb	N#o-n..���1��f�T�ť����;���sG��-�h@ƽ���"�z��qL�.k��X�2�����G����_`�J�;w���E��׀��s�����p�V��V��@B��7�%�>ϕl~���q�qL��,]�*�@ƽ�x��-�k@�e���*eX��ـ�{���w��}��z)U����dܛK��U����X[85��ױT���/>;�q����<\ �5ځ5�Bd��{�I}$�2��:;d=_���+pq�����gp�ȟhI�yhqo�^鿭�2?�/_ѧ�������?�<]��\ �{�&�逊�s���g��N@�]`�hػ�u�~�Yz�rM�n@�]X�;Y?o�\ ��>U�O%��T����ǝs` ���tOV�=�M�wq�B�	�.���KKܦڀ��sͫ�+��5:��:��CR�}d���&��%\����|��v5Q��m���7X�O,Oym���w���,�n\��I�,���W��5�����F�mk���9�0��m��I�؟\��6�z����s1n�3�����Aw��Ҟ��)` ���Ջ��E���<y�}	�90��l�kI�j 6�UZ"��9�Qd$�xm@��9�C���~������jK��_�W�r����w���{ₒL� ��7��:I`��\�0�;w�q�y�\ү�Z���=w�{�K�)|Qy~ ���ý����?��+s���:�[Ν��7X�o�p��\�.+��*��TܛK������W�~W�{l%��Ѐ�+s�aL��b���$��Qǻ-v�$>E�UO�a@Ľ�<�>��R�@�StOk�s��P
3 ��`Z�+�0��̸VI��0qo.�u��7 ���X�����0qU�#o^�7��\���S'	Lܛ��F�q�K�5j��>8��A��_`Z���qL���k_Q�%H�	���L\��z�_p?�F	�C*�k����0q���"VCe��x���S�����pen������LܛL�y��!�/1r�U�/�Î�%��ťR>��2�@�k�&*y�7��*��jy}�d\��E���i-dܛK�������L��B��Vq5 ��`o��` ��\q�q޿a��@�/0�G�O�?�Z�g#���6�qo.�a�\ �� �x����M2n�u�AiV���Ry&
dp�з��צ^�V�Pqo0m������U���5��5�S	\���jK��c@�u..��k����?w� ���3�,d��.�b�J�.��ዥ�-5��:���?ɼvM.�����9B��*a���6Ȁ�{si���.��:�խ�k�4��.�Q�Y;o*����bЁZ^Yȸ7�Y/���ߣ�N[���j@ƕ1	��gV���Ȅ���������kEY�@��ɟ֋h��C>����5�7Ҁ�`=��ʻo :��eC,mӫWK�v�R���i�ǽ���/V��ۃ��86K֧U&�����%T��V�cX{�;�֫v��FՌ�!r�畷�Ā��5�$Z���?�c'�g���D��q׹j���3�0��	�\�P�k�����d����t!fp�ȯѧ����#����Z�zE"��9�Կ^�v��5�q�Q}�2�@�S���3�0��l��Q�<Gހ��`�נ�W�
b�ǽ��<�ڀ�\�õ���l�����+y\ �%�k-ۯ$��cOb"}�!L��w��o�$���Z����c\ �%w*Ymy�8�7X��9,������s=��.	���{�K^Cru������ɲ��,�$�L0�����7��Ut�$A�O.�֑7#؀��\ܮ��1�_��$}���X-m�%���|Q8�2�Eſ_�1��*	�����*��q;�r5�]��w�C'ف����U�����?�����"��*ف�{���l4J�o1rʚT͛܁��s=.�V�Fau��.,!m5펭%Wg/�x���
�s�B�|�L4�y�'wq��Di��:Pru.�-ݟ*�*w���MXe����zK�QMT:pr�C��=Ow��:WU��lu��U�@�]`=���=�w��:��Z�����?Pw��..�,M����u.�K�ϼȌ�i`��`���-��mJ����+Yɻ�ꛒ�p�&i~J߄��U�_�<������~����o@�q���KbTWM�-���>\�_�Җn�M��p�Z?��	Wl}�qC2���F#o�G�t�&W�C�]k8v��F��kP��~���6wr�HL����7����?;Qb\i{��w�$A�O.)�Z�V�ɸ�5�ǋdMZ�7�!�_��Ō�sd �)����E�ܩ���.-oi�-���N������zgT7���-���o>�S�ʹ����rr0+R��N���u0��3d�y]�}3r'Xl$e|��?���ܟ\��m2�G�oB��;�Z;�M�蛑��i��` �en��ז��oB��
]�>��3�@�O���'67!wrŨ"#�Ĳ�&�~���Hb�nr�^�Ϋ�-l蛐����*J��/���8��oF�f�L�K��sW��g1BB�|�q?\~��&r��_������e�o:��1?��2�6w�	]��w6���,��	*}�q'���R%o�W�t�l0}1��H�6/L�>���盎��2󧊼ˆ�ǝ\Ԯ#��֌����>`*&��G΁��{�
���$T�7��EU��Oqm>��R���b_L�8v����d6g
p��W=߄܇�Z�i;��&�..�����#}r0m�[n
H �  }�Êj�OCF�n3r0�R]"������Qޖ����Z�hi��&����JhR-o�F�|��5.�{�J}r0�-�` �צc����W�۔�L�h�@��)�6��9�g�����I�ԟ\}�gC���YF�ӳ)���E6F�k�ߌ�W��9m�R߄��%�_&{�ӳ��S��;ã��蛐�`�x�o3���w�P�m�����~���s��+�9�=�L�*B��F(���]\ry�kc;����I��j��G�|���|���.}3r?`5�����ȍ7�h��3llF����?���S߹j�uǒ7elF��%�PZ���[�m~0q/�O��C�ϝ��\-��H��˙��_.��i"�����p��w�g˻4����^o=�˥!�m���־P�Oq�-�~�$�Su�����o!��`��1N��EC��{��?v� �'W���i�F���oSf���F�QA귰�����Z�c�H��5z�i�G�?�,~�ޟ��$�f&����Է9i��S?�nf��f�ެ.���E�h��� �������c\ �-t�҉���з5���S�΁�̷9����W�������f*�@��9i��*y�%�ԟ`�yT�ݲ�ߣ��Y���KBqI�<uf0��t�&������a�q#�3A�ԟ\Rj��N�A�X?�I��>���ּ>�� ����=k�~�:k0��ED-m#�`��뺴�%6D����C�܁d�ɞ�q�Ê�r�p�!{��\��۬�=�KcV�rZ%X��_\V����=�k�g0O�g3tF�N�Ŀ��t�D�=�̓��K��.۱�����W�/~"�q��\b����^�3���N���_'S�ՊJ&�6h(�����y>���O1-U{�/�[�;H������X�T��<�Z����������p{��c\ �9��[����� A�O�Q�}1^����s��4-�� ����D�R_B.��抌zX�?�jy6o�p�ؗ(����i��G�����;PǸ@�Oy��h����:]�?���h)` ����T�4��@�[H߭Qb�Z�?�<�8o��h �{��Fby+���̟`�Tʼ`6��}�o���0�:I�����F��=����沊�����f<F⻑���`1������m{��\���7w��#������3�b� kW�Ƶ<�y؞�O�����?u�}��K����ǰ�ȧYA4n���a�α���WY�@��9}���
$Ꭽ��_\ڋ�mp>���M2�#;H�	�%%v�t�4��T�ͻd� ��ZI[�2:�{�a�j���;���%�	"��y������y/���?�\6�R��=H�	��Zf{� ��s�U��D����L0�L�J���|��X�Ēi���J-y�������SEq��5�ι@�O�Z�3�)���Ĕ�.��?t0��F�i+gľD�m��F�j����Zy^$3�@��{�V��/܁s'	R?:/)�/���}b ��q�*T�Ө��B?�"����Ǳ�:��_�1�@�k�kiD,i��b��*iڌs���y��IKZ���@�;�?WPU���~j�`�oV�ܹ@�/���˚M�\ �������-���M��~�\ZtԴz���؟`��)<�z�\
�qo�S��@��O�e�*_��=v�@ǽ��֞����@�[�~��w���z�ܹ@�O�J\G�]C.C\�~��X�6;�ى�MZ��q���w
[&���S[d~I[S�\ ��״��R��Kc���?����9���꧀��q�MK�j�t.����"�di��2�5��l��x�6���z��K��3���)mPVo�s�s�����1�=���Z���p�=����E6�b��ȸ7�X�,{���#߹���oO�f���-��&	t\�1Ԭ�68kz�s홿��G�xw@�q��\D��^kڼz�?�zl�Ns�~���Fyߪz�$A�/�ք���9�����	�F^� �2�Z�*���r�2��>����B}`eT����\ ���Y_%���`2����� l�L���/���O�Xa�π̈́ �.�cߧ����q�k���Z\�L>�X��u,�KڨYse$���w���W<\��G����;�s	"����7���@�K�l�O���?�cg	"qi-y@��)��iz���ȟ`Z{�]�` �%��Ĩ|1w��Q��_`�_��\\�H�}��;J���A��*eY��rq)��^�cX �c���{��5�������H��s`}垵[ϱ@�/,�ֳDɘ��?�s�w-��9��_`FϦ�0��-�HI�}Q;T�lpfY���%W7~��%�4 wqEe�e�ot.���#z��z�;�o�R����_p0��=k�����Tܛ��%)k_�s����oL#�*���5�=W󮖁�{s5m-����%<'�V�d<����/����.��r*y�����S�5���g�$��[-�X���H^�!Pqo��F{���q��?R��ٻ� A�/0��W�@ŕ�S�G�Fϻ��Ľ�<��{�1�=�e�B����9H��@ŕ93l�������V`�W�J����Z��l}�#�,�)������������ʺ��@�]\�?��&�W �:�ŵ���Su�=�o0�3�@�ר������
L���h�����cX �)~��S8o逓�Ч�گP�8�A�@�]\��dY��d��Ԭ�/�ĝ;H����F�s�+qL��(V}q�(A�/0�?�/�(������k/���]IV`��`Zm�_*���Ƹ[)i2O*��_*K+�V`�:����<	�w��&��8��/6���?���{|1����	6/����
\��5���f�;H}�>?�?��
<ȸ7��R��
d\�����8u��Ž�,Z�@��=a��3*O��]`5f�W�΁���p8;�ji��
\ܛ�����"��2k��O��@�O�^E�	T �J�/n�%���+sܔX�'�T �.0�Z(��
l\i��g�-O�@ƽ�Lz��\�\ �[(�n�Xƌ�&�qo0M�S*�qL�EO�fB���7��>emu.�s:רþ�|x�A��)Xb.r3
u��]`Z��n�
\������?�.��j%�D��H���e:���`��H��` �-�*<+T�3��I�ȟ\�M?��\ ��|���9����6��oc�������z      �   �   x���1o�0��=��6@tw1$�SEi��l	���!�B�����
��nyt�ҳ�4�3����~�n��۲vU�]���q��[v�9�߰x��G3hR܆#����,)��_��K]�qO�J[`4����a����J�F���6�X2J�5��$/����@�}��G�-OD$>���5R�!	[c�C���{KZ��g����(�C�R�      �   �   x��ѻ�0����75�i�E��A�&�M]��������$�1l'9˗s�s�Gd�?U�ąJo2/;Քq��٫V�t$��$��\w��aN�3��i`b`�K�Km�Dx64IQ�*R��J�^���	~��^ щ��Vc�(̑� j�o�=.�)֘�)v>��V��S�c�C-��C4�/{��      �   �   x���OK�0 �{?ŻMqyiR��I���H�U��v�k��;���Da�zDy�� ��x�Y�2�&��w�7זE�V����\S�4_~�&O|��m�
O׋����F��x�8�)0E"&�/���KQ��]�uc�����5�=��Ƃ�ٽ6wW�>� �	���!�-���Q��P�	��
B@v`@b�p�����OP��P�i��/��K0Jҗ��B�%��{�V{�0���S��T' ��y�SU      �   �   x���v
Q���W�/��M-NN�IMI���+I-�K�ыϨ,H-�7�74�O�(��Vs�	uV�0�QP7202�54�54P04�2��2��60T�Q()*M����
�~
��~n>��!
.�
~�!�~��\��o�a�����1��Ĵ���i�9��8�� �{n�      �   �   x���=O�0��=��n���|�m3�R�RdK4e�B1jE�4�� �2@���̏���b�P�U��o�y������6m���nHZ���.�$�j�o_��\�p�1��q�4 sR;��2�*~Iq4������1� �nK?��&B�սwW����)�c��x.RpI��T|!^�fwb�RC��pEX���4
�[aR�-5̞��~0�Ct�k�lR8]�i      o   
   x���          q   
   x���          m   q  x���Oo�F���{K
��ْ�Sভ�@�׀�6�YT%ʍ�}I�8�ve��t����!o�};;�����w���;�=<�W�C��e�wO��~Un��>���{߿t�n��+�.��o��˻K���ڗ�J?�������������z�fw���~�������6,6K� C��F�¯}�2C��E������"�w�\�^׼A�Q)�kkdN��c�e��f��mgm�d#����<lk�0��)�~��Q�C&�o�Ӵh�6жiV��4Tn�~WsFѬ��CY�(ZEd]Y�+Ed]k�����+��妪?��z��w݊�ʁN�in4���Z3��%=�iK3��Z>V������u4W*d���r��d,1Z�%�cy��\�N1��wߠ�ѻ�}�p �hT�I�̢i�3&�D�j�b�tB�"h������1E�eL$d�Ծ1�&�h`g�S��[��X�o�C��FC��q�`f����,�`��l��5	����gu������n�1�{�19�r�gK��r>����,e�˯�T�]l:!͋���WX�=R�� "Or/		��w�H� r.�S��?��M��K�'V8(J�&�]&���/�	4q����	ӉiQ��1�/=�������I�)I��/��#�
^�@:����|�]��/�yC�$]AD�ã���CV�����Д��f����Ӯ�o��j�9�G��%� iXt��6G�Zˈ �bv���߷;�4z�āA��XFEB��GE��`w{����>|��jK�U�L�U�#���&%�͒J���	���I���7~�|QXi�L��O-�'�Y(K���O7�(�'���Һ��PzH��A82,� � ��q&�X� ���X�R=mu�L2�X�HeO3^[[�dOz��@���r�l�_4��XO�ȁ�HO�/i(���Pbex:Pp���)���4~WT��W�C�:�-u�@&:-B�YΤ�ir�r&&/�V.dΤA��f��mw��պ�L�_�ԥ�8���1.�S���N�l��r��
��S��q���7@�-�
���dT�	��d�2����dqaP�	��^M�x].�t�T����R�'d0�|�;��=��Rn�?aSufڮ�M�J�#��I�dp�ǂԤX2-�c�ؤHaD��y=7��b}h?���!ܩ�_�Լ����SI����<e5�JUTMod+�(���z���������o���`��b��4����z��gv��g�E��;#����L�/��x�b�s��(w����T,v�۝��X��B����ȴ�%̡ipQ��������o�no1уL{ˀ���O�mdؿL:�T��:)"�jRu`_줎��I�1JBNv;�t24� �i���ȃ����EQ�@
|EI�^���d�Wt$wTT8��
�4�S�$��T������B�*"���I��i��!��p��vw8R� VIP�O��z.g�S�2���F�|����	0����>]�Sd�9�|8��<�̇�	��5�`��P7/��i�'G����N�?sx8�Q���9p��*�����t�����$Jﯩ��8�DuEF�B�C��#BMdC��R�u���@���      s   �  x���Ko�@ �;�b�h�#��]c��!c\l��_"�HBvY��OH����*��4���f�Y���8~��Q��b3���p#E�Ar��V��>���v�o�!�TS4x~J�談y`����.�<�>��RYn�S���Fi��1�ԫC/�e.��_�6��enݎ����~�}��j���2�yIv���҉�s�X 4�:@�	�I�!�TWQ��W�|0f��u��0�h����������H0d��
d���}��WJ0oV3F�v+Ԇ%-ի�Nݻ��h.d~��3��9{��J��x���|o5 F&D�J�}�d���]{؆�բ��ñra����<.��]>�E�ے'�iZ�}�d
c��o[�� &"&Ն��4������~�����MJ�#�����yg0�      u   
   x���          w   ]   x���v
Q���W((M��L�K,-Ɉ/-N-��E���ř�y�
a�>���
�:
�:
��
�~
��~n>��!
.�
~�!�~��\\\ U�F      z   �   x����  �O�߬�~�Nͬ�lI]�V����.��S�oO��>������mz?���.�����HeE�KB��c�y`����DE��	��bFвfX�cUH�+B�.�hh��w���3��=*}�$I���'T      y      x�͝ms����S��M۩����}E���Ė[QV�f2Z�m5��RԴ�N�{��y�8���.��Z�Q~���]��8_�\\f/�/_g����\��ߗw6?/W�n�~��|Ȯ�/ߜ,���Q�;�H�|�"5>��@�@�#�߹�o��w7w��$�~:�.fӅ�v�=_o�7��O�5�����g��j�z6��������~�^�gǯ��/__f�����˳����h�M�&\1n����V!g�����NFT���h&��Z�k:�^�g���jZ�|�!X 7��X]��BN��_���*C�DL	�J��G�����Iv�����d2`�!ׂ�S����:,(i��L��׻n���AlB���[T��X���ïc � �d����I,o6�7w� D6L$�Cj���|���u�S:����	�[��_m��;�n�[2e9)spֶ�1��g'��8	�c}�Ȏn#	����KF��eY�F��C�IB��(:p�4P�q�w�_���Q��h'���/غ�; �[3)�{�4���Ѹ�2�κ�Lh�	#�����}Xt�w<d[&B14�P���������C)-C�Ru�k��|�L�QF��8���PT������b}w��^-o�������;�4��IJ	����yR�7\PU�;IqҶ�9R�N��DQP�-eT1A�xm�v��qH�ڥ�U9���Цf7��t~q�ü�1��*dS�rH7C���y���y�]���'�(��x��`)絆���A���F٠jz�3j2^���H�*��'�?Ϻ�7^DRA�$LH{��@����'o����G�GM�P!��( �B'�F��\< ��N@S��r @j
��ER������6�/�"�C�R4 �-e��8q�U�yt�:%�� R��d'����Fq6�Mu�Y�E���fÁ�t6���@lM�@�"&R0PΝ��7X���}u/
?�SA6�C�#
�(T�xh�.f�C$��n$ESA�7��Sa��}���͘pCMIɉI0�(
��l� �!nj�t3�&�|̓��}���������)49%��U�P�ߞί��vʦ��r��0F(Dp����|v<
dSrrH���\�-���۷�W�P6��Q:�[0��d����6���C�bW��D9(Y�8��W�h,B��)K9�pKHj�k�.�X� !hS���{_J�,�)�x��}�V��V�lj�ʟ�`\Y�P��� �M>�I"���X	�5��[�_,���\6����es ��؄��b3 VS]J,[����r�S99!�\�5�9u��W�cȉl�Iu��j яr��k��Ò�
����	B�&�@/�GN>RR6��Q���2�A���
���g��bʦl�$9���X�Ī�&���>=�[;u��X�;��*h��_�B2�l���YBPl�
�����pNt@�o�15�Ј3-%��F���8c(Z��I���W���C�JvZ���}�U�un���/�i D݉�U͔9��!�NDD��]sB����Ų~��B�� ���E��`{ ځ����H��k h1붪��!+�������nk�P�#�g%��u��T{E ؐ�>9%C2F�]�C��NI�BĂ7��O�3T���1qo�Y�����������r:�;�M���3�I���ꘝ΄v��!Pa�@�{�AMԌjxT���(��*���!D >n��P�'_��e>*Q�[��C�x|�(�i�ӗh�b��Mu�?�n>�
\�r��q��K�HKB��9*9A�b%r쿝o������vB����PNi��V�2_-�םH	��J�+��BU�@Ԏ��ܯ��n����KgK8�B�C�&і�i���Ǜ�����͇�O�]/�t��)$9���r-j+�d����H8�lS2��>��
R�0>B^t��G�g�oַ�{���g������?t۔����8nI�~�q��n���,��r�~v�=;�[�)���M�q��'��j���7>v줜 5Q�_i�0�!a���������,bK��ô�Ai'(|�pn��զ��q��7唕mH��$q[�ST*a$!�VA*�PITP
<RErMR���v57����jB�!��gB� �Lݪ+,���yC�� d��N��&��>͏Da��Q%8���ϓ�\qUK��d��6�3�CN�jy�I���m|ڎ ��Ԯϩ��()H{g&�p͔UZ�'w�r8��n��v7�J;!%o{�&�6⠡��e��$/�E����w W��V�EIxJJ������OEnkG�]���֔�mE �����)�#���&$��h8R	�$��ݺ����Xg�? �J�2#o ����r�B����P&�
�SF��\�W��/�#= D	'�;ݐ(��:T|���g���O7n-n����Z��)�Rk���
h������A��"F<?��Y�LJм��1YH9=K�o9d����tr_�W����s`���*��4��X	���sf�	ڶ�E���xe��TS��Ɓ���;hʸ�v�pv���ӳ���i�eC���B洌�3�kVBg��0`X��䫏M��X����2
��x/V�ĥ�^_��Z�[)�V�O:�)S��w�2�*�^�ۢ
Ciҋˋ��Y��C��!L��Mu�,w�H�H��%��mL1��������߾���K9�*�)4�Rڢ�M�$w�Hc��Џe�R���lpe�����F�6-h�n��R��O�N��h�Nb}�)���A�+����T,��<�3$M��!]X\�/�:��~ ��+��~+�!�k�׋�?����xa�v;g�?Z�G�3�DV�ͧ���v����s ]cJ��왌�|���P��&�ԫ� �S�
Dh�[�jf�t�|�B%�?��^vW�ܙI�0��e����HwW�4���K+}�Z)E;����U����ҥ�&�����Y����Ȋ�$XR��]5�i@�S�	̪��}lw�H̶�L�����(��O�@��4��'���0%��|�J��)j���u{��M+)�T�'���M+)%}��0eS��o����ڲ�^�>���j��I4T˟C�=���j�!=������!Q>��l����k�r�tHrW�R����LIl�r�S7���QNR��J�6_�q�/��-V�ۆ�4�e���z�3/�����n$tj$�8�ej�a�X׍���D�M�[;�	s�{JN
q
b�H)�ɹ秊Lt���n{>�!�d7���BL���K����w,Vp����<�ǵ%h�'g<�2����l7�_}�%�5� Kһi��A�C���.6|7�����m-��7$�y����POȩ�:$�Z	('����J���!_�$�ՀE�e����Rr���qJrz)��x>e���T[���탕�e��}1�/%gM���u�G0���o��v���,Li�)�foHi�^[|���>V)YU�57�m���v؈��&e�!V�e�(�!Ze��M�jB�|y�.^0�BS�������Ż�5�q�MA�6+�P�[����V��8զ�!��[�7��G-7�q�MAW�x��t�;I�z�������	�L��E�yG�
���!��zJI)ڔ�[mrB�j�CB�������R@�@M���dB����u�|�7�U���z��od�L����`o��l~��(}�@��D&	^��|%��(���$���+�`�7`�l�$�W�:՝���}w6�8����k�V.��g����(=���&@^��L����B���ߟ�|�f�^` ���`��)Ԯsq5;]<gqlc�����[����f��k��N-L�&��E��e���h߀? `d�W���x��ou�}�g�[-Pv��p�f7�T;o�y�W�P�8"��??Lx�e��Xb�U��(��P���oN_��������E6O�7����ա��fm�4�q���� �fƶn �f��8���������!�-o��/Uu�z�(���_��d�o� |   ��6~�U	i��9C�c�|��m|�x+zH� �y��?ʆ�Hu�ȷ[A�Ȣ(&��J�@�l}����c�yi�P*鍈��h���U��bU�F��9^�]�oo׫�ݯ�{/Q뻾��7��e�}u      {   
   x���          }   
   x���          k   �  x���[O�0���+��]i�HZzO�e!J$(�"�Ҁkg}a�_�T�)�9��gf����ۋ���E�Z_�FUO\��Ah�H��n�ݟ]�]ܲ�/6�ժQ�0���z��9;/�?�����.X^,����t�}�vx��%�j�m���G�6ڷ8�8B{KG>	��n���8�I [ڄ|#����9�L�
z�������W`��w���V,��2��}�I�8���k5z%�4QI��TnJ���"��;xE/� �p2��Z]��wdZ�R���-$9�I.���ID���,2��~�-)��,��"S��
��N,�'����4���
�l�Bœ����?rlwn�n��H`KH#��e��,�96��e�R�G�m� ���$��K�L�l/<\+j�
�"���0�w1���h��p#Eˌ�h�q_���A�"g���0�X���+7Pb�o������?�`�      i   [  x����n�F����K���Ξ��*Ҵ5�@��vASk�	E*<�����DY+��R�l�"�a�fV�w�������=�'��*�t�!�׍ݔ�6�˦�~}������s�h���}�m������˾�+���n n(O@fDgL����'�L��7�w���}��v���?�y{��/�n����C�|5�LD �V�������F$�'�V��~���4��� 56_��(#�H��"��y�?n��|m��,v��'3�E$��S�����i�|��PH,fU(dj�w�ݺvSv���Ǳ����\��}p��K�UD2��=�����eu�`DǬ{B�c(�2��������a"�c�*�z_%�q���A
�b� ��(�OC��>V���[fR"�ae�}�>�U�����F�pm۴v�.__��!f�����лV2�= �̙��%3B2�Ld@�d���R	´��2R���.g�m��ۑ�.JK �Q�:<��>���)���*����棻z�Ls�A��M/��$�J��E"��>Jf��ߍBZ$�Dp����v��g�*�^�+å�)J/�$M4hK���hZҨIc��؄F�� �	}z	M5j�Д��"���Ʃ��&���b, [.nR��;���&��}�������Q+S]�S�9�/��M_B�g�s_]1��Y��m�S��0�%R3�8���Y�����f���;�0�:�2B\��z�����x����Q���	@���Z~�z*k�/#���;:���g, �v�ǡ�7L_���.��6\�5��ze7M{Ƭ3�')V0�jo���*ۻN�y?��q\�6� Ɉ� RbT\�� M,�md���p�g��ZH�e@'�tU�ϗCf�%���T� Q�[�*u)f�P��8��b��1@Mk��}.7�kp�͋�/l�Є�Q�~���Ĝט91�3�ۢE_+�ʎ��XBxFeFMʤ 2��8�u���g2�R�Sԕ�ì�Vnu��	�5ƼW�2�e�<rz���Ȼ���	������i����i 3}�v�3�=���R�LД���c�q>�!��u���rLfR���-��Sm�8��Z(΅�Ѝ������v�p`�"���ٌ��O?,f����j����g���BcG<��o����c5k����j��x��O��h2�k*�OEa0S���V~�{j�S��!p��c�э� �t�p��K��G�c��LK�DX�5ư��ϫ/��yQ�h~Έ5�i*��<��]A� x)橡��\�W��[ۦ��#�:9𸓻Z��0r
���H�d����Š {��t��PfB��(��#h�^�z�	�      ~   ?  x���9��f�~?�&J���T6��w1^^7����|��UR��D)�q9�3?�FͰӦ4��S��剿
R���kv]R���Z?*��+ɇ���f�݆�ھ`���/Mܖ���'��
̟���d}0ë�b)6�?���n�M�Z�!������}����4~��vJŴ��<a���-ą���Զ�۶�����0P�s�򚭏�zO&�]L�1�I�=�k�Q��v�N����%n�j�;��O�uaKΕ&ZY�cX���Էiea�癕<���k��[ޱ���k"�0x
"�W�%�� ��wjoP��x�5ɦ�=e���f��h�_;��{LAxU�e����-�.͓j�|5#\K��ζ^��ı���մ5o3����^Wm���S� � �X� Bߦ�ҍ��Eń�<�>��E�10�'����Q,�9s�q�%�v���
��C��a���g�X��m��6B|6!�<O0�6�p .j��sǆ�y��*�n1��T[>���,�ǻ}v�����=m���X��{�B�>���b!�m�B@D��p+�0��۴����/&N�>�琯����-�"�ڊ��E5Z��G�S�<�-tWr��ru�#�,�k���N���Wm(�����B ��6��QX���������0��Q�ݳ����숛�τs�����[_���X��=�6��$+k,9�տ� ���f�Ȓ�
D`�M�Ǥ>���ތ7���6��=◎{V�6Uī��Ǿ��q���x(Jf��n���xRד2�o�5�mL=	d��~����_^���09      �   
   x���          �   i   x���v
Q���W((M��L�+OM�ONL��K-Qs�	uV�0�QP�V�`�1��	��]�@��#H�1��T��Sp��s��tQp�W�����s���� �x      �   _  x���mo�@���S�w��Xm�{EE���6}Ӏ˃Z�a������{�y�^�0c�g�efgfu�`쇊�3�}��-_>�䕤�r�*���ǁ�I�)�A]3cD�MC3fiC�ü��끡p���^hݸ^J��t[���C�}W��������f��:�P1f�7mǳ�]9�E؇��HHJb ��&���P���g(5N����ax&R����#͞�y�H��P�a�w�8��T���4&�2'�����MG�������ܠ�)%1d���X>W##��۠#�;��3�Lf�������G�Џ˴�(�iLwU�I�Zyܒ�[��||ea�残�7m��YL� YB��	8T�	���V�î��%ϵvT0��`5���-�l�r�$�dR>P�Pj��R���57>&��
Zձ���O`L孲����v�Qu���
,ZP�
��}����F�����F��%|�+sY�A/��5~�hÎ����!������L(Ir��w`m�n��*�aG�Й�X�ݕ���=5~2�}��Q�nN0�]�.M_<u	�����p�8�m>��b��-*-_�/��gd�5*��[��` �O�J�Z�;ͨ�����o=��xX����?���H�	��D�թH��c�����X�e|��װKz02��tK��j{��n[#��eO�͓"�O�]Y�A/��	ﻊ#s��f�38V���(�_r��n�B~r�d�5vk�!q�sl��ǣ�mr޵�g���ӄÎ����9�Y�n�Uo�Z���?���pB~�CZCb�4F|
�x�T���erFc$��0jG��=#�S�6Ƕf����fw�e���<!���-�������/D�'      �     x���MK1�{EnUI&�/<I��B�B��*���(]Y*�o�ӞD���އ̤��f߳�����o��B�%�Ȟ�w�����[o��t^�!)�P���Rsu�:�6����M�:�����w���	�/�! �L9�\,#�@`�T�;Bi���j��͞Ηa|��s��,
)1���U�e���͉���߇(� D] �2���6�)���3`p%��N��,���	JaL�Y0�"�5��ǰ3�𘳳E�vL��6��O�Z� ��      �   f   x���v
Q���W((M��L�+OM�O��/J*-)��Ss�	uVа�QPw+��+Q2\<���@� # i��������������������n��� ��R      �   �   x���=�0ཿ�6DH����C%����ADi$����M�,��.�x��%0^
x������e]]�ҭlZ���Is,a�˓�aǌT�^{B����iƢb\�;Ʒk��/�8/i���ǆ��0���R��nD��Ԉ0�O!�o'Vp1m�Mp�]��}d�1��&1"�?��߇��� ��ۻ      �   
   x���          �   r   x���v
Q���W((M��L�+OM�O�-�ɯLMM/�/-Ps�	uV�0�QPw��;�k*��)8����x:�(��+���xx��[sy�b��H'ji7ҙZF���t�c$ �/e�      �   j   x���v
Q���W((M��L�+OM�O�K-J�,N�+�/Rs�	uVа�QPw�5TS��
�~
��~n>��!
.�
~�!�~��\�$�jh
6�j�c�� <1�      �   
   x���          �   p   x���v
Q���W((M��L�+OM��I,I�Ps�	uV�0�QPw+��+Q2\���@� S i��������������������n��I��F�hf[��Y`��h.. �'1�      �   �   x���v
Q���W((M��L�+OM��I,I�(N�+�/Rs�	uV�0�QPw+��+Q2\<��@� C i��������������������n��I��8l0��T��h\Pjb��@Ҝ*�a��H�ᶀ� 4mU      �   
   x���          �   
   x���          �   ^   x���v
Q���W((M��L�+OM��IMQs�	uV�06�QPw+��+Q2<�}�A� i��������������������n��� ɒW      �   
   x���          �     x���QK�0���+��d��n�O2�,�D��kH��6�&�IW��&��
B�'�;9�d��e���B��J�s�P���-��m��{8�]�D`�{�&���]�5j�����QO!��1H��΀i���\�%���a��2��@h����m���ɍ��@k�@-Q?��j(�5t�!�ܺv�r>yq"W��Vf�JnPȾI`�z<�>�l�6�)S����O>�+�7�H��	�Pj���vpL�r$�'\:����{�i�a�tE�ϼ�J      �   �   x���v
Q���W((M��L�+OM�/�IVs�	uV�0�QPwqVGP�Ύ. ���H���B�P��-N)� '%�,1�@�Ĕ�D����4H��@X�5������|<�C\���C<<�ܭ��� -�*�      �   �   x���v
Q���W((M��L�+OM�/JL�Vs�	uV�0�QPwMIO�wT�Q0�T��Sp��s��tQp�W�����s���$�,#�YN��e4�/��<�(�r�L@�K-J���,S�Y���9�y���� �El�      �   a	  x��]�r�}�W��55��s�<Ѻ$,�TŢ]�'H.E�!��E�*���DX�m�D�%Ep/gp�����}��quxt���Z��.O���ɻi�E3�W�������[�}5���W��Ѭ�}�O�����x�}e��>�S���M�D��k_��9G��~�]��z��������Ջ7�ћ�����>%<@yޝ_5XYt��;\�v��`e\m|���!zp�0A&�� �!Y�6&X���0]�P�W!j�a�,��6F9�Y�!&�Hy�`Af̂ijc�#-L�љ8!(1�4ε��H�֪���<��MpB�A���I��r"ƙ��%MFg�%��U�tn�L�2N�Q��e�,3b����(�3ˍNE���g��Zemp�nd���&�TD1��,Nȳ#[#*�ܽ0�<;r5ZE�	����suw1
���QL��
`�0�,;B�Z&�!�K��d�Q)���:��3ˎ0�)�'���̲#�I
�O~$�3ˎ�d�N+��C�1N��ӎ�}��c�NE� ����(�$�L�����#ƙ�EDa}b�1N�w�H���,?"��'$�����#�G�!)Tg�%�6��) ��(ˏ�UN�U�r#���m���:0ˍ�Q�Z a�)ˍ'���Z�Q�1N��'ݩHYn�8��)L&a}R�1N�8���G��F�3��J�;���F�^���؍NO�٬:kƗ�Y�����&���dQ�M5W�&�i5��<�����Ǧ.�K�_\���a��ʹ�<����SՃc�tlS��N���l2�V�����g�w�tx���G?�}q�6��Z=�\���>e֌g�m<�W�����N'Ӻ:n>\5��|� �?dSle|r�HE!J���iHadT�z�?
���4n�	�K�{,4��!q�ی_�pO�Յ��4 w����'�)4����6eF�t���BC'�62()Y,4����(�q��yqThXO�OB�'���-4��!p��>J��ؒE���@NYtZ�J�A�dd�d���$ѝ,���M��lI�;h���d�G�/Õ$��u%Nz�DI�;i ��N�Qr%����
��6ҵ�$�4�vf�6�	ǫ�$�4x^� ���\I�;i R(H�q%�PY��I�%��!�*��!�4O,�~��z?G�F�м\��{X�K�w���&�p}�O,��1X�QƸ(=��?�Dz�<PTΠ��W�O,��1�'΢&�Ƀb��q��=��7J7<�TM��q%H�B��W��'�N�
�\�hP�u�"�~?��-m���p��K�lY�v�'o�Y�-�_�N���Rr`�
��^�Į�"��+:�,F-Fl��6VXTQ�F�
'�FВŰ�[RE��l1�\1�����j�����,�#�T�êl��b�d1�����j
D�� �bpl�r�``�h]��4����G���x[���EZP�YA�ZT�5xa*�:5�=���0L���l0������t4��������r4<5��47EO�?_b��B�A�ݻ�,���,���ϧsn��x7?Y���믤+)�g+�Q�6(�~�����7��&�v������g��`��;���;k��3F�?˵e��7O�_^�
�g\��GϹ�?����:�N~k�]-���h�)�O_
�O=n�_�o�lW-x�5�)��Ti��ǩ9_qP��[*��H$oW� ۭ�N {ݫkݨ�Vye��s|>��ݰ��Q��Ƃ�Q�9ϗ�|?���������Qm�8�Sҡ���p��T�-��R\{pқ������=(�4^bkne7�p�Ue�-��b6�4Z�`]����.	���z7�7�O�Oר%67��J�v��V!zӱ�T�ZX&��7X��_���)����׏Jnn��qu9�f�����L��bv�O�)��>U��S���Ã��X���y"�7�%��'�m� �j�EAӪQs����t�&���Χ�]7ަ�غ�w��Ԓ�������Jӵ���rD�HZ��Q���l�OMr�6�q��w�x�g�|�W��zT����m��v]�"op��q�s��^�h�'�m����� �]O��_{%T�'���Y�=��ᢏa�	�Ѿho����?%��u�N۽P��G�[j�wR���x�_�ڋE{{������GdZ2��|S���H{f��"l�j���C�Q�}�ޖ��I{�s�\w��+�����-���~T=ul�߿�ʠ�>io�As2�b�]�b^L{e\c����F�^�s���c7���W�5�I{[�k��w��_{���_E�ޟZz|�7_���5�M/���H/ϖ"�t�εFy22?s�\�Fw8���"��G��Cy�|����d�On�C��|�_1?\�      �   
   x���          �   �   x���v
Q���W((M��L�+OM�/��L+I,.�L��M�+Qs�	uV�0�QP7202�54�5�T�� <CSM?g?7O�?�O?wk.O��2�o�)fT���]@��S�.S�v�b��... T/s�      �   �   x���[�0��w?�y[�ļf�0��l���P��ѷoJ)�A��~0B=gŁP��|	�$�]�`��ɮ�a3u׎C��YzC"�1�X����"�Gk��WqYb2S?���X 4A]`lF�.�9�PƗ�.F��c���_D�7j*���8}��&���2��'�-�^zN��O����w�5��j���).�?�$�	X�.      �   �   x���v
Q���W((M��L�+OM�/I�-H-J,)-J-N�+�/Rs�	uV�04�QPwMIO�w���LI�IU
x����F@��@S��O�������9D��_��?����ݚ˓TM����ZfHmˌ��������e�ZeLu�L@�K-J���d�Ʉ�6����	9���/.. ;t�      �   
   x���          �     x����JA���>Eq�;�,9Iu`���5	"J���z��~�P_����,��M.�������t<\O?��O�?O��V��E�����^�{iUV��Le5˺Im�[��ˮ�؋�:�-]{��'b/Z���hi&���#�-{��4Z6{�2%��eD�fD�fD�fD�fD�fD�fD��D��D��D��D��D��D������`-��Z"z��D�k���2��e�7X�Do����`-}x��D62ч������1���m�-��h�l�      �   �   x���O�0����MQdi�lx�-j:�(ݨ:*�C��ۺ�(x����%��F�O\��,��]e��(}՗}Q*�$��h�?yH-OGs��ɤ��K�KyPg'g�����$�� �َ]�&��s6Ha(��t����߯@���:w��*��� �v���Jk�2.�-U�^��!�����d�{o�hs     