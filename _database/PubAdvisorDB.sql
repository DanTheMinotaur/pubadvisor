PGDMP         (                u         
   PubAdvisor    10.1    10.1 3    6           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            7           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            8           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3            �            1259    16656    hours    TABLE     �   CREATE TABLE hours (
    hourid integer NOT NULL,
    day text,
    opening_time text,
    closing_time text,
    pubid integer NOT NULL
);
    DROP TABLE public.hours;
       public         postgres    false    3            �            1259    16654    hours_hourid_seq    SEQUENCE     �   CREATE SEQUENCE hours_hourid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.hours_hourid_seq;
       public       postgres    false    207    3            9           0    0    hours_hourid_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE hours_hourid_seq OWNED BY hours.hourid;
            public       postgres    false    206            �            1259    16608    product    TABLE     m  CREATE TABLE product (
    productid integer NOT NULL,
    country_of_origin text NOT NULL,
    name text NOT NULL,
    percentage numeric NOT NULL,
    quantity numeric NOT NULL,
    image text,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    prodcatid integer
);
    DROP TABLE public.product;
       public         postgres    false    3            �            1259    16606    product_productid_seq    SEQUENCE     �   CREATE SEQUENCE product_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.product_productid_seq;
       public       postgres    false    3    199            :           0    0    product_productid_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE product_productid_seq OWNED BY product.productid;
            public       postgres    false    198            �            1259    16645    productcategories    TABLE     �   CREATE TABLE productcategories (
    prodcatid integer NOT NULL,
    prodcatname name NOT NULL,
    description text,
    image text
);
 %   DROP TABLE public.productcategories;
       public         postgres    false    3            �            1259    16643    productcategories_prodcatid_seq    SEQUENCE     �   CREATE SEQUENCE productcategories_prodcatid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.productcategories_prodcatid_seq;
       public       postgres    false    205    3            ;           0    0    productcategories_prodcatid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE productcategories_prodcatid_seq OWNED BY productcategories.prodcatid;
            public       postgres    false    204            �            1259    16595    pub    TABLE     6  CREATE TABLE pub (
    pubid integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    location text NOT NULL,
    image text,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    pubcatid integer
);
    DROP TABLE public.pub;
       public         postgres    false    3            �            1259    16593    pub_pubid_seq    SEQUENCE     ~   CREATE SEQUENCE pub_pubid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.pub_pubid_seq;
       public       postgres    false    3    197            <           0    0    pub_pubid_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE pub_pubid_seq OWNED BY pub.pubid;
            public       postgres    false    196            �            1259    16634    pubcategories    TABLE     l   CREATE TABLE pubcategories (
    pubcatid integer NOT NULL,
    pubcatname name NOT NULL,
    image text
);
 !   DROP TABLE public.pubcategories;
       public         postgres    false    3            �            1259    16632    pubcategories_pubcatid_seq    SEQUENCE     �   CREATE SEQUENCE pubcategories_pubcatid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.pubcategories_pubcatid_seq;
       public       postgres    false    203    3            =           0    0    pubcategories_pubcatid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE pubcategories_pubcatid_seq OWNED BY pubcategories.pubcatid;
            public       postgres    false    202            �            1259    16621    pubproducts    TABLE     %  CREATE TABLE pubproducts (
    pubprodid integer NOT NULL,
    price numeric NOT NULL,
    date_created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    pubid integer NOT NULL,
    productid integer NOT NULL
);
    DROP TABLE public.pubproducts;
       public         postgres    false    3            �            1259    16619    pubproducts_pubprodid_seq    SEQUENCE     �   CREATE SEQUENCE pubproducts_pubprodid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pubproducts_pubprodid_seq;
       public       postgres    false    3    201            >           0    0    pubproducts_pubprodid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE pubproducts_pubprodid_seq OWNED BY pubproducts.pubprodid;
            public       postgres    false    200            �
           2604    16659    hours hourid    DEFAULT     ^   ALTER TABLE ONLY hours ALTER COLUMN hourid SET DEFAULT nextval('hours_hourid_seq'::regclass);
 ;   ALTER TABLE public.hours ALTER COLUMN hourid DROP DEFAULT;
       public       postgres    false    206    207    207            �
           2604    16611    product productid    DEFAULT     h   ALTER TABLE ONLY product ALTER COLUMN productid SET DEFAULT nextval('product_productid_seq'::regclass);
 @   ALTER TABLE public.product ALTER COLUMN productid DROP DEFAULT;
       public       postgres    false    198    199    199            �
           2604    16648    productcategories prodcatid    DEFAULT     |   ALTER TABLE ONLY productcategories ALTER COLUMN prodcatid SET DEFAULT nextval('productcategories_prodcatid_seq'::regclass);
 J   ALTER TABLE public.productcategories ALTER COLUMN prodcatid DROP DEFAULT;
       public       postgres    false    204    205    205            �
           2604    16598 	   pub pubid    DEFAULT     X   ALTER TABLE ONLY pub ALTER COLUMN pubid SET DEFAULT nextval('pub_pubid_seq'::regclass);
 8   ALTER TABLE public.pub ALTER COLUMN pubid DROP DEFAULT;
       public       postgres    false    197    196    197            �
           2604    16637    pubcategories pubcatid    DEFAULT     r   ALTER TABLE ONLY pubcategories ALTER COLUMN pubcatid SET DEFAULT nextval('pubcategories_pubcatid_seq'::regclass);
 E   ALTER TABLE public.pubcategories ALTER COLUMN pubcatid DROP DEFAULT;
       public       postgres    false    203    202    203            �
           2604    16624    pubproducts pubprodid    DEFAULT     p   ALTER TABLE ONLY pubproducts ALTER COLUMN pubprodid SET DEFAULT nextval('pubproducts_pubprodid_seq'::regclass);
 D   ALTER TABLE public.pubproducts ALTER COLUMN pubprodid DROP DEFAULT;
       public       postgres    false    200    201    201            3          0    16656    hours 
   TABLE DATA                     public       postgres    false    207   �6       +          0    16608    product 
   TABLE DATA                     public       postgres    false    199   �7       1          0    16645    productcategories 
   TABLE DATA                     public       postgres    false    205   �9       )          0    16595    pub 
   TABLE DATA                     public       postgres    false    197   �:       /          0    16634    pubcategories 
   TABLE DATA                     public       postgres    false    203   x=       -          0    16621    pubproducts 
   TABLE DATA                     public       postgres    false    201    >       ?           0    0    hours_hourid_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('hours_hourid_seq', 16, true);
            public       postgres    false    206            @           0    0    product_productid_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('product_productid_seq', 17, true);
            public       postgres    false    198            A           0    0    productcategories_prodcatid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('productcategories_prodcatid_seq', 4, true);
            public       postgres    false    204            B           0    0    pub_pubid_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('pub_pubid_seq', 8, true);
            public       postgres    false    196            C           0    0    pubcategories_pubcatid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('pubcategories_pubcatid_seq', 3, true);
            public       postgres    false    202            D           0    0    pubproducts_pubprodid_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('pubproducts_pubprodid_seq', 136, true);
            public       postgres    false    200            �
           2606    16664    hours hours_pk 
   CONSTRAINT     I   ALTER TABLE ONLY hours
    ADD CONSTRAINT hours_pk PRIMARY KEY (hourid);
 8   ALTER TABLE ONLY public.hours DROP CONSTRAINT hours_pk;
       public         postgres    false    207            �
           2606    16618    product product_pk 
   CONSTRAINT     P   ALTER TABLE ONLY product
    ADD CONSTRAINT product_pk PRIMARY KEY (productid);
 <   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pk;
       public         postgres    false    199            �
           2606    16653 &   productcategories productcategories_pk 
   CONSTRAINT     d   ALTER TABLE ONLY productcategories
    ADD CONSTRAINT productcategories_pk PRIMARY KEY (prodcatid);
 P   ALTER TABLE ONLY public.productcategories DROP CONSTRAINT productcategories_pk;
       public         postgres    false    205            �
           2606    16605 
   pub pub_pk 
   CONSTRAINT     D   ALTER TABLE ONLY pub
    ADD CONSTRAINT pub_pk PRIMARY KEY (pubid);
 4   ALTER TABLE ONLY public.pub DROP CONSTRAINT pub_pk;
       public         postgres    false    197            �
           2606    16642    pubcategories pubcategories_pk 
   CONSTRAINT     [   ALTER TABLE ONLY pubcategories
    ADD CONSTRAINT pubcategories_pk PRIMARY KEY (pubcatid);
 H   ALTER TABLE ONLY public.pubcategories DROP CONSTRAINT pubcategories_pk;
       public         postgres    false    203            �
           2606    16631    pubproducts pubproducts_pk 
   CONSTRAINT     X   ALTER TABLE ONLY pubproducts
    ADD CONSTRAINT pubproducts_pk PRIMARY KEY (pubprodid);
 D   ALTER TABLE ONLY public.pubproducts DROP CONSTRAINT pubproducts_pk;
       public         postgres    false    201            �
           2606    16665    hours hours_pubid    FK CONSTRAINT     a   ALTER TABLE ONLY hours
    ADD CONSTRAINT hours_pubid FOREIGN KEY (pubid) REFERENCES pub(pubid);
 ;   ALTER TABLE ONLY public.hours DROP CONSTRAINT hours_pubid;
       public       postgres    false    2719    197    207            �
           2606    16675    product product_prodcatid    FK CONSTRAINT        ALTER TABLE ONLY product
    ADD CONSTRAINT product_prodcatid FOREIGN KEY (prodcatid) REFERENCES productcategories(prodcatid);
 C   ALTER TABLE ONLY public.product DROP CONSTRAINT product_prodcatid;
       public       postgres    false    205    199    2727            �
           2606    16670    pub pub_pubcatid    FK CONSTRAINT     p   ALTER TABLE ONLY pub
    ADD CONSTRAINT pub_pubcatid FOREIGN KEY (pubcatid) REFERENCES pubcategories(pubcatid);
 :   ALTER TABLE ONLY public.pub DROP CONSTRAINT pub_pubcatid;
       public       postgres    false    197    2725    203            �
           2606    16685 !   pubproducts pubproducts_productid    FK CONSTRAINT     }   ALTER TABLE ONLY pubproducts
    ADD CONSTRAINT pubproducts_productid FOREIGN KEY (productid) REFERENCES product(productid);
 K   ALTER TABLE ONLY public.pubproducts DROP CONSTRAINT pubproducts_productid;
       public       postgres    false    201    199    2721            �
           2606    16680    pubproducts pubproducts_pubid    FK CONSTRAINT     m   ALTER TABLE ONLY pubproducts
    ADD CONSTRAINT pubproducts_pubid FOREIGN KEY (pubid) REFERENCES pub(pubid);
 G   ALTER TABLE ONLY public.pubproducts DROP CONSTRAINT pubproducts_pubid;
       public       postgres    false    2719    197    201            3   �   x����
�@��Oqv)̌��V�FBZx)ZE��P*��޾�M-�0�9�9�a�Ia�m����tqT�	��mBӖuU_���Q�p�7�����0`�� ��0�6��F|�̵�6��� a.!^�gj,�e|{�'��ŷ�?V��⵫<Q�:|�2	բ�=��<Q�N�+��g�_��4��璥�YJ�Rc�tXk�g���]K*6�j�=E�����D*�P5�`$e      +   *  x�ݘMs�0���
�Hf���MO@��6M:��#�H[��#Ka��������^80�ؒ����wW�'����LgO$U���U9��#T��~!/��	�E���(
����G��X`�qA�+g&e�Y�9��5�~����<Ҟ(܀`m;�&��Ubgq'��n׮��g��7���<�t����tC����.:a�Q�_5��Ԛ\�>�7	7����Z��&���3�p��]�-�0|#{;��b`Dus��И�k��!��bR멏�"A՘=��S�Ы�
tmK@p�d������zOA���]�D�����:���B*uEbh�yVDԉ�Ͱ�d�J"8>�� �L��pv�dXVAg`�_
�^Od��^���l�d�Ao4ԇ\J�������
�=r�k�ɯJե��{����G��R�=�T]�B���׋�}�+.y >�h!��Ғ7�.dE���H|�w�`��T/LK�% �:�/��Y��Rt)�<�� ~��F�l��ÉSa��K��aj������3����+�      1   �   x���=O�@�=��[Z)B�c��@�H�T�e�bݙ��������_;,���G����i�z�c{4�`�N��,�Rf[���q�
,�	<F_����ݲ��E�-Q(S_a�((P49�]�;M�u�e��^^����=���t���MQ���<�D��m��R@o��,Nz�b���2�A�9�YБG������h>H�Ϥ�G�T���X�M}��~��xP��R      )   �  x�ՔAO�0�����Rb'�[�D��ҕ��r�X�N�q(���ą���Kc����7o<M/n�`<��	�fG��� �\� d�[U��U&��L z)x�K�f�U��7�f���h�ï���E
G4��sۘGe�R��!��
ϙ�]��,��a�� ��RYH�U���Z+���)k:%��JF�L�*U�Ig���2�� Λy�����8PJy��!MxBؠ=8��R��^����+�h�hDD��^�4>�4�YL��)=�q0���L�B0��Uvo��$�QS�j	WU�|ӿ�l��鴲���*{|��e�Āxf�rNw����^�B,���?6����V!(nuV,+�_;H���R��I���O��MLa����]6s�cVc�/ D�P�R���W�E��8k�8o�z�%��e:�N�"��?��w�FhB�.��w�-�{� �R��ځ��ZX������C�:�m킫��d<�1��x<��\P�KF��3,=�J�{X��/p�tY�ԝ6ң�T�r���d�X�	�-_��ۨ�ۙ��%Ho�%�fwפ�H�FY��7���D�ا��I��%,<��0m�"#�l)�
/�Y��FY?���E�� zKNH�|�p��]&٦����?���      /   x   x���v
Q���W((MJN,IM�/�L-VЀp3St�y���:
���驚
a�>���
�:
��A�n!
�N�:
~�>>��\�k4h������h�+�L6��������`.. ��Q      -   �  x���;OUA@�_q:4�����u��� 1���RPIP����.WEnxd2���93���|��.�]�����?|;>�����x�pw<l�w7�������盇ۧ/��O���?��~��O����������\m/�a����(u��8+��qyq�=k�����/_�\����a[����`����Mc�Z�l��A7;�e0��NhLc�Z��-��l-ԮP��Vh%Te�����c5�Š�d�Q�A��j�����A-e?��ZʎV1�)i������(ă���鲔@H��$�@�,%��f)�<�6K	��YJ*���Ry }���)��T�H����D--�'�hi�<�DKK�$ZZ*�N�nH*�ALnX�$�ă��鳐T�H�����YH*oH�����YH*oH�����YX*oH����ZX*oH����$ZX*oH����$ZX*�H������NI�=�ɝ��{#�)��#}6��W�>���;�gSRyG�lJ*�H�MI��)�| }6-�$Ц��ڴT>�D����h�R�@mZ*H�MK�I�i�|���.I���$��J<hKR�D�lI*�H�-I��e�T��ْT>�>[��'�gKR�D�lY*�H�-K�)�e�|!��,�/$і��$ڲT��D[���h�R�B������~�T��uI��.�|G��K*ߑ>��w�Ϻ���n�D��K*ߑ>��w$к��)�n�|G�[*ߑD��iς4Z׎{$Һv޳ �ֵ�ys�Y'>��~�h^r��I6�ɴ&��Ӛ��Z�Pk�kAJ�I>�I�&�V�՚uKEb�y� �ִY*lM���"�ִ;Y*�lMczE��iLg.iә�C���@^��y�XL����H���4۰�H���4۰�H���4۰�H���D�И�H���D$ۆ��D�mhLO$ۆ�t�&��1��Kd<3���'���h     