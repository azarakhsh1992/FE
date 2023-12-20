PGDMP             
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
   TABLE DATA                 _timescaledb_internal          fedge    false    343   xY      �          0    39058    _hyper_1_9_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    350   �Z      �          0    39099    _hyper_2_11_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    352   (x      �          0    47340    _hyper_2_18_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    363   Bx      �          0    39069    _hyper_3_10_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    351   \x      �          0    47329    _hyper_3_17_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    362   ��      �          0    30847    _hyper_3_3_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    344   Z�      �          0    47318    _hyper_4_16_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    361   "�      �          0    30783    _hyper_4_1_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    342   /�      �          0    39047    _hyper_4_8_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    349   Y�      �          0    39140    _hyper_5_13_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    354   ��      �          0    30858    _hyper_5_4_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    345   �      �          0    39036    _hyper_5_7_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    348   ~�      �          0    39151    _hyper_6_14_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    355   �\      �          0    47363    _hyper_6_19_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    364   �]      �          0    30880    _hyper_6_6_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    347   l^      �          0    39178    _hyper_7_15_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    358   |_      �          0    30869    _hyper_7_5_chunk 
   TABLE DATA                 _timescaledb_internal          fedge    false    346   8`      o          0    30172 
   auth_group 
   TABLE DATA                 public          fedge    false    283   1a      q          0    30180    auth_group_permissions 
   TABLE DATA                 public          fedge    false    285   Ka      m          0    30166    auth_permission 
   TABLE DATA                 public          fedge    false    281   ea      s          0    30186 	   auth_user 
   TABLE DATA                 public          fedge    false    287   h      u          0    30194    auth_user_groups 
   TABLE DATA                 public          fedge    false    289   �i      w          0    30200    auth_user_user_permissions 
   TABLE DATA                 public          fedge    false    291   �i      z          0    30286    authtoken_token 
   TABLE DATA                 public          fedge    false    294   \j      y          0    30258    django_admin_log 
   TABLE DATA                 public          fedge    false    293   �j      {          0    30300    django_apscheduler_djangojob 
   TABLE DATA                 public          fedge    false    295   |      }          0    30310 %   django_apscheduler_djangojobexecution 
   TABLE DATA                 public          fedge    false    297   ,|      k          0    30158    django_content_type 
   TABLE DATA                 public          fedge    false    279   F|      i          0    30150    django_migrations 
   TABLE DATA                 public          fedge    false    277   ~      ~          0    30365    django_session 
   TABLE DATA                 public          fedge    false    298   �      �          0    30605    web_buttonvalue 
   TABLE DATA                 public          fedge    false    341   ҆      �          0    30375    web_cabinet 
   TABLE DATA                 public          fedge    false    300   �      �          0    30383 
   web_device 
   TABLE DATA                 public          fedge    false    302   ��      �          0    30393    web_door 
   TABLE DATA                 public          fedge    false    304   @�      �          0    30593    web_doorbutton 
   TABLE DATA                 public          fedge    false    339   d�      �          0    30420    web_doorsensor 
   TABLE DATA                 public          fedge    false    311   ��      �          0    30579    web_doorsensorvalue 
   TABLE DATA                 public          fedge    false    338   �      �          0    30401    web_employeegroup 
   TABLE DATA                 public          fedge    false    306   �      �          0    30425    web_energysensor 
   TABLE DATA                 public          fedge    false    312   v�      �          0    30571    web_energysensorvalue 
   TABLE DATA                 public          fedge    false    336   �      �          0    30432 	   web_latch 
   TABLE DATA                 public          fedge    false    313   &�      �          0    30437    web_latchsensor 
   TABLE DATA                 public          fedge    false    314   Ə      �          0    30549    web_latchsensorvalue 
   TABLE DATA                 public          fedge    false    334   ��      �          0    30541    web_latchvalue 
   TABLE DATA                 public          fedge    false    332   ��      �          0    30442    web_led 
   TABLE DATA                 public          fedge    false    315   ��      �          0    30528    web_ledvalue 
   TABLE DATA                 public          fedge    false    330   B�      �          0    39163    web_ledvaluecases 
   TABLE DATA                 public          fedge    false    357   \�      �          0    30483    web_plc 
   TABLE DATA                 public          fedge    false    324   ��      �          0    30409    web_rack 
   TABLE DATA                 public          fedge    false    308   X�      �          0    30415    web_request 
   TABLE DATA                 public          fedge    false    310   �      �          0    30473    web_servicelog 
   TABLE DATA                 public          fedge    false    322   ԝ      �          0    30522    web_shiftassignment 
   TABLE DATA                 public          fedge    false    328   �      �          0    30465 
   web_shifts 
   TABLE DATA                 public          fedge    false    320   ��      �          0    30447    web_temperaturesensor 
   TABLE DATA                 public          fedge    false    316   ��      �          0    30514    web_temperaturesensorvalue 
   TABLE DATA                 public          fedge    false    326   o�      �          0    47295    web_userlog 
   TABLE DATA                 public          fedge    false    360   ��      �          0    30455    web_userprofile 
   TABLE DATA                 public          fedge    false    318   ȡ      �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
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
       public          fedge    false    287    4021    318            �   .  x���Mk�@�ŒK������z�!CI�I{j,����.���i!�4K��!�X,<����]���~|P뻇�;������͗n���<�����|�:��q{����qS�~��R�a���ߝ�g��~�^|�Tj{ڏ��o�����x���0��ݸ�V�߽�t{����J]�F���AiӒo	�h���_!T�0>�8��#��~�Z��(|�R`[���5��c���w�|��H�H�1e ���v:����M!-�$�30�B*�%0��ԅ���5̃R�Y ]�5Ѽ^AWC6@�%H��@�4�m��\F�4t�ͪ�����>٢Up�c"Н7�RZt�c"0.���}���.c�kH�5&#�2�D 2ДҢ2� 1���g�ˆ�d�s^a�30#��1�����e�����������>JVdT@�bМ�<n�(S��+Kh�-*c:��������C'c6��ZT����O��ȧC��1�ه�ͧ�^�R!�e�!d�)�8�� C�5Pۦ��A�z�w�j���,F      �   �   x���Ak�0�{?�Ë�b�K���N;x(Sw��4�f��c��KA���Ƀ?����z���r�yݻ�v;���M;���MCu�u�A��zW� 3W���	�޶����[���@=��:%�3v�	L?�Y߽��9�>>m�k��"0匋�g���X0y�pJ��8,NF@���bd󇤼]��5�O�H�)9�<��m��KQ�<-���T��ϭPR9�hJE��X~�'�2����|{�tg`�|��      �      x�ݝO�l�Q���W�$���~Y��"
�WC梌���	�o��}��s]�˔���ED��c?����������_>����O>�����~����}���?~��ϟ~������?��_>��?����_�������>��������ϟ�����_?]�����?|��~�?_}��_��������_���'>�������O�~��~���7���o������?~�5�W~E@�[��2|@x#~#(@��௾�@Xh���������o�����%�H(N�d��B���D*O �HhN�TU� �HX�P�Q��f!�H؜P�W���!��T�SJ�����D�5�
�a���EBuB%�{$4'4�f'�!G�Q}�>�Rk|at5'T���	��i�:�p6AzIز�E���|���n���F�6&U;�]�߀ި`��3�hW������p�a�1\�fV'd�����"\�f6'i=�p5�A؝�w��3�������t�����\%�j4���*��$\�f��6��M��yJW��2�R�.G���4�Pos)��3MJ��4h��T��i��`�ͥb���)	���0o*��n�IC���	[�qCX�F�!�XP�c�e���4$N� ̻�0atR'��耧T�Ӑ9����f�kt�Nh�*GF�ap��LX-4:��XZg:A�4*��.|����0*���!<�B�����L�k}�4����L��ʻ�4�E��Y�  ���y��4<�����E��Y�`�ۍE�(4��3�pHcQh��������(4�;����v�4��h���U:�=�F#���1�F#�mx�['�F#ꄌ�KO�:�h4bN(�NxJk4�N�x9��~�N��F��r���F����#?%�\��h��aE��!�F�������S�Y���0*@�"�4��h���s��,�F�QqB"��[�F�QuB&V<��E�Qs±7�R�h4Z�P���B�B�F�U�zw��4ڝ��x��NCo N�:���o��i!:a�D��NiW��Y �:���&�\�:� d'Jc���tu�A(NH��E�w2��i�:!w�}������i�����ZmW���pu�2�A��3�W�!/�����?��4�e����T>b���<���j��M�f����ݻ��4�Qi�?��j�&�!�J��K��2�D��٥��P�X����Rh����B��g���7�N�j��`�������h5��"����#D�������k�S�JG=e��fC^�_ +�m0�D�jC䈈��y�W6��6�f����Z��1ʍ�}i�6��UPs"F��/-҄�D�v�q_Z�i{q&�1ڍ�}i�f����B�vC�kk��F�a�,���^*��0b��K�`���<��n�'�c�n3�1ڍwY�N��@�v�-BV���#�(7�"d�a?c͈r�=B��jHw{�4�i���$dE{m���4�Qm�I��[���?`o��`�N �Z�=BV:0�	�Qj�E���� ���A�R�=Bc���ǨL�Qj�Ih,w�L��I��x�P-�e�1*`4o���^�	K*��3�!T�B��|S�4a�B�յm��h�	q�4{�j�cx�u�z��!O�f�P-CH�6��i ��x�P-c�����"�c�ƛ�Z��k�N��{��k��k�Lc�ƛ�Z!l�xL��x�P+������!F��6�V�P����"�iv	��D�+t��i6	�b�}SP��!��4��Z�$��"b�oj��q}]A�	q��}B�t��^O5�W���(��e;q5�|U��^�MQ&��lx�
�B<�f�18��5<;�za�ן�3���5<[�z���p���B�(�Ю�4�N?�
�l�D�����y�
�R�LCL5!W�g�P/;��ˡb�1�^�B}x�����m����̃�fVH;�m4�A�^3��y�,�.�4�(F�AqD&���3i�NB�0{�����{K�a4���I��Ƅ�4�!^���f Z'�,��	1��_]�vjό���.��F�g�bt��jr�(F���*b�	^�i"b�H>)��%숤]��6����E㊘F�BΰE;�_/�ό݆�#�Q���9�h7���j�M7iF1D�&�sm��&����a�6��S��(�yPC�0{S�#��7�ކ1Q������}�T�r;yf�h7l��*�]�L7�n�:��\��3�b�n��j�v�1���<M�!7!t����+5�6C'F���(:�R���(7����݃�pU�J�("�t��|�׈��>E:a W�/B�&�Y��F#^�2��k�^^��g�P`�&-�\mF��d v鬛U"��2��'�C�'���Ɉמ�o+�^��4,^y��1�kX^��b�+OԷ�\��E0��ם���>��y��!hX��m;�)�f�3,^�1��P:`1������Cw�h2���+x�,M�B��!�+`�Z�2,^p2�H�룧L�Qg�9"��k��$�b���uG�V+�_,(���(��NI�*P�;�Q[���+�F�!v@��v~��C
����c�1Z�#������B��w=���wsi�1�^C��T��#�D��k��1��kد��e�#&�0�
�(�nv�i暐.,^g2��q�ϢY�1(��יDkҏ�3��.,^g2k�}w��1��#�/z�3F��ꄽ�1��͆��h�NJ'��P�yF-���{����b�پf?K-�ta�jF���֌4�!]X��@�y'[6�Umt^Q���a<���B����/jQmUw�yW��y�E-����9͹[��y��X<|h�U�qu��_�����;��6:�����Ql��&�!H�y�E+`R7���F1��\��6v]�yf��6<s���@!jX���C�0M�6!iX���(��&`4�����j6͆͆g�`e��ĳiH�y=D+��e?d� ��Ξ"ub4�����i���lBְ�"zA�ݲ�g�و�r{�g�b4���,��{� ��a��D�"��f�<��m�<(����7��^L�e7�Yj�(��(��*c#�N7��AK��Fg�`���F�L��ݘw�x[��c�wq��^�a7Z�n�σ�ڍy;��,���|1�s�ʍy?Ͼ`yqI����"��;j<cI�d��$9�(��a��X�-DĖq��Y����K�N4�����r��`����΃�ʍ͠S,�lw�l��&��:�ҡ��L!����a��OX���������>�y����A���a/u�o��G�/j������Pp�|����g������a��~��SD�|���-O�T����JEpl�?R��o�g���P��4��Lq�����6�:��g���;�<[	���f�37J[��>$�̨�>����7����ŖGJCΰ̈́Z*����<0�oNs�R�m�ӎ� ���ȃ�.�6��<o`����Fa����������-�2���'v�6	|�������4�Qh<��	=����ng�����y�Ϣ`��;(��Ґ1l3�����a?�s�d
Y�B����:�Ƕޯ�����|�F�B��̀a.FM��5��߉�-����RɫN��Z'b�E?����Ҩ����;b� ��jB���|a.��X��&b�b���/,��j����-ϲ���~�y5���n���y^���"q?����qI�������9��4�;ɳ�+�~����}j�'t���6�%$��I��t?���N�gϋ����~r(���/���Q���̷���$�ޘh� z�`㗞�������W:].������1_�r����/�j���?��A�x�GP	l�3���֝����pi�ZpGX+��p=¡�1���.ͺ�!�	��޻�s�%���%F��ou�R�g$|ih]�<�Q\D���%�2�ޣ���*�F�.��1�( �  Fq�:݌*�1�2ѣ�Ȑ*�Ѕ���0c;qp=1����D��K�g��&���yQaFT: �!Z��#
c�N7YT��5ʎ�,���̄QmT��X�9��2D�Qu���-�n�!j�z}�w$ǳ�T�=C����*??��MF��p!��p�a�;
=��g��ΰ����5��C�����[�/{p,B�8����d�����_�6 E��y��fB\���·��7�ޓ�s#���~��@4��^#�\���Qu V���s��.썪�)ȥt.3�j0썪�+<�s#������b�5K99�j3읪ql�=C�dc��IE�e�ŋN��xc��hQ����<�uf��`���6E����v��#�.*̼Ϯ���Ϲyࢾ̞b��B��\"\�׉/7�'�P���Xϵ )�g���<�QX��
ҘV��P7bG$��v�s� Fe!t�1���1�Q[�Q����f��.��p)�� �C�C~�k1�^M"�D�C�u<��d�̈�f��CJcyl �!�y��Pu��z9�O�͆��X�����Ө6ԝ���^�<�Ն��[�3��puĮ�`]s"F���Z@��#%ʍ��ׂ
��x�1ʍ���R�tb�/K�K��j�/N��J!1�J�/O���!7;K��^��x��_+e�Q�v�E�Tm��RyrY��x��_+�c�̎*�n�Hݯ�+��F�/R�k��nӟQ��x��_+ży3!F��"�VȤ���_�N�A�v�EꭰY{Q��l��h7^�ފ��]�r�(7^�ފZ���4ȃ�Ƌ�[1�m:��*F��2�Vjņ���<���K�[iu�K�0��׫��+����ƫ�{�ʌ�έ4���k�{�*��%2#�j#�������������:�^x ��9-%�*62��{���ll5�u�h��Gț�f#���kD��̃����J�^j#�#�Ql5��콌�FΘNW��Y��Ko��<��ڈ�h�i�6���܉��������G<�5��#r�*G8x�r����zM_f�(7�L�h�3�(7��E$~}2UӤ�r�r�:�!�,<M�L�r3/�)�k�#�F��ꈽ�ڏ8B]sqq��� ��#�4�kL�#vG$ ��[td��ͮ�'��
,^�?8���4�F�!r@�Ͳ�0zyoF1�9>����)-�D� ��4�ؠ*��f� F�!�ît�m�P��Ґ,^�NT�y�f�g��Pw@B��,^�N~W�4ؼ�y�-���Î(h}�y�3��f���wΝ��Bp�_H䄆��V�,~�� �u�-\�\��!6X�ҥ��x�J��1�J�~�k�D�wNX�Cl�x��������R��Qi�9 �J]KN/�y�XCh�x��}����na	���=C��e�N���<�Qk���C[{N�(6����/W�F�f#~�Q*�2#o8���`񆚁ؘ���� ���lj �>�K���k�~����Rʗ���!F��[`O�vyy�̈́�F��s�����6���:f�~b��5�4V~=bC��x��@d�KRdj��6��`���,L��F�ׁ���47wHV/������7��Ӽ����$��m�ˣ���xP�kJ��n�k��q��}���ۙ��/������^��^��Si����9v��*�^R;���_\l��3=��ըW�°����,�s}����`QB��z�)�����uzΡ<�����dHH��ѯͻ��^�"�V�I����M�)b}�$������*��k��b�h5h�ؔ�^n�1͚��=��{�̨5<�y����o�D�˺X�o�h6�H�	���0B�PtD1`=1��E;� �Q�vC�����Xx� V����/�#����p)`�a7-���QC�z5�@�E�X/�yF1��#rE���h�i���A�^.5�P���|��1�{�w�*��x��\[�B�^N4>n$����3�g��pu�^[�v?U���>mҬ�!}X���zh���Sa��&:Y���5(�]N�m��<!|X����{&�3�,�`�KP�6��|�y�f"�R#��Q�xN�`��Ԉ9bkݤ�e�֖	1J��%�o i�%�9�V/����ClG F�QpDf���f�������B��z��@�^��)"'C�n�~�l��(ޏOs#F�Qu�P����1d��H�.��xP���i6�!yX=djAPŧ|��y3B���ZH�	������J���t�X����Z�o�� �Vᒖ՗_ͳM���4̭\��"b�Q\��f�B����6��<g!q�fذ���r5]_ ��*46���(�=�m�<t���Ls]��m+^�e>�L �R��y�t�y�B̰ͫ��z���'^#B̰͛v[(��Qdh^a���@�2C�jR۳71b���D�f�g�b��Y�3��@�BC3K�Ҫ�1*�,e��/�v�͆��f�2wlP�"�\n��m޵ۇ���A���b�ol!i��M�����K�:	�z��a�z�5窗k"l��<_gBаy~��k�˵�����L����ʖ̈Qnx����ϾA��.F����c����Q�r�3�WD w�yF1��;��^,�^�-Qnx�1P���	�b��a�)��gF�r#�n�.'�1�t��������h72�x�.�`����L�e�J;σ�Ff���Uf����L���\�ok��b6�s��f*�(F��y�@��ؖs��?b���c�h����4�!x�<��+��h7:syI���t*b���R�"��43j��YF�C�~ĺ҇�+�d�� ���h7����Ż�q��yqD���|K��0<�{*�#���n� �v�_�X�l{��g�Y��z�x���	;b���k���E?�9�?\��O<@�B�,\C�p�����؍N�p�2~��g���S�t�1�)�/�o�vZ��_�a�,���e �=2� �y3m�Q���f�"��(f9�/�o�3T�EK�1Ϣ����af*�,%)�e ���؍���0�_�g�iW%���/��cG�d���D����yl�wj�W���-�^fb����@L�o������؈��QtD�#7��o��j�K7���b�Q�r�w}��jk!\�YZl�ڐ��m�)h}
8~9Op�bT�R͂D�#&R���l�:!�H{J(�fᣨ5<�QP��W�������M�^ާz��k�>Ϲ4KջR��*���:�=E�\+"E���ڪ��w�ifS�^s+����KDJ��F���ڎɦ��pJ�.F��6��bmԟ"b2�h6�Q��ڞ1���#Vhܟ�`.��6��8��kzV�Q�h7B���3�:%b��M�6�^y�.�9��h7�3N!�О\6�h7�����"��&���v#��.��������q(      �   
   x���          �   
   x���          �   �	  x�ŝA�]�����lf�؅���T/�,&`�8�6��&<v �>R݉��]�29+�1�{�#�:�^���zs���7������?�}xz|���??~������������=����_>����^�}�����w�|x���ȿ}z������w����w��?�}'��ݷB�_1��t�|��5W_�!�6���O_��ϟ����������.�tio�w���?<���f�0�F�L�g]�B��pvl��f�4TW0/u�6�\���JX�և�갂u�t���su�ֹf��1h�
&�������~�fQ�Ÿ����&:�@�a�C7�!VBߤM�&�7���i�x�X���{�Nu����6�e�`ZB�fl��LK��
��4�Z@_/���+�Uh�|��ކ	u�V0_/JQ/�H�k��6��,ř
-���G���,���|%Y$����$k�V�,X���i���
�k�5LpEZ�|K�*M�N�
䇮�8�n5`�
懰�O�`~��X�.���
�ۅ��9\�%Y@?t�h�Ȃзc|���fV@?t�h�T8>��v�+:6_���(�o�:z���h��Wk�4'�^%���]�Q���}��F�|�6&�	�a�d��0�]���(�o�FAV2?|+	M�uF�d~�Vfˁ+�?ҷvZ6q��C��a�pV1��d�7�-�Y@�'#�%�a���H��2`�
懬��h*f���m��/��G��E6��Y \$:�a�@��]yJ�� ��Y"_��؋:�/��ٯ1u�v�D~4l]�������o���|/��)6o"�5�^2�s���¼d~V�������$K����̱�،p���3��0�8n������M�p[�CW��h���U@�u� ���ܾ���K����c����sW�G	�%W���5���
��m\�I���a\;3pz�J�o�!�W�|iw�������]r!wI���a��d�q#}����`���~X��yP���~O���X�}�^�z�hE�dYȯl�K�����T�yM���M�� �?�C�,vJ�:�/��f'��g.���O���{�	��@��\��������u������#�<1��<\�l(�^pϯG(�n�\�wg\[��W�-��В��gi�ǩ�%���!,�%4C�Rҟ�q4q�q"K	���E��XI�lH\�(�ҹ�2
�?�q��a3�x��x�6��¿��z�Wl�HSVt�"��]�D6KUB7�����*���i���\�UF�s����[�B��O6х|˪����S�/C���[2��%+�/yp�z�*�����ta����c�E����naё#��*��9�d�	\�UVw��0,X���<z����*���Y�J-��]�w8����"����A�ȣ\�uSW�BF�=��-&��(.���ۜFH�QDvS؊g��<��Ef7�u��9�ĝX�"���F���"�Ej7�Ͱ��H�"�{[C��q�Ma�MaG�"�bSr$Ȋ�n���@��X�M]���"�vr����z���tdEp7��iX'�w�Sr7���m^�/�������k ��|��ʤ�Ւ�[�һ�0kk#��)�{(�͈����=����AG�� o��}-Ȳ>���S��&�{�f�9�)�{(�Y���o�-�a�%����=�Y���{��=t�	�x�Ȏ���=��&FڲS�wcj���.O9ޭ,vl��ז JV�l��B����n����� �¼��ՆB�����y��˴��D�n��cM�i��;�d��ez\�9�[:�ya�nq*rY�򼇲�t�#��S��6��"�i�S��P���n��D���e������O�ޭ,g��y:�����:�<����L�#��c!����-o
A�§X��[X�	���)׻��7�����)�k��S�؞!�(�-�a�1,�8��<E{-^����@f�N��C��Y�"o��S�w���`�9�X�U�W^��2+����i�ͳ0ρ�u}��,�T���<�p����k�p1zud`O���f�BԄ@��x�0n��(d����*�5�ܲ����Wakߴ�:�!G�J�^)3m�l r��=��OJ��X��8�[����e���.8�	���g S$��n�;�e���R���5�:y�Y��zљ?�z�`(|K��+�%�x�H��-�C�J�$:�&��?�#olN]�3�·�e�%#U�Ig�[�oa��CasA߲[�ʬW^� |K�C�j*W_�!%;��d�r��u���3�S�lCl!����<��2p�"r��CXo�z���-���}F����=�[�oa�c�82�"�_�9�	���Q�o�BT��¶]�ڡ��#2Nʘ2��.!Q&��=��ϗ��K��ſ$��      �   O  x�ŖAK�0���a�m��佗6�'2�M��n�됮���Ӄ4������|d��,�b��ދ�V��iW���9TǶl�E-���l����||�j?�nx<�E}./K�[����L<��=.7b
`�b
p�a�Qh�xC-X�+�'q`ۜ˸�MwX>�����9I��춨O�M�*%#�r	�O�!(Q�*�Qe^��%��J+�(�b�E)�� Ye�A*�A�"+�"-3VY� ʌX�Տ|Ċ-i,��~ῨH�)��y�<�.�eQ����w�8�!��G�I��9FYi�;*#�a��>~i0�67����G�XR��WY��' �b      �   �  x���Mk�0��{>��%-s��7���C��A��j��%�^iRط�ܲ�ɾ���1�$������n���wU�����Mӵ۟��pj���������XS�6���I]��߽��Kӝ��[��kN�]��^�ߖ7��*5G�tp�N���q�:K_�+�zX.+��t��K���l��(��#�v�1c!Qi�D[����(�A)��!�u�B F)��c(bMd�u�PnŢ=�R�燨����z������6�O��D�0��l<!�R�c1i���YO,!�)X�Xy�!��/7Vy�
#���MV��Ĳ�o����Xy�!����v�S ���'�DC�!��Ǻ�#:�+/<%TDJ�A	�\y��\A��r9W�y�W=�4�޽g~z����ҚŤ��	��kʓ2\؇B���xԅ0�`��k'����5��2�      �   �   x��ұj�0���OqdIB!��YR�%�&�*T[�&�[l�зoܐ���j���b�]?�����ͻJ����6���ε��ߟ���2�e}��h�f��,�/���3M[7���᣷M��ׇǗ�L���l���e����I�Ԙ�;��)�];�n��tQ,��t�M��	x֝Yp�cF
"P��&4�E�hx%��pAPg�����ТES7eHx�2��b5Cz-�F*�4v4dZNђ�+�џ      �     x���=k�0�ݿBdIB�;�dK�:d0����pm��n��B�}�~�b��"�8���N�n��;�tw�ev��]_�+l��k�����u�,آ:�OlU�![��������}]�k�Eջ��l]���Mv���
B�D��`��@D��%�$��,C6tc����A:��2�c�%^�`��*���c��4��F^�ℤ$yh�ɹM3 #�!�$Q+9�|���Ҕ��kPyvm>
5WJ�Z^t����H�"���v�,���SZb��4��|�?����F      �   �  x�ŜMk7���/�$���O�h{�!�@i�_W�&.	uӒ�����vk�Jz�;`08�~���i�W�|��.������ͧw��}|}{���w�?�}x{_n����݇���o�|���ٻ7�/�������_������O�o?�~������?ܼ{��姯������g��/O	�_ �`� l�p�� ����_n�?Ư����B���'��a��M6�nΒ˦+6�"`�t�P���	����6����fWЌi�vb�|F��&�4w��+lƭ�g��aF㍸TB#J�Ħ����S�i@����.梍F.��K#&��h�pC�h�̰ȃ�F�oȱ}p��ND}��-RT�梍>�ϴ�{cK��F�h�Ӡy��6� ���X�r�T����
j5�T�QZ���qn�+�6E���Dgt4)h\��m���MDR#��h�b�@rö0B��-j��$]�uY�	V^��<[�B	;[6J��F�D��f�6����8��ZH�D�Y	� ������p�i�m-uo�Y	���ԉW��D�Y	��Z�sk#��hb�Z����鬄`�ZZ������c�-`�):�@#3����f!��H�`�M�:!ؔb����N��N���s��:�@��+�+�.�:� ���͊ڬ�����ܱn�}p�Utn+��6��_���SW�B;�iC�5B]agsv�ԁV]aGk��A�j��6sR��-����Zc�E[!А[�]+!ؚ?�FYlk'P�]�#]+�J�L[�JmTm,BtVѾ����6����'=�Q	�ZAq�Msue�6,൶T]���@�r��J�_N��N8ب��*�G%dR���m�G%lڇm����6�7��"lI��Q	l���#M
�h�T�9��/�༙��:x k�Q���Gh�p�8�����Ĩ�6x@3F��}��6��q���j�8�HJ�6�`g퍕hn]�Fl�hk�;kk�v�����.O�Nd}p�Qd�)���m����}D)ɉ0��@�⃝s�F!hZP�M^l��T�r/A���f�"F����	;\ƖZ!,��]�(�-w4����������߿��l�m�B�D9y�-�����&w01�pR!��CX��7������5\+X�"O�q�0��j��&ߏE��p�����g5���C�!y��Y�}F����8#��z�g��{5D/��Z|b2�\ak\e593n�b�Vİ&�#�+pM�$שhS�������_A��=b�����4pI���+8��5w2��W�µ�r{{$�G ����d����+5v_H}ei6ÿlFmu��̸�f`� :�V[Kn�i6C��&��6~&�h�oG}Ib���+�F7<�)�徚�4�!ش��6v���G7p���\��膝�_p��i�7�a�#/� w�ģ8ʤ��%9Uy��)�V�<�A6����o���r��j?Z��	�9Q�<�!�j�C���z�y�C�E���-����r����R�����2�a?�	q��^0C��M��x޹�MF5Ԟ����܏.A�P{.�~3�Jn�$���V����߉�e�`���Z�Gߐ���'���t<)���V9��&�~�ƣ�kՒ��+�pVS���\�.��#r7_��me����϶'6���v%nO���Ԉ!      �     x�ݝMo7����\�`��*�I�i9Yd���Qpba-ī��E���=�<|���X� Y�ǃ)u?�U����}���/���_������y�˫�7����{s�ꭻ~���7���:��/o>��z�������͟]n�n�������~�y���������������?9~��V�+�������o�׷��<������w�/$�|u��<�W����@�R�1�͇ϯ$Ծ��Oo�������'��/'�*�J�*�#Q��*�y�����_k��+������m��x�#�X
�B[J���Z�.���U�O�M]��	6�(�f���e�9�#[T�����<�����	�V�qI�і��_\�ѧ��dRZ��Ev$|�Gm�׬��Z��H��\�ȕu�L�����r��g.3W"p\�?�rrQʑ�(-D 6��z�������w���Ѹ�vo^i%�A��w���҉���ĵ��v��ֱr��5"�`�;R���I��y75�`�;R��x�F�f�v �0��#U��\|>5u!�0V�u�*ޥSS�9���ЎTcq��<Q��������q���1s%�0��c���K��RֱTY\����X��~9��[,h�0��RpYq��<pT@8U����<K���U0 �FqQ.��\�@8Lp�X���p�l`��Q*�v���7"��0��ݷ(} tC?U �Qj��-#
@9���;G��W�-L�>P8W+\�ʱr�w�/�{FΝ�عs�`,��~�J<W+\�ƱrIq�.?���ϥ�
�{G�g'��ە�+�έ�
p�PCޞ������#Ti�����̕��p�ƕ�RTo����j�۵^�x�q;�"�X�bZ4we��v� �AUą��{I�����6�r��h�	.�\m��J}����D�]L�
1�\�:��}���y�B`6��up���zZE�t���!knǎ���H�0`R�8�1�<s%�0��Czz�G����u!���X>���@;Lp�}?,��w�3b�axG���#�h�J��1���l�a����v�O�r밀�#�tȬ{Z%��5��\=�"_���q�)]��I��Ρ�!��
������Ԕ�n�Nj�RÓ47�CC,�.`K�|��7u�0��c�ѻ�'l�BÌ�Xz�ERޖÌ��}�/&ՓC"�.��/����HjXG�Q��@R#X�9J�FH�0�4R;d�:Je�"��|�H�p�(=������8R3`�u_�8��#C���8Vs߰#�l�2���h�����z�H�p��ѸbpˎY˙q�"56:G}ز�>y��(R+\�8BO��ݖ�H̀�}�MT��BC�.���t<.)�l��F�����e�ۗ<䑞�J,�'x�#����z�@�q嘺�t� �A]EuLq�V��spO Q�4�!����$�6r&.�!�����{��f.E�Hjxט?N�QX�@;Lp�f��$M]��;���>s�U�?0%���Cz����,�LҰ�˧�*�d�������-L�����K�#ID�ڱ�-��,d����q<bV��"�H��ն�rJ�A"�	.H�~qt�t8���$5�#U��6��)y�6��s,}0�� V�-LHjH�RCq��đ��Ʊ��:]�60A�0G��"m-g�3 ��0�܏E+���đ�q<Xu��4���~S�m>G��bqDʛ+ ��H�Aw/��Q*-.�N�T�^y�F��x�ʴ=%��Ly�6��w�����m��#�Gjl�է��t��t�Gj�k���E}沨n�HR#`�u40.[P���Ij�kt���L\*�`�LR#`�uP��]��K��6��s�~�����L�IJ�y�qG���/�\�9B�8��T7�@(�0JJ���r�oj. +WP��� ��P��,�eGGl�B�aHu�Mr9w�J�a�8�}{κ;b �������[� �� �#mTM|��.A�.�R��ި� a�6��mH��6u!۰tC��^ٳ,;s)߰|Cz��(_�y���)^u������F�wA�0���wYw$�@R#`�;bO8��z y�&��s�ǕF�� ��z�Ŷ0�s6 đZ��Fڸ8;:q��	H#5�#����'��Z����YĢ{�M@�0�K��ũ�xEj����3�w-$�� I�,F�:A@�	,`y=�JT7c��α�TU�"�!m\�.�n]
H!��W����mk�aHG#�#2HP� RZO)}�&���@����C$����Q�r}�q\�ԅ���h��[��� �F�F�h`}�Tw�d�60!Ǫcd�����+&'�r��̅2H������iTT�� ��5ZG�ZS.�M]��:l��XO���8s%�0��#���\.�M]�@:L��R��^�8U��gbH�`�tM�9 bHmp�X�$�g�	H!5����S*��@
�. ܓϋ(o��R+d�;�R�V�t��R\�:��$��83"!5�cY3,�`�;���%F��IA�.�yͰ(��� ��Ў\)���~N
BHMp���%M�Yw���rYՏA�.��o�墻�BH���(����\3"pX�qD�#�D�N2H;XS��Y}A�,�?��а�j��F�F�h`�]^.��\��p�5�/���^      �   W  x���Mo�0�;�"ꥭF-?o���v�1im�c�J6��x��o�ǁ�-F*���)���������}1��*���W�y�.�ٷz��6��ti���s�����q�[�,��aq�^�fլ�Կ��]s�V���x~���;���7����ɛf�yZ׋�u���������aq���]XY[����Y� �괏_���H;���:���~?��V��y#�V���x|�z�}�����N�(��m�lLF��W[�K2$4Q� �%fM۱Qe�B0�!��+	@j+c)��D\�6Lm�B2�E��ކ�� ��5��#����8Jp ���s��Ʃ+F�켃�q�\RV+��J��i�]w$����_ 	hy,c��}\�UE��s�p�XB�8��H[�����E���B����08�%��6����}��mбI,�荓��ۆ�-�9#R�?�T��F�l�t.����;�>�Jj�
�8�5��s�F�֦=��ͼ�ts��\{�� �����]��0�`�jn=	��T��FJ��f�zU�suc��4r��S�֒�qi.�XN��.�G�\����$�cʻ�P7��6���p~�~��f      �      x�ԽK.�q��ϧ ���Ѝ���U^ v�%�X�%X�]�ۧzn����3�K<��CJԃ�w�7SUO�տ�������������������?����?��������?���������������?����?�����������_��������?�����������?��?��?��w�����w�+�?9�������7��������w���/������������/���1��ߍ����#��s����ǿ������2�������a�g��������/�)0Qa0���1w��������f���_s2��l�k3 �*E_��ӵ ��l�+F�/��!�H#!����I$�\�QY�aF=��� ��$&��&������6���Qţ��j���`�_�$x�`F@�0X<(N���!�	��b<0�D�u�8	�!mb�<�R�͏"'�� ��1*�$�04�wT��G1I'X<��ױ�`I���6H�`��$y�`�俺b��%�� �8���V<�I�8����`I��y3S?��"X�<N0�c�$I�aj�6~q7�yH�<N0�wh/�$����-'�W<�I�8�DeHa�$x��P�_�;v?�I�8�D;Za�$x�|k��;�,I�;�I�8���2Y=��Gc�wh���c�ØD�L��p]0M��~7'Q纥ZM��~�[�@��l�K�d��,R��#�I���5v�u�����L�s�"�&��>�Q���m�����)��K��}�xs�U�o���D�̜�7��`I���f�}�ꦸ�Q�$z`��Z��Ò�q��������Q�$y�>�H
�����7f�.uS����s&(܉ik�`���D_���w����B���p_�k�8>��]���m���V���� �)� |��$�;..�/�׶Xk�,�͇�׍��f�������'�c|��pE��� &���d�^�b%�c|��!׍����K�R/��=Ip�2��+ض1	��k3��8o˕���L�Ǩ�W:z�82P5��dI���nvW�~A��Y=I00;Z��`I�0�+�|��U�,=��n����l�K�$��;K��&|�=*v`��d�}o��,u;GO��I���W�Fۓ%�#Ȭ��M��4n�3I�8�"ï�KwK�} &�۬8F?2G'-M���)����c�Ø��Q�%��o*-�Y@N�����ђD����v?�I9��]���aqw�$��z��/����g1	 '����ew2H���_v,n~!� �a_tr��$������:tŲ�$��d�
���"�-^` ����aL�	F�2X?L�.ܴ8 ��!i��Lʖ�$���8�W]���%�� ����D�B��$~d��*�%�C�=�;2v�L��IF���`k�`<�w,ܑ9��$�ց�(<J6�i�1��43����#}��l�Lg�b�����gq��Q���dk 	2��R�ۙ9��fl�pdL��6���p=-���8M�?�7&���W��q$N����Ox_�$}��r�O�����Щ	����I.��}Nn߳��� �ֻ>^`I��� L.��7�)ˡS���6�%V������Ք���0]3\��1њ�d
V�,Ir��IM߅���$}�`f]߅���%�� s3�-�#�N��:X��bӑ�MY?ݛt�^ؓ9��EF��dI�8�w#9��M����3�p[m�6�9�?�3�^�G3������u��=������`�f�}���a�.ͱ?g�f�f�7��ĕK7�&��@�r��s�b�f"8�����~k�,�6Ջ�Pya�H��'�`<�*�%�� cj:�"��?�=����"�n㋉�}ɒ ��QH�p�Ә$?l�c<������1��Fb8.ĩ��^ث3����1�_�1ռ��?2�6����X�{���q]9�X�Ӡ6�����"9}����]����q��,ܑލ~���rz�	���a����q�E�W��X�Q�XN0q�«�Ǣ9=ȸ�΀��Mm,���a��Et`8�]"V(��x,�� ;��w��.�ɒ�q�Q��KP�";=��Hw*����No0�ޯؾ\I����"��A����wz�q�z�*�$K��E����a�Ø��,~Y(�;����}�޽�YL��If�*�%��P-���yqў�X�G],X��c35��ZaX��Avtg []�0,��L�}�b_�$yȴ��;4�{��g1I'�<.��`I�8G����=�I�\�Sw� ��ƣ |a���,&�� ��+�aQ��~�ǣ��V~�Z�Eyz�y'�?{T���y����&K��y���l,���,��H�b�:,�ӇL��Qxc�$�|}���/����$�`�|/,	���^�aLZ����|��dI��H�X���&,�hjI�$}���e&�+7��"<��ص�,��@��� ��.hX��7v���Q,�>����A��
��M&]��,�Ӄ�)XG}���{�r���Y�z=�$��l��.X����t|F�m��G��k,��x�������Exz���\�{�FX����*ju�#`��5��F0T��.]���O��-N��6V�,�O0��RlM����{2�d�b��`���XX���� ��s���m���;}���z�`��~8f��o���Ewz�A���s�[�^t�7X�=�r��;�O�ٲ�6�%��g1��A���>��A��[G��6���;���3�j��wz��n�x�Aa�:,�� ���i|�X���-���XݞuX|���송_�
�{��C&]��,X|���Y���o�����"0���:���ބEwz�Ń�W�K�Ewd���~�^l�7��ߍ����� ��">[�K~8]l�7ǯ쮻�$K���������b;}�����,	|�����K~8]l����w���dI����B,���=�I�8�l�&.̕d���̴�D��C�}Pi�$}��Z'�#�����MƝ����:=���H:���â:}�����S,Iz�������$~�dF����AҔ�}�ƾ�1�'������4�_��6>�I���DЅ�&��uz����E}s[�Du:�3����+� Q�^d��K�%��gw�ܚ��NO���R,	>+/��<�J����I���r0Q��f�8���i��FdT�
��N��E�B����td��v*\RJD�	�[�G��D��o�{��$���/6oL��s.պQ��0���#}>}�[���X����*Q�^dq�(��JT� s�w�}pc�$�dԅ
��!��΁��aV��&�Ӌ��qg�K�|X[��R�hLt����Z�,�8ǔTpX��nLt�'���Wa�;0��B��~���w:ɤ��e�����4Ȩǝ��%��,&���"P�s&�� ��R��^2W�&�ӓlvWy��U��N�漾�%��vz��:WK��ql,�V��&�Ӌ�׏�dI��Y��.���vcb;��H�4X>��0ߣM
�>0ѝ�d ?�~5ɒ���da:��6wc�;��H��5wc�;�`s�B��:��,&�� #oj:ƻzwc�$d����KM�$�L��-R�������R,��6�u�F�NaLd�'���V�,�r�g$����c�Øď̻x��nL\�!�EP����{�����DK�~�h4�����i�i V�_����"��ɒ���b,_���=�I	2n�G�/l%��xd4}H����d�6Q�^d���o7&K2���Z7(���(O/�H�R��#Q�ؠ�8~���YL����}8*�%	�
S�Q�M"���=�إp�G�<�`�:���{[��g1�'�8��a�<���;Sa�&�Ӌ�|p�ҘHO'7��w��ڒHOO0��_4�K��f$�%�����"�nV�,�>+0��ph�{��q�    �xd�%����}.�R������"��f����d ����L��'� �;b����qGW���1L���Zd_l�ݘlMA�w|��WllI��'裮��)�9!"��ߒu�Dzz�)�ʭ��g�j����H���yz����`I����J&㽦��aL�ǁ6��Py�9&�S�O������?���\,�F�3��W��=����"�x��I�hO���?`%K����3DS�L���C�;�T�DJ������p�Ub=E��c�2*����zz�	2Bi�$~�th����q�ӘxO/2f�L��`o8�~�.Y�M��s����D|d���q0�څ1�^`*��o�K�~ؚ��Xi㳘����H�^w'&�ӋkNϽG�}���AsDD\�
����{z��R�y�D|dܛ�q%�����OO0�ZX��xO'�,�8ݍ�%k҉��"c7~��1Y�>�� ��~$��L��p�N�=�`ܺu������$~�Ԯ���5��{:��)=\�0��{��q�q\�w)Ү`�xOQf�N<��*��Rb>�Ђ�r%��i��hC��w�ξ�1�'X�G]�%�� �,�������g1�2w��_�of�Ȓ ����pwIl��D|z���R����i�o�B`�'%�ӋLF\��d��4�f�)���)��A����gn�$W>t�(F�Ũ��G1I'������)ڜ$�g>�`#%���᩶��J���
EG�ʕ[JħAF� �/��^�$}df�x�ܗ,I6}&"��ֺNJ̧'�v�C�&Y?|�1�x�}f��OO2|�/5ɒ �S�d���.��$1�^`���a����B��X��g_6>�I���g�)Q������~��J̧'���ס�|J���㠩X	��|`�m�퐠D{zr������Z�GpQ�o텭ɔHO/2�g-}M�5{[`�u7fS�<�����:%���Ac�]�Q�n|��1Ѽ�o�_�l�����J�[������$}`�z�D�8O'�����/S"==ɴ�]��x*%�S����pn�H��'�~o��,�0�֡��-%�ӋL���}sc�$��!]��Ko)��N2jn���bJ���l�aY�wSܾ7�$XdƸ�xݵQ�HO	��#n���q߳�XO�l��S�^��#��^`��bU,�8C>v'�\L��w��㩔XO�����S]�%����K�%�>�7���K�n��$s@��E�D{d����OV۞��{z���ҭH��4���x��3c��m">=�\�rY:1�ұ7[|Ȩ�ǠD|z�Eb$-����O'�5T^x3%�S�H�>�
2(1��`��ї�`I�����c�=�U�~�hO/2����$K��A�<]�Ry7,%�ӋLP�
nb>�h��(�+��$��L�av�)J�%�C�!��ʳ����"SP*���|d�q�G��O+��$����}��%Df�w'(������#3^SL���t�o��UllI����La�$|�F�`Rx�-%�ӓl�V���dJ��A��l��
;M��	?�q窒`I��)k��QT
ץ�)�g�M2Fa�G">��"}xa�$|��s%�ʓ���t�y�/)��{d$M��|Y���{z�����%���`�C����d�6ў^dʨ���ɒ��1�}q�ߘ,�'���,���i�Ao��PXC�xO/0�q�*	����H� uK���O/��^x�-'�� cj=.���^v=��hO/0�[~�==�xO���w�/�\�5�L�y��heܘl A�8ȸ�N��'X<�Q߇��[�G��찲A�OO��b���9Q��8z��=߬
��pb>�1���uiNԧY���5V��	�犔��E�bߣ�䏓K}���D|�S��:t��÷��O/2�r��I���tm������}c�?N0�AuW�pb>�`ִw�b���g1	'�KK�ApŅA�:�� ��6&K��AF}<�X5ɒ��\ՇZ]'����b]w'�S�ى���[�6>�I�8ɤ�ze�$��d�4އT�=�I�8����+��K�����Zx9,'�ӋL�~��k_�D}dd�I���D}zq�x�pI�$|д��,Q�zˉ��$�{��؇�1Y?������;��OO0�ߔ���J��M�^�*��OO�`T�� �s}Z��6p">��h��O�n��O�gII��}kԾG1�^`6]�ɒ����"��a�}c�>2�+�-4��O'�72��9h�����YU���dNԧY�|�\�Nԧ,�ӽN�}Zz��Y@N0",,���|` �z����(&����yPx���i�!7��,��YĻ'��c������)�������|z�aj�,I:��&���Ul�Iħ'�w�_l`�,�:M-�G.<R̉��"#��.4٘,I:{j��Z�>��{z����~���=L�� ����D{z��l�+<Ή���3�f��G�Ώ�zzqE��rN���X'(\�N���(|���1Y?�Cކx�d���$|\�ը��(N���}zj���}�b"=��Ć�n�Dz�ǒs��L���p&�Ӌ�L +�%��? M��nCJ��'�v'����Fr +,���yd,m��\�ĉ��#'��s��O����}�7B�����F؉�2ڢ==��[<�Օ��=��dt��k�xў`DM}<��J֤��Mf�YU��� dc�]���Ⱦ���r�a�si��">=�6��rYz�>d��^�[�,� ��x�3�^��cQ��`�HXw/�������}��b>}���Y�I�$���ͧ���θ�aL�	��V�_g1�`�7�W3��ҋ��!c �\q_̧z<���&�U��|z�N�����[��F#�\,�8[���a��[Y̧7٘{�2Y�?p~��Z��E��ͥJ��<�/W>pF|u��ENY��7X�9��J�b==ȸ7`f}_۰�YL��	�hRWA#��4��ӹYᲴ,�Ӈ,�cT&K�} ㆯ�=�=�������E��,I4=-�g�iݪ�,�Ӈ�Y�o�5ɒ�A�C��.�"!���c�Y���ų�d#rp嚴,��-.Y�FY���&�(��ޱ}Oc�>0򼽔K�G����3���nY����fS�,�2����LV�o��<=����+���yz��1E�����!Sh����neq��d����c��dI���L�hXXB#���&���L��1�;��p�b=���Y�t�pO�,����iVwg�,��f�p��Aˢ=}���ˢ==ȈY׺��HOo.�_��������-�o9h����=}�����'oeў��!����p�,��̡VK�ɐ�U�E{z������ɒ�a�M>X�vH,��� ce�$|��������b?���EײHOg���rnô�\X��	�����F���0��>�/W>|z?(�D��\/[��7w��K�e��hl� ��_�=���� ��בEz:���#��ϫtɂ�b=}���߿�mL�� �1����;��5~�`d���`k�0� ����d�vў>d�0��c��hO�l���a$�u�?�����ۅ�[����F�Xy��,�ӛ�
ˢ==�К�9�Q�Gb���`��
�V�E{z��}��^+-���&�{I`M�$~�?��Y�X�Cbў�d��K�%�� �������Ƈ1�'	2&[ħ�xJk���">}�"tY��˲�OO2nof�WF��=}�"Xݏ�`I���a��C=��$��b�f��,���[��U�$X?p�|#�]	LħY��/���%�g��,^��n ��zz�1L#ca�$}Чk��ʓ���4�����(��H���Lca�$|��~ 8���$}�hq9�tY:��{Cp����}�c�?N�8���&��t��1���e㣘�� 4��)�H�8OO0}h�֏Dy:���k��������Dyz��<*�%��ؗ=t��*Y/K��'{F+�%�#�"�kYeYK�<=�;:K҇L?F��������b�?2S )M��    �^uX��E��	f��nI�$���o/Tx<U��E�c�����ɒ��s�p�������hOO0@~�Ͷ/X�>t�?@��G��&�� #i��Z������"�g�^M�$}�ܦ�Cбn�S��Y��/jݍ/�hOz�v�(	���_�	�5��^`����XO���&�d����c$��`I��)� ��n5���sI�GH�b���hI�8��7�̥ђ �ӈ�����t��Y?�K[���~h�=0�BW��>�rG1ў^d<�Z*�����˸��{$4ў�`�,P��E�i���<�G�W�^����$�zw��$[H�!6s}\O[$4���`�"����`k�0�f:}�u+��HOO2��^J�%�S�C����C�=���������˾`I�S���C�T�©��4Ȩ��b�u%�XOO0��K�ǘ�a���jaM���[i�$~���6���Q�ڞHOO.@���HOO0S���n5���d��J�%��X��xŒe��yzq�}� �,��-)qݍ/�(O/��{�j��`I��i# `|�]��QL�F�h�ϽJ��#��E����t_�$|���mʠ���I����5O��%�� cj��W^�=������V��%1�}�7���t�6Q�^h4Tk�%�ff�ҏ�Y�}�c@N0�����KM�t�����G1�'a���S5Q��h4��nD�<�����3�K��l�wA+�w5Q��dŧn51��(���3�=�I�8�@��&M���=kQJ�m��I&�.���s��р���OO2 �w�j�<�d�AŎ��xz�"�]>���4�����=6%������r����&Y>d�\���̊�,���󹄳�~F�)�|ua������Dwz�?���dI�й���p�{��q�Q<��V%�� �ހ���S�$��N/2#�\kOt�F��]�*�L��fb�c�$X>t.��-��#����"��X�	���C�#~dP��#��^`��2X�=l�8J7�l㳘����殨�dI��s$a�߬j�w��q�	����m���$;m���5��4&�����FKȵ\�t�61�µ<��
o���x:�<"��(�J����	�ˁ%ħ�E0n!X�v�O�O�.Oy�;پ�lM �����}��`��!�b�[K|��x�YbK|���Ү�>���Q�Dwz��#�W��[�G�qo��W�-��^`���&�����cv
#��]����5{\`���K�ǘ�L��XX�l���$�4޷�lL�������>,��^\��II�${�Yz�9K<ꖤ-ѝ�d�J�_�GlL���)�����(��a���c�랱Dwz�9��B���b�>N2s��5ɒ�q��&�.�ؘ,�A�M����vz�I�n����m��)��hQ$-<Ll���"C���7dc�$����]���aL��	O�<Q,�8C�#�7�ۍc@N�����C6FK��-s<�����$��`�û��!K|�H�1�R~�on|� r��Y���nK|�A���ٕ_x��%�Ӌl���� K��AF�� �G+V�-1�^dG��2Y�A�ӱEf��M-���$��\�
^,�<G�m�] ��IL�ϺR��+���i��LC>��V�}�b?0GF�۬c��t�i���n���,&�ӓL#T&K�Ǳ<�biǵ%�Ӌ��]�0�HO�l�x�a�v����J�%�Cf��pu,<,m���$Tx/rn�����(v��_�����x�:_^L}�Nl����aXx��i��e/���Բ�QL��	��{�%X��N�	Q�����g1�z��v��֏}/Y�=N0���`I���i�g �dQ:�^d� T�,	6�Q:}�,��0&���͹�Z����y_$�b����11�^hnV�� Q�k�G�ܳJ�?���C�:h,1�N0�`����f����c�9t,lL�Dyz���nL���h؇`�}Q�(O/��d�=Ym�(O���\����}�b"=��d��{Z�l�ԧ2Y㎏�@�=�k���dt+M�� ��/ ̅ޖhOO26D}�.�1ٚ@����"\��%ў^`�zZw�%�� c�r�q����&�ӓ�Y�Y,ў�8�j�Y�nWK�==��y]�%�� h���ŕ��&�� #n]PD{z����U-��4���݃ዙ���b>2��k�%�>�� n$H��'w�QXB�hO'�7$F~�z��YL����3�^�,�0�������ɒ�q��i�ɒ�ͅ�S����y:�fd�g½$X�?p
2$���r&��-��/&�6FK~�����bkK�=���bZ��xO/2a���=�[3�uwy">%����V���D|:���A�mОxO���R��;��=�I�8�Dƨ�Z��i��3z�L׭qz�=%�t>־�-�{b=����Ӿ`I����{
xGa��'�� Co�Xa7�'�ӋLlt�L�D�����D�r�'�� ��:��&Y�>�����G=�^`�+�%�C>c|��<�^`��2X�?d
	pt,�s��zz���+�7&K�ğx��
�l�'��,�_V,I:C��(���z:�γ��z�=��pha7�'��L�V,	�Aj��#+<����$��k��'�� chO2���HOO�x�w�Ӿ\I�����_���}�b�<2�s��n���������c_�$|؜�r'������$�6�3��[O��A�>x����=�I�8�����}����>q�X���O/������1Y>���qkW��E6�Ga��'�� C��4������(O/0��}�$X?|*$\g��p�31�N2��,�(7&[����JPn�H���p�V��x`��"l���~��5٬��ab����O/��d�`k�0�.f�=Q��d����TO��<f�)��|��j�ӘHOO2̥���i�6g1����$�d.H��S=ў͝��hO+vH$��lަ��`I��D!�ϖ⒵�D{z��1�"oL�$�@oH��}�b�ØhO/05ú�O��l�A�s�/Y�M��|�_�ߟ�ޟ���B�k6�4Z�@`z�4n��k����%��ಸk��7�}����S"!2`^2��4�@�Psz���%���������i����aieQ�'�Ӌ��/�$Ke�x-���e���zz��;�J�M�B����̍Ob=��Je�'�� Cj=҇������Ȉ��Z�i�5��X�x�(OO2��_�eۘ,I����аp'A�<=���R���(Ol`C��������"3^y�8q��1POi�X�� q�^` 4Fa�$}�~t¸�������"3P+���)�����,&�ӓL��{n�&Y�?dj�"}���	���HOO0�����!S��B���}�b�<=ɨ#R����8O���� ���}Oc@N2@��dI�i4�@8*9��E&qyo�ܘ,I :�`��Rw�'��U�0X�?����/�\���j�l���ْ������kK�� KR�If��ɒbSق�|��Xu����r��͕\-�!�k���O<�@�,�!'����Z΍ɒbg�L��:В$r��x��w1EK���hl���.��2z"A=��4vx�nL�� �xZ+���q��XP�\Ǭ�˹��$����bi�$��7��Sq�� K��I&�\�9)�~"��}v]u���M��i�9��d���.�	��s�C&RW�d?ǐ�fs����*�G_d�7�F.�³Ɓ�s9�h43�>��q\t�7���֕���)� cm�q=���r�Q\��Q��cH���q�6���YC2�����1YC��t��T�$����S<��u��Y�C2��h���}�-�A6?�.�����m�j�%A> m �n5����Z$c�b���hI�iA�6B-�.~ԛ�0d�������s��ʐ��E�z�qcC�j]�,	#� ���	�$��ti�c��Ij��Kꍦ8JO�f��I�^�E�z�ͅ�Թ�^� K�NO��    �Eˁ�d��Bt���o�,I"�|Y�L��������{_s�R�"K}���?
+�-	"4k�ƌ����yL��I����dI�ŗz��4��Xy�l�%9�?� ���/Z�CN2%.����	I�]?��iLbȁ��L�ˠ�1�@�i��¹��yLr�A���﫛7&KbO�F�x�,]+\��7�@(�
8ВrloV$��%�śz��<���:d���@�}B~c�$���A���5�N�8�F#d�w�Z�Dd~뉗4���Kv,�ԇL��4YDt�(�A����x�(r�y�����@�`�����md��D�����}R~_�Šz��5eC��z���qQ�>h�`��;�%YD?,�E�z��8��d������Z�E�0!���E����?�ǢhI�Y5����K��r�i5ɒb�J1(��t}w��>h��Pmѩ�:NK=���~���T2��u��Y�C������r]��b#��2ݚ��Ũ����mZ*���?}Ds��p���T}�ܩ�HdQ��g���3"��²�@[sH�����س�E[c�EFc����d�T� �O4x�k����F�$�?�x�m|��r�͵���V� c�2�pm�!��;����1d���6���?�6>�k	2�bUD{_��EK�ȁ6e>Z����U4�;>kZK���CF��fZ�l,jՓ,��z�"�XԪ7��\�\�-�"�Ĥ:��WdI9��i^�,�"Aƍ�T*A��V=И�Mj�,�"W=�f�IH
��E�d8��DK0�"W=����<k�JVw��V�ɼ��}���ƣQ�^y�k,rՇ��.Ry�n,r�@�Y��B��qL��A�}�>V&K��A��O��def,jՃ�E��\�Y��.r��k�%)��+h���;��$�p���a�w�j�r�HԪ��{tܗ,Q�N2m<�֠�,̌Ĭ:�.�R�]?��EF�|�I�d���C�K�ᴑ�UO4j�\s�Yu+3m�Y�<�4��F�3#Q�N2k��뻼~�HCN2S��dI�Y�'�h_�7>��[�d��Z�z��U�m~��\�r=��I���K�%QD�|\��V�z��U/�8�8J�%QD?@�ƾ7�m|�$r�q�/V�oL�$�Po�]G���xU/4s��dI�[�An�w�D�:l��ȧ�r�0Ѫ�h<^-	"67��c-Y�N����3�P�,�!6GɁ��]���qLr�Ͻ³=�JW�����:��kcc�$��D����L�ȉ�б��s$f�q엔x����D�z�1�U��Zu�Y����Ⱦw�D�z��˵V �ĭ
�h~q��S\#Q���I��m3%���Iq9�r'EbV2��qo��WН��D.4%/��n$j�@�x�)?��J�R$fՓL�(<M>�*�O���֙�,�&f�MPp���&j�@��C�5"��$��dL���D�D�d�����cD�\�,���e�Ĭz��)� �Wu�YD,�3m`����:��ng�$���5y�P�#�^d�^�+I!��-����T�B�������3ZC���F�����T�DU��hI�ÐªT��"q�^d�p�@k�%9��4��^���c�CN4U�ҳ��V5��W,�gc��Īz��U��:�Īd���0*:G�U�%Pd��"�XU/2��/�&Y�Ch:"b����F"U2�����}㋖�͆Wޣ0�j�qo�2��v>�I9�ԡvu7��)��^�}�c"V��f�V&K��o���E�#�^h�E*�,�!ǌk�6�v���5H��'�H�8߅_�%9��������k���-.���ђr,�7�ړ��W5ؠ�np�J�Q$Z�l��^�A�j�ͦ �U��XU/4�L�:!$R�@cl�C��m�HU/���X�,	":+�f�|��k �S�$s@*��Q5���/h;�A��S����'��hI
�O�mz½p�$J� �M��������%J�@Cl����U,�BbT=�T�zi�$���G ����Oc�B|�o&��X\�J�Q�$���p���$���/��0!$N�@CmlR�v�T�D��_Eђ���W�*��C"U=�x��Tɾd�T����^��U�B3�<��V5�ŭ_���7Ս�D.�����H������ 7/���j��6��h����hU/2�B��1ٚDp̭���}�;���q�"I��k��a$ؠ7w.\��D�z���^�V5���j�f�j��c�Vy�$^Փ,n/V���Va~1vx<m%� ���1����\�Īz�Iw�<#�Uu�yc��U�Īhlm� �<�V�D���6m�DK���Ӵѵ�]�(Y�M��'�܁�ɒ�G��޿��řD�z�)��o��-	"��`}����<&A�$��$��dI��|\��;v>�I�Y,4��ř�/ZD2��5ɒBs*y(<C
5j�S�D����hI����t�)Y�O��'�~��`I�鎲��T���(UO2����E�ĩ�|l�Cb�9m|�r�)ŏ�2Y�B�#B1�?*�	���}��hI9F��	Y�KN��D�z�!b�n�ĩd�(���XB"U�c���q���@�U�BS�Bȿ3YEd� ��߯�ƿ�$�`q�/$��%ADf�c�����w>�I9Ѽ�j�3Z�Dd~����
�$NՓF$~(L�8UQ�(9 ��ʅ�D�z��ǱT-�!���i�����yLb�A�J�4YC�C�r��_L%�|� r�92C�ubUE�thg��p�HbU=�Fw�b���dI��ŒxDk��D�hȍ4n#R�� ���d<l��dI�i ��ʊ����T�Dá�+o(�Ī���s������n|� r�Y�/.��dI�Ϙ�������|��Ӫ��D��i�U�D�x���U�Īhq$t/���HU/�"��H�����1�M�+{!�����.+l�ĩz���]N�I�Ɛ CiN 楫i�V�b�!����j���xP��J�xUO2d���"Ѫ��tnBqK{,��fݠ6ښD�i�N�~��@b"V���W���X5А�o��;�,�b"V��l�.^cbV4�6G���UY����>
� 1Q�^hL���,2Ѹ�J�;`0q��d2����mL�F� ��ɿy^�=�Q$��[�*��`�V�d֜9�D+��A$��89��d�&r�M���F[��g@�����yL��I�F�p&rU>����e�.L�Z\�{$�(ZDtn�0�/Z{6>�I�c��sH�.Lܪls��P�{�b/&nՓF�Eޕ�%9Ď��ޕ���D�z��=�Z-�!6�\�2?*,��Ĭz���x�h�%9� ��ϘB�.L̪Z��I�LԪ�s؉X*��1�N0i]��jL��'�\�
��}��j�qo]``�L��'��2��ʿ3Z�Bm*9�.u{Dp��ҧ�ct��/ʄ;_��c�ͦ\���ꁆs}�*���I6w���"��W� ��zV�\K[���6�n��2_tcm|�~�" Ae�.^�m��B/]M[ĪzS�K��X�&�8��ɒ(2�!�O�YrZ��7�
�(](\Ī�s`�+y���1I"VR��U�ɸ�~���8&I�lI�}���hI9�Fg��Jm\̪'��8�ρ,Y�^Ī��»#ec�$���T�N�G�qQ��h�q+�&��V=РG�'녝��Uo2�q�/��E�z����NVy�..j՛��+�qQ�h�M��W�X̪7��T&[ĪAF��n�P��r��bV=�@#+W7��U��F���k�%1�挫����R���xU�hV-�!<GfXT�h��<&9� �.�6Y�C�������iq1�>lq�ftg�$��,���{kϾ'rq��ds���V�8XԪ7�/��6>��Z5�dj�0>����ŭ����8Z�Ed��"��EK��?�$�d�gLe�$��G#s�����1�"�����ɒ$"����=�l|� r�9��E����U���}}�Z�"W}�F�/�(Z�Dtn�B��.�%��U2q-�Yܪ�-:���w՝�cD4�^�r��U    2Ҧ7/�$��Uo2�\�,�!�am$��%��,_�I'������h�Z�!�cɕ[D��Iv��T���U4�&��=am|ђr��m��]H�1YC2��+��q�>h<�KO�.f�@�`c�ʛ\qQ�>h
l�_�vFK���\<G`���b1�>d
R����A��`��l�f=��*}F����Y
/.�E����W����$d�[�b�������EN4�
��dk	2�$��w{�bU=���x���N
Z��y�I��$-Z�Mi��I����2�l�$w��GA�V�!����fՍɒ2����X�J�V�@���ټpE���Mfȏ��&Y�B����%���XUo2�_�q�-�!0�:��/�/��$�h�"Pyi	-^��5�Z��]Z��7�6��h�X�@#�E��Sx�r-bՓ̚���7�}i�W�!S�ޘ,	"8%�F����8&I�DS3�\)�E�z��U
�w��U}��O�����dI�K���3
;�$�h���}���hI��]��_4�{��M&q��"B�Z5��7�6ܕ+O�ҢV�� M��5��j��]��_(1�N2o���2Y�Ch.�2�⵫��Z�d�?/��lI�9���H����$��d������`I�9�&�Vz��j�!7��`P"V=���5����H/3��
S"V���lT��G�Xu�y�{��
Z�� �^d6޿�lL�����KF��Q"V4:��+�QP�U��:؝�k�%1Dg����w�Q�U=� j���hI�鮇n2����=��W�"���}{�I����������;�$���Ag�,�Hm|Ւ r�	�J�N�D�hs�!��6ܝd�DN4C�ʋ
)1���@��}����1�"� f��n��U'�M93H�BJ̪Z���hI�K�DX�f����D�z�	�ƕɒ$r�y�8�=>�|�$r�9�/2��hI�LI�;��tR"W���=����h��Z�DN�.4�7VmL�$��������qL̪ZG��hk���ب+@���U/2R�w��dk	2�f��E����q�"'���G�'&�j�j~y�6%��Y�"3!,M�� �ј�ze�*%f�͌{�
obV�q�ڽU�d�A"V=��X��1Y�CƱ��ؾ�cm|�j��\��f��%_�$�d
�r+E"V�d6��ʥG������ƪ�hI���6�?;YJv$fՓ�?s
5ɒr�	v��N5+��Y�E��ܡtA-Q��h �k��[5и7��}�dߟZ�V��|��P�I���wGzo5��8&I?@�s7�bc㫖$��G�Q-I"8�1�M��| �(r�y7���d����uy�ο�yL��A�8F�6Nܪ0����F�=���U/6��%^N�����S�n7'r���]�4YE��Xŝ�}��Χ1�"<�pV�nY���Eƀ^����$�"���C��8&A�@D��.��ђ$�Ԧl�e�bY���$�HW�8ѫ^h��V-�!��5��я�j�����Y���U/2G����ɒ "sX�]�+��q�W��"<Z�'~�@#�hދ��$��d^�߀�*���lZ�@ʉ[�Bs�P-�!:���ڵ�N�����$KR�~p�t�/�{�|�r�I_�d�-�!:��Y�p''nՋ�Y*o��ĭ
6�U	�q|'��8&)�f�PY��߀��6�i)I��U�I'j��;NԪ�
{e�*'j�@c�kc�ln�D�z�Ł|֮EK�ȁ�l��Jd��$��-"�ݙ��U�#�̏=��U��ђ0��02ER�[)8��^d2�u�5ɒ0�sX;��6>��]��s�X(���]�"s���j�E46w�]sJ�'��1W�Vȉ]5��N��;���q"Y�^�����dk	2��ҁ�'�w>�k����*�c9ѫ�5P�N_8q7>�k�d�z�EI~_�Įd �"�W.�&v�;>�ǢhI��kZ�n�D�z��#F���U��{�x���E�Įz��w�w���hI����:�{�i�~�D�z��vRp�V�dS�o3�GA9��^h�+�%rU<v�Q�]���U/2�х[-�!���@�p�H�V��hx/����*�l���nX�Y*LԪ��h�ʍ�Y�"�/��%)gޗN�x�w>�I9��6[�Cp���x�/3%�D��E�Y��dI��3�6�/*�v��֥ke�/'jU�a$?���]d��D�M;y�,��U�f#n�k�����U'F���wLr"WE��w��)��F6>�I9��ί�m�Z5��h::��ʉ[5�pnv�w���-q�^d]�o��%I���"�ȝkVw��EF�����-	"ǚ���KW
�j��xZ�ب����U/2Tx!'f� Cmqk�����U���Q��08�^dd��C$����HJ����F�PzZ2�����r�H"V��Č�2Y�B4ޭ'�Bee,'^Չ��LKW@�j�16��!�]=�$��d�7&Kb��=\�?��5K��U�D���Ջ}�$ѪHS�q���%���d�
/-�D�dSڀ_��w>�I�O� �QH"U��x���AM�$���Qt1�+��HU��ƕ�JbU��Fe�$R� �D��W�5�ĩz��j�-NU�VK
w��a덏��T}�<�H����T=�h�x�y��Y���?m�#�9���
�9����}Q�>h��.�E�9�hsQ�j �P����\��8nL�s
9�p�s�Ε;(dq�>h���8U�Z�I:L�A�{��C����~Y��<��u�TL����8U4��*K�e��h0�)���l|�r���\�/�S� ��T%�W
�"U��Q�6Z�D��|�<���!d��>d�ߜ�}��*�=~���T�]I���`���(Z�D�6w1���wFK�ȁfST�~�6��%A�$c.ll�E���2Pd��"�Uy�(�`�Y����,BՇl~{,� B��A��P)=#/�Q�@Cn�BV�l�Uo2��C��S=���p�/,�E�(U6g�/�[wfK�ȱ2��H��T����ᅧ�eQ�d��X��}�Y]��A�F_�F6�jI9�X�l�|A�$��\�
�K��T�D��Q�vc�bU�c(7W��U�E�z�E4�ɒ("葌/V�R��T��"[����T=�ȏ�ui��,N�����E�z��Mл@dc�$�\+3]�O�5K3�S�As�/
wFKr�NO��xj3%���MoiZy�_��AF��:��荏��T����qzg�$��Ή��w����1	"'��}D6&Kr��W\yH^���L:W��/R��(^�ܺW.�-R�����AQ�$����Σ���E���ūL/<#/�R� S�9��*
�ꍦ}6�FKb��9�HXV�p�U2�'���AF��!�x�Ŀ�yLr��F�f=j��/JU���Fo�ϪN��(r�~Y���$r�>�ݒd�Q����ځ�t5mQ��hE@+�J�ũz��}N^yJ~Q�>`B���Ũ�s#\��Հ�5�Ũ�����%[s��r���}�C6>�I9��\/��ђ2f�G�#Y�Y]��Z�E��P�U�ke�lx�w�Ⱦ�q���d����X��<��ujqP+k�e��h����*{��C�SST�,	"0K(Oq�f�p���d4�
+�J�Ūz��6�78y��$��dS9]Y۰HUy����X�W��E�z�ao�Wf�MD��Ba]��7��A�6
]������ũ��VI���x�j�.R�-~h��z�-�!4?������cC2��)�2YC��ܜ*�t���l�z�E�tT��\��(^@�4Ѫ^d����	���M���M��XU/2��ź̝ђ$r��Dp���Vl�Īz��W�Qh�T�9+y�b��&V����*k�5Ѫ�}�Ԕ��X��yLb�IO4-� B�j��T��}�}`f��XU/��f\y�U���jm�t3�m��Īz��[�M��AS�;�W^���U�Bc�\��D�h<ݣ�|y,Y�D�z���T�o�Īz��w���M���{    �EK���S��:�6��@&^�m
++c5�N4n]�������cE���˚dIѹo@��_���xUO4����gg�$�臭1�������$��dRza�&^U�مK?Fj����E�p\yw�&^�s�kG��}=��U/��������dI����������qa����/Z�CN2�Pe�$��\
�A&�k�V�d�A>��%I��L�9[�},�hUO2G"(�~�Īd�qaF}}O��8&V����7H��ԧl�;{W"F�m i���U�ꉆ�^��'�^d��߿�mL�F� ��Ե�.�&^��P�j��Ad�q\5y����I��'�!I��mL�sI��O)l|�j�o�U���E��E�Px��&Z� ��?�����D�z�����]'^�@chB����E��E�4}WnL���t���S��f�D�z�Z�g�$����M�t�HbV��\��2Z�V4��{���ĭz��[:wFK�̑I�χ����Y�p�t��5ˠ�Z�BS��dI�Y��pe��&f�-��b�g���D���w`�.�īJ��u��:\MԪ��{m�D�:٤Q���͈���ĭz��3ޣ��Z5�p:���չ�qL�ȉ�j_�vFK�H��K�]���qL���E+7�$n� c�$痢ˠ�[��3����J����Z�"�yV+�%9d�����~��Y+L̪��c�/���>V���S�,��U/2���ibV2>[q�t4Q�ұWxi�=:��U/2*�FG����z��|�r����̚�U�1��qۯl��Ĭz��x��f�Y�DA��;),��d��G��@��U�ؗ<:�=�[��d�Y�B#�/�_;�%1Dg��"}�o*��<&1� ��(��b�Y5ȸ�`f������F�;�4Z�D��{��4*oѱD�z��n����Um�F\���J�@-1��dsV�4ZEl�w�T��Kܪ�ln�F����ɒ bӶ�D��3��<&Q�d#��ŭg�$����P�黍Od�E2�ϜBM�$��gH3Q��Dy�Ә$�ͻ���6FK���6'�hJH��QXbW�Ⱥ�݇[�,	">�8N�T64[bW=Ѥ�kh�kK��ܧ�b������:�F�K�AF0W`<{�J�
-��^hf�E���hk�h�D��}�p��&��L{�Ž�~�%K�<���V�Xh�[�"�ѿ�����Z>����Y��㢍�����q��hӴ�,��7���I�#�o���D2��πZћ��A�AS���Ůh2�=<hZ�k�bW}Ȝ�ߛ��%[���N>���o[���{[��I�Cإ�מŮ���=����7&Kr����~� ��U4�^yP��j��Q�f�}K���1�!'Y<Ҵ4YC��!���p;�$�臼9���u\�-n�MEKwR,nՃ,�>�{�%ƶ�U2�Rx��-f� ���N4^Nkw,n՛M�N�.�Ůz���X��
��$�d���Uk�%I��W~ޱt+�"W}���/�]��U4��?���j��U�g#nG5)�����A6��Z��n���4.r�m�UK�%A�gn���s
��$��d<�˸6&KB������ҽ/�Z�F�xVC��䶨U�3�t,�mܱ���bV}Ȥ�U��ZĪ٘��K�l�>hsQ��2����2�=ݵ���"V}�؟���hkGݜ�/]�^̪�Q��`�Y5�F�5 �������QKK)l1��h�"3�]�%�z���Q��w���A���f���T� #mW��eq�>`4�{cM�$���[���Qv>�I9��Q��z��ђS��B������1I!�u�/>lL����!�V,R���&Ry��-V�����U��Z��7v�{�$��T2<V�Ө]�^��7wd-ΖD�)��k�mѪ�dڧ�2YDp�Q0���z[�����}bfg�$��=���{#���1I"���Rx˵-bՓ�׾+��8&Q�@�9��n~���ꁆ�Q���%k���U4�A�ђ$B��/]����.�Y�!#&~7�nL�$��X�+P��/f�-~i_��팖$������i_̪7Y�ǻ$_,	"�k*V�]�V�&�.�'�}Ѫh4"���[r��hU2��Bm_���?C�%�־hUm&�w�/6Kn|Ւr���FKr�̱��I
W�}��>h���#
;�%AD��"�`a��/^Շ,�ɒ$"�8c���x��hU호��(Rx�/ZՇ��������I6[��Vy�/Z��{�)y_���VUg��$�3[EN�1��6[�EtZ����Ս�#I9�č
�-��U2;��ɲd����l��%^_̪'�5Łw̪��Y�!�!T�,�"6�/���ފ��qL�ȁ��^��dI�Y�:�����qL��A�v-�v�ɒ�S�2pv|V��&^�M�3(_-	"�An2��ѻ�0�xU/2�wE�d�W5�H�! Tv�{�U��z��u�U���S�\�G$Ѫ^d:��ǚdk	��m�,���<Ѫ�h���baQ�5��1r̓������C.2��ݻs�!drQ�b��w�ø����y��d�T��֛΁��%�Ī:Ѹ����G�}i�Uu�M�;H�u�XU��F<���r4q��d�6YB��m�ةt�K�T�АGi�$�����׮�&N�@�x����K�<1�^`>�+�%J� Ck�ؾ~m|���'u|a�ڙ-I"�ai�:�53%�_��I���V��'Ѫ΍�<F�u�U�И�KW��j��7e�_T/6>�I9�F��^��V5�0��+o��ī
����TV�x�U��Tߍ��%A$�f�ŉ�\ M���ϥ��ђ B�:[�jZ�U��"�h�h�U�h�ͩ��uO���*P��XU�ϮQ��s��j���:;Q����%A�$�N�;_�j�a����nZO��Y��Im�$�����zt{���8&1�$cLD5ɒ�sOU^��W�Pa�Y�/�k�hU/0�6�-��%!Df����;�$����N�N�W$o���%���E��L�ewj�rK�,t���sZ�4!�@���(��)D�/,Ah�(
��A�WlD��@QXU'�έ��v���c!U�}����nڅ/ZC2�/ӭ�1$�dFG�-��ªz�鸛��Q�vW8j��ʒ�ъ,b�E�����D�U=�F�o^��H"�����{A~��x�~��ؔ�5�}Rr�k����$r�9�o�]��"�ȇG�E��V$�MA���D+�H�jdz}+�IV��L	/�jO�"��6�3I�2a�1dGC$�w���hE��&.�^ ]�81dS���8�KVHU��}s���*�D+rȎ����8a�=��Y&gﻋ%��1d����wN�=S�$�{��WvW>��B�8!���-Z'�3�d�z/��I�!�L7JWkq�*a�=Cȉ6�������!���h���&�3��h�ԹP8+f%�e�R����D*b�N(qɋ{�9��ch��4�� r��j<*�LE���b�]X�HE9�����$+�Ne"��9�e1-��(�?��0d�n�D*��A�>H�>�$��A��R�§��d1��7�LV���os�&6v6$ZDv4Ds��G�0ZDh:ڄ�k�m�SV���,��&Z�Dh��T������"�d�}W�$Y�Ch:0��6��&ZDx.�����
��I��}}��/LV�$�BU@z��^�8F�-F��.�J�D�i�{(�g9�p��h�ъ$���/2t�����A� �Қ�"2�z�FtV�&Z�Dv����[�ADf�:��F��B�z��k��'YD$߯3��^��dE��F���O���YC���Y�'Y�B�7`Ȅ���^�8)�@ںp]HUi�<�,?l�^�<1d'sBk��d��*2���W>�E��2����F�˪��7����������]C4��2b�������Y��-֓�*2��=����Ǖ�#Wh�Tui���/��?`1<�jp�L�d�(�B�5V&��/4�[H멻����\�N��Y6�-�    '�v&�g�d�!J�Ə4{Ɛ�L��5�3�$��������C&Yl�y�\ �g
9����C{��}Ԙ�u'�=cȁF@���2�3�L2��o}�,|�"Sg3 �Ú��Ɋ"��^k�{���� 2����{�d'c`��]/^D��2JL��W�hE9��]��2Y�A���fAA���"��d>7���U/LVd��D,���E����^���A��^��Ɋbs�5,��w',|��!��`���CֽhQĐ�L��/���!���k�XW�hE���!Zk�"�����_��}g����!;�/�:wD�Cv24sjl⟦���F����+�A��)ɉֺ+�$�W?3a�x?����`A� ���wQI�A$�IBW���<0�$�����ܪ�H"��9Z߅IV��,�iԚ�"1#?M-�_���cE�'��� {��,|Պ$��1�_c=ɞA����lԹ��Dg�\Ā��ںW�I�D3G���Y�E�d>�Gk?�3�$��6����Z��E{&�����]z17	<�`���ܹ���"'�__��=�H�nꀍ[��A� ������0YDv����B~��X�����뉆E�9r���u�	�"8�1P���S�"�d<H�o��9����W��i X��_k/��Ad�`o�h��^ 9� s�[X&+��n���em�H"4�N�Ǳ�r�"�`>�_�QC�s%ލ-�i@E��tFk�V��[��C�����!;�M���1��hd��iTĐ͑��#��hE�YO��Εk*r�A���Ɋ��(��~q2�|�$�?�m����c��.I� �'6^� \��L���B.�Ȏ�H�yy�ID�j�<���S��hE9М���5pEd��g||_��]�H"�3��^��Ɋ$"s�?�8:D��(��16�����"�h��z�HEtFcqe}7�.| ��";�����+�Yd.Rȫf$�%m E������H": ��5�Y�"��o�6�T�Q@�$b{磛Yc�H�D���Ӥ���H"��]��k�"��	ʗ�w����P�dsͩ4�@aT�d�kl]-��Z��n�eS�"��h�l�B�z�����`E�7��XҺ
Z8U�qs�Κp(��Z��քC�T�h��;c�.�B�z��f,m��
�*Ǵ��@���RՓ- �z�Q$��ѧݽ��
��A��%�0Y�Dbf~���Kj�X5ф7̟r㖃«z���m"�WU�o���Ї5�+�g9���ўQ$��6�ν�Y� so�7(̪IF�9d����,Ԫ�Ґ��Q(̪s�k_�$���Y�$������.L�L!�L��;��P��h1\ZWw�j�o���bd�Cv4#���IQ�U���뻅\�Dˈ%�߱VF+�����;d��zՉ�jk�HaW=ɀ�/��B��d���6X�8Y�@3��/Mъ,2��>Ä���]� S"�Β�B�*4{:=�m�=���\�@���aaWM4�y���=�X�UO2�39ӓ��!���{���<2��\5��7�[�^
,���}�7Y�ChJ)0�>�\�|�r��F+���!j�����I��̞dE�9�5E���Ja,ܪ'�)��,W&+r�D6��u�6�¬z�����1d'�0������c�Cv���c�F+�Ⱦ��v-;mY+�B�z����eP,��7�h����I6:�,a�VM2�-�ht^È�[U�7p��u��k݋V�UO2Qv�LV��_!�î�c�D4q��hEѹs��4�G0>�E��4���ӓ��!:uhsp�qu��F��3�)ZDln�q��>�E9� �%�=�
�j��o�/3Ѹ���]u��+��;�baWM4�|^�w�`aW=��/��D�0YDl�ީ�w/��ǱH"Z\��Mъ(�SJ10�6R`!W=��ύ�/X�U2
Ex�x_�49��[(�/-��vU�7�&|Y�2[E�-6��иK�Ыd�k��=�'Y�Db�6,���5��|�(r���h]�-쪉���.���,�'��B�}3X�U�,3?�?{z�j�If�����%R�UO2��n]��[u6�N��`�녏�í��al�/:{_�s�M�����Dj՝�bS'��UЇ[�B�y�:/�ć[5�`���]�mY��U/���k�'ؿ1� �|��mE�Y}�Uo4��c|�Uw4�MU����ǇZ�"�!�drO�"���m�Y�h]�}�UC�q�`ܹ��P�^hy:��í���؆�]������ECo���[u'#��Mf������s'Ko�"��]��(��x�Uo��_�AA�.�î�h��^������!W����6���jՃ,Sְ{T�'Y�D�G����U+��"��l�wn�v՝MF>�,��C��'�#��hz�Y�����[�L>�7�g���1Ƈ]uGC�b��Cj�Ǉ^�&c�ƛt�aW=�b ����îz��ٻgie�"��OlZ��uQ�aW��4�:�!d3�[�Գ����&ھ�w��\�i=�i�ꍖ���Y����Fcs��ř�jE
9��%����Zu'� y�Z�C�z�q�h]+|�UM�e�M"��EF��b��/��N�y�vw`�Z�C�z����;�rŇZuG�Y6�͍�DjՋ,�֎���9D�n�L�[�V>�E����.]�C��h6�U!��e���%B��E�y翤�=ɊbS�1E:�w�V�� ���^��ъ$bs�N!�ڷ��n՛L@�q�=ԪYlF$�~�V>�E9���h�V$�N����P�]�<Ad'�|�������C�z�	����C����m�(�s��~���?mKъ0�?�M���k���G~՛��ݻ5Y�Eb.T0R���e��X��͘>����V������~��;���C�z�	��I�'Y�Eb�~
�KY>���ƄƝk����h�)��;7��W��L���d�c�6�K��5=��7ZH�mk�gI4�-@��>�� r���6n^u'c�LĽ�6Wz�Uo�`�&���=���,�\�����îz��j���]u'��q^3�,2��]�F���iz�Uw4�|������"��d~��IV�����վ�Y���î�h��F�B�ïz��Qg%.=��;����ƫt�W�����ۆr՝�4��.�y�+=ܪ7Z>����r��e�"�x�=�����&+r���F��Ek�1=��߲߮lE��-x�v��y�Uo2m����dD��E�n��Ǳ�"4;V����P�W=�t�g��!Z�Ex.�c��b�����h:z�Qd�	=����w�(r����y_��"<�C�u}�Ы�h:�;ۧ��&����y�~Փ̿,�^��!;�%w��vՃ�qD�|�W�}#4��[�\),��'�C�u}�Ы&�掷1�e�KaW=�ah疥®�db���^�ѳRX�U4�[�W
WF+r���n4�~�q�KaW=��ޟ��ADg�)uM�B�z�� ��I��ъ��z���/�Z� ��3XB�'�12����ʧ�H!�b�����hE�ل;���ދ��y,R�N6W�E�~�«�dH�*����e�«�h��8k�.�ªz�)�Yc�V�$�x%$���T�U6l�Ь+[D��sq�v�(̪'*t&+��N��[�x-ˬ|� ��� �S�V�}��px7���VD�PGt6OS�VM4����k�e�K�V=�\���Ӓ�p�B̽%��v���­z�9�ػ�~e�"��l6p7�)k�YD�-P�{�Y$�{���.�vUs����,��E{F��̕�u�­�` �6� ;Ww�����uS�gI4��м��#.ܪ'��ݣ'�3�$O�`�<�˅\�@���Z΅\a���ڱ����I���x�n�$���\�UO4u����+�I~<6ŰѸ����I����/\�U'�l����Z�w�0��h4;K���"������ke�"��x����q�U=��8"��/LV�    ���g��g��X��_�}�[)��d�kkMVĐ�y��"��Z�89dG����4E+��|	�2:�h�����IF����p�UM2�nf�g%[�@��hs�do�"��l�$B���/\hUO�)Hi�Չ�*��T�ļs	���f�޹pͅW�7`���=>�E9Ȍ�;�6�ЪhN��@�Ъ�dFꝫi\xUqߙ,!��5me�"��h��~�<-ɅWu���N�o3��D
��I���XZ��H"2 hr'���«���	�{�_��A� 3�;t&+���ж 5�<�ƅW�D���h�X5��q�hﺞu�c�U=�4�#���,LV���nb�e�sѩ�h
:����hE�Yu��\�.�Y�<A���G��	wa�"�ؔ��lh�u�\hU6%k���j��\2f�m���"�\f��SK�B��dB[��u��NՓ�����*�asq��;K���d�=@:����$�M}��<ʅU���h�;�G����hd��w�raU�h��$����eM����d���(
�*�T��Q����«z����ъ$S>��:Ӹ(_hU2���dE���3|����\�8I�@��xo0^�Dh�e0��ɾr.��I���;�w��Z�� _B;c��&�&�u��$R�UO4
��k]�B��h,���[[c�P��h��
�*i>��9]�Ǟ%�®z�����v�Dc����?@.|)��A�~��z�YD�2�
ͫ3�^�d��w��3�_���	�}�l�SVO2׸�qK�B��d��X�]ڳ�q,�����fzm�i�(R�UO2��V�®�d��Q@�����q,�ȁ����2ZE|:���:��ֲQ���d ޹���N2��&Һ�T�UiW�� _���������ٙ�h�^u��6k�WC��®z����ѹo���R���ᚭ|�$r�e����G.䪉FcC�;d�,\�UO2�΍K�[5�dl
�׍�g����h����daaW��4��]x[v�rՓL�1�r�$�؈�ٺ�Q
�j��m����/�3��d�D�E�p�&�5�%R-gԤ���h�B���IaWe���X�.�wl�B�z���-L��!�L�6��w��|��{ZD�s��z�-�?���zՉ6�����U[�D~Ճ-���ъ,�s7h�ca��WF+��]�&��{�0�dlɊ(��g�^ӵ�e�I
��&�o�KjRVMƖ?4��RVO���dE���b��B���"�����R�UO�P��==Ɋ2��nA��gՖ�B)��'�坿sT
�j��m�7�����cC�л��'Y�Bx��$��߲R(�^�@SR��SjR�U����Қu,�K�W�d�p��d�^u���gB�jR�U4"�����dE�i�������䥐�d��n�0XBlv���R)�'Z8�����ъ�q u�����h�.�ъ"���:�j�i�HQ�UO�p��-"�\�u6�Аq�{V
�j��oX8�݈��5+b�&v��$+b�μb�ki�\�ds�*te+��f���.�W�N�B�z��=[ғ�"�s�.؇q�cD4����H"�� A{��~�M�;[R��&�6�ݥ�~8)��'Zf�k�LS�"��Z
�}��.|�(r�)ص��'YDl:)�0�Z:{֭�*�S�1΍ײH�W=ɔ��6�ЫN2� B"���+�"��h6f��3Z�W�]�K=ZWA��D�L"�&Ɩ-"�^�S��dE��mf�E��Oc�C4'�ΦN)���F�e�2hlېB�z�9�5�$�\5�7̣��R
���d��Cd�*(�x�S��y,ܪ"kM�L!I�����K�Y-Ԫ'����h� �h��2�H�]R�U2�n�X��C�L�6�{t��fU��6P]:����I�׋LO�g�\��a��]�RXU6�B�5[�UM6��0�e�s5��hj0�?���V�
���u֏JaV�h��m
���P�U'Y�E������dE��C�];ｓ«z���7��hE��ـ< �sI��h�����"4�4�^�ٳ2S�UO46n��O
�j��l����P�UO2��{K���T l����땏c�D�9-ٺZ�UMbC�΍�Y�$���&+�OU������b�D#ܔpDg!E!V=�lhc0-��,6�����=�ZhUO2��hE�����y���"�d�;��;K�ЪN2� ^y�e5M��&S����!�#��>\��E'-����8S��D�M�s��ZՓ,�#����KVXUEg����iaU=�h4g+���
o	7��haU=��D���&�6x��W���cE�ǚ�ȇ���/Z�D�7�h^3m\�ªz���<S��V5� 63����ZhU2�ڱZ�R�#�$"��[�§�Ъ�hy�����!6W0���������!;�5n�ª*>�dP獠ZxUe)�<��y��b�-s�Dg��bՉ��xwt�| � r�I�fm�V$�c4u鼄Q��F��Ü��hE���O�BиID��IfL�X���Z5�P���o]R+�M3�ǻ�qe�"�ďhc3�ƭZ�U����3W�C�'<���_�W>����;�,�:�X�N��X�&3����Y��!V�ɐ2���7Ѕ��C�z����o]������X����P�^d��jj��Eb՝L V����X�`ù ��Wf�D��˯�9�eY�aV��29���dE��݆K��+�"�죠Ñ>|Y��=��YlDd�yTb�D�W���t��<ĪZ@|���VD�wvpx�"��O��";��E��H���`��8�u�)ԇW�BS�/�xe�"�ଂ� ��6-�b՛�kk�"��dC��崇W�F�a�y\R^�m#F�����M�M�-LVĐ��u_6í����C�7Z�D�G�͘�qɞ����8���Bn�pS�q)�{V
n��xf��5��Z�&�ilL�P��d�,#�^¨��F�\[�An�D�߰|	�{��C�z���>4�/LV$�$��������íz�)��:Sr��<i�_���lE�٦Ę�7[�Ed����1޿�/|)��N�Cާ0�%{�U�L�Y�v��=��7�Sh�Vd�o���h��Xd��LPhtny�Uw2�-o�q�CzBz�-4�Vk�"��,�(����c�D,��f�2��%އ^�Bӹ�u���W������e��îz���K�&+��͞wʌEֹ�����h�?Ǳe��îz��u�x�U���@�k=��ꍦ�$��hE٧A��Zk)v՛,��}��dE���!�W.�Y}�Uo�|�������h�c�����ie�"�h�|%��hE�y���w�c��=��b�Ԭ3Y�Dbv���7��C���'Z���_��A$�Ǟ��ֹ���Mf�q�I�eM���mF�x������"0�˘�F��0��d1�w�-L�"I��;Fow�=��ܟ���=�H�1l�TSl�*b��E��Q�]ֹ0�3�$ٜV��f�ݱ�0��hF�7h�ð�h0�P��Ύ-���d2��3Y�D���͝��0W�:�=�;���;���K�aX����x��{�A���6:�'�ðz�Q���FW{(V�´4	�{o��hE�y�#D��La��M�?5�V��wG1�%���^h
4���"��$o!�X'b��Mx+�z�9��r�3�t��=��7����3��W��з��>�EI����H��ɊB?����{g�ʧ��!4m"c�Ag%�=��6���5��¯z�1g.~]���!�O&,�K޳�[VO4���2ZDxx]���7(��'Y�~P�.LV���"ի�Գ�[VO4��*c+�����i�.�¯z��|��.�V$�d�7��#�V(V'�+>����
�j���t��:���
�ꉖ�;�q���N4��6���)�'����]K�`t����~��U�°�h������3�_�"��d@�~�&+���ȶ0j]-�ͷ��    ���D��$����y,b�N���]"VV��:�|�y��uaXM4����>�X�a�au��6�m�"��dE������:ϹZaX=�(�;ϹZaXM4эq@�V�B�z����LV������uD=뻅_�Dっ7ZD|x]�^%����`�$���:�1����v�,|��ƃ��NMъ ��R>Ӯ�X=k��`u�ц
��D
��A��f���Ɋ����a�|��X��V�|VG��-�M7C��-�D
��	��ֹ��p�&�����.��­z�92��zj�\��HB���X!W=�����ba�gI�}��.�r����ak�gI4�M��ѻ�M"�]�@Ӂ��_
�j��l1���c+ܪ'O�[g�B��0˻1-ƝM"�\u�Y�Gr��dE�N���u4[!W=јT[��v�D��1�^�3-)
��I�<����p�N2�2���i=ׅ\�@ۿ����vU�g�G�ːҳZ�U'm����/^�U�����dE�ywT�{}f�B�j����}�ze�"�$�msKc��/Ԫ�h�G��*����ȧ]�e�^�UO4���qS�"�Ь�ذ|����Y�$c��C&+RMA�`�b���caVE��z�Ec��fՃ�!��X���!�w:��r���]/��'�k\��Mъ �s�BF�%���"�#-:�9�� %sx�	W/��'�;�^�H"2˻��h�H�B�z��@o�����$��ӡ�s�����.�筽0��>����WF+��1�<���}e�"�$�E��)k�HE2����ǅɊ(�S�A�;��O�+�"��\������W�H";��O�RC�"���|��k�<��Z� �y0��*�L�5P�l|�B�z��w��B��h� �W�>�E9����ړ�">��������ǱH"���n��H"Ǭ�����̕ъ$r��h�Ѹ��N4ނ(��u��S!W=���6/Ԫ	F���g�z$����6��4g+�HL��7ާ��]� c �L��"4~cl&��y�r�8>l<]�E S��k >��$r�90S�ra!VM2���H\"�����ꉖ�x��_�E�eʧc�[)�=��Z�$����%ta�gI�������5�P�h ����qe�"���1��x�nՓL�/�=��?Ԍ!z7���¬z�9������ъ ?�W�����>/ܪ�R�Z�V�h������X�B�J8�\�8�#zaW=�����5E+�H��&���/�'�8�wd-V��G���
W>�E9���[���D�-,���ʽP�N��b��Ӭ%Y�V%�!L���.�r������5E+r��c���MK�[�$Ӂ��'Y�BhN]0R�|�V%��a\����/�[�$�7��h֓��!SѼ����G/ܪ�F�!�K���B�z�I赞�%Y!WM2�-].�ޯ��c!W=��o�vS�"���%��ǻ%e��X���F��­:�t
�z �P�d0 ��B/Ԫ�O���j�M�Z�w^�U'�NA���زE�P��`H`��DxaV%�m�>�����B�z�q��k�LS�"��4-	u�})̪'�C\��dE�9�<��_eV>�E�� ���:?/Ԫ�&��3q��¬:�h˿�x�>�0Y�Bl�6L�}��Ǳ�!6�_�e|�[��U�B�z�1���9�[5�(6L��w�p��hI&�]�+�Q�fԜ}4�9�\� �ˏ�q�HrU�ц(���}a�"�d���[��dE�c��Dk\(�­z���ᝧw���R�J!����=�iQ�U6F�{%KG�"���mL���B�c�AzՓ�կ[O�"��47W�Ύ�(���g��ъ(?y�LFcIJzՃ��H��D������(��jQ�Um~�|�i�y�B�z���t&+�IF���a��(�'c��nr�D�������c'EnՃ,Дo�B��0�c��w^3�[�@��|��4E{�Dñ�i�~�(ܪM�Tk�"�$����_a�i�(Ԫ��+j=�
�*�k�����(ܪ'�������dE��B�i���[�A�P��h�&��H"�C�0�0�_�<A� ˋ6�3Y�Cp���kZ�~Q�U2�{�F+��d�pQ�{H�q�(̪L3�K�R�Y��V�U4�A�y�@r�DC���t��,n���z�i�VDڋ3��F�^�B��d���w���2��m$D�X��[�$�k�zO�"���&�F�ᗶ�q,�Ȏf �z�ZrU���7˷8�\�/ܪ�q�}3Q�U'YL]��,��B�z�q��\��hE��B�f�\�/Ԫ��&+b�L)��r�fzVA��f��ƞ�Ɋ�ςjH��me�"��h�O4�V��R
��ֲK�P��d��c���DaVe�����>��Y�@Sp���2ZDl~���.V]�89d#2���Ɋb����"��Oc�Cv4���VF+���O=�ֹI��dFj��.LV����{���.�j�mV�Z�9�g,��X}/�{��A���E"Q�U9��!��z���c�C4q�֕�¬*c���W�DaV=�(�;w�fU�}h�Q���7
����кn]�Ue_}�L���D�V=���>lr]�D�ic6u���nՓ��Ck��l�4�ls����_l�N�3�d�!;[R
���lZ$6�\�/�'�b�n�­�`�����R�UO.����S�U�~���l�l�X�UO2���[���&�F�*���D�U=���uOO!VM�LW<�����|�r�1�޽�Y5�2]	
{�֗B�z����LVdޛ�]�oZ�81dG�j��":��������_���h�Y�4'"+4�+6Y&XDv��ؚ�"�����OcDv4����:Ɋ�ӱ$}�_%Y�C���_y&+r��Ȧ��:/>J�"��e� ��{H�1� ��`�SUv='R4~%ZBv4PxqZ��!1�X�ы��C���!����^,LV��ݩ�D���z��XĐ͈�E�Mъ�C�AF�h��"��dAI�w[r��C�7���/�&�����r��h<zA�aU��pv�4��&ٿA�&˫֛����n�ŝ���� �h����0Bۡ��7�\`N��>���5�7��h�_����o���D���o��0�i-6�WK�|ъ r���<6E+�ӄ�v��C�z�Q��})��dE��������!;��6v�%Z�Cp�ܹ�k_�o�A� �����`E���_d�+�"���aC��I����T�/2������Ɋ�?�M�L𵖶�q,bȎ�dh�{(J�D��W������E�=���j��A�~��8iҺ��0�^hv/�n�V$��o#,�sW�C�z�@�6��Pu'�B�^���݇Q�F��X?�hE���+�����H"�İ����"��Af��>�hE9����'Z�D��`#J�w���hE9���Hn�V$��3�����-�_N՛��Z�AD�lڈ��{ef��X�(��K��V�E�t��i���0�^d�hq}0nI�0��dl�����݇R�F��b�[�":e=yR�{H�旇P�����{�&+R��`��"���,ъr��=�w��C����l��%�,|���ɀ���+R��x�}�^��OcC4
��N=�F�D����?F\��-[DF՛�?�\��H!6�	�qH�i�V���1m�ي(b?�|�\+�Zv�<�����`E9��p�%�|� r�9�h�I�p�&�� �˽uy��T�ќ�h<���n�nz�iٲ��^d�7G}�U]��">����>��|���?$��:ъr���G���!1�(: ��<*ъ$?���]�dE9ȘI:�_J՝�l��4��wR���~�����h�[�AX;��<���LXW3O�g���ID�Z�ٳ����h��D�.\?��;�f�6:7R<��Y���}��=sH�o�:�uu�aU��T�237E{&�����
7ɞA� ��ɱ�����T�����woYޅ�S�Bc41o�V$���yV�sJ�"�$�n6�    ?��.�S+��A�׎dE���Pv��k��X$�-^��H"8�/��p�.xhU/2.ظ�Z՝�ƒ�֥Bx�Uo4w��>mx�Uw4�%tйK^ՋLgݩ��$+rNC��\ޅ�X5�����7�:Ɋ r��ӥ��IV����[޲
��M�����!4���>'}o�\�89� ����%YaU�d�Qd�l\܅ªz��,mt�iC�U�}�S�������!<-"���/}��9dG�����](Ī'Zd.~�Z�H"s��fFt�,[�
�0�h���:ۙ�0�N4�8���}-��w�"�d����
�j�AH2{�Y�8j�-����hE�M�6���>�E���&���0Y�Dd�΀8��jU�ߘvf4�:Ɋr��x_ĵ0YC��9�wv3C!V=ɌP:���&�f���e�HaU=�l4��@!UM2�M2�k�u�U=ل���lE�}:�d`c�ZՃl��+�&+b���!8�KV>�E��惜ߍ�+�A�~̛��t�(��Y�?]�=���W�D�9����±�T��((b�̈́�u��N4� �����D
��	&|k�{�Aħ�BǇ%�+��"��hH��3+�A�y1��V���c�Cv2	i�~�ª
1;UCltvNCaU=�B�n��h�V5�P�v��})��'�\�Xz�$�DD������V�D�d����
��&���+��h��cJD���Q�,�Z��,Fo�g�}}��7��(��'�Fc�Z�I��n ��/�B�:�f�����ўIa�6��53-;
��&�v9�{�=s�Afझ��P8U���m��w5���l!�'\��d��}|X��o��!;X@({g�"���>���ŕOc�D�8�����[��ZՓ̇�qa�"���`SΗ��Ŵ«z�9��$�2ZEp�R0�gy�:PhUO2��ǅɊBS�At��,�V�M�v�N�U5� 6t��Q-D
��AF8�;�Q
�j�alC�q׺�[HU4��y;-VU�W\b��+t����d�,�K
&+b�ɴ�!�����T�Ds���Uy�(��-M7VՓ̉�����d�4.�H��n!U=єP;oK�ª��������Y���V�D�9x��H"�[>���Ӗ��`aU=ɔ�7�`!U����GH�"(V�D#� e؇]~_�"�h�
J3�QDf�g��E\+�"�h*��ъ,�sK��i�%��W� 3��=��Z�$C��?t.|�j������X���U�su|�N[��":��9�m~�˻XXUO4�ݪ�ъ ��K�;Ȑ��XhU2A�P�Y�H!6g�d�����XXUO46�γ�XhU�u����oV�l�j�!��Uu��n1�qu�ꁆhh�ъ�?����:�p���h��Z`��T5�pd�aԷ���A&�K��K��P�&s>�cH���X(UO4w���],���&���?���_�p��d:�/�Ɋ �UfJ[{��P��h�Ν˻X8U-�i�ܸ���A&��ؙ��!�c�"i�����Tu��60o���baU�1�p݃�{t���"Yr�2�'�3�$��Y��>��W�@3�?�4%{�7\��m�U�$�[b��©:�b�)����B�z�ދ���=��o��B;��ªz��C�;�_���N��C��[kZ�/��'� xk�6bU:�w��λw���h���;tVF+�̗5Ah���Isp�3Y�Fp���E3+�"��hB���H#��G6ڇY���cFv����/>�¬�d�l
�y6�j��oy{�KCײ��P��d�:�fU�i�$��&��q,ܪ�	��_VF+��c�c���"�ds59t&+rM�)�.^j�-�%�7ZD��#_f:�m�0��d�w�RO�"���@��X��u�V=ьo?sO�­�h8�����l��Z�$!���S�U� �����B�z�y^��
�*���%s1���nU�߀-D�;��fՓ,4�:�AdNr�/"W�{�ja�V=�D߷{��V��'#���6Ӳ�P�d��vW�{�9D~2?�='ߴTX�U� �W�ve+�����_*��=0�[� 2��(�0Y�Ct�_$�^�س�[�U4%o=P^�Umn*om�)��#���)���&y�\Gkc8zU�9Yh ��[[��vՓ,�[�_
�j��\0!���^�D���5ZEl�D@��lܲᠰ�dI#׼SO�"��d
�M�s��Ы�h2�qk�"��;��Y�j�Y,,��'�꼀�
�j��T�ø��;6�P!W=���*kMV�0�����T�U'�mYo�"��Ot{��,|���e������`E��*��a�z�X����=$���x�ZՓ�GD��*��IƼ��;w��.ZՃl��}���h���7h#�ڷA�
��I�x��${F�$��L��t�
��戭}�TxUy�M.<?$����«z�927^�D�X5�6$��K�T�UO6���AW�ga������(�P�`0.�vO�"��d�|�ݵ��R�V=ќԵ5ZE`�6`(P��]*Ԫ�ƴ��ƽ/T�UO2��l��B��8E"���Eu��XD��΍Һ��
��C(>4.�V�јX��+nՓ�;���p�&����ᇵ%��B�z��"4��¬�4Ms�d��gaVM2��T%�w{,|͊��y����ea�"����gh�(P�a!V=�ԮU�MɊ�o��a�ET�UO26���c]�«�<=<ܠ�(b��=���hE��͆C�>�B�z�q�A�[�&+RO�F�]o�1^U�A�=mݳ�TxUO4wj�V��ހ�~��l�(��'�_=�=��2���M�˂�Oc�T��6���B�
��I�=�/LV���x�v6�R�Te�lC�{v\��9� ��xa�"��e3�ήX*����w��hE���6�:wFՃL �R;�AD�����Ϟ5�¨z���k�pS�"��{� r�j|!T=��8��3(��I��A`o.F�	BZ�?�j�	l����>�E9�c|XX�0ZDv43i]-��|�K���ţT8U'g�M���R� s ��dE�9?��t^J�S�@��o�ъ,�?�,�j�6�B�z�a�Ю�uO�"����pﯠ+�"�h�(�˕ъ$�Th"���
��I,��'Y�Cb��+(���N�M����
������z)�Z�JՃ�:
�j�A��[��=QX8U6Ej��
�j��oj�ɬeY�p�`�N���Z��D��i����{��ʧ�DN�����RU��A��I�V�¨z�ex�`�Z��";Y��1���B�*��]����B�z��)��ά�V$�D�|����ӲM�P��db�O�'YDpw6�7��,�JՉ�[�#7�XB�Qu��6 �g�3Y�Cp�b	��;3�0�h:w_���VF+�N!?9�x�G-{�P�d�C�}���dE�)m �n�[�41� 7�\��B��h([��/����cD4q���Mъ BS�0 ��;�V>�E9�d�bi�VD�c\S[����g��X�UO2ͻHc!^U�9ť�a���Ǳ�h6�co�"���p�A4^XX�$S�x��X��H"<��l��?��q,�ȱxW������VD�~�1��u!���d�)����"\�U��?7��paVM�]J�y��ԸP��h�Ľъ,2�����L�}E�0��d���3�QD���I�yi&f�-/�h=�˅ZUt���5���.̪'�r�]3\�U�}�[$Wx���h����˅Y5�X7����D�0�d6��3Y�Ctn�AڹvͅY�$���i+�Ad�)<����-|���R\�U{�1�fqFF��{�V>�E���ƪ��/Z�Cv��#�Ɩ.Ԫ���>��߳�[�UO2�{��]��!��]�ͪ\�UO2�����ъ�hs���q�{)ܪ'��5��paVM0�M X;���¬*�c#7��="�Y�@cT�h�V䐘��	us�®z�e�Z�z�=��0�z��r՝�p.��h���rՋL���_��V    ��D��Hd���oI4�S�1x\��-{Dr՛l.�|P[��� �d2�_���7p���o9�|w����_�s�E���s��í�dzl-	�Ϊ_~�Uo47�ΫN�!W�� ��p�|��U2�Z�{���dE�}#�XW��q,r���̣u��íz�͝N�Ɋ���%�d��>P~�Uo4��}�)ZDv��ǸmD-��fՋ,0P�/ںd��N�>wͨv6��C�z����[�\?Ԫ;�L�J
j�d�0��d1�f��dE�}o&dzl]�}�Uo���H���Z5�|_�H�~�>�E��2c�-�=Ɋ�����Y�~�Uw4�|\@g�/?Ԫ7Z�~X�2Z�D|�Q �&�uj��Mf��x�?ԪI�N�[�ճ�0��h!����6��qo�ìz�9A�u&+�H�f�S���籈";[�↮l�,c�Kҫ��e��íz��j��_��N6��#tV��í��Ql*,Һ���V�т�;/Q�[uG�����^,\�@>�ȁF`�[W�v�YߝC�Cĥ�C�!W�ɂGtny�U2��X�͕r՝l.e!Cl��Kn՛��~S�IV��L�P�k��Gy�Uo�P��hE�cߌ:�/.Y�"x����)ZDv�v��N��}"��ds�Ľ3XC�Ǽp�ZV��V��D�)VF+��ɬv�~;���C�:�6�N����eIMn�u����Hf�̶?��\E��i�m��_�,!��AP	��:����U��fO�u&+2H��|��l���UuG�Kt h����hD��/M�����"�dም�RՃ�3����-�ǇU5�t� p]�H!��|��[�":M�A�A�����!����IV��Mfq_��5y(U/4�;Hk[�<���fsG��4:8Uo2���Ɋb�Ɍ-nK[�z�<��ZrIt��é���m�?lq]�<>���C��5[�H!�����+��fqv��A��<R8�_���c�C�1:(Uw2����TN�-����V��&c0{�Y�{R՛�Z�O���A��/==k����@�n�_�H"1�����_R՛̇�*�0Y�Cv2�?�[�W>�E9��Jig3�<��;k&E���UuG��_'�w���?�"��dy�6^!�S��cg��u�B�z�	��.�V�DC�K�����q�P
��I���x��R�$�ȏLd�g%�Ъ�l�z�p�B��l��B�v���8Q(�W�$��u4���«�0{�F��u!VM4���֓�RhUq7��,�a�za�"��l{Trk]�-�������?}=��YDv2F��X�,�U5�`l��y�P
��	�2�]��2ZBp������߲٠���d��a�za�"�d.�����q,BN�A���N��
�*�oX>���v�YN+���OM�4�(��'��+ڻ}a�"�Џt�a��i�T�Dc�ۭWF+�M�{G��׳�y,r�A�Ԛ��!<�9Cg?g�S!U�h�ͮ��T
�j�A��1:�QNՃ�QY:�JU<����;�p�p�&��f���X�,�S� s�{��'Y�Cd�s"����+�"�h�x��6E+����4��n5X�<A� c�y�0�&�6lh�h!T=� z�h�TŹTx3d�v�ud�T=�<�$�IV��l�Ƿ.�FUԹ�	?�]��H"Y&��XR
�j�e�'��gP�TO,����!:���.�2�M�Do�"�ؔ���pxO!�H-t�'Z�����§�hs�S�i0kYL�§�h<6��/��h�S=����Y���M5Ʉ7�\ �¦z�	�=���H">��*<>�[_�<Q� Rh����N5��2�̌���|�$�?ΐ��W�\Ǌ�:ՓL$�@;�9��eNz)p[�	��h1���G%�P�b�k�������hE9�$���Z8U4�����G��S5�86�λ�P�&���O}+�ZUi��2f���z��L"���weF�j��m�7Hk�n��S�$���0�3�$��z�oY��B�z�����h�(B0�.���ZhUO�|��{�� ��y�N�j�o(*�xS�NՓ���d-��Iƴ9C�����c�T%<&f���JՃL�����IV��3L���LϚS!U=�,gӴ��&�.�m]�-��'�8���A�@l]u*����;/��B�J4w93G�5~ZhUx����B�z�E��`E�9K.yGg!�V�Dcߒƥs庐��dd�K&+��`<�:K,����h��j��ъ �?�M��k!U=�$�s�A�TM0�-o��練0�&�p�^����¨z�Q�⨞dE�9"/�Y߻�VUO6�[�ӕ��!�ϕ(޷����©z�ɀ[Gѓ��!2'K����╏cC4����!Z�C�7`���>,|� ����ڡ�h-��'��u��P�ҾT|J�:�
�ꁦ�a�2��ъ(2o���&hl6�B�z�e~��kqO�"���F�j=+N�R�sD�Y��!���jo<���R� ��r��{�)�f[`8���M+��ͧRU�u��P�&�6W@_ʆ�m�Q�$cz�@�0YB�'�)�]��z�?���y�:�G�p��ϞGG6k�EQ8UO4e�� RHU�'����ªz�1�F���ªJ�6��,��XZ�<Qd'��Eg�A!UM2�m�I���>��U�@�1g
[�Y$~��q��O��f�,l�Vd�m_�Ѹ�����`C[s1d_r��o�|�3��0j�R(UO26��d��cN��L/9J�*a!T=�`�{o�g
�h�;�H����¨z��a�O�,L�� Iƾ���Ц��q|f�ߠ�[��>����sKO�TM2�L!n��D[�4>cȉ掭G@�j��n6±���P��d���c�dVU��u�ut�¨��"�i���i��/Z�B2�wG��dE
�9��0�s��
��I�O�kuNS�"����RmYJ�B�z�ɸ[���9dG3���!VUO2�����9d_q
���]��¨z�! D�͋V(U'�m@�*��¨z�eF���
�j�����}���ǱH"��wq��hE���M?�/>�E����Һ��
�*�tl�a\�e��
�ꁦ0��{WF+�����O��Z�X�<>Ճ,��v��X�SM2��>��>��Q�d�?te+��eU
l��>�E9ȄǵU�'YEd��
c��\+��Ͷ�o��y*�
�*�\ټ�^+��'���ؓ�H"2
�M'_�W�����h2��F+��N�FF��K[��"��-�n�V$�MA�<u��ªz�	��&+�Ⱦ�v~8��ӻVHU'�'�66�X�T=ɄoSxO�"��4m���k��q,�ȁ&�z��J�$�Ĕ����q,������1c�R5�hl,�ޭ�kׅS�D�?;ᚢ9�2�o��^�Ӳ��p�d0-m�S��1Ħ o��Gw�p��h�&ﶞ�ъ �?�Mp�4^�c�V�$�kCDK�B��dh��uݵ«z�a�=�VhUMp*��:��RՓ���K��1��H�(�u���B��1mC�zWA����8��'�H"�!i�V$�}���`��
������S�VxU'��e~;w�ZՓ̂��O�g�1����;O�Z�U=��C:���&�Fs+\���¬z�1�e��	�"	&���Ht��b��5��h� "��A�ޯ����C2GT�LVxU���B�u�=˻�X5�h
�A�]���E+r�A�xO��$+bL��(	��s-�������5Z�C�u��3�ѹݠЪd�p��$+r��;D����,�V�M��w�
�j��l��TԹ�VxUO4E�l��B�:�4����e�HaU=��QΝɊ �S��l��?ϭ|� r�����ZhU'��yT�{�d��X��L�} ha�"��|�4����0��hj�{ZS�"��|���W�R�o��Y� �wk��
���w�Nvw/|���Ǭ��H"2+3�y|�Z�<Ad'˧ut�%o�Z5�H��k �?Э|� "�g���K׭P��d�ç��Ɋ��|��������c�V=    �h����WU/䪉��=L�і=�^�U2ĸ�U{�9d���{cI�O�^�UO4u��o=+�A��*S�M��j�	o�:���­z�1�B��9/Ԫ��_p>Ү��-�x�V�}J!h,��x�V=����x��j�$cۆg��Ư�^�U4@��"1��Q������AF��ƍ�x�VM2��;*�{���Ǳ�!;��͒�?�x�VM4�MU�z������Af�5��xaVM2�M��מ_
�ꉦ*��[�?Ԫ��7|V
G�63�Uo��h��D���N����k�^��轫ge���NƐ�Gil��W�&S�~&�7�\dp}i�>���b�~%A��L�Z��7�~W�,|��!Y��x?��=��;�lꙛw;/��U�Fc�V�}�b�R�f%;Jm�!U��x���ea�"��ޯ4Em����Ъ�l����F��ي(�?��Aͽ��*xU/2���'XDpoX2�sq�
�C�z��v����WuG�}Fn��ȇX�F���yc�?̪�F{��Pg��?̪;�&1��md�Vd��L	�O��C���; ����aV��d@s�"��F�`��Md��XD�$���L���@�Id'�����݇Xu'���Z�b���[�
b�M6�d|�_��x�U/2��@�Ɋ�ӨD�Z����ft�`l�V��]�Dk<Z���E��q@k�"���.ê����Ъ^hJt���Ъ�h��咝�fZՋ��c4V�C����ms���ҳ��Ъ�hA�a���hEѽ�dH�V��V�"3��߹���U��P����zZ�,�>��7�������ъ$2����^������E�����U�ë��	o>�þ����C��l���I�:�R<Ī7�)@t&+�H��F A��D�C�z����U��I��A�vu��,>̪7��bak�"���~4�P:��<̪��6^���j���f�y�?��Yl<��;o>�X�F�w�W��ꎖɘ3?�t.>Ԫ7�8K��P�&Z�
o�9�����y,��N���'YDb�62;�hm�z�Uw4�-B;�6fՋl��P��G���d���77H=̪���t�R�4.�?Ī7��=Nޓ�C�lj�-�u��U��������h��hL�`Dm���^Ճ��L����V�h�r���K���C��0"k=\�0�^h0�[�f��Mu�)����&��eV&{&�$���� #f՛�}`�ђ��XU�x;�L�Aw_O� ���d2� �zɾ-K�_���db@��=�_��E��X�M�:7c�Ū��=
�^�^�+4�M�t�}����1���~�N�K�_��E����y4�X���U�F���Qk4|��lx�������c�Cv2 ܸ+��!�K�f�Vk�H@�Dtz�X��k�V$��,\�/�=Ɋ ����_�oi+�"�h�!���I����8M"�;��(r�y��E���Ӑ�K�E9�|��ǅɊ bSC7�s/V`D��u:��.��ъbSC'��oAJ��X�����(�H"��� ̍{��$���捿s]`�D|�)$�i�e�AE9�xXg�RPD���)_�e�YP�D|��H�:{��$���A��:I$�UmSE���+�"��h6���G$�H"�F����4n�*��A����&+r��Щl�˻TĐ�,_@������2�� j��)��CN2��Ϭ'�3�$��E\�6���3�d6���`�0���i�ܺN��r�9;ck�g
I�|V� �;�>��r��&{��$c��(���k����![�Ȁqk6)�ί����x�NHD�|^_o�=Ɋ �s�����[�8IdG��Um]ޕ"��nÅa�E>�E9�d��G��Ɋ$B���6߿��|�(������{e�"���b<�Z�z�Q�@c��M�$�S;�!}5����iEv4����E�Y�0v���G�"�dnF�֯�Ɋ �+��C�1���B-�ȎF�G����"��,�.�{�E�)1V�֓wZ�,�h��Ema�"��\T(�|�fzvtZ�Cv4���p��!����{����{��!�-�I��!8~d�0w^/�"'�QD��X�"�6�D��ֹ؞9�$�6,L��!��!w����"M�1G�:�pÞI$��0��D�=��"'�8���{�ܫ�F���-|��CN4��d�2XC`�~�����"�d���gf&+B�mL���;�d�Q��b�@���Z���ѧ:�!ZB��>yM����;v`!m<ON=Wҁ���A�R� ]��j��.r��S��1�����4:���6�bs��F�z�УY\�'��|c2 !r�r4�ʙ��݁�L�.�r�8��[��SO(8А�6f@s��h�r�{�h���d�����D�B%s��A�a�%x<�� 2Ɉ�Y甓�����]�d^h@EZs��㓢�1InL�-m/V�YdV��9ɀ�̴�Q��e��LdL��I>L:m�Ԁ��ѻ�p���N2 "�H�$2=GP�z��K�=50�:{s�q�tq�YhF��b)Ȁ���\K�k�@&h��L�s����,ه��G�"�lD��(2 "6�����ޝ�z7Ѐ��Y�QKuJ|�h@E&��<�N	sZ@��Ef"R=�i'�AZ�����)Ѐ�,�^�n�N�L�3.]����0Id@D&���M���o�l���a�ߎ��Ȝ���&y�ADd�i�ɀ���lxHy_~��i��T���JU�g�i�G���B3}R"Iр��H���By\�x�$u$�[�d�C|D{���}�i��Dd�I�N��~=Dʜ+)�w6-�~=�"�0���s��zH�q=��ċ�WDM<ގV%o�=^�r�i�B��~5$Ȫ�+�=��9?ρV�Mki��<�ZU������?���㯇,2��4��٘�WC���h��mX9?ρZՅֹM��h@Dhv�s��+V��{�Ydf���qc2�!t�ѳa�9���
�\���_���@��"��{�nίX�U�zhŉ߿�o�Ѐ���Ǳ���JUM��p�́wЪz�io�)ܝɀ��P�f���R�E������%�����T����N�M�{N0Ш`�5����X��R(s���Y辅�������h�b뽪�f�c|7�Q�������*��#
�PUf����z�b�@2�*���")�K�Ը|�3����$^"=3�T4Ճ�؇�э$�T�:�@���2�"��2��9mDd�9�K��g����-ȞR4 "�T:��s�hT��*����qlT�2��^e��i��s��р�ؘJ���2mc4P�z�������L���ٿ�2�*Uٸ��;�r�i���͞O�9�M��͎R�[�j�@���]�ȧ�bP�zqY-��ɀ���1aO���A6k6�:s T�^dV�2K1hT2�C��,�h�Q5��\Zol�%t�.��j�y�t���D�ko�:Z:U/�n�-5�_���j�	PP�z����?��ɀ���e�T��7N�|��,4k�SG�A�����<����b��Y���{���d�2�F㴕�=e��@��Νi����S�UY?�����%|h�"�s�V��(q�t���H��ci+r�8eL<�T]d5Ĳ%.�&P�dR!�woT��#�F�M�{n4 "42ފ��qN�����}��o<��a��T��I5�q���F��z����@��"��[�d�C�2'k�[�[}�-�{�Vf���V�p�*r�H`"�����rc4`"r�Wb-�#�U/�J�ߣX��J�@�:V�kI\E�Ru��j�/�	4�����n�̵�UZi�})5p���ʜ�����3:UZx�Xt�3p��6cf�+�	t�.2.~��ޘ���iI�*5s�@���R(s�6�R�@��R����=��S�"k#����^�w�^��N�Su���%�~�30�:Z,���Y
��Y���h���՚I{����4�h�TS��(U�9ĺ��NU����� �   ��e=JUZ�Z8��5hUUÒM�e�i#P�z�5�w�.'�%��c�,:�y�JU/��5u�V�@S;��M�� ��W���r�I4d�s��a�·h�����oX5�U!�T]h��-�D!�NՅf��껇���:UY�Vr�i���ɋ��(��Z����wF҆�Ǜ�껇l|��L2��?�9ɀ���b��.��
	t�^h�\�7�?��I�t      �   �   x���=��@�>�b�Q�(3��ĵ����G�D�b0&�I��F��õu�f�x�7^��?k���oPuv��>�u�SYQkS$�Pom�X�P�cS����>t���$o�3�iZ���EU��}����
z��e�`@<��%ER�R���M�ن��^���˚ �d�"t���H"��I^�q�m.���z�>�
m.A�k����y��k�v1��X���l,
޲<�N�8      �   �   x��ѽ
�0 �Oq�X��$�Q��С �[Cm"-Ƥ$���ۊ�G��;���4�'���a��n����*��r9c���/YQ��
n�=��#�l�+�U���BYmX�'pZo��\B<DG�-h����N!�����"���I0�h�?a�\��¡S�e��/������O:��M�e      �      x���Ak�  �{~��Җ��g4��C��A��*Yt4�%C������ЬaG;�Ǉ�i�ޮ6;T�w�H�ͻvue�z�M�k�Vf)�_��ܷzh�ЬQ)����}V栏CXU]g�n]ge������i�E3��)�$[ ,H�04��`�����8�'�����%e�T��*h���� ��w�.�CQ6�?K�&��*�
�����8*�	�˂�@�wLhL]>ą�H9�j�9��\��_�=�?�˕$�f��      �   �   x���v
Q���W�/��M-NN�IMI���+I-�K�ыϨ,H-�7�74�O�(��V��L�QP)V�Q(K�)MS є����Ғ�����M�0G�P�`su##c]C#]CCc+CK+mCu��"��RӚ˓.N��p������@:��I WA����S��&.. �ㆭ      �   �   x���MK�@�{~��K[L����x��C D���%m�44&�n��Ɗ���2���0�����|�.T/�r(j_�]��5EM����wN;���9â*c��YoE���6L˶��}m�r	��n���0g���i@�H�PE�QV�;��B7�V����)`l��#�����K��'��:�ez��	C���`�.�~x���_�I�n�a��2�K��DXb���gF�      o   
   x���          q   
   x���          m   �  x���Oo�F����%�B�lI�(r0P�@��j��FV"��D��/��#μ]ٗ<9T�~�X�����_>�uW�~����6����>����i}8��m�a]_���]U�mݶ�o_v�ޗ��v��������ӗ����x�{�-ʺ.6ͪ�>�yU�zW��j����w�?[|ū�r�r�~(s��vצ��E�E���/�E���r��C:�I��*2�o�	��2��� ��F S,���d��r�j�w��4!\3T�#k��O��k��v��D�\K��&
OU����dg���%Etf��tc�y�׶�J:6�'}�{����d�����|�~;�}�°��`���I�����6�d����mA������{�&C*i�}V=��
 ��DPL��}���:��5ߝW�Ǿ��5E��V�='�C����Dq�t�k��Nsm�]�N���҃D:-��M$�\�	tω&�i���Du���oݯ�)�5�2Z }��a/A�6 S@�K(��&&���
��U�6|��a��]
��CR,4�ly�5)�K6坔rYS��t��ʇ�ֵ�CƈR�hC�yy�`@�y�`�@	��y���e�ו�� 1V(�*���� �C���򗁨o��U����:]�M�c��הq5�J-,��iC����k��ɒZ9����S�{�m�7�H�22�;���5��<K��p W�q�+.�cf�7�Pt�ܗ�w�/����
YRGS�!-j�� ���ɃZ�o7OW'�����}����(ڐ�@^��$���t&�I|�Z�T�����ඇ�4W V)�R
�� �S� ��qJ
L�
���W/�B���c11K"a��1#Q�c�d%:�N�������&C��A�H��Or�Q�u#����F;l�����t��n:�r�L�C;����� P��(�Qb
 ���0�����5��+��������������l��e��N�m���e{�;�4���L�A~<�$Ǖ���4yK�0/�e��y�p�y$�4�U��7_�? ���ץLٗ����P�mTH�9��FE13rZ}�b�yx\m^_f��BQ��i�eŉ�)��ˆQ��L����:iv� �f��e
����)�iɍ�3�8��Q9�#�0S���F���r����L+�%G�ҕhҐ0����@�6S	�Wh��g����o�Ӷ#��	ܛy��K�L�7��E<�@��o�P�O�L�%&���~�j���KO���C���2ʤ���#t�q&�d�tF�3M���!r��LF]=��4u5����N�0�F�8)E�aN¤�Sd��	� ��
��N������sS&IvnjH�ؔH2ɌM�05eR�w�7�t|�Lי@8R=˔NڙX8o=��NݙX��D9(��3�t�6���j�!!	��+T�3]&$�W�2�L0��_�J�z�P�1�@z{�N�o(�J�H�L��S�P�dJ6OsD�[�䙂���c���=Lg�@��a�w�Re*	�ߔ�(�PIn�'�q��B�� 4U濡��(��H4�s�%Z��b�^ʑ�&�s��A`(����9�T���dnpP��<r3��̈́<}3�pa!�cę0:�'��c*3e_��a��N���y�y�A�1�L�E���r���ծg      s   �  x����n�0�=O���v�d4�j�%�-4
d�'R;	�<�$�FU�J��%[�|���O�Gn�y
��t�t�M���~�J&��S)�'Q���d�v�� .W2��(�P�Gz`
�rQ4]��ف���*���%�M³��ӄ��?2�x��Y�wX�x�[��{��^�a��Yf,^��	���=Fl�E��:��\nӮ[o-��裏h��;8`2săȧa>g��/a��)`4�ai$�jC*6�e�ݾ���b��P �$��65H�!�����ߔQ���lz�G�rd���S������.��A���ˉ�28�MZ}��o�����2��� y��h�,�,U���+�q��kgsW��)C�n\}h��%r1xۖ�npvN�e�Tx�Β�FJCW��Y	x�4-�YDo��C���G���r�.�Ӱib�t��x+���E5      u   
   x���          w   U   x���v
Q���W((M��L�K,-Ɉ/-N-��E���ř�y�
�):
`Q!�j*�9���+h�(�(XXjZsqq u�c      z   �   x�ʱ�0 Н���@�kiN$AWR�#����׸���M[�;����m�O.��z[�3=����I�-dW�	loZ���p=/UQh
.����($����t�<wr�*'&"C�rL� �K�%�1�c�x����)P      y      x��[s7����)��2�Z�s���D������6�T�E����,z(�fSS��h�;��-�z��U�Ғ����^]�ή�f�.��W������R��������X}���p�����fu�-����݇�͗�I�����r�!|���v�u[<t}��t�-?�߳��e}���h��ۭ�vv�]�?�p����g���wg���p��	%� ? g�G G�(b����'�@��t���n�e?����d<�����v}����	���X�V�ՋQ������]�m��?�{�76��Hj!�Te�2�����x�J�:AZj�ڑD�ʨ}'c�����t2��ǳ�����au2ǰ|'K�L���;��/��߰:Y�h��fRZ��'��b��(;[�?ێ*AtCg)P�� oE9,tEW���=��Q������o�b�1v��7jv�n���~��~�}X�.��i�~���觛���ݧa����[a,��!Z*���t��d{P�M�mn$!���Q�W���l����-��v��=j�*&�-Qun(H�9j���?;9�$���Apd55��% ;9�$����	#
[��ڂ��b;���?7B��V�S���`����P�R�E��� ��R�HJ�F�~6���vWO��۔#���.��n�o6.6��UN�娼��{w:����z������!����n�y����l�ۇ����#��VfJ1T�M9����J���meơ17�g&�%��fQ'2�)��L�ee&�2�И���x_u$��f6��׬�xzu��=�&Mz�u5�����h�+qȷ�/_����a�~�C�"y]�yl�ɝ%��u4<�7�e���L6�l�\�:$]���q^O��P��I��paD&�\@2bEd�6��`�S�$[Q5�{��IZQ���T�<*����ꁪ�G�*S�kRUy�6���t6���)�r��@ /%UYU=�Ze�S�R�T+�u�Hݔ�<�n�t�p�j���)MJ覄�)�
	�)��,楋���t�?��P���������)	$�1�;���)�.�U�$���f�������i�\`�.�rvbA��i��� 54���R^D���a�X�w!l>_�O��$o]L�h�ku1�1�;}>��������T��(PZSl%Ă�o.�/'�í˪Wa�dK3V�}3}�~z�f`�u��yq�,�R&e�1�l������;�u��#�Z�)"5؅�[O�.�rd�FKm*;dm�]��$���K��B<N+P�4���-�尼^U�_:�,�v(����Dtȏ$�
U�^�V7�pV!�~���kJ�@���: �C���8i����v���
� ���#9i��d���d"��K��9�����aI&U�L��-�@g �o�ZHP�ȅ�Rd�˚�'���Ci��Ց����րV�K����W�K����  p�_��<�uE�L:ﰆ�xK\%�M�v�U�(w54�)aV��+og�!wI�$�����+���<��~�/�BR��0J��l�Z�rYa�ߵV�o���5�U+���>?j�4�n�u
������aM+,����,&k[a	*>�1XHֵ�&�qg��L�4�����z��%O�TP{R���z�j��4��ջ�>���6M��G5�^�c��7¦U7�Q{�'�Z�M �T�ZS9c��i��;����a�铏
fh��N2�|�+HW��X��������B���xIK�վ�M�����Iz�Ő�
F�Gd������l +
�y9���&� �n%(a���fǵ�ȡAcZ{�m���ٝl1�l[`O��Z(�llY��o7_��-���i9��RH�C�4<�uTTJ��.�<����W>]n�_��"I����񼚲V9]9i�f�]��%�VWK��_0��p%�������n�on�8L����R��g�Bw(p��}��ލ��o>�}�r�I?�.�rd儓�+��l��m����tuY��.�mYm�I�������s��7��ս�ˋ����ů	iW�IyaN��#�=��[a�[lw���j�[�8�^�ݭ�/Mx�����cFl�UDP�j�������U�ÿ"���q��/KX�a,ohzy>;���uS<Q���F��"#Y��'�M����4��j�p�K�t�jE�ؑH����Q>�j(���:΁$�gb|~zVB�㳏�&�c�p�{�6&%��q�8`�^gᵤ�R6�tHgw@�ry:�	1>�C�7STʂ�&�	�Ɣ�RW�����khtu��Ӆ�Q��
b #�ĆCLcR�{EVY�HM�A8�Fh���I�q���"���$o�R��$	*�|�.������U(�)�Ԡ�R[�����W��MAC!� $�t���6�c�i27U��}�TR]�]�ϓd��0��
")�cK5�J��HaHX�Z�r��fP���2��?B�����p��l%�f����u~�9ȹ	�#
��!�*^w��q�}]o��x뷹��wn����Oy6�qZ�o�������n�{H�,�H��l��P
���Ǧv�`IsD� !dd(�**9�h�$��������>���
��O^�jp����yQ
0$K�ߧ��jh�����2�!��N�p�O�jY�;�JP*d^b�z�������ǩ#bLV�P��V2��^\)W�j\t|�+Z�����
��q��Z���$��Rsϯ��z!�"�IWA�X���۫��EGm�4;�c�����EM�"����-��W2,Z��ڢ�c�G~��/W�����4�[ǀ���+*ݡ�s��?5��6U��"�J��f>\4f���O�6�Cz��)]d�>?�S&����i����m�)j{�]a�$�"��S��aI����l>��v]����@����TaA=NV6���{X����=�������>�^�Q��m�ܬV��/�E�	R�N�"�l&e��9A�U�)�U1��V��j��_n�S���Ј��:����m{��4Wz�0����*v�	G���ߪ��b�+�k(�Z)���O_��)8r�sp���F��Go���X��qQ�VQ��?58|[�Y�#���C�v�}4�jp��AO:��^�R#�����e��kMq�ܳ{ڼЏ��-m޺p+x��o[���+�/�ڳ�Kڼu�v�ET�-�<m޺2�pqS�)���	B����<qM��|���*��B�Dq��t<�N���x6g/������!Iw�k2!�zn@�bd3��Tw���XYk`c'�D��w�H����Bu]6��ř\�,WC�WJ6�9�8���7O�O�׫��tq���&3�'RR#���^�w�&0ƀ�	���'��iS��I8"��'��V�4���j�s������=MSڈ���p�VV҈�]��$��+�s� d�ؓ�{�c�p�������������FG��RW^�ot@��-+��ۥ��v��M�� ,KFJ[l��v�
�I��R�F3N�i'�&qSk�cJ8H��nۉ�<�4��b�+���g?Ǿ%m�tS�)3B�T�<���ڛ�ˍL��"���^�x]��/�󆀮�H�t#�jRCp�L8(^���7At��&��Q��G�:���$tU�M��Ĩ��'�\�����]5`��1j���ug�PZ�P�.Jm�5#[����*�0�2�`d��V���DE���N(�N(�Q�����"2�Y(�V(LY�����S���%-���ܘ=���/t���/���j�V:��vY�4y��K�aI(u�.�o��J���ĀBy:6���=	�� �)�,�@e`C�<��fx��0z��t2��y`�	�11`���X���-�2�Iv�X�6��V�/�O�`�G�t����L�m6����$�K5�ݬxq~z~������ŀ�5��]P0��N..;��%	le �1,���(V���������F��8}�nc���|r>{94sf�	�a_���^�L���nHS8č�P�]�K�x����~[n6EHD��2W��?BS�fS�P��F]�d�� �   uE��X5~P�X9��1L2���$�ci��Y����������������.M�&�Bʕˋ�X�E��uK��s}Ͼy����&}�ͺFS��Ŭ`�}o��/��ݤ�N6ۀBAO<���6���s�M��v�xC@�!�;�5+���NC`�!(l����;r�U6����$�4�)E?G��(49�b��h���^���ۛ��M��+E�mn6�	��:���NG�Do����r}{�^eϮ��j,(�}���d��      {   
   x���          }   
   x���          k   �  x����N�0E����
R����!V,XTB ��V�3��6~ �{�Q�T��;'��uf掝�����C��y��L(��g�S�^s�<)��[Cى�F3f-YIr�5�"y�=]^?^�g'�(��jR�q��O/+�h��oZ�!��V8�$��V�COtpdq��H���ݰ���E��]�w"�'0�b��+�*�{ �/��՟�]Fn���7T����E�8�|��}�������Rc�P��b��]p`	瓄�5Ѕ�tO��H�%���|/a�g	��9d>���;R�EyE����{�<� O����"���
Nl�cœe>X��?ql{n�n�,$�%�q�F<{d'��{o{Y���o��@����3�	X$��kE���(��� �	�C����.�V)�7R����y���E��=�O!q�7����Y�r%���ڵ����Ǖ�      i   S  x���M��6����%A��o��rP�@��Jh%�W�,)��ǿ�P���-n�ˮ-y�f�yg�~��㻿?%�?|�+馇�*��K��Z��v}>Vm3$���M�wݛ���n~YW�|�|����}L^���e�6�k��W熗���j���k������<��1�2Њ���|����QP(��|��F0B����<B���{8HAhT~�@m��0=�/ۻ}��YRk�܄��@T&q�Ğ�����}��-�ڪ8�h���M�+�.�:޳�����DCA���T��������s��3��v����kv���q)��ʦC6vd����yU߃%�q]��X�����v�&"n���P��·їC�ɜ�m��B����$J��T�'���`�𶩔�k�pa����y]�����l������0�n�8ĭH`!�^����JF6�!��RٽlFH&㲉�ȑm׷Sw/� L��j�!ةC�9����_gF�)1�F�U��@���X��'R��"���ۯ��1G0�MdO5+ �0�P�P*-(�6����)Yabv~7j�E�E\o�ǿ˻�xr�T���.e\�Pz��9u��i[��ކӒFN��8�	PW��[p�ȑ��x �,�6����N�-8q|�at�R����!����[pr�����>��q��J�->u�YN�&�ahhq��-8}<��Ӽ�cޏn3ъ�0�K��b5k�SS}���Y?]�l��3��bp���=��(��g�Q�p���Q����@�Ӛ[~{�7n&���{=���g,@Z�ۇi�w�X��.�-�%����VS�}�_Q�x�I���"������n��l>N�;��W��N%@2�2��[h"����փ�=���RĮG��#_�������3�ac"U H䍘��K݊�%���n���gzLX�"\��U���.�y�����%4!d��pRN��s�\X�UآG�+�����XBxFeFMʤ 2��8Y���Ah2�R��U��ê!׮<i�G�Zc�9p��2n69���BR������ҌCF�`��5X�V6�Y��ݹ�	�^{��)D&hJp��q��8_�ڐ�t*��\A���d$n����f{7��֊��8�A���E�Mt���P�ΛQ��وŝ��0�#�?$���B�������ƛ	�"gZ�ڰ?,�۝�_�~��%���C�xM��
*lf	�Z�W��~>_.O��/X�n�g'��^FXJ�<�.��dYo�"o0�U�{*�.�E��5%V��$Z��ߤ�๰�F[�[��\���~�
-� ~,��c��"h'��%�>"�1�b~B,r$���Y��/�2�G��ŋg�f�      ~   C  x����n�Z�}�»t�ct�x�`ǸcL�!`6���?}�\)� ,��/��O�R��);J�w��4rg^l�Aqn�������U���B�<��_(,����O�c��e���LҮ�ǡR�⛺��8i�S�9�?�P�3�����f��[�?/Q��E�v��>)�y�&����<�k��B����Zs��]H[�l��H�@3����
��h�S��+�uU�����0P�cm�Ҝ-�K��)9��:}#o�]o�KKn��68L���OauU��1_�ڠ���X�����	��m�;Z��n�9F!�pJeĪf���Ϥ�� LCD��D���a	��_ >������?�� ;L	A�9E�%�{{5�U����� ��?_jC<�|�� ������qQ��4Ū��1������"tG���v�F�5���0����҄�?<����bލ�u[5�W�	��Z8,,�.��ݖKm|��iJ���#D����3���;���Q]V��WLs���7A/m���Ҿ߉֤+>���GSH�_^�ʺ(�Yϛ��G�-�'Y��s"D���	$w�g���6c�0v�(}��&�K\�0�����B�`�n�Vyp�:�쥕n����s~�")2;��nԑ�~�ǀ�93 O�;�gN���T��w@�4n�F���;nu��^FK\n"=�W��X�*د�$�o��Ձ�FI^b	H	,��@���g�Ȓ�
D`�����cb��Sx���q�\��S�=���Y���}S�R��R��f9ӯחZG�?(�A�W�H���?�n�d��@����_ip.      �   
   x���          �   �   x�=LM� ��W��m A�N�v��v�7��j��S�.���0��:�0����u���JH�0Bc�$z4�I �^�E�Y�1��<쁤����Ԍ"�ͥ�o��ĝX����o=��H��� e�߰�X�di�(+�=UU�Q�5
      �   �  x�՘Mo�@�����H��M �zr0�I�l Q/�f������Q��;3˶)]�ua�XyM�ٙ���p��1O���>�,_ޒxΒf�H��%kY£�n�v�6��/�ͼ�oㄷ�mT��hQ�9>�x�.����6�_�l�I�����\<����u��b�_ϣ��+cf���и4�F+��Zh�Y��i�m�0���h�v��!�f`@/���^�F�U����s���w����շ��~�"��,$~.\�7Q�;]B�	�%�-=ٯ�%v�(֬9𢧎�kK�'���{0D���DC����I�ئ�9�}�u����%٨�X9.�E� '_�����%qWk�[Z�4v7��h㌱�e��I>s�~P$<{7�����m��6���/����hD�p��4�a�\�0��ƌ�;G1 �J�,�q����n�7Mcova���=��s�D��X�*�A-���n�a7)�'~K��R��yU���?^ _�A�Wo�' �}�O(b��9�xNE��+�?��O��^��[�ιc�=�l��!��T�z��X�o	���~n~EP���-�z\�8�3e���$���!���Uw��9ۥ�:xq���m����гj{w�ֹiл��:T�h���l^s�~/}e�����ڎ�����j�あ����X)�A+u�ɭ�������{�%���o��������>ǯ�Iκ����s���Q.ME_^���0�H����F�e�M���q���@��S�d�Ue>��4���1���-�?vl�,/�_�8��}W�O�w�F�`{�=R�F�)�,�-"�n3ѻ����Ԟ��i]�;֟��Ӳ]�׫u{�ÁV}�������):m�N_tx}��J���a'ȝ�T�Cn�s]�qW�;��!��zYnWpǇr��p��T����:�,�� ��h      �     x���MK1�{Enma�d2��
R��^K���R�j����xػ{�����l��~w���Y||��!�]9i�X�	*��0�;�Y;Qc>Z�ׇ��~/V���:�/�6Ģ�c'3@�*8*-7����L!@J$���sB	-Ws@z
��Q%�v6X-�9 l�[�\�z�Q�(J���H
=�����i������K^�-�ZE�-�9$��w�͑CɌ*a�brs]�Mc0e<8�]N��\G���D|1��l9Y����b�޻��      �   �   x���v
Q���W((M��L�+OM�O��/J*-)��S�HI-�LN�/()��L�Q Iŧd�&�d����������ҜT�HA~Q	Tyf��B��O�k�������[Q~^�:���iohbI#Mk... E�/�      �   �   x����k�0�w����)$֪�iP�p�����%���'��w�R6����{��pIQV��EY���?]l��"]��"���Oۀ�ikB1nic	g���϶E�����}�Cr��֬����-��R��X��H��Bj�G�Rqٮ���I���5Em��^P*a�a�&��S�!�<]ƙ�e3M�9#/�H��%��}�s��f��rJ?���gR�?Sʢ ����2      �   
   x���          �   e   x���v
Q���W((M��L�+OM�O�-�ɯLMM/�/-P��L�QP��4�}B]�4u��Ab���\��d7ɉB���&9Sh�	�$�I\\ }]      �   �   x���v
Q���W((M��L�+OM�O�K-J�,N�+�/R�HI-�LN�/()��L�Q�MM,.-��K*+�,���M�+�Q���̏��O)�I�Ts�	uVа�QPw�5TS���\�����l��b#��\\ ]Q7      �   
   x���          �   �   x���v
Q���W((M��L�+OM��I,I�P�HI-�LN�/()��L�QH��/�O�,JM.����!ҙ���)�9�p�������M�0G�P�`su����u ��?���0�F��\��t��!�c,�n���.. ��[
      �   �   x�Ŏ�
�@��>��T�`U��)�`!,Ժ.�;Ђ9����M��y��矁�DQ�e�DQ��0��Q���k�:�ЏhY��j��Yit�4���XP�`O�smP^PO���{���zw�+���[���)l�<{�'����WJ~(��d�����������(�n�32�;`��	      �   
   x���          �   
   x���          �   }   x���v
Q���W((M��L�+OM��IMQ�HI-�LN�/()��L�QH��/�O�,JM.����!ҙ���)�9�p�������M�0G�P�`cu����u ���'�� �F��\\\ �V-      �   
   x���          �     x���Mk�0�{~�nm!�tk��v(#0��f��V3��h鿟�2:�v�M ?Ho�=l�%�r���`�Օ$~D鉡%S�S�d��Z��x�b�R�s
��|<��o0]�0�Ԡ�n�72=*RN�A�ZC��Pv\kņ�i�C�7������<�Y[qR�xv����h;0��.����^�EY�(�A��O?)=q��^��B?[��Yƣ�sTJ�Jj���n�A�@n)L���D�[����~e�z�����
W��9��?�QhI1�Y�K�|��K      �   �   x�E�A��0����B(�â�)l=���U��%yՇM,I����a�f��7�l���Iwl�����
h�����߈W
H#���Ak�( R`���� ���n}j�)���=�GG�Oc����?oj�K�Jճ/ԟ�2�zYʟU)K�k��I�X|��3Z��;�T=~�v��4=��oQof_O�      �   �   x���v
Q���W((M��L�+OM�/JL�V��L�Q�K�M�QHNL��K-��L�Ts�	uV�0�QPwMIO�wT�Q0Դ��$�,#�YN��e4�/��<�(�r�L@�K-J���,S�Y���9�y�Pø� ��s�      �   �	  x��]�nG}�W4�Bc�.��<)c0�x0�`��lIDh���3�`�}��Z,�l��P�-�"E���sn�{k��?����x�������t:�߫ӓy��U�X�'�ŸZ���夞�,���dTM����j��g'���E�g�i5>9�|r6�g�j6Nk̖'���r:�}q��w���껴��dV-O�=����c>������m��F�b7�.W�ůG�~y�x/��2��eq6�.����|U�o���+�
�Ҹ�_19������5�<��:�y���_���`� �;H�yq�P�mc�Ƨ��
�%�Rk|phoÞ#�]
�Xb�#bh��� f;!�Kt���\'�B	�,yc��|�P���YB�b���"���tG��+ȓ ȶz�o���%������2,5*��ZA�u��	��k9�u2��h1�f��X����d�f9�t��	2VL ��@���G�[
 (�u3���^���̿��b1�v3��$R�c���@���ے�bOl�2�f�]�`ZK��f�Ci��Fd��?�h3�h2�2������S�Yc����'_*gHP,�d�d�к���@���G�b�d5A-����'Ȍ2V[��0Q'�O�$�D9�:����$(-�N�?A�?"9��:��Y�1��+K��?�T.È��X���L��h&�N�?Bf�b���:���QV���������l��26u��	2P�D9��N�?AF*�ZP��N�?AƩ��
�)ŝ���*�e9��;y��S�X&(�s'� �*�3�2L����R�X;9����Q�a<�٤����ᢞ��?�U1�WE=+>׫y����-U����Su�����b�H����W�j2�(�_�����:.[?��h���Ϛwތϫ���ȯ������������o��|�V�h,�Ӭ^g�j6���z^����j�/��Eve�)�E�^"��A�p��aK�'i��̈��ɛh��	JBf�FD:�	I#���]�3#�3�Rs����-Ȍ��SP6�ԗ�`fD+#b��$'�0���6�w덗S�1���.�	��IP=̈��%Y5&�\�����2d�$�k�-��4�6�lD.Y��Y��,h���%�Fp	!ڈ�#��msɲ��#,�r:��\�lec�a]5l.Y�0¤	~�ň\�la�m��ଜ���e#\��Σg�S���d��dE�����l.Y�2�I��
�>sɲ�>���5Ĉ'V�����?����@�f�o���O�Ċ��L	,�+��9Q�=���#S�J`����-��r��6��[>2%L�K�5�)J�'V�<��7���M�ǟ����d�"��Lc�X���Yaד[I�||Q�<���-����E�h����Ɛ� l���wH�����6��E�\oOu�D��oT���E�"��hh&�`F��Á��+�r8��!5�n`l*�A�h�<��Кy�\w=E�hH�����T�)�tHDA���\��A����!M�P�7u�)�L�D��	�GΕ�9S�(��G7$�=��	SHeC
�F'��m��~�ϫ��b0(������hZ/���Y��4�L���*�N��o!Bx���zx9��^N�{����������aè�����oR��
��r��{Q�ti�2����q��;��S s���Ŧ�+jK��b����[�$�nh9�2��V��������_�z�����N������*�e���j:��AZ}���qC������*�~��1�����n
����	�W��L��D~ܓ�68%vf�X2�ܧ��C��?��?\��Z �� �)������w-~��Ι�����k�����pZL'���C~ޏ�FǴ]E�����/��&��P�o��W�^cT���f���l}lՍ�/�Jr�'ɣ��J���Ar�9�ݙ�'��Y���P��]e��С ��ZnM�c��Pݜ�:���qC�@LSo�E1�����d~�}ߜyÒ���
Kй:Ч��s��*���p
��z{���йP�'�\B�����M=B�/���8��g���\V�\]�l��e�Q�9v<�}2�Jz]j,��&$ՙ�=�b�=��6���WL�2��a��q��5uV�Zs^a�3�]vnո�.��Zi�e��^� 7k�I;�{�e����`4������Aΰ�$���7������^fu��2�ܞ2��7[$�W�e�#�=e�XDV�A�,�� �)��nrkHh�-�:t�d {֡	�q��\�L䮁}���]��)k1�"�2����$�=���I��������l}�����Ҕ����)#%� �"�I{�"G�QN;�r�^� �"�I{�"3����a�1	2�jE���V�
��*H��x�l�m��mw���C�L�k��ڳ�J.i��2dٶ�E�1pYI������d\i@��x�݂vRҳg���,      �   
   x���          �   �   x���v
Q���W((M��L�+OM�/��L+I,.�L��M�+Q��L�Q(.I,*��K�OI,I�QH�KApҋ�K���@Z�,M�0G�P�`#u##c]CC]#Ku8��3�Q0մ��K���P3:���K�5��KL��P�K�� ss�/      �   �   x�ՒM�@�������Īi�<a��U6�r�J܍��7��}����e�aX?�y�9��|�q���y�P�b�$�bm@��JŲG�{,��X�Ď��b_���g�-�K����t� �,���(œ�i=�.٦Ԁ�Es�� J��@�&dH}��#;W3�߅,�U��2-Z�6��m�>���zw���r�C�cI�ѩ�M��g>��A�����COӮ͉Q      �   �   x���͊�@ �{�bn*��Ճ'�
R����v�Hg*��[eu�o�KII�✝."/.G�B���߱��!�>0�hZ�b*���y���X���4��#�F����"�ʠ�]q��v��.t�
8��᚝�4Y�b��a��T8��� �#�L��Y̶Q>���[7�&#���^U��[�J�c��k5����>���Aׯ����?�j� %E      �   
   x���          �   /  x���=K�`��=��[b��y�S������� ���5��=��ݳ�/ܓ�����y��a��.��<����a�����[ZL�u���x�<��M���~���L/�~�٦Ecu2�Ӱ��:5�Ǫ��\��.ອ��n�\�,]�u+�\�V���~�\0\�F���n�\wi�åMS�6M1\�4�pi�åMS�6M1B�4�i�#�MS��6M1B�4�i�#k�t��A1�T���jP�,U�b��HՠE��(R5(F��A1���@�E�t��"m:�s��=��Vx��OU�M���      �   �   x�Ő�n�@��<�7@��8	ԉ�!j	(��%5�đ;�U�����T�Y~}�l듋�v��A�ڭ������7Ue�ۣ6C��Q��Zu���%�F�"&]71td�5��]��W��Ķwe�N
�`?��\la��0���s�A(*%��ckԉڀ�!^���|:Mf��2�ޢ�y�(ZK�u�;����)b��p�\��{�}�*<+2��!0�2��D9�~ �x�Y     