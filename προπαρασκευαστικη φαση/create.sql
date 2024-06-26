CREATE DATABASE project;
USE project;

CREATE TABLE etaireia(
    AFM VARCHAR(9) DEFAULT "UNKNOWN" NOT NULL,
    DOY VARCHAR(30) NOT NULL,
    name_ VARCHAR(35) DEFAULT "UNKNOWN" NOT NULL,
    tel VARCHAR(10) NOT NULL,
    street VARCHAR(15) DEFAULT "UNKNOWN" NOT NULL,
    num INT(11) DEFAULT "0" NOT NULL,
    city VARCHAR(45) DEFAULT "UNKNOWN" NOT NULL,
    country VARCHAR(15) DEFAULT "UNKNOWN" NOT NULL,
    PRIMARY KEY(AFM)
);

CREATE TABLE evaluator(
    username VARCHAR(30) DEFAULT "UNKNOWN" NOT NULL,
    exp_years TINYINT(4) NOT NULL,
    firm CHAR(9) NOT DEFAULT "UNKNOWN" NOT NULL,
    PRIMARY KEY(username),
    CONSTRAINT FRM FOREIGN KEY(firm) REFERENCES etaireia(AFM)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE job(
    id INT(11) NOT NULL,
    start_date_ DATE  NOT NULL,
    salary FLOAT NOT NULL,
    position VARCHAR(60) DEFAULT "UNKNOWN" NOT NULL,
    edra VARCHAR(60) DEFAULT "UNKNOWN" NOT NULL,
    evaluator VARCHAR(30) DEFAULT "UNKNOWN" NOT NULL,
    announce_date DATETIME NOT NULL,
    submission_date DATE NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT EVLATOR FOREIGN KEY(evaluator) REFERENCES evaluator(username)
    ON UPDATE CASCADE ON DELETE CASCADE
);

--CREATE TABLE requires(
    job_id INT(11) NOT NULL,
    subject_title VARCHAR(36) DEFAULT "UNKNOWN" NOT NULL ,
    PRIMARY KEY(job_id,subject_title),
    CONSTRAINT JBD FOREIGN KEY(job_id) REFERENCES job(id)
    ON UPDATE CASCADE ON DELETE CASCADE
   
   
);

CREATE TABLE subject_(
    title VARCHAR(36) DEFAULT "UNKNOWN" NOT NULL,
    descr TEXT NOT NULL,
    belongs_to VARCHAR(36) DEFAULT "UNKNOWN" NOT NULL,
    PRIMARY KEY(title),
    CONSTRAINT BLNGT  FOREIGN KEY(belongs_to) REFERENCES subject_(title)
    ON UPDATE CASCADE ON DELETE CASCADE
   
);


CREATE TABLE user(
    username VARCHAR(30) DEFAULT "UNKNOWN" NOT NULL,
    password_ VARCHAR(20) DEFAULT "UNKNOWN" NOT NULL,
    name_ VARCHAR(25) DEFAULT "UNKNOWN" NOT NULL,
    lastname VARCHAR(35) DEFAULT "UNKNOWN" NOT NULL,
    reg_date DATETIME NOT NULL,
    email VARCHAR(30) DEFAULT "UNKNOWN" NOT NULL,
    PRIMARY KEY(username)
);

CREATE TABLE employee(
    username VARCHAR(30) DEFAULT "UNKNOWN" NOT NULL,
    bio TEXT NOT NULL,
    sistatikes VARCHAR(35) DEFAULT "UNKNOWN" NOT NULL,
    certificates VARCHAR(35) DEFAULT "UNKNOWN" NOT NULL,
    PRIMARY KEY(username),
    CONSTRAINT USRNMM FOREIGN KEY(username) REFERENCES user(username)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE languages(
    candid VARCHAR(30) DEFAULT "UNKNOWN" NOT NULL,
    lang SET("EN","FR","SP","GE","CH","GR") NOT NULL,
    PRIMARY KEY(candid,lang),
    CONSTRAINT CNDIDD FOREIGN KEY(candid) REFERENCES employee(username)
     ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE project(
    candid VARCHAR(30) DEFAULT "UNKNOWN" NOT NULL,
    num TINYINT(4) NOT NULL,
    descr TEXT NOT NULL,
    url_ VARCHAR(60) NOT NULL,
    PRIMARY KEY(candid,num),
    CONSTRAINT CCNDID FOREIGN KEY(candid) REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE
    );

--CREATE TABLE applies(
    cand_usrname VARCHAR(30) DEFAULT "UNKNOWN" NOT NULL,
    job_id INT(11) NOT NULL,
    PRIMARY KEY(cand_usrname,job_id),
    CONSTRAINT CANDNME FOREIGN KEY(cand_usrname) REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE
);

--CREATE TABLE has_degree(
    degr_title VARCHAR(150) DEFAULT "UNKNOWN" NOT NULL,
    degr_idryma VARCHAR(140) DEFAULT "UNKNOWN" NOT NULL,
    cand_usrname VARCHAR(30) DEFAULT "UNKNOWN" NOT NULL,
    etos YEAR(4) NOT NULL,
    grade FLOAT NOT NULL,
    PRIMARY KEY(degr_title,degr_idryma),
    CONSTRAINT CANDUSRNAMEE FOREIGN KEY(cand_usrname) REFERENCES employee(username)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE degree(
    titlos VARCHAR(150) DEFAULT "UNKNOWN" NOT NULL,
    idryma VARCHAR(150) DEFAULT "UNKNOWN" NOT NULL,
    bathmida ENUM("BSc","MSc","PhD"),
    PRIMARY KEY(titlos,idryma)

);