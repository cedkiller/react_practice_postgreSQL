PGDMP      7                }            Practice    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388    Practice    DATABASE     �   CREATE DATABASE "Practice" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "Practice";
                     postgres    false            �            1259    16412    record    TABLE     G   CREATE TABLE public.record (
    id integer NOT NULL,
    task text
);
    DROP TABLE public.record;
       public         heap r       postgres    false            �            1259    16411    record_id_seq    SEQUENCE     �   ALTER TABLE public.record ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    218            �            1259    16428    users    TABLE     �   CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name text,
    user_email text,
    user_password text,
    user_type text
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16427    users_user_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    220            �          0    16412    record 
   TABLE DATA           *   COPY public.record (id, task) FROM stdin;
    public               postgres    false    218   �       �          0    16428    users 
   TABLE DATA           Y   COPY public.users (user_id, user_name, user_email, user_password, user_type) FROM stdin;
    public               postgres    false    220          �           0    0    record_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.record_id_seq', 14, true);
          public               postgres    false    217            �           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);
          public               postgres    false    219            ]           2606    16418    record record_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.record DROP CONSTRAINT record_pkey;
       public                 postgres    false    218            _           2606    16434    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    220            �   3   x�3��H���W�/�IQ�24�I-.��K�24�1��M�c�=... ��      �   �   x�e���@E뙯��F�f4�hl|!#���z�����SYp�,��65p����r3���y|E�;�iAY.%U�DuYt;�/��*l��lA��vI-�M�%KY�`�3yޝ�=Nn��U���Vb���J��ޥ��	�ˆ��_Ӯyo{�sԎ��4��ܭ@�͜�n�O�� 9��s[��QL�`���o��z�M�     