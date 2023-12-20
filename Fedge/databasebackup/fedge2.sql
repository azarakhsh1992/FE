PGDMP         *    
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
   TABLE DATA           �   COPY _timescaledb_internal._hyper_1_12_chunk (id, "time", tempvalue, tempvalue_min, tempvalue_max, humidvalue, valid, temperaturesensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    353   o      �          0    30794    _hyper_1_2_chunk 
   TABLE DATA           �   COPY _timescaledb_internal._hyper_1_2_chunk (id, "time", tempvalue, tempvalue_min, tempvalue_max, humidvalue, valid, temperaturesensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    343   �p      �          0    39058    _hyper_1_9_chunk 
   TABLE DATA           �   COPY _timescaledb_internal._hyper_1_9_chunk (id, "time", tempvalue, tempvalue_min, tempvalue_max, humidvalue, valid, temperaturesensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    350   q      �          0    39099    _hyper_2_11_chunk 
   TABLE DATA           \   COPY _timescaledb_internal._hyper_2_11_chunk (id, "time", value, valid, led_id) FROM stdin;
    _timescaledb_internal          fedge    false    352   ފ      �          0    47340    _hyper_2_18_chunk 
   TABLE DATA           \   COPY _timescaledb_internal._hyper_2_18_chunk (id, "time", value, valid, led_id) FROM stdin;
    _timescaledb_internal          fedge    false    363   ��      �          0    39069    _hyper_3_10_chunk 
   TABLE DATA           ^   COPY _timescaledb_internal._hyper_3_10_chunk (id, "time", value, valid, latch_id) FROM stdin;
    _timescaledb_internal          fedge    false    351   �      �          0    47329    _hyper_3_17_chunk 
   TABLE DATA           ^   COPY _timescaledb_internal._hyper_3_17_chunk (id, "time", value, valid, latch_id) FROM stdin;
    _timescaledb_internal          fedge    false    362   /�      �          0    30847    _hyper_3_3_chunk 
   TABLE DATA           ]   COPY _timescaledb_internal._hyper_3_3_chunk (id, "time", value, valid, latch_id) FROM stdin;
    _timescaledb_internal          fedge    false    344   �      �          0    47318    _hyper_4_16_chunk 
   TABLE DATA           d   COPY _timescaledb_internal._hyper_4_16_chunk (id, "time", value, valid, latchsensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    361   8�      �          0    30783    _hyper_4_1_chunk 
   TABLE DATA           c   COPY _timescaledb_internal._hyper_4_1_chunk (id, "time", value, valid, latchsensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    342   ȕ      �          0    39047    _hyper_4_8_chunk 
   TABLE DATA           c   COPY _timescaledb_internal._hyper_4_8_chunk (id, "time", value, valid, latchsensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    349   m�      �          0    39140    _hyper_5_13_chunk 
   TABLE DATA           �   COPY _timescaledb_internal._hyper_5_13_chunk (id, "time", energy_value, energy_unit, power_value, power_unit, valid, energysensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    354   ��      �          0    30858    _hyper_5_4_chunk 
   TABLE DATA           �   COPY _timescaledb_internal._hyper_5_4_chunk (id, "time", energy_value, energy_unit, power_value, power_unit, valid, energysensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    345   g�      �          0    39036    _hyper_5_7_chunk 
   TABLE DATA           �   COPY _timescaledb_internal._hyper_5_7_chunk (id, "time", energy_value, energy_unit, power_value, power_unit, valid, energysensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    348   ��      �          0    39151    _hyper_6_14_chunk 
   TABLE DATA           c   COPY _timescaledb_internal._hyper_6_14_chunk (id, "time", value, valid, doorsensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    355   �N      �          0    47363    _hyper_6_19_chunk 
   TABLE DATA           c   COPY _timescaledb_internal._hyper_6_19_chunk (id, "time", value, valid, doorsensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    364   VO      �          0    30880    _hyper_6_6_chunk 
   TABLE DATA           b   COPY _timescaledb_internal._hyper_6_6_chunk (id, "time", value, valid, doorsensor_id) FROM stdin;
    _timescaledb_internal          fedge    false    347   �O      �          0    39178    _hyper_7_15_chunk 
   TABLE DATA           c   COPY _timescaledb_internal._hyper_7_15_chunk (id, "time", value, valid, doorbutton_id) FROM stdin;
    _timescaledb_internal          fedge    false    358   ZP      �          0    30869    _hyper_7_5_chunk 
   TABLE DATA           b   COPY _timescaledb_internal._hyper_7_5_chunk (id, "time", value, valid, doorbutton_id) FROM stdin;
    _timescaledb_internal          fedge    false    346   �P      o          0    30172 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          fedge    false    283   (Q      q          0    30180    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          fedge    false    285   EQ      m          0    30166    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          fedge    false    281   bQ      s          0    30186 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          fedge    false    287   �V      u          0    30194    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          fedge    false    289   CX      w          0    30200    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          fedge    false    291   `X      z          0    30286    authtoken_token 
   TABLE DATA           @   COPY public.authtoken_token (key, created, user_id) FROM stdin;
    public          fedge    false    294   �X      y          0    30258    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          fedge    false    293   �X      {          0    30300    django_apscheduler_djangojob 
   TABLE DATA           T   COPY public.django_apscheduler_djangojob (id, next_run_time, job_state) FROM stdin;
    public          fedge    false    295   �g      }          0    30310 %   django_apscheduler_djangojobexecution 
   TABLE DATA           �   COPY public.django_apscheduler_djangojobexecution (id, status, run_time, duration, finished, exception, traceback, job_id) FROM stdin;
    public          fedge    false    297   h      k          0    30158    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          fedge    false    279   +h      i          0    30150    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          fedge    false    277   i      ~          0    30365    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          fedge    false    298   Vn      �          0    30605    web_buttonvalue 
   TABLE DATA           R   COPY public.web_buttonvalue (id, "time", value, valid, doorbutton_id) FROM stdin;
    public          fedge    false    341   ]q      �          0    30375    web_cabinet 
   TABLE DATA           t   COPY public.web_cabinet (id, bereich, segment, anlage, arg_sps, pultbereich_sk, station, profinet_name) FROM stdin;
    public          fedge    false    300   zq      �          0    30383 
   web_device 
   TABLE DATA           �   COPY public.web_device (id, geraet, bmk, serial_number, manufacturer, profinet_name, module_type, io_module, port, plc_id, rack_id) FROM stdin;
    public          fedge    false    302   �q      �          0    30393    web_door 
   TABLE DATA           >   COPY public.web_door (id, direction, qr, rack_id) FROM stdin;
    public          fedge    false    304   {t      �          0    30593    web_doorbutton 
   TABLE DATA           o   COPY public.web_doorbutton (device_ptr_id, door_direction, device_io_module, device_port, door_id) FROM stdin;
    public          fedge    false    339   @u      �          0    30420    web_doorsensor 
   TABLE DATA           o   COPY public.web_doorsensor (device_ptr_id, door_direction, device_io_module, device_port, door_id) FROM stdin;
    public          fedge    false    311   qu      �          0    30579    web_doorsensorvalue 
   TABLE DATA           V   COPY public.web_doorsensorvalue (id, "time", value, valid, doorsensor_id) FROM stdin;
    public          fedge    false    338   �u      �          0    30401    web_employeegroup 
   TABLE DATA           8   COPY public.web_employeegroup (id, "group") FROM stdin;
    public          fedge    false    306   	v      �          0    30425    web_energysensor 
   TABLE DATA           b   COPY public.web_energysensor (device_ptr_id, measuring_environment, device_io_module) FROM stdin;
    public          fedge    false    312   >v      �          0    30571    web_energysensorvalue 
   TABLE DATA           �   COPY public.web_energysensorvalue (id, "time", energy_value, energy_unit, power_value, power_unit, valid, energysensor_id) FROM stdin;
    public          fedge    false    336   mv      �          0    30432 	   web_latch 
   TABLE DATA           j   COPY public.web_latch (device_ptr_id, door_direction, device_io_module, device_port, door_id) FROM stdin;
    public          fedge    false    313   �v      �          0    30437    web_latchsensor 
   TABLE DATA           p   COPY public.web_latchsensor (device_ptr_id, door_direction, device_io_module, device_port, door_id) FROM stdin;
    public          fedge    false    314   �v      �          0    30549    web_latchsensorvalue 
   TABLE DATA           X   COPY public.web_latchsensorvalue (id, "time", value, valid, latchsensor_id) FROM stdin;
    public          fedge    false    334   w      �          0    30541    web_latchvalue 
   TABLE DATA           L   COPY public.web_latchvalue (id, "time", value, valid, latch_id) FROM stdin;
    public          fedge    false    332   -w      �          0    30442    web_led 
   TABLE DATA           h   COPY public.web_led (device_ptr_id, door_direction, device_io_module, device_port, door_id) FROM stdin;
    public          fedge    false    315   Jw      �          0    30528    web_ledvalue 
   TABLE DATA           H   COPY public.web_ledvalue (id, "time", value, valid, led_id) FROM stdin;
    public          fedge    false    330   {w      �          0    39163    web_ledvaluecases 
   TABLE DATA           R   COPY public.web_ledvaluecases (id, description, functionality, value) FROM stdin;
    public          fedge    false    357   �w      �          0    30483    web_plc 
   TABLE DATA           �   COPY public.web_plc (id, funktionseinheit, geraet, bmk, ip_address, serial_number, mac_address, manufacturer, profinet_name, cabinet_id) FROM stdin;
    public          fedge    false    324   gx      �          0    30409    web_rack 
   TABLE DATA           8   COPY public.web_rack (id, name, cabinet_id) FROM stdin;
    public          fedge    false    308   �x      �          0    30415    web_request 
   TABLE DATA           �   COPY public.web_request (id, description, servicelog, button_pushed, cancelled_by_frontend, sent_to_plc, sent_to_frontend, "time", cabinet_id, door_id, rack_id, user_id, access, status) FROM stdin;
    public          fedge    false    310   	y      �          0    30473    web_servicelog 
   TABLE DATA           M   COPY public.web_servicelog (id, description, "time", request_id) FROM stdin;
    public          fedge    false    322   ��      �          0    30522    web_shiftassignment 
   TABLE DATA           a   COPY public.web_shiftassignment (id, starting_date, ending_date, group_id, shift_id) FROM stdin;
    public          fedge    false    328   ��      �          0    30465 
   web_shifts 
   TABLE DATA           �   COPY public.web_shifts (id, shift, shift_start, shift_end, extra_time, shift_start_int, shift_end_int, extra_time_int, type) FROM stdin;
    public          fedge    false    320   �      �          0    30447    web_temperaturesensor 
   TABLE DATA           �   COPY public.web_temperaturesensor (device_ptr_id, measuring_environment, device_io_module, device_port, critical_value) FROM stdin;
    public          fedge    false    316   |�      �          0    30514    web_temperaturesensorvalue 
   TABLE DATA           �   COPY public.web_temperaturesensorvalue (id, "time", tempvalue, tempvalue_min, tempvalue_max, humidvalue, valid, temperaturesensor_id) FROM stdin;
    public          fedge    false    326   �      �          0    47295    web_userlog 
   TABLE DATA           M   COPY public.web_userlog (id, request_id, servicelog_id, user_id) FROM stdin;
    public          fedge    false    360   �      �          0    30455    web_userprofile 
   TABLE DATA           x   COPY public.web_userprofile (id, firstname, lastname, role, bereich, telephone, employee_group_id, user_id) FROM stdin;
    public          fedge    false    318   ��      �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
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
       public          fedge    false    287    4021    318            �   _  x���Mn1��p
�Q�;�����S��+���,�|��<ܔ�,7�[�ת��)�Q��tP?����zi��[�+����j�}�)��%m�T��|��&N�-V{�:��i�<\�����gӒ��j�������Yk8ַ���õ���Iv�F�8��nݟ��i8{��K=A�����UO����>�y{����Fi9GNvcY���p���q!	��8ee��Pv�[�2����t�aXhN�J6ì��݆X�0+��r���f�c��&��aa�����g�0,�Í�nY}bXx^�o��6�"5��|�sL�P8��tL�p8�V�c\��J���O���pN���r�\�m`P$      �   n   x�mͱ�0Dњ��}`�w$I�����)���ф�؁�}�Obz=�Za��|�x�)ǗvaJP�-E�ɱ!'sz3�֑�6�j%�R���0�]�����ٽLU�C"�      �      x���[����E��i��/�x���r���U���� m�J��q`��~$�?�X�%�W�(�e��iK����I�i��G����C�&$5H��-�����lZ�$s����T$K�ʕ�>�v��dҸ��kf ��V�nY�h[�~�dAR�TNT�ۊ�iL��lH� 3s���t��4��\�D�,i\��w�����Od=84�jpE����34�Z�U�,���� ���/�-IJ��z^3#��R�X��9�Y�,A�r��NR�dE���[�Ɇd2��ٗ<�����u2kum��NR��� ��z��_��� �6����[AR{�&i�qME����l��D�(�m�L-�Q��Vs�w"7���R�E�d��D��r�萏G�6��tu��:�㑓�Td�=��x�&��_���!���d��3y�نq2��~�萤 K�����:$�H�ڄ��3TH8��T�� Q!�Ë�)�&iW�=�hV������E+EM{��^hJ���d�^�盒� ��EN�zQ�I�$y�2
�)Ț��w�x����}�$�>ҖR.��=� � )��k�A�Ar����+�� � ����W��A��T'���4HK�F��:��i.�xd�N�Aڂ,��䇔+�Y
�R![Q�D���lT���~�r�h��A�
�Up1H4�$H�&u�2�}�m��9H4�Cb'��蝬h���N���dA�A�A;����	�$$:�A������D�<(v�Ԛ��w��oJA֖h5\Ґ� [c^�c��H�C⣑�U/4ڶ )A�B�}�mER��9?��7�!iAJ˭-���n[B2�>�E�0HB�i�	�w���A��ZY�	�$[�>��&:��>1-r��B=\���}_�r�D����{yt�N�Bԫ��g�Bԫ�<;�x���j���Wu����Q/����D�P"�8��@�d��Q�������$�-�J��E�8�Y>*�w3�I�Ö�����_Ub�ǥL���;�.E��b`:C��2E��6�����Ѧ��٦UY?PB���f�U�}�E���f[����7�m�$�Q�>m"�I�L�l[�s4P�I����U\5Q�I��}�"���n�hSdZ�G(��M�je�T?�tB�"��>D���g�2E��c�b[�s�~e�d+� ��LD�"��1F�=D�"��>D����F�ke�D�;�E�Ub��g���E�"���KJσ�E�"��g��~�,*��Ǵ�ã��m�hP�Z%F��P����D�U<�nޥ����D�婟�=�V��<��D�U|t�q��>P���E�U|tR�ϥ��A�k�\����r��P$[�Ǧ\�� Ѡȵ��x~W��5ѠH��������C�mUϺ���OO�E�nUO�H�� Z�V������ -�d�z�$�9P>oVѢȶ�VX�y�䂢E�nխr��Y]лG��5��౉.�"J}��c4�@�>��/a{��.hFTeq���5@U{�/׬�Z�*�35l� M�'��ԭ��\�z�c����\��������n-=�j�5�wd��<��E���#�?zԋ������Dѣ�m>��U�.E�����f�EQw^M��Kb��d5�4�C�<�o^���k�I�<9h2�ۅ��@3��ɓ����ԮM�������+]����g���w!����uUt�3 ����	P(��([�ϫ�K�<9*9yp��3��ɓ���\��B�%O��쉭|�0��ɓ���h�qՂ6y�h)u�LC��6I$A�p^]u�pA�$�-yԛ?NA�<�q�;��"���G=���*`��M��8*�y�\g3�M��8���d��h�g2��yZ�q�h��Y�l5�TP&���%�3�_�e�����j�(��1����-nx�w�4"c!�r�\LSl�7�_P��{�*�Os`��V����3�� ����-@O�Ğ�� +��s;��ņ\	�{�T_�"T�5"�����3H� ��\���5�ҧ���{�6����Y�x)�Uz�s�qʯ�����`�|}1�������_�u�r�C8:��7����き�Ĭ��˺���6�z�,��D����P �N�Z<�z���P ���M=�Y(;N�G�}+��9����R]�0zIN�5�z �eq�E�<�q�6��,�ypa���1�{��	=��7--��E�<.q��$_WE�$�t�����H�I�'\���+�6"����Jk���y<�h�j����񌣥����OE�x��z��W$z�ጓ͓��D1�IΘm�G@~g���'`ʖ���W�Ϧ"ګ��/shC��;ټ�_<��B�����ϖ3�;H���z`�Y��2���iV��/�`�`[�~).��Z�6�A�a[�~��b���3���闲�����z!���闲y�Xꢙ�`����g�Z�랗��K���RI�*�latIzݓ=�~/m��Jҫ�*����$���	�6�D��/=�}j�;�&I/^ѶZ3ZW�$���*F����Iڋ�M�J���Iz�ۮR�0I�$��K������MR��ޑ~]M�^�ʋ�:PE��0�����]ҽ���Y�x�m�^��|]Vk��@�&�%̢��ݚ�,aέ h��f՚����۔#s��������^ Jb�ť-��IN�~t�oE��\2}�<���%�TԺ4V�<ץ�U���#��Z��嶅:PB�z�K�>�J0�s�G��E5��
��$X���ޗ�LP�ν��t��aE��U�^8J��������DQ%�#�xiO0<<���Q�jD�h��Y���^h�h���C��� B��?��)��Z�ᙡE�N %���'>~R�-�Ѣ�s��mǷ������84P���׸��<*ڧ��5�]�^{,T�X\���W�6�>�+��j�{��M0h�IF_�Q�uG��y��p�G2�!���H�S9����[��-Q��&G��1=����?E�6P(�ɞ�{��CYީ��%Ϩ�ǂ���G��񃗫��B�g�>�ԉ{㦃+����-���Tt�ޠ{%g�WП(`{"����մ�Ӽ�E���p���@��K�C��E���pn���Lt4QA��~->,�������@�ZP��_{�!N7�&�bM��a֯��D��>�|�����$l~��{O���7?�=�߭��%��n�n���������<8�>oN��z�]�x�����?B�~���G��������o�8b�e��s˥�~�/}�ȮUy���f�x�Uþ�b��>��g�x�1�Ƽ[5��ߎ�+f�j\1����wa
2-�\� 4��Z��!O��X�� 5�bG��4�
!47�&�bAo�=��b�'s��Cx�L�&l�Xh�cҙ���y�(�����l�ߟvCQ4B#�<��gt^E��<�^��xe���8v��[hVWEg��t4�J�/����b�E;W~��	���f6"�WTZd��ۓi*�f����#�
�M��ZV$�dd�"/�JB��,����~I��E����^dI菕`�����eL�17���`a�3�"%柷��nK���B�y��$�,��n���j���)��Q=��qA	�X���D�Q�^��hLyjS�>�-��Ş�9�"���@�%��
5DK��Ҩ��ь�{�����򃎝�Tm�����(ݮ���s��%��:�w�G!wd��w���96�����3��W"y|q.Xy�P�>=��(��B]z*��O�0!%6���/2'��\���O��� 
B�����ў;ۉ� ��R�(-/�߉�"{�=}ɭ~]5�؆'�$~G�
�[��G���?d�t^s�w'S�>����W�Q�&6�[? cxW(������wW
_tȓRG�����(��I)e�Q��X�/�{��FRϝ����J�	?G]���*I	�����玢J�TcS�;�(S���;�Ds��
E�"���.9G�P�)����Rz>]肢L���.�V�)����\�����)B���ʅ5�\m��l>�rz|�.'ˠM �	  ��lW����aE�"���.�_m�~�K�^�.:��ڤ������^P���Q/���owxG�&�g�H��!��5��M�{��,��I�L���r�e�QLe�~NL΍V����(���bJ�J��i^e�~RL-�\d�����bbъ~��RD�m���6�@3�d� *zNn�лJ}�_�Sr�_(#ڏB�5���~J,F�j�����m��BfC��m�+��=WhF�nS*�G+�Ђh?��[H���"Y��15���6D��(�Z�HZ�m?2�s�� m|J�L����.�R?�h���~�_P���x�F�l�
E�z8��g��u�(S_�"��m.���2Q?Z��'Y�?���2���XeV�æ�6Q?\��R�G\�&���1�����V���~|L��5n����tItN�.��K܏GѤ���k�I��ױd���#��������c� Z��t��J}h&�q?\�{�s��3�q?[��Vdz[� ��0�ϯ��&���|&ϓ^�eC{�o"�5=�)T��*�8�r{~��5��G�Db�p}x�P�G���j�jAC}���S�T��.w.o��I?"ǣeY���vQ!�g�4���q�	%�~������#�|STH��&q�B����EކI?���nj�ٸ&�H�	'±3�E�b����}�(���n�P}>��Iڏ�)�'S�/�.i?咽��h�Iڋ)]N�|��5�I��P>>���q��E�t/D5�F��_Pt������,��N]2�79y?n�?QB��/�`7�y��E�������8R`����ɟB�t$㱨!���'32
�k� �Q�z��9f�9�T�Oz^U�c��X�y����_�����ov�[��rT�%�yiF,��3�z��ut�
Uk�P9�^���6����F+�տ�G�+������@�3�q�l��Ѩ����U(T�c3И�<��	���hL�l�-���e���2��yy��#=_u�hQ,e�gn����'ĢEx�8iL�l�r�ቢE=&.,�|���1Q4���'��c��/:�F�8N*�<���(��9$��ϫ�M�9Z���c�A���6yL��/��E�<�K��X�0l����6q,�Gq��s�z�*������@�4l���3OF�$���l������?r�h�D	`˞aN�����6I�hq,�x6G�D���`P#���X�#���=�N5�0)��Lg��u>����cG������CgǢh��:)�XD�9�t7�h��iLU�::���i�V<���G>P�Hc!q.���r��PQ��c��I�/���BQ�X*'D���(J+�r�Q�x62?::�St��8�8�ɲ��rC�%�Ih��8�f��Kf�V��Ӹa�~���LK�}@��x;?�
�D��Տs���&�r���TU��3%�����U�����e���?��~�[��\�Ԯ6_S�j���g��4�H@�U3���-���y|0|���ݗ��"��@�
��U�Fz���jH�C�r�E�/6?�s����ԑ>���zP��˲��F:K�ge쾺���E)�(�~,�'y_(��}2�d-�)�(�ٔZ=B��*ʳ���+y�@��$t��BQ���wε��Ώ;�q/�K�:�ª׏ӥ�.q�O1F��e~tt��mڏ�ϳ���%����i?��n�Q0����RA��Om4�iN��P�i?�=v̩��2�G��=��Lr�!N���UQ���w�-�yU�i?��{y������4�{�2�S.�kE����]�9A�BQ�����i�=���*ڴ��N��Omڏ|gI疚�6�g�{�}n�_�h�~軿��
E��S߭���׵\_׊6�Ǿ��K��*ڴ��^��ܾ\��DѦ� w4u�|��i�}��zu:�Ĺ]u��M����ltѫMm�x.���k��h�6Y��[��>�kC�<���g���U�&�4�k��zG�6E9(PM���~����Պ@c'BZ�4ъ�Z�󪃙�����[����M7(o��%U�J���i�(o��%U�#e��~��v�x�Q����~����Y�K��ȡ��f�7PE4��B�)����j��a��(�M��W͈�^�$eq�:Ђh���V̇T����T@����Z�d��ο���E�JJ�ޯz-p�h/�6���{�]��|�9U]��(#�{&���<�����\Ms��@��#�(��}kz�<�½����2qߚ�A�̬�v�t^e�5��Z�|;P ��}۴������Gf��U���i?6�Tr}�h��Y��{�CF1j$=�!��xx-v\.ɨ��VzW8��,;H����E��)I}�������2z��Ж[it�.�G{�[+P ��ѣ=��F��[���wE�����3h�r�A醢Iqz]?�bɹFѤ8����T��v�*>�J�)�f�U��Um��r�����E�4��c�B+��\�_C���IF{~E��h�����Y �¦1�ڤ��2�;��~���������T      �      x������ � �      �      x������ � �      �     x�m�=�$����S�Wl��	d>��d���JTώ�t72�l~ d��:t��5�_D^�/�+-w�_����������?պ���R�����K�]�~�nt�r��]{��P�8H�c��3h���%���.�~�e��#�]izM�=�SR�M�5�3���M	
�@A��#�g�j�|\jk.>i�\�;�P�W�p�@�]'U
z �<qK��P��e�Ꮰv �QA�XϠv ��'B�o����o2�(k��5�\Ǥ�6N������'H�o�3��a�b�����7LV�l���0Y�=R?mRІ	Ҽdl�Ϡ�0Y�=�t8�zo��.�F�|V�7LP�K�%��q�t��2��6NP&~~*�7N���Λ~�F9�8h����={�7PP��̩E{寉9rS�^�����T�� 
��dD<c8!����G�'C������u��f�BfP��'�(��T���	-
�[�'�����u����従�6N�r������ƃ�zT4N��Rpr}��h�V=�9�&�i4P�r1�b6N���%T4N�浆�g�Fô����)��Rt��t��5��^��q�����}>k4���e�A}/�P���A}/�4�-�}��9�&xw���NS�p���y��GO��z=������@e��c �T6PQ��7wnj��@�KPO�����@A9Q�+�R7P�N��EA��s�G*��T�s�����;� ����J����@ŝ���U�>�B�O����	�oK��<p�Uɷ�T����7ӗq �BAؕAa�t_K�=�BI���G�լ�oQ�쮩��
���B##X��+1�6XY�h�kr�F+k��>m�a�Ѻ�9b*+�F�z|%�hI��5�!ssԆ+��ob�;���.Y��I��+kL܎�ۀe����mi `2.4�Ia� ݮKZ�1�kԚBa�@R��퓢bb��n�z %��z8��+J1����Y;E*G= � ���Wp &����Sd�m�X��FE�t�b����N� 6Rh�nU�R��P���Ud�y�lB�@m^\��r�1tzu<��@ҍ�s��dZ��\N���[zo�����Ѿ��L��-E-�p��EV������=�[�5�P��Yd�Zhכ,��-Ũ���2�����H�-�m�H�mQ��-��q�c�M˸J�G<|pr5뢤'��i[�w-F�Ģ�)N�yQ�u)�ܸy5����R�4��f_���6�b�f_���Jrr5�R@�|�;(�� ����Rj���/Ϳ��q�;el30JZ�A��ޒ����坮�E�ϒ�qK�܋}!�ի��MY@.�[�ε1��Ւ���ƅ�Kx: �-��i[�&#���ƶ�#R�u��.��}����vVؽ��y�Z�m����l�<g3��h�����D#����5)m�[5!)%�;�FlU� �̴���غ�a�L,��U[BK�D#5&.k3y�����g~M~A��2j�2����f���T�U.�o�U~�����֮�K0�o)�g�ѦDr6��}$"�9�i����j	Y���0���y�{��5��eb��21�&V�ݺ�-c�L���6/$b��!��A�y�"��p��pL��bk���VR䗣����@��2c��/�q��xK�z���%dr�{�ACHO��]�5����2����f=Xq�>�|� Z`�a����V�j��>�����[��sh^Cxe�o��S*�s�rrXem�i�^�Ea'K���a"cK@������pPXH��mIb(��ai�+4����Ja�Kq\�10O`vo����%��AZ��R�WTi-����k�Jn&���DY��r�%�L����'��i]�X+v���]�R��c�Ӯ��{b
)�u�=�|�eb��_����&VRL�؂�R}�����N�*�^R�T��^)�16m荒K�	����ت��¹��ۗ���Yz'8���eTu�#�bF���jt)Z�i~����������k;      �   �   x�m�;N�@��:Y=��}l�س V@ICAG�c�L�E"����h|���7���n��P<�l��o���w /h�T��O��w�\��8'UV&�ɚ�ɵ���饧�	��[�V��t	���?�?�VhBm	���l�`T8����pF�5h\ ��$�MV77I�O�:��0��Y�u��9�/�:����Qt/�:�t�֩~�о�??�      �     x�m�9RC1���S�3�h_| J*�4PQ��'d&��7��_����Dt�x l48\��������Sml�<0YY�f���90]�Y�4���ʮժH��G&
"��#S�T͕UC��{��y۾;�#$��	�
h9͒��Rʹf9B�	c.euܔ�,o�ݥ��/�!j��Iڴ 4��f髴���~�O�_7:�#�5��:�V�h�x��Bk��(�2�B�SR���y3�K�E��^o�ɗa�e�� �v�#վ$aF�<þ�߻��      �   �   x�m�1�0@��>E�*0`�Y:����*�D"���Oʍ��F��x��R�����'R{��I'�3��_�s����,�B�V�i��%�솘��G.���K�@|Y��؁ΐ�y��\2*��TzA����F�      �   �   x�m�A�0�s��ܫ X6<�/�9/��UWQd)���vy�QW���'�2�^���'ʩE&�wT����}(-���ꦧ�"}�XD�-UI�vVj��2O��Z1����-lN�\YK����>�+�iF����(�ۨ��.	A|      �     x�m�M��6F�ӧ�>��"Yg�:'���O�M�M�hI����%$�����_L/����d�7����~�&f/��2R�a~ǘ�p��������v�UAa��#���h91٘-
�z�Bky~�)ML_���o4�90:���mA���S��r�tb��<JTt5�Ʋ�LUʆ���Ŋ�"i����;�\��-|����h�wL�*/�V���Q�˛S�L���;um�k��s֕��������%�E�ޘ���D�i��x�H�v� �*�[���BmY�K�D[?v�pbL�S�ve
P#�ͧ��)�AV|���������j|Zxc�s�vn>-(v��x�f�6- S?D�{"�� ��Z�ڹ�� ��Q��otJ��A}������j+����>��}�� �V��:�
6����3-��T`�"�r�S[ښ
���3��	6�)AzP�kxc�SK6|0Իk[�M���ss�nN,ͨ5�uspb�c����9xc����7	�;%U�t�A0F����'	�*?i���,�a��>�dA��jN�jA��^�kMQ.힏x�Ћ>���Ղ���Z�MV��.&�o���!y�,G5�%?`r[4	)��J�Z�tS0߭-��_��G��i��؊�|�m�}ߑ���^��!�Z7ͫ���墭�e=b�EM۩�U��Y�K~E|��{��w�|��yˢ�l�B(齭�!��|�"-{���4\[N�?`�;���
顩�{��SP�}i���g��jb��u�gi��t�pr�иZ1�4��f^���<��S?9���e����n&��A�.˻�815�^4L7'���R�L7{q
�����fF��\o3�ԁ��Լ�����p�]���bw9%���ӆ�n9؅j�xl�o�݃�h&�������#W�,/��;��тW�Ι�#����r�-����//1#�����v3F�K��4�9L�$�z_d�Gֵ�ǓGN�p��xS�ĭ�L�	�2u|���_�:�_�"�MQ��Ա��Lj�xW���HS� �/9���?�Yjr����ܑ=���8�7�tV�s{����%��9<
38�f�:8��>R<��~�9q2��W�w�,˅��|�58G���EQ��.�1��9\C\ڿ��C��r�����@W��_���{��&�{�)�ۺ����08N�����5������¦��]G(�e=���c�l{�൧�����,�[�@.�k>֞l6j9;_�%�' �2��/����\����>����4�����r�9N���-�?�����I�I      �   �  x���M�7F��Sx� ��_]!�&�m���]9L���f�ӈ��m��������TOZg뿕�"���������y�oR�z<�夹����&Z����|>_�{mg���cIe捕R^+W^�g��3cM�C��rԵ*�ϑ_��8v!�Y��� ��Rfo5j	�k����hMm�O��2�6[��G׽�&B�v�����&0`��5�0������ '�c\Eu�(��`^N�G�e��j�)��YtI�mo8E�� �
�[^-^Q�;E&o'��/dbY�g ���\�EAM <%�x?�Z��`<%�x�����]�� ���U���"WM <#��_��D�����t���)o�]`<%��8��L��.
�g ���������)�E���-�=���%��O	>O���ی���Zo������o�z�n�[���wQ�:@�ƥ�iIT@�:�o��O\��^� �߉���/� Z��X+������նng�,UU�߉�� @�e[?��6ё`	��.j�Ld�)��:��ֻ�'Q�2��*������z�y�Ns!�)��)��ߣ]�� ����W4m�� �:���G�4U���$|o��40b�`\'��3�G�`\�y��>L�3 ��Y�>z��xJ�q>�n��u�| �l˶��|�&�)�u�k��Q�Н`[��h��@wJ�o���A��q�3 l�?-A,
|�o6`��8���3 |7�/�x�J���S�7��)vQ �g�kd�gq�����y��-֚a�o�::��{��рD\w˘(����� �Ö��	��T��֩�3�q�w� ���nTt��3 d��V��g,V� �)���=�`t���6��5��3 lOa8�`t���6A�}x���y��l��_It��^'��QԈ'�� ��l&�x矠;%���{r�s�|�Ξ���uV7��*z�Ή�o%�3�q��z�N��kt��k״��s�i�V;u�(1�������-v��S|W�F$J�i�� �զ�y��`\@��T���|ob��7b.�;�6ټ�ܯ}��S|��A��n.�;�6۴J��\@wJ�o�$:�[U|��f;x�Ů
R�� �:�͟ӃgQ <�����|�*
��8;|ͨ3k) �Ŧh���1�juߡ�bke��R |�=GM�!VS@���j�ZN��M�h�f��R d_�a�����m�>8coeH�2 B5������ �j9�uk��{+C��`{�A��n�kJ����Ilш��eσ�a#1]?W�%A���)��n{Ng�D-�����0�ZN����-��5�����/�)��$����7�;v�(!S�	0������$o3�L-'@�NVtokN��L-����u��fu��S⩜t������'!SK��o�}��C��O�J����B��O�
�ϣ�ד Wˉ�o��J�аQB��`��mD�nC�F�������Н`���_����@����HI����h�e��R d���v��&����l	~����V��R l���<Î����}b���HM��w#�R D��������
�Z
�g�7��>q��SD��Vx�̐������k<�@�F��I�+_�L-@w�����ZN��f/��0�b�r�7�V�{'qo�<��EU��.���F���tT��@ QS@�H
߁H�rlw�c�~*�%���ag�"iZN��a/��(f��R Ll�>$����iJ�vD��@��=��Q��o	$i9��U�&[�(M{�9lFI-�	��@�� �k�m�w`����!D�}?�q�p��@�fD��b�-@��y��wfWM�:%����;v+����r�����G�N��M	����~*��e �h
�*��vM����S8W��W4�
�h)��� }����X G�	𽯜8���R lW;�ǯ�	$i)I�M�	o�(�"ft�+�� ��7N^�$i9��V-��l�$-@7[n�$n�����37��
AZ
�o�3Tw��&�r��=:�� ��Vzk��AZ
��G�v>H�r�O���5����� M�����I�=�h�� -����b���A���{ٛ�-:�C��=�tm*ju֢9��:j�� EK�����Q���>�r�Z	�Axx�.��k���۷o�G�      �   �  x�}�=N�0�=;��ol�
H�,̈p�����y���]�Y^�^؟�;b'A�g��q{}���zپ���
0R�}��xl��$A83����i�_py���RHSm�D�J:jg�\'@4�6"@3_+�Uth�m(֍���nV��2�Q��мQ:+�ʠ��t�쁵��E���W�QY&���(�Utmt��!m��33R��jr��,���rf:����l㬬����;E�F|���V<�Q�5�U���4 ��ף�:��^
ꨱ�-�YYg���ͷ�YU��x���Ə5�$��_L���(�u��_�sFլY�����gU�$P�XY��<<� i\�Z�%���\cI]e��YU�ƪ�n����7d$�      �      x�|�K�,��]ۯF�����@w"5�����M��\e���ZY�2x�w8�M|���Ƣ���?i��9�,����1���_s����_��_�_������)�AR#g	s�lD�~��8������S�w͚�_b���s�:;����/B���Et �!<J�.-�51�X��7K ��U2��iB����L� �e�sObˬ	x��G�g^��K����L�Y�z ��Ǟ��ų&౳���rBpY�����N�<w���g_y�D��x�A؏�6�<w�#�G����˂瞈=���<x�����k���V�� ��hЌo����'r��� ������}�:r�'���7�D6<y�#���ҝ�0��7<�$���&���?�ړ7�;��*x�Il{�������3����o�e��Ob�A�&��o�Z�����]<�d��XV���?���k�G�??VO>����R��3�Gy�z�;������*���x� �/)x����,�Fw���iH�5x��ϸ?̶�z�=�쓸�� $���?�l{P]����'bqA�@���?<-�:���u]x�A(�s�M�O��=�mŲ.<xC�Ϙ�y7���S�D"��]+�~�C�6�&V��'���Y��>b���'A�����'�O�柱l�8��
�~��C�>�����2�ϡ3���>�G�]~��o ��MKk9���?B6�F�
�}�a����V1�-{�D��0 ��#�#��bTx�A�yx4�Ux�+6-�IT �,x�Al�%rs�|��eqǘ���L�%��׾n����ӆ�����仲9��/�l/�C����SD������� ?v��Q1�1���k[����bɿ�9���F�l��u�5( �seb�Ѐ1׎�UWk�?g�1i.���)b9�4�lN�@0Jʧe@l20E�����K	��S����[>D��I���@�g����0��Ł
���("�D@v8V����`be �d,>.�d�@���8��`,ֶ@�,�����P��B��&�K��lê�Kg5��\ ;$���u����"H�'i����1�)MHfgdx�^v+7ڹ@�ؑrcP�H ?Ue8�[�$�@0��wH�i���?ah ~/�
�J@(% ��Xn�WΨ�Hd��3��3F�~�"�h ���X({��#_	�l��z����c!��`�"0f�;Ωc�	&�C���H\>C\6���{����'�"?���sQ���!���MG@�B�t;A��������P��AC��[��|e� C�~���]���K�uw�4p�d��;.M��.p��4��}/�厄4�~��:�(`�o���$����w��$t��{6n��ϙi�;�6���OΟa��a�Z��M����<�c@�%�@z���~�(z6A$��9�^����&XƸMl���Dw��%r��[�����a�oeUl�߃��vm@�A���xO�;0 b!ܨ�6G@�]3��]ZM0 �d��c�4��W&�7`K�1b��2�vD��im�)n���@欝�2��c@�X,P;\@#�n����ߘp��L�y"�}����EckW��/��ȶ7nm:͏������R�.��x���7o.+f"3�����ݲ�}��_d�/���9B����ښG�q�"����e��؁������K���Z��6@�0���\.�
�0��~{Wqj0 �dxPg�O	�|�������W�)N� ؝�� ������^_?$ �R{��ϥ����ʋuG@��\���2�@2�vo��~H ���:Sx�Ș5�<|�[K�sx���Erk�sx����DU��<��^��.E� 5VO?��|�
����M�V!����;CۿZG�k���n>�E�t ce�������]��Eu�w��w,m���;�׮	
H��wˀri�����	wd	���k��ټNp8�#�Z���4�@"�$/�
4p�t�y����	��Hʦb@��kM>�Hd���]������JG<�H������@������O]4��NzP?����S��Ǿ]��� "N;:�W�k$��?B�/*P-x�f�]�U���
�aҩ}�E_<�/�:�]�Հ!sک���&F[���1v\��ϭ7�E_	�W�c��\���>����M���I_	<��m�U���,D;#���N_$�þ��HY�����ҳ���V� �D����,���3��}�A �/.��CW�{2<�@��n�fx���!6��bx��\��w � �#a�{k</���ќl� (�g{0�M��~�<�C�}�� �vH�#�%  ���v�2���	( O�hnT��8"a8��L@I�C@ 6��u�S�@0�`Fw�[
���p��P@ j�l6�� ăa���.�W�H��6�k�$���#�4��ܠ�D��T�C�� $�a~�D�+p���g4٣k��G�g���U�+r��!��'a���X�k� ��1�e@�ca��_�{P@0b��"��1����{9���u@�\^��(P�����Q]�$��彺 ���GÇ�ʀ����Cuh ��H,>i��x�θY'D�5�O0��Y9�രv����l���c�o&|ŀ�wu�u`	&az�-P��xO��k�L���mO`	":�ʚ�,��X��������JB{uf8�^�r��|^�n`>�7-,kH�����e��?�%��,Agܮ�\�B�U��~�����z_�W��^��#�Wp�:�,���7�:<`	�H̓��l2X���͖�w�+h�a�=x؂�`�2��@�'�?;�Ĩ��cx>'�b@�G�c�[ǵ�`"�\ͅ�-�"�O7��� �/��M���%o�Y���Kǁ� �-������I��h��@`&�Q�6�[Ы�������A�
>ċ:�Mb�s�g+$��-�1 ��p�Hxh����СE@ Q�d2���l�d,x}�Vŀ"_�S���C,��cK`�V_�:���+�EK��=tq�����0�I�%p�n�~�{�Q*�+��V�'�H *��3��XS0�3����b��o��Ăm[O0��doڥ��KW�A��.=���&�ħ�l	lA�`�^���5��c���JTp<�K-�ʞrm ��{��_dp��BEi��	����S�����I,�XM< ��CLmM�5�L���TƷ�2��WM��9��F�1Wߚ/D�{����t�~�g#4i���c�R�x�K��v���!0suv��3�iY:�l��L�3eJ����z���w����Q�sZ$��؋�J�ΗH��g)�W4�Jaٮ�90��cΔ.i�����n���I�\v`j�� (_z^Qj��7�epc�-o	��*�<o��~z��B�7��E�c�~�7�s�s�޽b��9��Ce_   ��ϑ%�������Od�z����A�^���9bi���|�\�u,�=H�Ϡ�e�U�w� $"��C@�S���������Q�v�4؃�xN�>���L�z{�&a��t�Β�J-+�� $r�hBp�� \��U��d��Wˀ�};�WZ�y�@2"��K�2 �P{u��R��|��Xݎ�1��=�Y���C��ME�?��tz��������Ô����?�?�)�� E��ֽnsIB�>F��O0��nX�p_ � L��+�1:�$΍@��\&�#z�)�$0��.�6�)�%0r�wp�?H��7�8�)�$�)�������tƞ��]:�4�@"�]9�?H�hg����C� ��u{�ChM�+���:|m��D�K����`"^����`p)���oM�&�CH��5�=׮�p��r�	D���hVՇ�2�@2��!E=�X�Y08���T\ ���5o�,��>f[p�2 ��(���    �<_( Yo�-x���7����1�?��&��� L�^^u8�( ������Ԟ18�ɜA���b@�-�d��V��"L����b@ꦚ1�T�y��C�������BCx���m2a,B��<�G��M��"4��6��;C4��&rݲ�ڑ�8���Ѣ!R.B��.���`��XKv]p��r�����h�Qs�1L��b�ϟ���^���w���C���F�|?{"���T[�������g�z����9�~����tV��1x�������9��R^�[Ls0�3�nx� /�a��[��:x�����e��#���h�W�X͙��|�>\��*X�K�PwY��:�u����R��t�+�	�?�9�F���%� �����N�;h����`>���6�lK�v"`0#C�9�1���xB�֗<�� ���_��@@���S��7�2P �/0L,�m�`c���*7����cdj��?h̲�S�U���d��ӵ�ap9nL��=�S>�A��)�O�A�����d28�,�4��6��a"s��Q,Ѐ�)L;H5yp��cd��M���*����1���L�v?��!��5�1� �0�u��!o?�}��΅`>������1^�,De2_� /��r:lW���VsU��r�izHw%������ު!؃Q�u�=hȲP�^��U!�=���y���	��$�lb�Kb�u��=h��0�O�m�`r���0����`>���[� \?���2�V��3?L{�-�A�3��opg�!�{QV  �Ȇ=t�6Iz��c��u���4��i��$���5��E��3�V��ƴ �!*��r:�����d��1&m.�Ac��esvӝL�|��w5w������K]!��A�/mK���D�#�e��?��=g*�S�J����ζ��C��}J��X�"�H��HMi��C(�o�v�v��c_tST)���&6m��
8��8:�X@� ?�۩h�4C��1�s@:49��j��}i��DȢ��:B�!t�S���1�2@2d�o���1vЧ���76�0�NY$��;�ϭ}��!��^�@@�H<�ZҤ�
8������� ����U�M���]���,~:���p��)�c��0�-~�v�:,�G�;������;t�Fba��`�6��[	$�w�_+��0�3���	x��Ɲ*��	a2s�:!4P �̋�J�᩷:av�;�\ݓ���|���wǀ$*#��m�\�0�m���g!�:㥨����Łĭ�;�1I,��x�I�{�E�����<��N��!���!Q"����C�=��$)��YM������ ���MoK��S�W�v]��ǰ��C ������4]��Dtx����}���������gS"`z�>�U�sPr�?���18��y�ƈ���ru�o�����*��WH´yk�C��>����a�����@ ����ֹ_�A�Lb�s��&0��pr���/����{S۱9����=v��JR�|̽�k$`z�@;F���18��9����
$��aCm�nlXo��?vxsG0| o�!��:�K������I�A:��%4�'Mu��h�(���` ������E�|��@��T�uS�X���{QR1�ebl��AZ������x��!���1����:���c�et�.H.���~<c�i;)Tb��VDA~��c��M�<QA2����,�5Ww"��QA"v�+KR,O������tQ�@2v��ݞ�����eo[��4��eG�[�j���i�@]�.
 T�Mx�9�f�K�$�� �ܹNA�
��M�=@ �r>*���� ��	�� ��ŉ�����"J���<����>���>��矌=���D}�9gթ{��Ϲ����;O��{����;�/l��OF-�lҀ�pT�[%u�Ǟ��D�>XN���8�<�,��2P@B�1���	ϣ��hn��@�خ�~O��snc��HF~�*4���v�f��^���$ޞ��,�	2�[p�i�GU�9�"撎�GU0����cJ�e�h {��U��"�.i��̷�@'���o��6���r��n;�T;Guh ������&AL�;N	l��B{ݔ�# ��}���^l�HƞHYUH R����ֻ�&P@ v���! ��ou�s��'���ͣI�����J���i��A����O�� �[	�^������kQ1�����������=�{��Jc,���@t����	@ɲ�GW��$�x_��Brh@#sjف�β�H�^�Z�[��ޣ>������p䫁Ǭ�ʭ��j ��׹F�s��+�D�qs���W�5�rY�+�j�1� ��T�|U0����P+��|i_$�|�T]&��W�����V��\��+�d���9F���{�ʊ;�	r���M��A��Y�qs�yn�@0�N�͌ʽA�?'�i�<�	3�h�����5�+6�H�^]��}@q#+��{�$c���%�>���.�y�	Sh /����D��c�ǈXh�"�ʳ�� �(���~�� ��֠��cle��h�|/�k?���b�;��,w����`g�rޢ/���@�K_7�`>�S��FU�A�@��iT�^߱4P@B���y�wЛ�����{;���U7^X�S�L�v(ZM��o�/�?s4���D���1G@�S�G�g�5���ll�gܔ�3u69���dV��uh`{ʈ�5��&b�-5#6X���l�)e@+s���[4�������@��`"�~��h`GB8�g��~s�|��M����qS}*��~�Y���Y�Ao(�#�g��;h{�)�i|���c�?F�P����>��w�����������=h����樓؃�X4(ܵ�9�>D��8����x��u�~{�LD|ZJ�� b̚���Lx��y!�&��^) �@@7f��@�M�#�w�{@�(�#�C�����U;�IWWx�|�x �1_xW��c��,'��ҾH�I�F��|5�Mu=�z�����4���������ճ�z7_�W�(�׷�@�0�-<�@be_	$��}�`�����6E�̄��Cli��P�w�}��L�]�9�"��>eQ}`?�&r�ow���<���2be��d�h�@,������� �`&aG���@ �(w����dL4�kuz�\q�)�M��o��&x�+�Bx��7�����?������׵��L�Πw!�>��ԭY�c��'Czni�9���j�C�7���qo�u�5�����e⤭��G�x�`��!��`>���C ���''6�x��9��i<�b��5��$�4���;`.���~註:��kj�y�\1��v�ә���d�͉��3�b^��y{uv�g0]�4�8���ϧ�]��g0�=^?�
���Y���Z4��֠3���$���C�H꫋Ơ!�	\n�^؂I��8T &|�k��:%�-����ZmV��ѱ���&��-��+��]1����8��M����C���7<��@;�%VH�r�2�-�����ʸ��|�ݗ��lAC$��~�|�嗢B@׏\^۲�8 \����������7|��X �oFmŀ����=]���`"vvRi�؂Τ/J]���`B4�]�C��w�jqZ��3��ݪ���[�Π3������xo�&cpŘ�MTg1�ʾ2���N��ԙ����O������ٵx���_�![��_л�<=R'@^�r���-q������(�X�¾��![�lA�.P$�j�x�-������É~���7��[0�m�    �l�..؂�w���\p!�Y�F)�� �vsl�d�'#ݼ�� ń{���C$p�|�m�v*.؂��,^M��[�1Wu7٩\A��NޯK nkLAg���zM< z��
&b?gu��� E��:��9�u�|����@��
��gN�s�6y�|����.���}xy��]4AB�M���|A��"�Z#Cq�|�G����_Лϟm��4%�|��x��x�|Ac,�E77����Ae5��g��"8�5����3���;t Q�<O3��3����`:�\vW��t�[��ѣ�q�4Ƴ�&�.8��(	Ip\0�P�;}76��d��s5�W/X�����n���c��
؞-�׷	:�|�nj&�^0)�c���<\�l`&�謦��o����Oc���CLλ����zkdr?y67���D��ZsZ�`R�����9x�|��6�(x�'�B3�1�ņ� �� �*�����OD}�ix�׽�E��)��	��c�l����Ơ1�7m.��-���Xh#��q�tD�;�v��g�Azo�I�5h�x�������CL�v,.8��\���%�A���e�5��k�1��+��`Cђe7��.X���)�ukлKX����\0ca�h*�/��<��ė�r�����c�|����wG柽�������
�Oo�\�y��ݔj\���`}�r����1�yv�/؃�X��%�^�9zF��vļ`&r�f��� ��ҟa�Oj�r.؃�}'Ʀ�ܐ\���Z��A��^����sT�̉��
���L�0��`"b���X`:���׶���|���j�H`�19�d�^0ck-X���[��W�� �AG\j\w-v4���S�۝���L���� f��٣���Ł
�ձ�����)�c!�6��
!�h��,��o0B�	�j'�洦`:�>	�qT�A��L�I��}] �D|$G}�`�m���@�}M�d��գiA��>@�-G��K����L��u�ӗhBNc�愯`>f�9�yg��c�]]T�kИhx�;�b@q��w�
�
��Cش�t+U0�����NK����D���C@QOJ�G5���;��}�l7
��1�O3�B�|��I�P�qA뙭ש�f�b_YWA�`r��a��9�+؃���İ�m'oi�^
�`2�3��MM��l�dOF랓
�`"�lZF)X�|�������wa`�|�E��n��>��U6��IE���$T0�Y��L��$T0� �ܴuTp"Ԍ�R0Y=�u�	hŎ��c����t�� ������O`>�%и�
ޠ1�	�|�~��5��ã)�Tp����P�m�����(Z�ȡ6Ƃ�J@FN7ݓ�@ ���^M>��3譇��>�ŞΠČ�8Bօ�
��C���@�
0�N붟����d���*	�A�vIgs7�R�L�� i�p�Ypʾ]4{�1j�性`J��wڪ�I+؃��#v
40c���w#Y�`>Ɩ\�3P�'�{�^>U�nK{�!�N�+�`:��y�s��;(q�i�i�����ߕ�)�	y��Q�F*��I\�˹ζT�%JP�رfs�`�Ώ6��
�vp���2*� y���	�3!���x��n�{PbȎ�:N3BS�|���To�o�7F9�=���==�D�;�R���d���U���-�H�0����~y�����
�L�^NR^�
���K�f�`&��@MN��5h��ԉ}�n�B�s��mY1 �8F��|Mp�o�!kqٛ�P��)`���)����uns��J�F�&�#�@0g�۵~Qp�ao���Ls0^k6�=�A�
Tڼ�IU��a��S�������+0����Tp���Xv��660��+h@)x�#v֕ь�T��A�u��5h���[^���_)�M��k�?%D���2o���i�5s�z�p݆�D����R��ˤ�@��I�0�2�Xh!�+���E�L�={u֪A�����VS�a�A3?���s0��Y��n�`hA=��\� ��Rӂ�ns4�[$^��LԠ9Sr�&��C2{�ԡ�1�]�r��F7Û7�5��y��40��̾��j�(2��k7�b��i�˜�\B��ѹ�|cV�躷�ka!#�xW��b��ͦ���|�h���EDu<bH!��s�)�yx�t�A�����jO��v0��1��:�`-�xuϱ�M� �BB�7��aEM�m|]���אiU�JM7�ȂS�C�� �^���Lx�ݠQ ���<vJiw$E��!��2�U�#JJf[�t�0A�l��oR_�`PD@>���5A�J�xo�.`��i�o�-i�=P�����R�)J_�}#���Dj�}d=d����`�Ԧ��A������Qx�=B��Y�DM��1 �d�^�ւ���A�\w[hh!�h��Oi����9o�P��$:��M��A ��HE���$g�m*��XhAr��֙�ƀ�-����kw1)4�_�a	����:���lC 1윙��rI�DJfR;�Ӈ ��t��L�0�����A���;�]~��h�!;��:����=�3��<�@Iy;����A�wL�d�.� �d�ȩ�"�8��]"=�Iq1䐐'7�~���W5���\Tz��Ѯ�� ���������A$$�L�ED��2�'�jHB�=��-\w &�?lw�bH��)U�5h�\����BoW3�I}�ahA=���Ő�9�ⲓy�Utɀ�9Wˆ�	�4?84A�%$�ʝ�p�R�Q|:M����\�W��w�c��p��߯�s�:��"����'�^]�G����饟m����ј��&|w�ׯ�yR� ͠�d��݌�7�+�=���z]i�W
�x�M�|0�Ќ��-b�dX�Su۲�����������|���v���]��!��!�o���w>S�f�J=����7(�4gw� � �_��m�9@+\��w���r�h���ؽ� ��ovK7I��C0j���4B��聢)�Ŗ�YgNPC2��5����������u�bc@�X��|c@-�����]bN�GY��ݶ7��L���ƺ`�PG�9;�SS	n(!RW�����	�c�G�7X�Μ����M0�'�m�{���:HƎ9e��`@�^�V��GȄ��׸�Y&8�3.��o{h�`A>���6�	�3�Ư��W�ƀ��F'-R�1K����%�����L=��}&�w���Y"�;��LF,0Ж9�h:Os�IB�8�CB^n��>z�-B�U��޺a�1��ddPy���D+;��Yw̙�?>辖�%r�fA<}�[����8�;A�~��60��w��@��ze=/��^�|���54��n֑��5�6��1RB��"�I ��|�eS`�A�u��[zo�<PCB�F7u� �Cܽm��H�#�� !�r3��y]Q8J���� c?Xm�<����ٝu&X��ī�G�/����Y�x�b�b�6��kCn���	�5tXۻ�	�w��G��]  d2�^Ne�xg���V���V�Դ�2�+��6�:7��V�����ވƀ��M c@Ӄh��X��o�!�IE����A �d<��9`O����'�,���R^S%bXqC:=�ٖ�|�H�Kț1�O�۲�-��ُh4��V8���nP���+�u<���@+�	�����c�aI�F��%�E�A��uI����
�K�@��M�Z@��'����w�%{�c���`?z\{��
jCp���&����O�&��]mM0�����7��(:>�Н��#61ptհ_DW�f�!����+��\�f�Vb� �N� �d<�h.�'��Ψ�@���j��Au�k"��8%ڟ�ZOF0������3��-Htt��t�rq���샤i5fhag��������Q>��n����D�_0,��]�7�\�    �3��ж/������ȋeP���]�jƄJ-b�����j2�1���	8��L�^��g���; )?���O(!PiG��x`H�f�{�6}�L&���"7�����Rh�F74{�V� P������j2�8�ɘ��l�(A����ò�2Z��{w��_`>&�#��S�KFȾ;�$����d|��;��#E��ȹ��Y�>>��7���j0�;'�lTl������l���r�&�c.-�6��z0�#mrR�U.���65s�|��MYɝ�Y�������}��
�(.��M3��r���}_�Xŀ�ǜ��U^�M��H�89=崱����,O�m6��#-��z.UqhY�>R�t�WUlG�>&��o���1x�f�`�
Z�m�G�LyE��«W>؏	-�i�pX�Z��VO��Q���;���Bm��NNqV-orq���SY�������+���8c@��N��m�G����u����,�z]B�ǂ����o�Z1�����$�\��M�������ܺޣ�C����$�-��a�u:��ِ��Pƀ8;R�z�QB ��&���wc@
�x�t�P��z4fM�G�%2,�d_v7�� Ђd�l��͢7�B������Gc�̻| V��-0).ޮ-�����X�K�[�>c_�V��x��x�x����{���:�=h���� �6��a�h��w�8x�����.sm���O��������cBv�~�L	�b0��~��2VRf����)�'�zNy�ŁR��]+!P���A��5!���xjVy�h�����w[%��YYME��1�wvUh�Gc�|m���)Z�lk�������K�����c���ZPO�cPuV�Ł��G��e���@m��r���h{9�jf����s��dt�G���y�����}4h��ν���{|�k�n�k�W
��t�(�Q�-�Z`?>���H���r0��N����( �����,{M����ǿ���}��]��B_5d7T;��B���|�?z� r�{��M��<_���;�M����H��v4�rR�-�){��}�� �۵3����z�Y��]�W�l��˼�`�r0���l��}��Ƙ]?�I`A:c�U�7i�b�b0��������|�9c5c��A"e�T��:1l 0!#�3�*������+��A�A�e�����$W7���3�ڵ3�������&��̲���o�-D�w�<�]�7�� ;��f����"]�T���Ǩ�f�Z�N]eNy.�����vjX��~paiS:	�GѬ����'����r\�3�=cg�a�u������u��iw��&o�&��1��S+Ǽm�/��*)���4��?D~}4_n�����{��]�@�17���c�,�~�#N��ա�������I�1 ?&n�����c@w��f��}�_��r�qLk�mQrq���Φ3�-�A+n�oca��@��+�������y��� ����̮c�A�����;×԰"a���4�u$ �d�zm�+�@љ�J�{�����VF݁����G~Gs�'1��}�����@q��<��$����W��� C&Yp;��_@���Z��;�A
GKop�U�-�_Ќ}�;��-���܇`@
C���	'�A
	��Q;�ď�����h��ٶ]�h!�������G� ���[�|I�ķ>�w�����r�Y��Gt��5�,l����o���U�=$d_���@;*��`^�B�'���]�E 䰣��U*_��8�C@��P�5�W3��!��:�Ξ�w���tA��㿻����d��WU���D;B�}�E�pA����|�B��& ��bH��;�1���ZM�pA���T:�p��s/����n���M� )H!?�v!��^Gxyݰ��OA
����kf�++H�vSZsRF�~�s�IA
	��HA���v>�nIA	�%m�6)�A�jێ���| �dlC� ���:ہ7F}���*֢��Ҁ�W�9���W�x��!�]���R7oZ�oJ��褍��㫅����n7<�R�#���)�{sm_)<�N���㫅9�U��S������c�Om2y����ס��b��	R���pT�6{2O�B0��]�OPB�o���`��%���v��!��Q���6[2OC@���]�1$�>�;Y�1�m���ހ���'�ֲ��ƀbر��K��bHƎ�ڔ��1x����6Y��!��4�L�@ٔ�h�/=VjH���&����"�G���z.��X�1�^ ���R�2P��h�����ߚ��	���F�t�w1� �
>�{,xoA�]��3�[���-p��1Q��,Ȥ��mn+�	9��G�C}���<���Vդ�38�3��{C�����@�-��|2]����?����}�#վ����ɂ���l1�����~|�V��c�e[�`@
ۏ�b��%������y��A��dƺ�i[�`?�94��Rw��`?&��!u��-dvԸ�z����|�}weG�`@'��ܹ�'���1��c����?&d������7?�O����J �ybGw!��@��'�qm�j��08��x���rp g4E_CV[7��@>Ȅ_�&r���`�]6�Ձ���_�jF�+-s[sq���TF��@�]�����d0!�'����ݷ�:��	Ԑ���U�3��x����Ȉ�.���NW�`Az�����Z����@>��4�����Ҽf��c�W	�_���7p �H�{?�ؗ��|��o�_�|�`���a��9�䃮�A�~	�w2^�$e"���d�N��R0��(�� ඝ�H����r�J|�!;��OZ�f����m�2!]��hJİ�U��kr��d��Wh!�MC��*gp W\&N{?�vC2��T�]<HoK�3�ƛ�P� `A>Fg[g�`A.o���Ļ�e� ����d��:����������v� ��i��w@8v&]��`�Ձ��^&5#�A.��5�x�7i�Ըv�p!��A����0!"�[j�����F#�r��/�;i�V��|�,*[b�^�Dm�2!;)�aN%j��d(��b�1���\V���;�������J�������������ft�&�_��|����{��i�W詛���@	��n�'	���π����!��^.�A�����B6���� �c�h��6�λJ~�1r��ڊ%��-[���sm��d���ECB ��1�IL��_��|�ځ���<Ho�06��*&J�����[�V��|��*�9�8��j!�A:ݙJ��|�٢�)`A����vgy2![޻$.!C@ޭ��r}�����Z��@��z��jCr�Э��Y���@������.�1�k�״��[���~b���Ŷ.�cTg���i���7�~g2!��u-���wh�i�6iy.�cx�.'_��4&�ʌ�].��� ��}D	}�@��={�q�w��Zpfy�/���3�BRT�x��{%��	Ѡ�Օ�az� �E�2{Dk6V��I�K]�!��.���������2��N�M2��	���Bs�� �q��n��/`B>hS;�M����O\�흘����s�h!&{�[�4��C���ͥ��I�&׻&���&������(]c@	�l��7(�������Łb��۪wһG�=W.�D�@>�S��v|$q$��G��N	�Ʈ��5� L���� ,Ȅ�`m�,Ho�a�g�t,x�y�����7���T>v��B#�A>ƾ��y`AR��?>i��-<H�<��>�ż���a�w�  `ARL�65��6C2,oZY	��r���v�;AP$w�n,�ǜ��5��i�w��W�ZmF�@zS�m[�m�|�1|G�1�    �H'Zn�˻�X�|��ڳ���A��}������{�I����6��u����萅��C��Gc�"����Ł�٪�I0�����kzW���	����u��~��m=g������̵���`���} ����`>z���^o�n�����l��6x�ӟ��Me-u.���D���lw��}|��v���b��>t���ƀ�9އ�)��Q޵���]���x�!51�_��{�S��9���8�u��`��D'�8������q�nw	m�����ٜ���xL�_?�z@T�EƫZ��t���x�!/"�,�@qU�g�����RH�����V�P�K��8�h!!{����	��'�۫�U��N�h!���RX1�]�Fwɹ�! &�mm�^���y�7&�1��1$#T��-Px7�,w���!!]o�B	�bN�7Dom5�-7�I7�@�/i��@q��#ڀa�!%/��s�&C2��k��M���О�7�b��>��69�A��ٺ�A
�0b�j��m-$�޼��@qQ7��sM����=��7�$��捻<b�����J]��fPCB�g;~n3�A��[��S�7�$��Ӗ>8���mLϕv_D�J�T�&#o�!���ۖ�[@��Vo�[
�!��m��-�����e����@9)y���|�-��wQ�/��&��n�*a	�N&�ͷO{�)���aPǀN�ￃ�Vo{�N��ϗ|TB ����v�iR��1$s��b�p���t�A9�x׉Q�9����Io�9�7h!!;uC��)� bOO)����H!�At�����>��Q[$�H!�3<Dk!�B�3�j���)�/�S��)h�����8�[�-�k����+�a�c�?���r�7��u�)6��U�C���������;�Ӝ���~吐�a��Zt߯(�/��|�bx� �q�����{���s;Fv߯��%��Ws����u�L����+s�e! ��t}�#���y.Đ�}��ЀԐ��-���m1c��M��������:{x+��I�ڍ��
jHF��䶂��3��VY�`
b�� �]�n1��}��s[Aɸm���@Ѹ�zM��R�)��gzw97g���tW�g�r���� )$�_&L���ƍ��e�N�����Am��3@9��=�ĺ3@
���qǀ�ۍz�6K�C�$�v���)�8����C���1�])Wh�c��|}=��������K��t�t�e%����l���Go�eY�k-���ۙ��G�qчU�k�XH!�h���7��t�s���ー"�;!��/���v�q���������m�������� ��ݖ|�~���L��~[	�v�K�ݝ�����.�33؏�������wlw�q�zt��[XgZ��g���.�����S�v���NV��x�Y���������$!�C̘�M�������I�c1P������jS��1�7�����{��}�����}7}x؏�N>*{V[�x�}��0�$���s�}|̱����p��<���w_;`?&u����P����r�[��c2J44~�����[tk��r�V,�ǄĻC��WӢ��Wm}`?&�2Gw�x�L��;u3&������̑`�r���F����cB������s.���;/�����������wC��>4�G~#��)�������/��b@���si�������n�=�G���v��r~O�Đ�=�S�h���'�����8W�%�	ݿY�%bxs���6j �Az^Vt�i�W�qW�]�� n�Z%z��Ѷ�p4���G1�b���7,��[6�N�������2!{���ɜȁ�A���VD�?��?�a��F�@I���S`Br������������b@Q0�}���L�y'�v#�s:�]�d":h�.@��[��l�>� 9�L3��/>Ԑ��uwh�/iLA����X8��k�e�	�r8�w�i�X���^��1 ��#x���,H���̧��8`A>�.�����Qɹ2B �z}t.��c�����-�<�@>�=���dB{S�z�%��Cfsr�����w�0)RH�NU���H�dO�߹0��_� ��;�Wh�%o�-Y�]��A>^�����Ar�;���>�� �ɻ��$����f�^p ��Ve=gB ����ۺ���3~wK��|��4�K{Lu䔫9$e{ߍ�ɚ�b�A� .ؐ��x{��ԓG�E�mW�.dB��]3�6$����n)ֻ��1��r�P0 ����v��^p!�㾔���Abv�'h����!�u�0f��B�˭�wTlb\�ݻˀ&��$��,M߿.d2g��.0!%�9eh9�8��cd��I�?X����.�շ�1.!�������4*�t���`�s$W���ld|�(�i�Fݏ	�:�]�J�~���I��5#N�ǅ�˨�d�����������pZ��/d[R�82!x�Q�3<C��r��}��n_-�p���){Đ��V�%b�� �p��m �d<�e@
�S�=���y �A��P�^]�CBg����N��>ҙ�W@
��o?��)\���v��N. ����X��A@QĪ�lW�5#v�*�ă5ܘP5�� rHȾ�ݹ�W@׍���	�nCTY�t�V*w�"8�hP��t7�!�9��ۻAQ$>c���cm �d䎮��n�敯@�(c���筻��+��&uj����*�1����b�B0f�y��2w���J�An�wC���ja�+�kh����;_-<��%uU��|�0#��st�����svg�{�j�����Nw{�W	��Nk �j�����@*B�b�{v����b2k��8�vA�_?4^cc\PB"<��V1 ��3�g�w�Q����Z^�$JX�Z�yu=��%��7�^��!XLe�\!!�����RXѯ���sA	�� 튯��(�{����V1%�b�C��m;����*�!{eQ9-!�31����뫠���}y]��U�g���n^�UPC0�oψ�1D	ֱ��<��@����e��G����t�u�b�;$j�?���r|�uԐK�¦���氘���t�����)%js�}f9�6Vj�|E��7��DU⾭������\ˀ&hA��y�����D'H!ާk�� Ѧt����U'HaG��w��R�u�2��_�	Z�1'xx�@���-$ĞT�B �˦�2�$VjHƾ����5l�(�xv�+�j���n��BU�!�-��P�q_�ٞRwE�Ԑ�EedB��8�z+�:e0)�CR�����!F����iڢ���WCS1 �������mL��f$���-)�bT�����c��zH��N���ÍbF��U�(��	��{t9�
��Ԙ�qf���Ł4���Mkx��O�%��������%b�(����MkX��1�v�������h/ZoDg�[�����F�Â����]��`?>�L�Ƽ+؏�L���/��S�`?&$�F��P�\#k�-Fk.o���HW%��>:�d��zW;,���w�0�̱^���W����z�獮&�]�}\1x}���.� �q���&�U�x������!�,�m��+X�"���'�@	+f?���+�{�."�N�Gse��<>D}�NÀ��=D���h�P/��l�u�ޤ@˓T�m,ڔ�)؏������&`?z�T��L����� ��x�����A�爏�j�~��I��E���h����k���
��w��ۙ
��c�E�Mɛ����B�����\	��ԯ�Z��9̢�v7��A&��n{�?����v�E� ��c|�asA��>.��d�n��G��j[T�}">Đ�]�y��7ש�yT�c?�rbmB��||��n��F�|���ʆ	��$Rn-j��R�̶    #�r������maI���>z������0p�Je+��@	۳����l�?��d�SFW"��>:�Sa�kvS�z`>�8!�K��!�)$�[�\2 ���2ɝ�Upe[���؏��"����#��?�m���Bs/��?>�Z��t�Q���HLx�jK���?�k�yq3I���!��f9,ÍA[ˎ�͕�A����|i�%r�H�7Օs�bu �d6�&i���f�,�!��RȻY��8�hA��Yn��)��o�����ێ�D/��[�_�4'z�4G0��b�"�RoR��J��i{�o2��*��������˘�(�`t�k���1_%$c�ϻt�����1QP����Bx�[��/j�W
�)�:/+7���Zx�����{Ny)��'L�� �c2j��[ד���L�������}CB{jn��f�E�V���o�:�!�N3jX1�ky��f32 �"�����uPC2�o��w_|G`����tc@��اiFdha��;H��o�!��ν����by�n�U����c�\s�g��r��j3�PC2c���������ɪ��G��3dL��F��c<I��J0�UT�̗�P�z�<&�m�O�U��Hќ�6�w��#��ui�b����<hB�suHˀbm����򫞦�C4Q^܅`>>F�;W1 ������(#�sg,|�:[��B2�{�S1���2��T������n7X0���Q;u1x��\Z��(p3�+<<��\H!�5M
MF�.�ZX�9�D
Q��ye���k>���Ď����1�f���b�t/������@��[��2Dj��ъ�_&{�[fx��N�}	�y������-����OHK����T��q�Zp��Z�V���|���D-�w�~�t+՘��ۖ�Tn���UB2@�:{ϐ�������!��޾RH�&u9��|���]NiI��@���f�4ȃH��v7�n�2���H����A0<����`@;'7�P�.� !����ac@��[���bc@�\�Ϫs
�D�l��B8�yC������A�ݦA'G�&qx)�}�>�9� )����6�)�8���4��A ���Fm2�-��"c��fr�_��w�:����`�9�+�q'�����7~1�8�9�F?
j������~C2�������������jh���2s�ԋ���2� ?�!{F͜c@�#��
�Қ�9h��S�r�O|�!&o��1_1pVI,�3�rq_1�<�R͕�����ni~���A�hsFkv����A1o�B����Ãwm޻�ef��,f�s���Av$��'�A_5xS����,G���bH��]d}so�!OΑ��� CBG����a���;���\�1���7��8n�s��ao$�1���"��_�O�bH�+�RQ�@+G�����s����˻�`@�����\���Ŏ�����-$r�l���$�B"X�}�y�����EҤZ��,F+��Xh!^>N�c@
I3L�ߎ���]ܵ6���]Cf��h!�����7��q��v��^�5��Oq�f��k2�!{B���'����stg�� ��bRos�k�Ab3��/�@	yo���:����Mv��G|��d����pƀ$G0���ZmGr�Y�!��t�O5$�{���Î�+ws�h3�'���C����
�v��p�Ƣ�rf��,m
԰s��i�v>5�t��M�?����+��P��̙#��<Ԑ���YB�����~����1���X>�yt�� �J9�+�cB��<{��@7JL�g
4�2X���C@
7f0���d[�@7;�(IgO�R�[{x���QO�va�-d;�n7�����D��.	ֳkJ-���$��x���Ý���`?&�K���5DO!�(d�[�y���Ie�r|�!�Ae�A0_5��z�-�]Ȅ��r7i̠���T�e�i_8��XHs�s98��x���r`}nP	meǕd�R��g��f�3��J�1��:�gv2�M��AjG�v�Rb��_�T�-�c9G{�2!�T�h�m��A�u�)21�<��"�'�jR������i �1\6md�9,?c�Y�u�6$p!t��%	�V�e��"l�p!��do�Ξ Rbl�mb��<�`B&���ؼ���M���6�q<C�f��DQ1��(ش_�U�].0!�"S�����2�o�g@�3�tY��:|�*N�@�te��X L��X�4�Ac@1��Ѳ�&�Φ�����$ݣ͈;c@��MYc@
��U쒕X�	��ߵ�7�W�v�x=�]l�� =/�(!CV��%mn������Eb���j����q-� eg!�a��$y���� ��U�>�S����.�v�� ��P3�@;f�z纯�1 �`��.&�-Dm���对8�B$x���U]�Aʉ���IeMа��|��t��Ҡ�M�6-x�5�w��eLB ��Ǫ�e0�Ѱ��|���f��1 ��3��o�Y�� o��400�p�dt����/0!�钍����L�^���L͵�b��9����2�g�Y_p%rȂ��5M� 6d2��֦$a�)ꮁ����G�@	����B�~M\]���1{�n�rP�7�_Ǽ����4��L�5}�9$Ó�{'g>���Q��t����x�yɨ�XJS,>h�̶�S5|,�`Ȣ�KԦ��������TB�fԙny�e�/<�_��Y3KאS מ�<���>�_���VB���}�r�|u���ΣR��߷��-,�رŽ�3�ֲA���1D����4Ņƀ��w*��vbm���S���ho�����7�ae����Ԑ�i�k�h!���;ߩ��X�=P��g�� X�@1x��%îj���ލO1
������U�: ��Ќ��M:�: �dx�r�s0�v��ή���Ԑ7��|�u@]�=��`�*ȁ�Pan�4�1������v�jH��%Ŭj`�4��m��ZHfk�Y�B ��=���,/(![�[�э�6�����W�TB �W ?�)�7����i�'��������>7�bmGzZؙO4_�{4(h!��A�u5�Bt5?�u�����\�}�RP����7i��AA��s���Z���t��f�b�}�J��� 5� }:oYor�1�Yg��I�Z��p�^���4@���"[�p�X����M}!C22��@�h!z�")�sq ���⮻�A����A��@��߉��^IԐ�Б�W�	z�K�AT��M�Сۍ�6�����4��4A�x]bˀ�M�C{�W�8DB��4Ah�A����H�&�!ou�ԏ�=Dos;��Z��! ���f��5h�O���6�bHƧ�6!��Z���C��^�����2V3۠���S��f^�7S��7�b�Z���Ӈm�B�b���Ã,�[U�aB_5��1�n*M�A��c����4��Z����;c��+��>��Kj�٦��*;���@�\���'D�����Rsq ��9RǇ������ygw���ߧH��R�����>��qB�A�ݜ}2Fw�HbHȞ��LRbÊ|�c���V������-Z���vHdmmUbPCP�g��.1ȁb�/��3��6Ԑ�w��"5�8�;E�>�8�y�]�Z����|��8�z�^���]E,���]VN&r����y�]  6�c썰��I2;�O��mwK�!�G�`���4H�y���|̭�p)b/��4Q_.d27�S�(!�Uy�?�Z�ؐ���rf鿧�7�	���z%TЀ���ǦwP�a`C&4�F��C`CN����mx�,�Xh!;#�&M�����w?�w��=� �<m�����.:��� ��~��! �h��^	ѵL 0 ���mx)9}{պ��    1��`�bI�h��l����=Z��ho�O����c"{�Z0�>zWsR����-���|F�K�@fcs{oK�m*�jHfm./��1��7q�m���Lȇ���Ad66w��*�	<Ȅ�ߖ`%r�9�xs��I�A>���@[0�Azgs�m�o�j�2��D�V�	��7�{G�U�	��	���=z����m�Kp!�Q����q��	�1���3K�%���-��C�������T��ˬ�$���2=��p���~��2���ZV��}ŐPo�h���� �s��9� ����+�+*w�F�b�0!:���[B_1���0�щ7!�A>����D���uG[-L���&�0!=v�y"X=.�Đ�:��dƨ�uGy���f���1x��N^�J��	���.�z�{�i�������`@
n�Fl�.ɧ1��;�]����K��`ԾVV�!`?fNy��5�둀��P�ύF	�ft��v�:�3�bE��������*�=�1��+��N���8bHƭ	r�"�>f���`��	؏�c��
����ܰ ��ƀ��"���1�3��㞀���m��	�� i ������x����萸w��߄�?>��%�?�!R���͆mjX��1u�1��1�6|�lB�~����-�Ʒ�����e��A��^@������2Օ���"v\��U4�cB��Ʋʽ��e��G�"���I���rZ��q��4��"`?&�i>��B��4�[HS���>>b�wj)0=�|z��,�����=ݼ{��.s4��@��^�Dŀ"E�r;�	���T>��lx�A ���崱�@�kA��fE�2���������8"����T.T����XnT5\�׽��C�1����S1 ��*7	�bU4���PG�a���b�Y�;��P.`?fX��7V#`?&4}z�,���I�T��
��y�~9�畫i��[
X����{rz����"�\��3���Bz4��ic��&�c�i��`@�/�}�e� �Q~��+��3�T������9���#��l�F���L��h�#fX����o�d ��3f?^�/֒.`C>�����	ؐ�W<�&��j��9c��W�Z1 ��y�)��!`B�0�vQ� �B>�֤��XlH�V��		hp!��_	)`BΛ��}�'Ԑ��{0�N���D��M����1$��LS���<��Ev��z�� ����1p!=Г1�k�+v`B>Fǫ�@F��4�6Sv���)������)��W�Q/Ha�Wƈ��t���p_-<�ڦ�]q)���o�����bx��R5�|� 1�qi���|8�BL�8�oh�P�!d���
�!߯�=ʿ�>dRs��#RF��W�X߀�����X��+8����c�|H����>6qB��|�׾�%I�����g��71 Ws#�1W��Cz`���М#�3���d�z1W�!r�^2iA��G�yZ�aՉ
>�ls�l�S0"=���S��*�p �D�z��%��HjǾ�zlȄ|��!S�!�n/��H��)Q{��l06�3�û��eWH
6dBs��0�BИ~�FR�L�d�7��B@�l�K���
&���t���	)�v.�I�0p!�!i-ht\����?�������0!=6�v�M���j� ����d��!�����Bd���W7_���|����5
䰢{���H �����Iʔ1l���ѫ��S� ���8j�ą�Qzt�>�~s�J԰� �]���'�A�oaU�
F����d�#�1��C� |Hg���jg	.
>��9�QK.l���r��e�`C:�}�S�u�)��	���
�*|H	�s��{�|H����ݥ[�!���H�f/�W���l��9���@7:vm!/KH��@���cH!��Wi��S0!$s��	}�ੁ��mm�:Q��Lƣ<�:�`�J���n�ًv(X���}iI'�����e�x<�W�즯͠b�R0��sXǀ��Q��C�Y�����%$>R�{t�?�=�9�Ǥv3%ВF��(� ���j5��AkwZ4�`@��f'f&*8����=Y����̵?�n��aĎA�bwU
��c��M�0���^�u�F<" g�I�s�|3xߥ]�J�� �B��HO�SO�'_��t�@>�s1ɝ���a~�K�5l�2�A~v��8�í���(8��Y����`@�F�n��5H�|��ov�����NC���ئN���~|̹*)������`���|��{&�/X`?:s|��,�k��� u��B ���c�F��c2�۱�]�-��㰕|���{����p=��}�q��H��G�>y����(��a�:!>���1vz�hX�>z���5o�`���G�)d�)vZ�>zĞ��~E��o����9_�f	�"co����c2����GClCl_�Ҿ��ー\�jZJ�U1}�q)_`?&�%�
�`@���k��x���0�X*�4\`@&dj���H��Dvc��١NY��� uߖKv����Lhv{M������ȧI�lX��ٿ��r�l/A.���Á�ߢy	0���4hN/�,a���_@2�y�����J�ǀ�H��6=�n����0vvk�3q}�`��^ÍU'�����A�U˯�������d��� ̴o��u� �=&v�F��1 �n�s�s}H��;�{/�f��ǁ�1��UV.b�^��N�~y�p��8����b�?����%'s�M',5ĥ�9}�N������LU�N	�F�˝~����'��Q�Cl�W��Ȏ������EA�j���,1��!��r��Đ���h!߽I��4�bH�]��$b��e�N��"-�B2��FFH�R��ĸ���-�BB�,�h5D�����-���x����O���A|O�<��r����'+�9$s�c#�5�����F���54�<��m��zo��0G��rfy�5iOXԠ���·��6�!!�4va�6�Acn�Q�Ր�!(7Uy��ڠ���=�KZ�=ӽ����zX����bak�=$t楅*���5�-��<��=�~��6�Y��a���j�;����4�d�Ê��dp@�/�MC{T� ��@-�Ƣ��5��� �|��9��İ}'m��Up��]��ʹ�����C �dl�-+��1����]Vo�.�!!{I/�'�.�!N}���� �dYd"Ժ��=in���uA	y[5;]�b89m���ul7PCBv��!����z~�9�v5c���V1��fg
m0��pcPӹ�% �b��:i�7���@�n��SC�&�r��@�����C��gbOu���_5<F�m�}U0_1���=�u���ݿjHj�.|��_=d��}K�������dLuZf�1�o��F�^���Ã�ݓ����Ճ��y��P��W��v'�(��г�LG<7@�{����e����rH�>:6HzC��4��;��Zh�GG�!�b���;=�c{��v]3n� 1$c�$���Ha�4���dE��������{�Fx�A�ݰ'h!�;V�.h!��=��l5��� �����n��1xϡm��.����@1&�>��FV�	R��+f�=VD�'H!w��wY���!���\p6�5l�!_X���')��C��e�7+"�`D>H���U6�}�^����b-�1��P1 q�`��J�����m}	�%b��ת-�k �Av*�I5�����y�t�+ҩ� ���H�<�E�ڬgn�� �+̈́�`F:4lyY$i����؞�HO�s�t�Ӽ��4(�B�W�Tl��L�O�Γ��Nd������!�p���fC��3!1��t�k�*6`E&�����þ�L�wW+,8�f7|�ٚ�6��Df ��UB    �78��L�3?}���'�A�
�i��Dz�����f'ӧ7���aʀ�����|�y'�@ǗK/�g��������! ��4�Fv:nh�� i�ɮ�@q���	�l#ҡ��u�m��L�~<��'n�!=�Λ��,O��p �h��o�Ҧ�&�C�GpM2{j���������7���*������|��[k�O�kݳ�ɽ��1�O*7 �|�0Zޟ��v�p_1<���B_5d����h��2�����j������l���},�	9z����?s��t�GO�7�b@���vy3+v�	� �U�����)�W'Q�L��,y�o*���f0%��Q���	�P��.�3l��+��5_��Z�p^�� �Me����^�%�]�K��A�6쬩�鐝GMO<`A&2��%7����w�.X���ު%Z����_Y,n38���r�����M|�
Y_8��dg{�7���dz�`ƀ$��l:������c/:��r����7WW���cľ"�|�~4ƻ���Cψ��G���*�C}���AtbN0 �-R�����on���/����~���z��q�\�*~w��L���K7:!��Ɛ��n���!�m)�<`@��"�����X���<[��`�dB���gG�!���(�w>X��t�'���8Y��U.�	�v?���i����%�/}� �>v�1 �1�s�f9�<�����5�E�5�W�;0!t�Т�.�C�U���K�&�c�(c1\?&�$-~9`B>��&����I3�l�4w��LF�,=��	9#|��]U0!��w�	}�0c��og9p0�dlQ�2�:��f��fy"��W{Y��2�߼�� cOW����j��x��������Lȧ.NV���������E��c��U+�УG���
(8�	��e���G������~��L��5���C�'�ǥm L�9����Lj�p!t��=8	��_�k?���L�����N(C4C�J.�X>�!![���݄@��}���G��#׍�w*� �j'{2�\�	����X�Ҡ�vc[� ��`�,�Ӫ}*z���^9�g��WR�4��|��!W�,�)�'m�K����1���`B>F�qY0`B�9��&�r����X�9��m�J K9x��9���T�A�ju:���Lo�.v#v���q�#��kX�ZmmvSu��th��d
��!>p���ȹ��v��u�� ��x=4!��r�Fe����@
��1�50 =�ՖJ;�tV
r��L�g�uv�u���1z�ڦ�e p ���G���G��6u�B��H�|�&Rm�����dB��8b���&��-/x�2F�����Ɣ����.�����	�5t�����|�'����Ow ��,Hg�i���v��L�� @v��`B�]Ҷ��o�P�B&%�$�!�Í�o�MIK��1�;����9�V���]p!�#ÒH.ؐI����{��L�^Q�i�`BJėo[Y�ʉ|��$f;�-�lr��1�
�Rb��-㽜&�<郭�LHOp��e�a��t_1$s�oRc�|� =}}�.�.x�	�v���H�+�fH_�Z~��Lf��C�B�t~o�`g�dB�>�2�9 � %.���ŷ��|��|���� ^� ��Mg[t*��A�7��@�/��)����<��,҉haD׷�����2�n�B9G"!È��=���v�����V[u�u��I`A&�f�u'r@����إ캌�2!�]+�`AzT�߄�[�J��5��^����W�ٟ���_� c�Nٍ���<�c��/<Ȅv��"]0!�_�>�i.�0����@hr?q��t�MLg�\� ���f<H�k�n"l]2�1�!�1 u�M�ӘZHh��}���8�wW���@m���C�u`�n6�����lr=q�����ӧ�[�x8p Z����1l3�['B�Á�Ij�.����G���]p ���-/N1��)����Ŧ�d�]��[�`@
�c7=��.H`A>�W$ʀND!�s)��`@&��o:1.�r#̿�یA^p ��n4H�+�_�d9vŞ���{X@�R{&d���j��A��w������Gf��,����|���P��f��r<�G��/��\H��d?����B&}b̟ R��o^f�2��Z����i���o�j�� �g\�1Rg���2T+2���y�܄���/YJ..�����ݗ���!M6M!��@>�N-|2�ճ��&��x�(3&��T�-�g���dB����Ȍ��_�6R�L�Oh2��Oh��8� �! �@n�)��1o޻�ry>�!����z�'2�>n���������o�h�x}��[�]�Z����޴~/RHF;I-��GK�o��^��!4����-�@
7"�<$���5���-ud�1����\���@
	y�)s6�p�i9׃���1����D�.�-�������6=t+�ttkh{�,�>�c@�.е�Ҙ^3��83����gD�]�A��,#R��G|rz��)�EG�5���Lh�g/�K�n#3<�U_$nl�~���o�Tb�y2���� ��'0����(ƀz���ͰA����\}�ʻͿ��Ӕ���hc@��7�B@
�ښ����-����6�p�p�f���Y1 ��$���p ���܃���& ��-�kRe�!��X`�1 �l�]mld�A �����^	��_�����������1��y�4Vm�!!;ư�
�@�x�ތ�F]<�!�m�ש~�P2^��\-�@	�lt�A�?�{/�(m��@	����A�Wa��3��������E@��o�o��)�!�n�C��1h&�)u��1 �`�E��F���!��m/�A�bH�NM��� �r�Ğ�싎�)$�����PB��K�/~�Z_H!!��J�@'��b��-�n݉�j(ay	q�]|�峁����U�-l�>���=uɶ1 �d�ܹJ�~;2��[#�@Iۛ0W�(����%;��*�bװA�he�C ��Ddh�!�cgQ��o�Éyo�F�Xn�CB��B��d��|/�bCs@'K}4c@'&T�9��p>h�ĝ֘�N'�H!���XT�@7�M�qxK� P��V�c�Q_�bHFd*33h�ƼI[==X�BB���WA��r�\N�����`\?�������c�]K6i��!:�}�z�.Є�j����bc[}J�x��k���j�R��L�Zy�bx��}IٟA_5��a���+c�bH��ѣ�S�����c�~㽋Ų��ϧ!5��z�R�vY��A��Ղ��,���O1$#v0�+ʍ1�(琳Y��A���nk��� P�ȴ�ͦ�bfx�:ٜ�b1:RX��y�%j�Pa
b���A�,_]�Xc@�5b[�z�C>�!"嚛��e�1 �d֙�H�`@3ڢfc���)$��L����Y��x8�B2>ԩ����h�5:�
J&"ؙ���~�q�r�H����G��Ͼ�^�:-H��n����bH�vu�J� P�DW���J��up �ٺ���H��W��[]8�� rHF�����ۢ��Mb�=$tǛ�PB���	[�t��(ƀ�����Xc@�T��j��܇��z����|��ZxƀVT
�q����|��u�H!B��,�3�����C����"H]��ZЕ��Gy�*�'3
���t�u��f�`?&��Ũ+��)l?ype�G�Zȿp!��v���g�Q��t �`���bHH�8� 0 {��Υ��:��=P���������1$��ۊ1�h��}Sy���jh�5Ho�1 �3�����	1ƀ�Y]_Cŀ�d��.���@
���v��`?�    ��Ŷlg��Ctw�k��ɰ�V�n(!��ԯ%إI��AvʩgT�� �9�du�}���č��a��m�_+1:���w�dxc�Zpf���3;؏���t6�ڠ�F�ޫ��%�U��D�ۉ�Nk5櫅dv?s1���8��v��]�F�>&5�ƒ���t��L��7���ڒ��o��pG��&�Z>�ax��w���|v�s�KK����6�%�eW���:]J5$rn�o�o<|�������6��jh!ZF��x��tp��bw��ǌ���^��Z�BA��fK��82E}�״V�z`>&d�!��8�
v��M�u��Ǭ!����O9u)\�k%��:��"��C��ɶZ�.�6��̙B��-��n~���b	����݌vpG��6���9؏�1vc9�~t�6 C��KÍ5$��O6'�ǡ�g9~!�6�}4hzm��M*�5$�d�r��9�^UI$���kh�=�ת�ʜp�0�L�^����q�Gc��݆�r���Aީ�;����C�:����t�xO��E���-݇���Ǳ���6�{�Wɨ�Ed(a��H�_���r��� {	;W��Fe%U��Ǉ���1p��>m�l|�@
���!���)<�;9��9�}L�G�1Cu��hLLR�}FtcH!�Y;��d��h���Un�E���;��r��h��܎������,�3b���>́`=>h�#l��=�:fN�7�=&���Gj@x���0+���%3�p#���؅� �1#��k�h���!����t��8#x}ٞN+&�Ǆ�|/����a�,�m�L�7櫅���l���J�������o;�||��͟1�+�ٳ��˹ن��]/>����3����T.��?>J{?��`@μ��m,��`@>��Y�� � �x�:�(~�$�|���*c@#�;Wy1��H=̉d��^����y9���k%rm2��4�}���L� g�*�����y$R�\i�1�@���Ɣۆx8� �#���&d�.��<��Ӂ���^R�9����@�w�o�j�Ȃ��k??����6 �� ��\y���-���n��MY� ��9��h�W�I|��c����'�A&s��K��1t�]v�:���qskG*�t�rj���5�m6��|�]/��b@~��7�&�^ƀ�Q;��`/�@��w+�[c�>�B0�3�$��Ђz�̹띕�E<Ȥl�-m`B�-��h��H%�s��c@+�Z�IK� ��}���tAohg�9/�9�`Y|�"�г��S<���|A�R�^��?.�c�ji���~�v���l�]����a�����A*4�����RY�� 2���m��K�!�����!no�c�kr����&����B3�*���z�1��LƯhX�rfK�/�J'��m��5�Ij	�����&mWfC<h!S@Y�H���d~�! �nf��]��d�����^Ipŀ�����	�c2�,�٦}u �����N������N�A����rxH>�W��)u{'������pH����19ʘ�$�soϋb�����Q2�4�+���5�Po<� ���){��1#"�@U��,���	�6���5�mu�2���H��^��o�!��|�	�Ds����r�iP_�+]�'x�	�f�hV<:��4��:E� �9��|�6��gI#�͏^�_G�bHF��d_2���,¼y�K8��*��-�ul�1 �`���:�Ϙ`@z����MW/0 �^cɀ�v��� �x8B2��4���QrҶ�<b��	���P)R��vʨ�x8PB"���`@	>��>���	���u�;i���A��ϬBu��(����I7���1���"@	�m+���/`���z�Ym�:�̘�<>��
-&8�ƘN�W�1_t��(1�i%����ǜ��N�),/�ۻw���9.%t�l��B�g�َ�l;��)���CRg1�y4�N�z�9[�l�<>涥,�g��(q��z$L��B2�pt�Qb^v��u8'8�	�]�K8�����S�?i��x ���W�SB ����6�U�GɻQ�m.��=:$��A�
&X��x/ǡ�!ZZە��o���P���C���0۞�-�`=&c��S��j�1��U9�ÁR4Sg��h���s�J��c��I3���;���O���T�`���Q�y�oYJ�9'X���a�u	�|�`������;��jHʋ�'�ߛ�>f���>������J�9&X�ӯ�}�lJ�A_5<��Rz
��=}�؞�6 �<>F=��1 �`��Z���x8��g��>|��A�� #5t�����۟�����������)eq>�a��y�y�� �Gg|ژ�*H��ѣC���(��pZ����Qc暽2�%i�c2b?�M-�GO)�n�����g)$s�.�R$Z������Ӊ�1$��L��!`?d���o�E����o(r��R7�I��A�,���_�Ԙ��<2��1
�	m8�|
�C���z�Gͬ^)��s�l){V;�|8PC^X�.�2)��F&Q��%]�,H��\�l�8���gׅ��j ��q��p`A>(�T(zp�۾ZO��7�c�x��r���_dp �vz�� 5���1�Lp ��ފ1���Ɓ���U�Aǳ�d�������A��L��/�b@��l�O3r�ǈ�R�����A��X����C�R�1
�ݳ*)����T��4g
X�ɸ�R��R����:��,�ǈ�&)��ʺ6�B2�k��D�!���#	�� ��&�����=�C��e���Y���n��{p �W̦d�%��u����� �2}L��v^�v�cB�gϬS��_�1!���6�4��Ac�9�{�cB�����]���)��?�_����x�˃�'�ma���������p��S8%��n�m�>�zi�&��2Y}r����`���@��^[�'��ha�y��}ː�`@+�Ư]�Z�h!�M��n�h!�k�ha��L/�ff�,�BB����	�¿=�=���6-C0ק��Q٠��(��Re��l�BB��і� ��Q?��&� �d|��ՑZȑB}l6p��Ԑ�9���5��Ҹc��Q� �`�g�+H6h!��w�-�A�W���{����}�� 	�N�ֽ���l�!���!7Hr@7n���JE�!!�/	��@7��wl�*���c��1ܼ���ȧ9u�l��Z���!�Z�����!���9H���K�1�gtf���ʡGs�R[���~��;�a�Hr�z0�K�}���_�W	y|š���
��(�R=�V�W���cgۆ���3ۍ��n�z\5L;���m �dlw�h1�t���9���C�p�0�~b��B۴�F^O��k��!L�{��pߠ�0�;��V]m ��7���GXs�6�BB�-��bq��o��0���n}�%I;�a�d���3��f��&��B��~u�.ß��@�72��V5��$��aR��t ��m��[���Á$�3|8)[´����/Z�:S;!{u��ġ�sh��P�ʩ��w"��D���D��aE��<��� �B"�"YdƄ�BTu�{��)�����}ԯ�Zؑ(^�C^������S�U��|U���-d����)�
<>���'h!{��}���$ѥM�����m]�&�!sק����-$��.'�R�"�s�Ƈ-^��m�뤀�@����G�RN��̱�?{uH!�TT~�j��BB�^&,�M�p#�OF/����@��{��B0�>.Đ����q�*��(9�v���T5�IB��e]��@�؟y ��2;��2P�1!{�*_��}4ȃm9�_�}|����E����1��؏�2�{D�(��Ǜd    ����f�ݿ��8�z����rn�s���82�}�V��`?�(8Y�3����~��N;&�m�w@ى?䖣��1d���%�
��C����!D�-���.r0#v�!7�
��c�N6� B�ĵ�H��*��#�@�'3#Q�}q�p[��)x�9�"��
��rJC����ye=�@ӝh{��R���ǜ]����w������G���w&�]�)���<�3.[��{L�ה�zyb�dfr*x�#S�}�$�����*ߩ�b@Q5�}���1(X��^r6�B�{���A&����=>��t�a�Gϟ�m��=0꽍�=�GTslm��X��z|�O�$�x
�c2�"�E���2Gy��!�=�뤄@��=;[��t|�JYBa��G�]�R�ヴ���%�������[`;>�C��˻�wQ�q�o�T,F|G�x�5�|�]X`;>�>:f�.p���/�Eo�또��;�-�G�/;�����t �d�\�{o���Yr�o���K�|8PC4��a'*���v|�G��N\�q�%ˢ���	]���m��8n���V�F��َ��%l�����1R���{���o����Ǒ��}�)�_�<z�O~�p��_�=&u�*_%��3�X�}x��0>�s�u�W�W�D?�zw��*��||�8[U=��W3Yۖ��������D���õ���x�3���0�ɭ���1�6��Vt��8����8OV���{�#O����ʷ�zL��ɒqX�32�e�1Y1���A�g�Q�ӥ�}
tt���A�SV"��}|�=o|j�����а�����g�]x(t���q�Lj]����I`?>��S65�(�O7e�|pgN�n픳�����w���G6�n_�2�;Đ�W_�����C�u���.0��e�,��^��씳�y�T3;�����E�����윊!D[��s͗"p%��&5ZȆr[ٔ�Z�=&����ŀ��qȐr:i>H!!��8�7f�-{��	���d�}5jHf�K�0�g\�G�k��cB�)��es-��=�����8ߜ���(�����!���X����'�HaG��X9Z/���7p=�3P����=�he��qF9��G������!��7 �X��y|��W+�����^λL�·)$t�\�=Ό�-ݦk?x��4�0��8� q�3��^�>&$�1M�T�>θ����Q/0��ov��E����͞���]�>&��z��%zxs��Ђ��cB۾s:�}���PX�d���C���z�qh�&Z���z�oH���X����ƌW�W����Y���x80��Z���y�m/�I��8���7�%���GO5�װj+���p_HΈnOp�v|Ǉx�ۖ��(Q�(>�U,0t��{�7����n���ȹ�+n��(Q�h���\,��Gɹͽ���>�(!;]����x����/u����7D;�6��c��o�X,E��i[ee|B����Og&����c��q�b@qط�5��h�󘐝��ewg�G�	�ݧ�U�z:pc*a���������ヴ���%j����"/�x<PC@���-��Q�RR��8Y���1������+78�����$�ۅ�c2�������D��O�X�Ӂ��(�^S � _�#��|�����PZ1 �hW�c����p u[��/v����Q�-�܈��||��۟U�!���2;kE�`>>H��J!���Z��9�)���5���*�ilp�v��!.�g���r�����F$n����1l��ᨱr���t�K�֣Ĕh�k���{Lf�E�$6X����g��!,we������m*!���Z�����(�'�=&�ݣ"e��G�j���&;Vn��g+���}�H���jg�7؏��#��.�`?J4����Ɏ��Ǆ��He'YB���*m�K�m�||�~S�*��ߺ~���
���f�AL������&t2���A��d7؏��^���vo�����71l�%&E���k����}e����6?�{�E����Ã�ܲ�0�� 4&EO�ob;p ���'��4D����!|�l_1$4��"�����c�iҏ���LƎ��0�G�j����l֎�R#�{��b$�o���3vكH��Ϡ뗹^-|�?&d���j	���l$�
�X��~L&&y�J��3>�q�۽j���Akt�R��~Ԙ�|�;1lA��Ak�	�Gg�4���q����O�)��b�L�߭h�bH�x��@��>���^m0 �~{*� ��?l7�
�68�Z{Ӑ��A���'��ġnp ��ZS�����8S�sfykdB^�v9j��:��H<�!����7X���"�e�U�G� =L��!�\o� snc�,H]���~�]��2������&�g���O���u<�d�����qv�7ɻ-(^uL�y?��v��Ԙ�c;���V���YV���?�d"2l�J�Z,H�=��W�Y��2S�������z��L��8jr�r��Ԝ�sL��������R�������^�/C�<�d���Xr�Rc0��O�e��,Ȅ|��d/��AS��ZSHr�2���X H��@:~���o�٪W��� ��i-F��<K~��?���d���}{�18����"JF�/<:��9��?̲W)9���x=9�g9��M �ͨ�iB��؏	��G~���9����q���	Jx3~�)���p���؏�C������i�OR��,Rz&H!
3�EW���Ӂ��uEp&�ax���!w4g�����"e g�b0���&3��5$4��ɮG@��3^�4Y���CB���@%r��B>Jt2���a���v�"��!�5�mG�G@1�~�/��Z�Đ���_ P��T;��z�# ����fUj�?�X*�!��t-E�1䨟�y�1DA��F�	��/R�B0�O �-�t������>
bHh�w�VB �Y��[뿂4���7��b@Y�i�ZMuĠ�����Asت�j��n�4g��e	�g�b�_�
+�:ĐН���5��z#� ,C0{���Fc�"}Ư�^�|8CB*���M԰�Mg��@�13<�\МZ�̚n� :��lP��x��	��5$��1D���1�̒?Đ����<�/͖�2Q'!�CB���@Q�����lPC0�Ѹ�\�j���kaV�9��㖁��vor�!���\�5du�鮌���9$�N!������I��P<�!�s�a��2f�V��Á�o�ƾw1�����=C9�3C���i���:���}�����Ų|�ZxȾ����+��Ӂ�=tݻ_%$#��Q:%�UB��=>Hw�k�s�J��b߿�����Rx��۲��s�R�����͒諅���Ѩ�v�b�a�=�4��ÃlÔ�o����6|$�f���U�c�#���'�۾�'e�[&�ɗ� v.XJzZ��㿌�X�����1>��~e�P>�.!��i���׀�A�{�Oc'�_�_f�UZ���k@�|�bV^w�5 ����p�����v��J"�o-ӽ�l�n-�(���#j4�j��`/2�e�e�%PC2�6|���vC0۵Ţto1$���%j�q[7�i ��;@	�ICq� 5l�w����~�C2ǧ73İ#��dY�� 1���b*!���6e�͂�t ���xDݖ;@'n�|4��������i���<���R�Đ������'�᤽��V�	j8�Ty�=sN�5#��In[�5\/m]kHgw����T�3�	j�{�P�ݺĐ�/޵b@�\���Z,'H!c�t�Yxƕ�|�� ���8�j�1k��S�|�`����?7Y��+�dlg���|�л����Ye�@~_%<����J諄i	���NR��|��{����O���}�- �  Ȼ��BR�s��[���"c��-��h\1$c�l'M4WA�oT=꯬ɇ5������f8���N�&����ub������韷mM�`}�WA�~o�W�	���f5{�x䐐liZ��V]�BiJ�] ��z{�#%r�o�=$��w��9{����@a�;
n6?�.PC@s��9��d��?��9�\O��T��}C�T�Z8 ���xλA�.z�M�-��аO�n�ZHƧy���F���9�����d;�K�A�+���2ۣ1���s���|0_)�(R����q����k~�bF��_5�Z>8�����c��(��+�+��k�pz�W��)�BGދ��-�=��d��M���!o�o���Jȟ`�S�)�p��Q6��PB2�)��t0�λ���ڟų]BB�Xr�0�ZW�6z/� 	�T��`@�s�����R�%t��	.Ha���^����@
��
0��w$�5����C ���������@�궣����1��`z��l
� ~S�}�z� �CBMIJh9��y���o]c�!��ދ�b@��Y]Wc!FF�4擜>�SK�%P��x���i���4�gG�,���5�~��JԠn���g
٥rHhцec@۳�3��� P���ZB ��v�/]�x:�C2�A��1����CX'��A�o���\�2�2!�C@k̷���/���,�L`�a{�M��f2���ZyH5�A���Z�w������C0��$ů����=��4�;|]�DTXˍ1�A�M6$����?}�Xܸ�n��X"�{>���8��_�j�f ��AK�ezb�)4��#�1��`Lr]jk��B�݌�^d�b �q�\�Ś���ja����^�c�3��1��(n�|�0sȆ�ZI�u��b�1�O�m��]�}�_-<F�!Q��E �1�m�o�zi��� �ƺ��ja怿��o���j!�n_ѭÅ��J����E�Z(&�/� C���o��M�1$�������z̝�O���=���ܽ.g�&��!0���0+�3Đ��^���-���k�U�Ǯ�?�_��b�!!9eo2 ��
�c�N}��k%s���22�03������.�������I��n��l%$bo2L��̉��	��p ���Qa��F�b�INȐs֌��6�`<�0z��f��� �B@�g��� Ђ�9ci4ylh!����� ��IL�Q�l��qf�e�cy�zHFG��,���^"�	E3��ox��w��A�(��SדyP�hߧ6���dl��7��`h!�=^Eb	�V�URY�bX���/��=:#v���t�R�W��/��ξ�uXm�A���o�f��&6�A�����������aU�Jz�ϗ9�,��~v�<zp���SBHf�"3/���蹡3*��0�p�\t��Z/�T��1b�����']O��[T�dK8�6�p�䈰�X��Y�2�)\ϟ���*'D�Á��¡[T��E�ո�mQ;8�����DL�WX01��	I�������!Yu��1_18s��� o���}� q���ښ��}�����W�Y�A����!59nb�v0=��'q{���up$w��?�@�W�������Σ3>풴(C@���<�Kb^J�6�$�k�15����B\��m/u�Bt���IW,!��A:��"݈�����^@���5�b��ƶt���I`X�y���҈���zLƵ����y4fz�l?��� �C@�Al���?"���y�LY}��! S�-�=�L����m;x�����1Vƀ��n>����ȇ5$d��ά��'tz����?x������P���]���Á�~�L:�5h�Y�<(���=>fK��W)�}��k��B�@�.B����sz��Yt1�Q�jF�zu��r	�cB��\+!Ê8+�[#&U��1[�<Jc@>�մ���K0�E����}��T���g-$abuş1 ���6p� �B��x�Z98!�B@�9r���{L�9����Jʒ�}7΀��|��ʮ�|8�BBz�%u=����>o�:���B0���M�ƀ���>��:x����a��߿������֎�      �   s   x�mͱ�0��}
v�9��r���&'��'�������3Ai��N2V����?�%�52��Q&X.Ό�Ѐ�Yo�퍦	���2�5�nV���gs������&����\/1�S�D7      �   X   x�]�1
�0@�99��T���%gq�:����� �������X;.FŔzb��v�.�%:%d�?��*y���Q���WRo���Ӏ�7�� x      �   �   x���1�0�9>Ew�*�qJ쳰 h�JH�ܟ!h�����ѱ��=�ΫI��7��ur�C"i[�b���M�{o!j�~��j�|�`�UN6����h1D�IG�\踗����e��ӵ�D����E������E�      �   >   x�3�4202�54�54P04�2��2��60�,BK.4i##+#c��%�4HH:,���� ���      �   p   x�eͻ�@E��S9�h>;�"��1пX�`X���]ބDw�]���M��^�w��5W ���L���U�a�T�<�X�Hv>��
�_e3��ԅ��f�QX1.��+�      o      x������ � �      q      x������ � �      m   �  x����v�8E��W��`0��f9��!�N�&6cL���c��T�$�{�����'�R�?O}u�\���Z�~?]������蛈��N�k ��l#x	�0!HC
n#�q��(�K��a|�>סwM��~o����Y��A��"�ѣ����8<ﮍ�g_o�9�g_��֓ l��F�]�t�<at�h`���}?���	�ٷ3�/'`�����j��қ�C?��j����xh����`6����x�g�f�63:��N�����h��|���LT�bl/a���������#���~��o��e��0u-�`Ĕ� �Ok�wP�q�9GJY k�9�g��LQ����ʾ|�_4T߇w��h`~�-9�lϰP���EÚ�2�4\��
?��9-�y �iƷ�u�(�a���ՠ>_�귛��k������ڇ��tl��B�$yrd8ɹp&H��|�I����9��z�[�"�3yRJ~I�L���ߋ	M�eFW�ٰ|�;ȓL��H@���0�yz�����m�r��tD�(#;�Q�`k��T��m&2�*%q�@6��?\M���� C2�f�����"�79��h�f�����3<沣��*�@bC8�tÉ�L��,	��ښ����T@�J�F�~��aM�	��UgpS|���*QPMC�����X:lh���Q�R� ��)E�� *D�5Q��t~s5�E��w�H�L�%1�c��i�Cb�٨1|(,�:���g�&�̬�ճ���[������xŠI���͂���2o/4Ko_�4)Ӽ���4=ǐ|��`f�,�f])�O)����'*�&S�Rj�J�&l�ϫ���v�״�J�C���isEHHW.0W�$0���t�H�&��v�6=\Cg=�#dKiə�t)%9S&_�PC΄&l�����5;�%Ȉ?B�M��![H�;C��I�|w0���~;��N���<��Y�G �ŀ܆#`���t����V�q�=�w���8;�or���U��~�9����'_����׬�P��]���k�>�B]s���a_��d��AY��)m@�di�t�P�v'���(�9��� uov�����>/�v{%e�.?)	l�A)��A�`{N
�rN&���7�1�h=%��3�Pwm���"k�%����q[�'�������ri�	�Pw�D�}�a��B��#�v�/�+���������E�7B��Y�Κ��)沢�eq�̕EC/��f���^T-��zyN�лv�F#3���d`������,"�{�o�d=��KА,��{��>��l�S�
�
�_���摮˝�:����=��qp�v�ɶf��x.�vi�mW�j��-�b߸t=m�:�����q,fZW"!�4=+�&֖K��B������'��      s   A  x�m��n�0 ��kx
/�3b[�
$^,S�1���Щ���'˒-���/	�M%��CD�DA�Tת1x������0ʤet� �����e08�������N�-�<��xx|.Ծ��
�`��V���� R:v�ڂTDǊ�Q�PTK����=ea
5��lv�<~�����g�Ȕ��8Q�J^?n��ɪx�c�0Ӿ俒�b���k�Z� �
n�1�.}+�8;�]��<��H��*��Xd�p�,#�:�ԍ��� �M1�r�i�E�guhM�X'T&�G�r��������A�Ic\ˢ(~�w�      u      x������ � �      w      x�3�4洰����� U�      z   L   x���� ��T�{F�Zr1~�/!���Ʃ��ñ+�[:0l�dڷ�ٞ��,Ȭ�Ԯ���͒��BD?��      y     x���[o����_A��A�Ŝ9s�-�T�hE[q�-�l5��� ���ݹ��i;�m�wfg���3�_|���ؔa�ep'���7w�n:�n6�-�fK����y�io�>���G~���j�n�O���~�����𔬦L5�"2�]�Y��tvV�qE<Lyf�x#��~��q�����l~y9[^�:�-T�` Z(3Vr8��?����Be�Cl�@����>�\��~�N^�?��*�A\�p�δ�t���5�.�eJi����/���kt��%�3W������ߵ���� ���h��r~z{s��FV��F�v�Lz�ɳ���nW�N�B씁�pr�l{z3&#�J�!e*3p�=���Y��o�� =p�}-�<P'/&�[��h8�:M����Ɍ���F3�L�QgrѮ6U�I�)�$�	N�>�HEd�M"t#�`��9N}e���)��Fh������~X��(s�Ԥ9L�j������	��^^ր<5bJ�p�b��t�����
yj���qޒ���/W�����n{��\�>�����n�v���W*��������0�7P��:55J�"#Ï��u(֡�	:�j�bqG�TQ��mN���2CK�D_���l~���y)��fP�@�Q���ߴ�>����a�}Z\;vߴ��m
D�X�U��cGz��1�숒�*������g���L����)jV�Q�����W��u�U`�����*0��ލ�T�+0ar&;0L`]:�(��2�Y������b�iP􀜎��D 2@,%�����Щ2�
����p����p��"8�:�w8z��pLr*��>��جZ��ѯ҆�^�����2���g�C1�w+,��6d�L����1/R�y^��tj.�σQ�Y��mC�aLA�fH�|�Yp>u�{ѩx"�Dnƨ�<%��-��xW%��(8U6F��!�����N�@��n4�n�%�W�w��篪D�)2��,-e?���l��.o:��m�:�{^������*�x�V:�N5h9�{�M��.2)	2�T��ө��yEٷ)��]4LY� �GQ�;���)E�X#)��=y$ؒW:6�
y@��j$�� l(k�{ Ȝ@f��3N-�P���rQ3�R"����G�a�aQ:EH睥b,�<�e9`�ϋ�B ��H�d�A������~]T�6'�l�������:�m&̒Csm�l��kfXN��*H��TH�ƆD�-���*ܙJ-����B�ɏ{��2��&dt5���M$P�]�J�F}AhܧvJVhV)s|?�Tg)��&�p���
8S�e��xg*8����Ag+8��x)�ñG�N�c����c0�a�V�gI�6h��s�:��=����s�9R������FO�s��b�1���3*59%q��h�އ�1Z�l]�t�T�
�e�V]�넎�9,Kvg��d���͋7�jX�&'�"g�J�P��|Wq��wi�C)��	�dj�P��D7�\���*�֡=���r1��a��WL��ձ��U�b�8�4׳f�3��9�F!tP������sy��
D#r�`T�@�O�H(NK<A�I�Uc8�g�'��7�V�%� ��B��V�N߫���Z�O+w`J#�Xz�ݶ��m�on�ZY~OM���>��d���z7�no>�}j�v#P���C)ӳL���/V��R��o�e��TSZ��_�;����݇�|z}�ޮ���O/�oۧ?^�B*D���E1��Cr���f�:��ծ}�l������ǟ{dy*_O9u��Z{}��ci�6�c66O�4�D<<ϳ*a�z�\�}��Z�#Z*s]�KPhq&Z��bA�X�@��D����ڊ�IU Pա$W| {��sm�c��o����S~@��2]�=<`+��{���O c�#���^k؉ �� \�EpCr�Ā��]/G2�Tla�$��?���C& ���X�mƵ@����҈��|�t���B�U-��w��dw�io����J�u�l���5�P6㩩��:S� �`j�bS&RS%E�$)�qfc�V��ۑ��j2��q'���R�mHO�Tى*��bD��g=3p�G�� L�A�����R�]�0������@Ϣ(of�[hb8����m%1 ���-(B@; ���cB���:���mX` S�ZM5�=Z E����vG��h|�|��:����Y����l"a;��ǿf0q�u�Z�n�`�G�H�����  \S��:��6 |�4���N��#u��8	�	·�����ȼ$�d�)�S�Q�+����.�w!�
9ǎn�*'ƂX]k���(�jnŵX㊯�U{��+�~�d�
o���aN��R����l�𬵻|s��8/��9RP���J��h7�>2p@2 �S1�rǄ5g�o����o���U����Ii�̉��v}d`ͺ+ ����5/4��v}d@�I��6�Jj�c�;"�m�Hf첑Fq)LH��x�Ɣ� / ;��b=̠1(M�[��F���y�Zxd����P:�s�e1M�h���nw�F���y����l��\��?ݬ׷�/�M�U��􎹚	c^1)W��<�>��w��.�' �U�X)�P��eㆋ��/oJ����(r$�������р@X��	pcBw�U
a�"q4 �G�� tN����IJ����N�f<V�q��QF`z\U?e�j�8�b���G�6�S�I>�|O,�pp�U�F�{Y�n�#F�ǝ�#�����/ӻG"V���XSy$�
�s�_�0�2%�P�8B�b4�G��$z����H(k �CF/����wעgZ�<S6J�A�b��)8���@����7��)O :U�n���q�����}�Ks��f�c	��P�Y �%\��%�K�j��lמw�ڶۑ{>0Iș���M�<���[�s$�Hl,����&�L��ET
G���T��
��ݎ��#D� :���Q)ķN��4,��eHy��:e��LCI7�Z#̡4g�pw���vu{����9��(�$�]r>Ef�*jYry���IpJD�L����0�r�T��H%C+�A�
�<�
��~ܔI6VS�����,{��L���&�8���O�s�*�.���\%X��b+�N00;�����F�h�&[��A�	��u��)��Ү��C�[��J�\l���oe�绑�s��Y*�x�V���)(�s%���_����SSP��5tnh�sS�NA���]*K������'��!纫��+�X�ʭ�NA?!�	��6��¢b�� <f����1!r+As��S��|V�(R"���9S�nH�X>�@|�.@7d�CLh00�ʇ\O3����t�`�]&�}��Q�x�}�nh�#%U{%�1_��=�8u�d�����&f}�Is�+��M����������m����/^�ɯw����_W��a	�O�ɭ��f3��w�/߾��� 9�u/i��N3f�5��g������"��k�|��.�4��ү��颏i�6�|�[�_�F��\AѠ%�4����	��0�
V�dl��y��V�<��^,~�ڇsu���L�,���Y:
u0��~�v����j/���X֏*��!��6k�Y{L7o��a����Ӻ36��%~A%zP�? lvu�n�])��RЍ�)G��? e������۫�(HE�[�JHt�j�x"
]2K�JN2��2�(�%E�Ha3{�O;��PQ�����:;�<��۫��g�?�fog ��T�v�b�
= �r�jX����mד��N����w]��g��ɓ��u!      {      x������ � �      }      x������ � �      k   D  x�}R[r�0�����Kg:�#��c�~Pr�:��v��Ѯ��J2g�ô��7�`2��M�������霍l	D�vLYR[�'�� ��c��k u�����/^����G֞��쇜�걍]�ζ��7�7T1,?�}aÔl��Ȱ��xE�Z|�c'mgD��2餺 �S��}R���_�`�u��3�eP=���� {[d-$�d��r�l;��4hAf}?��A.S~�*y��Q�-{�:&��CH�ufL�q\mQY��0�u�_K(��e_����&���4��P)����dzNP���,#���7�V�,      i   �  x����r�8�������Pj�ųl����0���!����$>��{�P�s���p(�vt�8~]�p ����z���@	e? ~P~��3�1Њ���C1��OX��xv(�s�~o�A
B�	_M�m�:��ޝ�g��;[T�6�2!V[hf�r��־5�ɖ�]]b �Q�0����ɗ����g�M�`�p1�D�ڢ]o/�?���=���\|�Ƶ'��M��+���ͨi�w.��[�`D�t��¯)�#��]Ɲ�MDp��׌�F�o65;)�B�d��"1����_��n}�v J��*N5{�Q4uU�]?�ܻ��z{v�P��Ү8�\[hz36�Y+�|!��=�2B2P"��̨S�M��0�0�c��;]0B�^����J���@h�d�2��K���������b�_�>!��&J�����(I(�W���2���l���m*��"�¡�Y�'�F��|w�Ը�	��2\���zMP��(�wXZ�x��b�E�* c���dI`��_|��oX��l�%8D�R���\�z/�����-]* g��a�ԏ����u�c� �vp�����m�a(���;,����t�F�0��o��av�f�9����Y���v%+����aps�+_E�Ź�?��;�1J����&�e�5��;ou�ƭ��ȉȰ���03�i�N�ص����c�B���[�k���>j+{����9��̢�O?�f�����q��54���@r�r��5I$���,@6\Ӟ&x�x��s�d���c������N1�)$J�F�ͫ������a*�XL'J�����u*d��A_��f�A葐t?�('�1�j�!ܶ�Q_e���݊bG�s*sj2�ˣA��^$�hr�2�c&�:��m\����\�81/�?��s����bX���GJs9A���C��uxc�J}��v|��;%����Z�a���^������o�$�3� wꙋU��m<�#6�q��p��e�{=�	�H	
4�4�ͅ�R�r���kJ(�ުj�1�n�*p���V�j��
��x����:�>S�k�"x�\B9U~v��aU�׆�Zpu��&6��-',��kc�� ��yr$dY��eݞޫ?�â�������4�Dk_�REභ�<gݡ_~�<]�~�t�%�����E*�eL.n	
�L��|,��*�Ȩ���2e��n��������F�      ~   �  x����n�@�s��GF�����c<1l����}k���4R�8�T�ç_�Ӭ��q��̩ņ�9I
���>�+��m��U�����+�"y]�m.�rQ��j��۵J{�R{]�9�;rv��V5r-P�<(�8uqn6�%/����f���@	Ztf��,Hu\i�x�/��D~�m�1����~���6���Ӥ���%��ۜ�g�� CFϥ.[i�С�7�w�ԉt�5Ke�[i#����c��o �A�q�$�sJ(�_ ��bb7��� H}���T��I^7�_�H�g��o�����`G=4qd��=���em& �m�u�C�A`�9�"�$�h�$F�a(p���$w�g)}qxE��-��S��z�]����tZ�4[nw���9���Ӕ2F�"�f�!*C2�H1~u�j��kfj�(�	D����}E"��d{�j���wþ�[��Im�4�b��#���>ˋ���D�I2/�)��'�>Nڜ��m�l�*�(�p�`�W$R��!k�B;=V���,7���}MW{uF�[w�4�(��0�^����9P��(w#�����J���6&���NҼ�/�����,�T:�N�y���tpܜ���}fA�BËӢ�
PRX>�x@�g�x :'D��$�$��'&���M����E��/I�U���jK�B���������tpǓ������������Qg��G��4�$�3�;|��      �      x������ � �      �   &   x�3���t�ttvR��@:����wq�b���� �X�      �   �  x�}�mO�@�_O?�\n[@|Y]�� �.�1&��}��n��}��w*^�-��%������(H�V��J��`2��f��*�*,+lаd�/YOŹ�$'�Y�V��C�V�# `��ч&��N��m�Iy.y�3�bT[�_�ˢN�è!	!*d"�%Q�9}��LRd��/Q�g�E�F��I�Zy�N�Nu�>�J�l��E��wG棈wq^�����-�������}낤'+�(Y�4�&oY ���w�Q����9���pI�� �������u�>:&�2�,$S�)����2`!{�,�//HK/]�*�)��LfZ�`ɚNT�]�y�����9J�/4,�������OR(�\�km�:5��7�$K���=.��:z4�����? �i|�yU����E*��V�y!�Os붴�?$h��,*�s��Ȫ�Ī����t�H��T�o�A̛&
���	�]�.aH�Oc�i�~�*��s�>��@�����H�(�Ce��!Y�U#�u�F�W�Ӏt��I�����%]���+4h���4�u�〢kui౪�5`�#ȟ4���i����d��4�}:X��5:6O#_]*ڜm7۳7��1�!cUk��rPd�2�bx^��HJ^��_���+��4�ߓ�����u��`��k+�P�h>�\N]��z�aY�#��      �   �   x�-ϽjC1��Y��bI�-�ڱC�.��38J���^^���~{P���'� *7[�J�7��⼱��9��8�QE�k��j�U4����������3��U�s��B��8.OB��,@���@H�~�����=<�4Zv����`��\Las԰3�/�y��|�S0k�j~��~����?q      �   !   x���t+��+�t�4�74�0�4����� Q�R      �   k   x�]̽
�@E��އfF��OkAR,)
� ��MT���p$`L��W'�8�p������x�FC�h�l�z(�Dxj,�F�i����١�i�ͮ����SE���'�      �      x������ � �      �   %   x�3�t/�/-�w�2������,g.(˅+F��� .�y      �      x���t�5�xC.CS mbq��qqq QZK      �      x������ � �      �   +   x�3�t+��+�t�74�0�4�22D�Yp�qs��qqq �^	�      �   ;   x�3�t+��+�t�4�74�0�4�2F3�4�2�JM,�s�s��
�p�q��qqq 1DA      �      x������ � �      �      x������ � �      �   !   x�36�t+��+�����7�0�4����� R8r      �      x������ � �      �   �   x�u��j�@D��W���8���z,,�W���WaWn���>JH���̛��<G��䉓$�w��ҐEҎ>F!��)*���^^q�uR��x�0R���لz.��eQ�6�9�r�z�k�ćyj�}텪��^��\���I��rZ�C��m�[���iEy�7�q0�5�i��'h����"��Scf      �   F   x�3�tqcGgGNCK#=C3=C=C��2�LI,KL"�Ĕ�DNoGG�`� �a��r��qqq ak      �   <   x�3�tMIO�w�4�2�0��LcN�Ԓ���l ۄ�5/�(��4�t�����K�c���� �s      �   t  x��]�n��}���oJ���]U}�6���.�XX`�#��;�Q���X��Sőd��b+;`��E��<E�������h�l�GW�s�4�o�����/E���/��#w$_��~���w�;�X�M@��W�Nh�2�6��Z�=�=�`���� ��k�X�J4�+`C^��}L�����1�a�.$�Џ])�,$�X���X��H��ltA�3`S[��vhR��PkP�spA[�|Y�dRpA\f��&R�LA]�F5��4y	��1SpA_&P�0��=�fk�����2%�Y֧"���%��QA`a�\���*
H.�e(	�K��C����$��EO06���R���QAA`F.A�Y�9sA`j�#d0s��	�8�
K��1��鴱���	�*봣T�XP���҄aAa&���L�����	����3&`Ѷq��
#'�����,����u
.(����7�IXAa��e�*�ˢ�	v֧E�0w���M}	�Zg�E}	���p���
��c'��9�g*�K�^Ic�$�
�pP��(�J��^�F�>-��N/.�ͦ�l���zS���mV˺�y��f�Z-�O�ݺ�\ϯ����z���f{���z��Cg՟�i���⺮�����c�+>���[����r�ZW����o/�7��V���ow}zz����;��S����|�l�
d�,7��r���V��e�^��uu�|�iֳ�/�{H.7�bgj�/%u��ɍwn��E6u>g�)�;7AZ�6!�L�#�'F�@`�[�wnP,
����wnlm�Dp�oa��a�H����q����и`Cfr�Ɲ���a��X;���h�c���1��P��)�N��͘}1�eB,�L��-nS���M��2;n[l�6���H�nܶ�s#S`d�eֈ�m�972%�2mʍ�+��1Dm2��-�iiP��wi��m�e=T O��ύ��z=)2+�n��ׄʒ�.Ӈ��Y�"fr3(_�n�g�]�2�-k�&ؘ��A�WH��&�c�?(g�
���2���*��5~��PTΠό�����+$��r5jҐ�?(s|Ɵ�09߂Ox��Z�4���� *�!ݜ�e�_'?n�y�`�qݛ����r�&����m��r��'x���[c���6�;0v��m�����$UGE$�)�}<h���ă�-g\�ʃ>,�٩��SipsHp�	Ɋ�&��T���G�O�t���<�a�����`|����a����5\&-5�6��N�Bj�mp�#a����hYT�5��e?=
����|���rsRW'+��b��gK��q6_��������jN�Z��ׂ~����r���6��;��_m6�ar��e�)��4N>?� ��e"=�Va�m���:/�@;��!$ă��Ε��љ���=�r�#���� ��ѷ�ɑ[���qvV��W�5}�^��n��t�{Nv��5�����ߣyZ#2��<�Ǜ˷ϒ�q��鯉i�a��������'��*�Bd7[l����l�WFkx8{/��Q�{i��ey�Ƚ������lQ-�ﯷ�l��D��D[�NKq��!�m'�$�=�iV(G_�v��� ,���ܳ=�p�G��!�{d�u���=��>F�̮��'�u4af+G9�J�v�U���>��iÁ���<	�}�48G���uwZd��k�l�U���K���n��I
nv��VL�����>�VL2ç�uZ�>1=Y�!Q�5{��۠(h������Z6m�m��
b��㐝 n������'ֵ����D1L�*螪�d]��B��������x��V���4����#�[]Ey�_��t��OC�!Q���)�-$6y�O��� �r�C���f����)������P.����2Xj�a�|@�����E���+���ǉ�Q{(o_�f�`a~�L#�QnzF�ؾ�@*{?�Ӓ(�YR`��+�K{?�����(��G+^i��}�I��i�H��L���}�mg�xJ�4�6$�{fߨ}���^w_;ҥ|�}�=�o�5F�]�5�]�e�����&ƿ�9ԇ�$��X$^g���Ŭ���e���bޭ.d爼���/I~���'���I�?-��&���wt�u�l���������      �      x������ � �      �   7   x�3�4202�54�5��2�@LCNS.crF�f\&8�9͹Lqșp�p��qqq ��C      �   {   x�3�tM,ʩ�40�20 "NC#(H��@ln�9m�s���3�J����8}KR:�е��`�k�闙�Q���]3T#�&�~�E��9�0W��tB&��f�f�c���� ܉5�      �   \   x�34�tMIO�w���LI�I�����7�0�47�2�ɕ��$AFƜ~�%��E�0ac��	�k^jQz%XԈ3�,j1�	n���=... ڝ �      �      x������ � �      �   �   x�5ͱ�0��Y�G l���:�3>e��P���昩(�7y+��܊&[qȣ���r�Sd(Ѭ&��D��hV�j�YM4��f�Ь��B�ZhV��~si[��V7��l���6�����V�j��R��V�U�ߣ���t�>�1���Gm      �   m   x�M̱
�0����W$�&J;f���r�`KC��]|z�"n���+�ۚ-S����X��r��0�Dj7������<��O*����q��r�������QD>VN�     