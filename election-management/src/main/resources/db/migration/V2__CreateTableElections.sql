CREATE TABLE elections
(
    id         VARCHAR(40) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TABLE election_candidate
(
    election_id  VARCHAR(40) NOT NULL,
    candidate_id VARCHAR(40) NOT NULL,
    votes        INTEGER DEFAULT 0,
    PRIMARY KEY (election_id, candidate_id)
);

insert into candidates (id, photo, given_name, family_name, email, phone, job_title)
values ('dd1f959b-c8d1-46e4-8d94-4f4fd32b822e', 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'Arly', 'Levings',
        'alevings0@geocities.com', '452-722-9706', 'Analog Circuit Design manager');
insert into candidates (id, photo, given_name, family_name, email, phone, job_title)
values ('f88a36b8-f87c-444b-965b-7ebc158c590c', 'http://dummyimage.com/100x100.png/ff4444/ffffff', 'Urbano', 'Coundley',
        'ucoundley1@webeden.co.uk', '729-911-4350', 'Software Consultant');
insert into candidates (id, photo, given_name, family_name, email, phone, job_title)
values ('e1cff3de-a3b7-461f-8b2e-01684533dd87', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 'Eleanor',
        'Potteridge', 'epotteridge2@dyndns.org', '985-818-7747', 'Physical Therapy Assistant');
insert into candidates (id, photo, given_name, family_name, email, phone, job_title)
values ('65370d67-74fa-4b3c-950f-61c23e2dfd59', 'http://dummyimage.com/100x100.png/dddddd/000000', 'Maryann', 'Imorts',
        'mimorts3@usatoday.com', '618-766-7462', 'Professor');
insert into candidates (id, photo, given_name, family_name, email, phone, job_title)
values ('ecfd0cb1-ff83-450a-a500-fcd7430ce2ab', 'http://dummyimage.com/100x100.png/ff4444/ffffff', 'Aaron', 'Magovern',
        'amagovern4@jugem.jp', '337-161-6236', 'Civil Engineer');
insert into candidates (id, photo, given_name, family_name, email, phone, job_title)
values ('006eecc0-bc97-4dbf-8798-0625c08ca2c2', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 'Ward', 'Philcock',
        'wphilcock5@meetup.com', '160-975-0952', 'Account Representative III');
insert into candidates (id, photo, given_name, family_name, email, phone, job_title)
values ('da0d59af-c132-4db4-87fe-c80eafc0b9b8', 'http://dummyimage.com/100x100.png/ff4444/ffffff', 'Brenda', 'Ullrich',
        'bullrich6@people.com.cn', '284-653-1977', 'Tax Accountant');
insert into candidates (id, photo, given_name, family_name, email, phone, job_title)
values ('41ea3d17-a181-49c6-8725-c8d6120718ed', 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'Elsie', 'Bowery',
        'ebowery7@last.fm', '971-567-7767', 'Compensation Analyst');
insert into candidates (id, photo, given_name, family_name, email, phone, job_title)
values ('84433231-1c2f-4c68-956c-138924fff7e1', 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'Jemmie', 'Waldocke',
        'jwaldocke8@paypal.com', '631-723-8435', 'VP Sales');
insert into candidates (id, photo, given_name, family_name, email, phone, job_title)
values ('cc5351ad-b2fd-4410-83cf-bf169f2763d2', 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 'Carmella', 'Towey',
        'ctowey9@ibm.com', '856-369-9166', 'Assistant Professor');