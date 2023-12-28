-- Создание БД 
DROP DATABASE RGR;
CREATE DATABASE RGR;
USE RGR;
DROP TABLE IF EXISTS department, positions, project, employe_programs, employe;

    CREATE TABLE `department` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `name` varchar(200) NOT NULL,
        PRIMARY KEY (`id`)
    );

    CREATE TABLE `employe` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `department_id` INT NOT NULL,
        `position_id` INT NOT NULL,
        `name` varchar(150) NOT NULL,
        `male` bool NOT NULL,
        `age` smallint NOT NULL,
        PRIMARY KEY (`id`)
    );

    CREATE TABLE `positions` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `position_name` varchar(100) NOT NULL,
        PRIMARY KEY (`id`)
    );


    CREATE TABLE `project` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `employe_id` INT NOT NULL,
        `department_id` INT NOT NULL,
        `project_date` DATE NOT NULL,
        `project_title` varchar(200) NOT NULL DEFAULT 'unknown_project',
        `project_description` TEXT NOT NULL,
        PRIMARY KEY (`id`)
    );

    CREATE TABLE `employe_programs` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `employe_id` INT NOT NULL,
        `program_name` varchar(100) NOT NULL,
        `login` varchar(75) NOT NULL DEFAULT '-',
        `password` varchar(20) NOT NULL DEFAULT '-',
        `access` bool NOT NULL DEFAULT false,
        PRIMARY KEY (`id`)
    );


    ALTER TABLE `employe` ADD CONSTRAINT `employe_fk0` FOREIGN KEY (`department_id`) REFERENCES `department`(`id`);

    ALTER TABLE `employe` ADD CONSTRAINT `employe_fk1` FOREIGN KEY (`position_id`) REFERENCES `positions`(`id`);

    ALTER TABLE `project` ADD CONSTRAINT `project_fk0` FOREIGN KEY (`employe_id`) REFERENCES `employe`(`id`);

    ALTER TABLE `project` ADD CONSTRAINT `project_fk1` FOREIGN KEY (`department_id`) REFERENCES `employe`(`department_id`);

    ALTER TABLE `employe_programs` ADD CONSTRAINT `employe_programs_fk0` FOREIGN KEY (`employe_id`) REFERENCES `employe`(`id`);


-- внесение данных
INSERT INTO department(name) 
VALUES	("Департамент сетевой безопасности"),                   ("Департамент внутреннего развития"), 
        ("Департамент внедрения технологий"),                   ("Департамент учета средств"), 
        ("Департамент проектирования информационных систем"),   ("Департамент рекламы"), 
        ("Департамент эксплуатации"),                           ("Департамент инженерных решений"), 
        ("Департамент общественной деятельности"),              ("Департамент логистики");

INSERT INTO positions(position_name) 
VALUES	("Менеджер отдела продаж"),                     ("Менеджер по работе с клиентами"), 
        ("Директор департамента внутреннего развития"), ("Креативный менеджер технологий"), 
        ("Специалист технической безопасности"),        ("Специалист технической поддержки клиентов"), 
        ("Уборщик"),                                    ("Креативный директор"), 
        ("Директор общественной деятельности"),              ("Бухгалтер");

INSERT INTO employe(department_id, position_id, name, male, age)
VALUES 	(6, 1, "Анконин Сергей Иванович", True, 34),
        (9, 2, "Рыбин Дмитрий Николаевич", True, 22),
        (2, 3, "Простак Алексей Владимирович", True, 28),
        (3, 4, "Шелестов Михаил Евгеньевич", True, 53),
        (8, 5, "Делов Валерий Яковлевич", True, 34),
        (9, 6, "Ухожина Марина Алекандровна", False, 43),
        (7, 7, "Простак Анастасия Дмитриевна", False, 18),
        (6, 8, "Ушакова Дарья Константиновна", False, 54),
        (9, 9, "Продлина Алекандра Валерьевна", False, 33),
        (4, 10, "Семакова Екатерина Сергеевна", False, 56);


INSERT INTO project(employe_id, department_id, project_date, project_title, project_description)
VALUES  (1, 2, "2023-12-19", "Акция 2 + 1", "При покупки нашего антивирусного ПО, предлагаем клеиенту систему по защите его платежей."),
        (1, 2, "2022-01-01", "Реклама в интернете", "Создать несколько вариантов для контекстной рекламы в интернете."),
        (1, 2, "2022-05-06", "Демо-версия ПО", "В целях привлечений новой аудитории рекомендуется создать демо-версию нашего антивируса."),
        (8, 6, "2023-04-22", "Бесплатный курс интернет-безопасности", "Совместно с депортаментом сетевой безопасности создать бесплатный курс для наших клиентов по сетевой безопасности."),
        (3, 2, "2023-12-01", "Унификация антивируса", "Реализовать утилитную версию нашего антивируса для unix-подобных систем. Так же создать более тяжелую с GUI для тех же unix-систем."),
        (3, 2, "2021-11-15", "Анализатор спама", "Импортирование антивируса к почте, для устранения спама содержащего вирусные ссылки."),
        (3, 2, "2016-06-4", "Песочница в интеренете", "При переходе пользователя по фишинг или вредоносной ссылке, запускать браузер в виртуальном адресном пространстве, для обеспечения безопасности."),
        (8, 6, "2018-12-23", "Разветвление рекламной политики", "Создания направления рекламы иностранных клиентов. Реклама  на зарубежных сайтах."),
        (8, 6, "2023-07-22", "Подарки постоянным клиентам", "Клиенты, покупающие подписку на наш антивирус более 2-ух лет подряд получают месяц бесплатной подиски в подарок."),
        (8, 6, "2023-09-09", "Убрать рекламу из внутреннего приложения", "В антивирусном приложении нужно убрать рекламу в целях повышения его привлекательности. Оставить рекламу только на демо-версии.");

INSERT INTO employe_programs(employe_id, program_name, login, password, access)
VALUES  (1, "ERWIN data modeler", "Malwla-s", "mk123ijA@*1_", True),
        (1, "Microsoft Office Word", "-", "-", True),
        (1, "Figma Corp Edition", "Malwla-s", "mk123ijA@*1_", True),
        (3, "Django-admin", "adm_21lka@kl", "Y(*HDUAINd8o2ui1)ad2", False),
        (3, "Project-creator", "a84rmkrzjoi", "Y(*HDUAINd8o2ui1)ad2", True),
        (3, "SQL-admin", "a84rmkrzjoi", "Y(*HDUAINd8o2ui1)ad2", True),
        (3, "Skype Corp Edition", "a84rmkrzjoi", "Y(*HDUAINd8o2ui1)ad2", True),
        (3, "FredOn Analys", "a84rmkrzjoi", "Y(*HDUAINd8o2ui1)ad2", True),
        (8, "employe Base", "Keyajzmw23", "fsj73yhUdj12h:!@:L", True),
        (8, "VCK Company Account Editor", "Keyajzmw23", "fsj73yhUdj12h:!@:L", True);


-- ТРИГГЕРЫ
-- INSERT
DROP TRIGGER IF EXISTS project_insert;
DELIMITER //
CREATE TRIGGER project_insert BEFORE INSERT ON project
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employe.id) FROM employe WHERE employe.id = NEW.employe_id) = 0)
    THEN 
        SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot insert this employe_id. Such employe was not found.';
END IF;
IF (NEW.department_id != (SELECT employe.department_id FROM employe WHERE employe.id = NEW.employe_id))
    THEN 
        SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'This employe does not belong to this department';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS employe_insert;
DELIMITER //
CREATE TRIGGER employe_insert BEFORE INSERT ON employe
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(department.id) FROM department WHERE department.id = NEW.department_id) = 0)
    THEN 
        SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'No such department_id.';
END IF;
IF ((SELECT COUNT(positions.id) FROM positions WHERE positions.id = NEW.position_id) = 0)
    THEN 
        SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'No such position_id.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS employe_programs_insert;
DELIMITER //
CREATE TRIGGER employe_programs_insert BEFORE INSERT ON employe_programs
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employe.id) FROM employe WHERE employe.id = NEW.employe_id) = 0)
    THEN 
        SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'No such employe_id.';
END IF;
END //
DELIMITER ;

-- UPDATE
DROP TRIGGER IF EXISTS project_update;
DELIMITER //
CREATE TRIGGER project_update BEFORE UPDATE ON project
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employe.id) FROM employe WHERE employe.id = NEW.employe_id) = 0)
    THEN 
        SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot update this employe_id. Such employe was not found.';
END IF;

IF (NEW.department_id != (SELECT employe.department_id FROM employe WHERE employe.id = NEW.employe_id))
    THEN 
        SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'This employe does not belong to this department';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS employe_update;
DELIMITER //
CREATE TRIGGER employe_update BEFORE UPDATE ON employe
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(department.id) FROM department WHERE department.id = NEW.department_id) = 0)
    THEN 
        SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'No such department_id.';
END IF;
IF ((SELECT COUNT(positions.id) FROM positions WHERE positions.id = NEW.position_id) = 0)
    THEN 
        SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'No such position_id.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS employe_programs_update;
DELIMITER //
CREATE TRIGGER employe_programs_update BEFORE UPDATE ON employe_programs
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employe.id) FROM employe WHERE employe.id = NEW.employe_id) = 0)
    THEN 
        SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'No such employe_id.';
END IF;
END //
DELIMITER ;

-- DELETE
DROP TRIGGER IF EXISTS employe_programs_update;
DELIMITER //
CREATE TRIGGER employe_delete BEFORE DELETE ON employe
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employe_programs.employe_id) FROM employe_programs WHERE employe_programs.employe_id = OLD.id) != 0)
    THEN 
        SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'You cannot delete this employe. Because it is in the table employe_programs. Remove it from employe_programs table first.';
END IF;
IF ((SELECT COUNT(project.employe_id) FROM project WHERE project.employe_id = OLD.id) != 0)
    THEN 
        SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'You cannot delete this employe. Because it is in the table project. Remove it from project table first.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS department_delete;
DELIMITER //
CREATE TRIGGER department_delete BEFORE DELETE ON department
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employe.department_id) FROM employe WHERE employe.department_id = OLD.id) != 0)
    THEN 
        SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'You cannot delete this department. Because some employees are attached to him.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS positions_delete;
DELIMITER //
CREATE TRIGGER positions_delete BEFORE DELETE ON positions
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employe.position_id) FROM employe WHERE employe.position_id = OLD.id) != 0)
    THEN 
        SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'You cannot delete this position. Because some employees are attached to him.';
END IF;
END //
DELIMITER ;
