PGDMP  :    5                }            myhotel    17.3    17.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    32777    myhotel    DATABASE     m   CREATE DATABASE myhotel WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE myhotel;
                  	   payylayss    false            ]           1247    49161    booking_status    TYPE     ^   CREATE TYPE public.booking_status AS ENUM (
    'pending',
    'confirmed',
    'canceled'
);
 !   DROP TYPE public.booking_status;
       public            	   payylayss    false            W           1247    40969    room_status    TYPE     _   CREATE TYPE public.room_status AS ENUM (
    'available',
    'occupied',
    'maintenance'
);
    DROP TYPE public.room_status;
       public            	   payylayss    false            �            1255    57352    update_updated_at_column()    FUNCTION     �   CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
   NEW.updated_at = NOW();
   RETURN NEW;
END;
$$;
 1   DROP FUNCTION public.update_updated_at_column();
       public               postgres    false            �            1259    49168    bookings    TABLE     .  CREATE TABLE public.bookings (
    id integer NOT NULL,
    user_id integer NOT NULL,
    room_id integer NOT NULL,
    check_in_date date NOT NULL,
    check_out_date date NOT NULL,
    status public.booking_status,
    created_at timestamp without time zone,
    updated_at time without time zone
);
    DROP TABLE public.bookings;
       public         heap r    	   payylayss    false    861            �            1259    49167    bookings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.bookings_id_seq;
       public            	   payylayss    false    222                       0    0    bookings_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;
          public            	   payylayss    false    221            �            1259    40976    rooms    TABLE     �   CREATE TABLE public.rooms (
    id integer NOT NULL,
    room_number character varying(20) NOT NULL,
    type character varying(50) NOT NULL,
    price numeric(10,2) NOT NULL,
    status public.room_status,
    created_at timestamp without time zone
);
    DROP TABLE public.rooms;
       public         heap r    	   payylayss    false    855            �            1259    40975    rooms_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.rooms_id_seq;
       public            	   payylayss    false    220                       0    0    rooms_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;
          public            	   payylayss    false    219            �            1259    32805    users    TABLE     5  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password_hash text NOT NULL,
    role character varying(10) DEFAULT 'user'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.users;
       public         heap r    	   payylayss    false            �            1259    32804    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public            	   payylayss    false    218                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public            	   payylayss    false    217            l           2604    49171    bookings id    DEFAULT     j   ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);
 :   ALTER TABLE public.bookings ALTER COLUMN id DROP DEFAULT;
       public            	   payylayss    false    222    221    222            k           2604    40979    rooms id    DEFAULT     d   ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);
 7   ALTER TABLE public.rooms ALTER COLUMN id DROP DEFAULT;
       public            	   payylayss    false    219    220    220            h           2604    32808    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public            	   payylayss    false    218    217    218                      0    49168    bookings 
   TABLE DATA           w   COPY public.bookings (id, user_id, room_id, check_in_date, check_out_date, status, created_at, updated_at) FROM stdin;
    public            	   payylayss    false    222   �"                 0    40976    rooms 
   TABLE DATA           Q   COPY public.rooms (id, room_number, type, price, status, created_at) FROM stdin;
    public            	   payylayss    false    220   �#       
          0    32805    users 
   TABLE DATA           Q   COPY public.users (id, name, email, password_hash, role, created_at) FROM stdin;
    public            	   payylayss    false    218   C$                  0    0    bookings_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.bookings_id_seq', 5, true);
          public            	   payylayss    false    221                       0    0    rooms_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.rooms_id_seq', 8, true);
          public            	   payylayss    false    219                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public            	   payylayss    false    217            v           2606    49173    bookings bookings_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.bookings DROP CONSTRAINT bookings_pkey;
       public              	   payylayss    false    222            r           2606    40981    rooms rooms_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_pkey;
       public              	   payylayss    false    220            t           2606    40983    rooms rooms_room_number_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_room_number_key UNIQUE (room_number);
 E   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_room_number_key;
       public              	   payylayss    false    220            n           2606    32816    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public              	   payylayss    false    218            p           2606    32814    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public              	   payylayss    false    218            w           2620    57353    bookings set_updated_at    TRIGGER     �   CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.bookings FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();
 0   DROP TRIGGER set_updated_at ON public.bookings;
       public            	   payylayss    false    223    222               �   x�u�Mj�0F��)|�+��,��	��-��"j��P������%ꏑmDٶ����^��}>oGHC0��Z���P�ʚ�럷Q�׼�����h���
N*ԣ�ݳt��{�{;���A	R`C��A-Ġ
J��G]�e�tZ���fk��+��B䒭��t��~}=D�+xkd?������[����I�Q&         �   x�}��
�0�s�{���Mڮg����:�f����ƍ	�r	�#X!Xu���T���q\�\d���v������Y��rg�ov˵=J�m,_�'�����5�ձ��zO��Ii29x�Q�~$�,?s��|s;�䢤5�XG����/'���l"o<[�OFk�B�B�      
   �  x�m��r�@�5|��!ݯ��f5%*�$2j6��A�` Q��I�*U�au7��yK�F�3,�?⇸��ӛP��(�!�c�oX�y���>���w^Q$/�v�n]�����:�l�α�N��5	�;D�0�a����L!�q2H����p�Ϝ��0KY.��j[�~}Z��n��υ?X��z��pؽ����x���F�)\%��Ln�x"L��&�1�׽��u��u��Q�-i���!�Y��<�W4i���!��2��]���%c�L�f��eZ\�����<a����Z?����S,Y��W֮X��7�2lP� ��q��\:锻Ϟ��fy��)����I�B���.�\��h;����wۇ�$l�|��]0@3S�L��"��?�z��     