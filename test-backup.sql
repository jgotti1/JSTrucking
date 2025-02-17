PGDMP  ;                    |           JLT    16.0 (Debian 16.0-1.pgdg120+1)    16.1     2           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            3           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            4           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            5           1262    24577    JLT    DATABASE     p   CREATE DATABASE "JLT" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE "JLT";
                postgres    false            �            1259    24578    fuel    TABLE     �   CREATE TABLE public.fuel (
    id integer NOT NULL,
    truck_id integer NOT NULL,
    fuel_date date NOT NULL,
    fuel_gallons numeric(10,2) NOT NULL,
    fuel_cost numeric(10,2) NOT NULL,
    per_gallon_cost numeric,
    mileage numeric(10,2)
);
    DROP TABLE public.fuel;
       public         heap    postgres    false            �            1259    24583    fuel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.fuel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.fuel_id_seq;
       public          postgres    false    215            6           0    0    fuel_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.fuel_id_seq OWNED BY public.fuel.id;
          public          postgres    false    216            �            1259    24584    jobruns    TABLE     �  CREATE TABLE public.jobruns (
    id integer NOT NULL,
    job_type text,
    truck_id integer,
    driver_id text,
    status text,
    starting_mileage numeric(25,2),
    ending_mileage numeric(25,2),
    po_number text,
    pickup_location character varying(255),
    delivery_location character varying(255),
    job_pay numeric(25,2),
    notes character varying(255),
    complete_time timestamp with time zone,
    job_date date
);
    DROP TABLE public.jobruns;
       public         heap    postgres    false            �            1259    24589    jobruns_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jobruns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.jobruns_id_seq;
       public          postgres    false    217            7           0    0    jobruns_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.jobruns_id_seq OWNED BY public.jobruns.id;
          public          postgres    false    218            �            1259    24590    maintenance    TABLE       CREATE TABLE public.maintenance (
    id integer NOT NULL,
    truck_id integer NOT NULL,
    maintenance_date date NOT NULL,
    maintenance_type text NOT NULL,
    maintenance_cost numeric(10,2) NOT NULL,
    maintenance_mileage numeric(10,2),
    notes character varying(255)
);
    DROP TABLE public.maintenance;
       public         heap    postgres    false            �            1259    24595    maintenance_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maintenance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.maintenance_id_seq;
       public          postgres    false    219            8           0    0    maintenance_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.maintenance_id_seq OWNED BY public.maintenance.id;
          public          postgres    false    220            �            1259    24596    users    TABLE     l   CREATE TABLE public.users (
    username character varying(50),
    password_hash character varying(255)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �           2604    24599    fuel id    DEFAULT     b   ALTER TABLE ONLY public.fuel ALTER COLUMN id SET DEFAULT nextval('public.fuel_id_seq'::regclass);
 6   ALTER TABLE public.fuel ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            �           2604    24600 
   jobruns id    DEFAULT     h   ALTER TABLE ONLY public.jobruns ALTER COLUMN id SET DEFAULT nextval('public.jobruns_id_seq'::regclass);
 9   ALTER TABLE public.jobruns ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            �           2604    24601    maintenance id    DEFAULT     p   ALTER TABLE ONLY public.maintenance ALTER COLUMN id SET DEFAULT nextval('public.maintenance_id_seq'::regclass);
 =   ALTER TABLE public.maintenance ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            )          0    24578    fuel 
   TABLE DATA           j   COPY public.fuel (id, truck_id, fuel_date, fuel_gallons, fuel_cost, per_gallon_cost, mileage) FROM stdin;
    public          postgres    false    215   �       +          0    24584    jobruns 
   TABLE DATA           �   COPY public.jobruns (id, job_type, truck_id, driver_id, status, starting_mileage, ending_mileage, po_number, pickup_location, delivery_location, job_pay, notes, complete_time, job_date) FROM stdin;
    public          postgres    false    217          -          0    24590    maintenance 
   TABLE DATA           �   COPY public.maintenance (id, truck_id, maintenance_date, maintenance_type, maintenance_cost, maintenance_mileage, notes) FROM stdin;
    public          postgres    false    219   �"       /          0    24596    users 
   TABLE DATA           8   COPY public.users (username, password_hash) FROM stdin;
    public          postgres    false    221   �"       9           0    0    fuel_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.fuel_id_seq', 1, false);
          public          postgres    false    216            :           0    0    jobruns_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.jobruns_id_seq', 86, true);
          public          postgres    false    218            ;           0    0    maintenance_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.maintenance_id_seq', 1, false);
          public          postgres    false    220            �           2606    24603    fuel fuel_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.fuel
    ADD CONSTRAINT fuel_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.fuel DROP CONSTRAINT fuel_pkey;
       public            postgres    false    215            �           2606    24605    jobruns jobruns_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.jobruns
    ADD CONSTRAINT jobruns_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.jobruns DROP CONSTRAINT jobruns_pkey;
       public            postgres    false    217            �           2606    24607    maintenance maintenance_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.maintenance
    ADD CONSTRAINT maintenance_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.maintenance DROP CONSTRAINT maintenance_pkey;
       public            postgres    false    219            )      x������ � �      +   �  x��WKs7>s��5|��['�L�I��$��"[l$y-�Z9������EJ���}@ IF�{W-���a\�����n}{W���c5��Y۸�&������(�/���џ��j�y����b�D�����?|Y�V^vL)�0]�*7�-����t��׿�\^Py�d�xʖ�l� sW�F.?vTs.�� �P*�����eFd���TuAE��AUDyz=�ǩ��т韬ϼU�7���ʂٷ��������P��1;�������d�#���������Yy�:M�%Ԅ�*�P(-P�������9�gT9����2�/����P�
�G���晚3~��aH

���x��An�K߭q��F��m����kõ�@��C\p��7�`د�TD���}ׁb[��G���^��W�{��vf�g�_-��-҅����f��XB�@��]Zn���޸�z=#���z�F�檚Α-Z!T[�~m *Ti�
�˨�@���ۍ�nS�'�$���|ZU��l���l�ҵ�|��D�	g�R�_�P���/�A$"�PVbU�_-�v˓�Y�e�	�׍��k<���v���^��x ���,D:mN��#C}������?!��@��"�� ׎t���Rc@&8����_�>���!��z��0Z�6d�+1P�S�J�����\CB��v��B�K�>��%Cd����$�n�^�/k)�C/dI�qs7OxP�M��|@��X�F95�8����|�[����2`�G���N�Q�޺���c�|[-_o����㹷4Ze�	0�G±De�ί�q
��/�K_V4_�q�)+k^��4��|~���X\�f4 �B| ��[`T����`��P�f0$�b� �#Y,|���~J�<j��rw�@=7&Q��^�k\k ��7�V��mBES$}��`�S�-\V���*˳ĥV�C�H�\>ٱP��vYIv���go��Ì�F�M��P=�7�ݜl]�̈́��j�f��-�Ʉ=��;z����E����z��t앉<��;���D���;����D/,�F&�����F���6��7sH���ڽ�4���mD4 ���ޚ���er�̘��J>����6`d����&H��s�VRu�᰷��V�1'��
�Vƅo����mx>�b��X˲���:.��?�.��      -      x������ � �      /   N   x���)�T1JR14Pq7)w�3�+/�t�3��J-�2)�����/tq�̮�0�)��p�J4������������ 	�{     