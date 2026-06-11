-- =====================================================
-- THE FULL LIFE ONG
-- DATABASE RESET + SCHEMA + SEED
-- PostgreSQL / Supabase
-- =====================================================

-- =====================================================
-- EXTENSIONS
-- =====================================================

CREATE EXTENSION IF NOT EXISTS citext;

-- =====================================================
-- RESET DATABASE
-- =====================================================

DROP TABLE IF EXISTS tb_registrations CASCADE;
DROP TABLE IF EXISTS tb_events CASCADE;
DROP TABLE IF EXISTS tb_beneficiaries CASCADE;
DROP TABLE IF EXISTS tb_regions CASCADE;
DROP TABLE IF EXISTS tb_users CASCADE;

-- =====================================================
-- TABLE: TB_USERS
-- =====================================================

CREATE TABLE tb_users (

```
id                  SERIAL PRIMARY KEY,

name                TEXT NOT NULL,

email               CITEXT NOT NULL UNIQUE,

auth_provider_id    UUID UNIQUE,

profile             TEXT NOT NULL
                        CHECK (
                            profile IN (
                                'ADMINISTRATOR',
                                'COORDINATOR',
                                'OPERATOR'
                            )
                        ),

status              TEXT NOT NULL
                        DEFAULT 'ACTIVE'
                        CHECK (
                            status IN (
                                'ACTIVE',
                                'INACTIVE',
                                'BLOCKED'
                            )
                        ),

created_by          INTEGER,
updated_by          INTEGER,

created_at          TIMESTAMP NOT NULL DEFAULT NOW(),
updated_at          TIMESTAMP NOT NULL DEFAULT NOW()
```

);

-- =====================================================
-- TABLE: TB_REGIONS
-- =====================================================

CREATE TABLE tb_regions (

```
id                  SERIAL PRIMARY KEY,

name                TEXT NOT NULL UNIQUE,

created_by          INTEGER,
updated_by          INTEGER,

created_at          TIMESTAMP NOT NULL DEFAULT NOW(),
updated_at          TIMESTAMP NOT NULL DEFAULT NOW()
```

);

-- =====================================================
-- TABLE: TB_BENEFICIARIES
-- =====================================================

CREATE TABLE tb_beneficiaries (

```
email               CITEXT PRIMARY KEY,

name                TEXT NOT NULL,

birthday            DATE,

phone               TEXT,

status              TEXT NOT NULL
                        DEFAULT 'ACTIVE'
                        CHECK (
                            status IN (
                                'ACTIVE',
                                'INACTIVE',
                                'BLOCKED'
                            )
                        ),

region_id           INTEGER NOT NULL,

created_by          INTEGER,
updated_by          INTEGER,

created_at          TIMESTAMP NOT NULL DEFAULT NOW(),
updated_at          TIMESTAMP NOT NULL DEFAULT NOW()
```

);

-- =====================================================
-- TABLE: TB_EVENTS
-- =====================================================

CREATE TABLE tb_events (

```
id                  SERIAL PRIMARY KEY,

title               TEXT NOT NULL,

description         TEXT,

event_datetime      TIMESTAMP NOT NULL,

location            TEXT,

capacity            INTEGER,

status              TEXT NOT NULL
                        DEFAULT 'DRAFT'
                        CHECK (
                            status IN (
                                'DRAFT',
                                'PLANNED',
                                'PUBLISHED',
                                'IN_PROGRESS',
                                'FINISHED',
                                'CANCELED',
                                'ARCHIVED'
                            )
                        ),

created_by          INTEGER,
updated_by          INTEGER,

created_at          TIMESTAMP NOT NULL DEFAULT NOW(),
updated_at          TIMESTAMP NOT NULL DEFAULT NOW()
```

);

-- =====================================================
-- TABLE: TB_REGISTRATIONS
-- =====================================================

CREATE TABLE tb_registrations (

```
id                  SERIAL PRIMARY KEY,

beneficiary_id      CITEXT NOT NULL,

event_id            INTEGER NOT NULL,

status              TEXT NOT NULL
                        DEFAULT 'WAITING_LIST'
                        CHECK (
                            status IN (
                                'WAITING_LIST',
                                'CONFIRMED',
                                'PRESENT',
                                'CANCELED',
                                'ABSENT'
                            )
                        ),

attendance          BOOLEAN,

created_by          INTEGER,
updated_by          INTEGER,

created_at          TIMESTAMP NOT NULL DEFAULT NOW(),
updated_at          TIMESTAMP NOT NULL DEFAULT NOW(),

CONSTRAINT uq_registration
    UNIQUE (
        beneficiary_id,
        event_id
    )
```

);

-- =====================================================
-- FOREIGN KEYS
-- =====================================================

ALTER TABLE tb_users
ADD CONSTRAINT fk_users_created_by
FOREIGN KEY (created_by)
REFERENCES tb_users(id);

ALTER TABLE tb_users
ADD CONSTRAINT fk_users_updated_by
FOREIGN KEY (updated_by)
REFERENCES tb_users(id);

ALTER TABLE tb_regions
ADD CONSTRAINT fk_regions_created_by
FOREIGN KEY (created_by)
REFERENCES tb_users(id);

ALTER TABLE tb_regions
ADD CONSTRAINT fk_regions_updated_by
FOREIGN KEY (updated_by)
REFERENCES tb_users(id);

ALTER TABLE tb_beneficiaries
ADD CONSTRAINT fk_beneficiaries_region
FOREIGN KEY (region_id)
REFERENCES tb_regions(id);

ALTER TABLE tb_beneficiaries
ADD CONSTRAINT fk_beneficiaries_created_by
FOREIGN KEY (created_by)
REFERENCES tb_users(id);

ALTER TABLE tb_beneficiaries
ADD CONSTRAINT fk_beneficiaries_updated_by
FOREIGN KEY (updated_by)
REFERENCES tb_users(id);

ALTER TABLE tb_events
ADD CONSTRAINT fk_events_created_by
FOREIGN KEY (created_by)
REFERENCES tb_users(id);

ALTER TABLE tb_events
ADD CONSTRAINT fk_events_updated_by
FOREIGN KEY (updated_by)
REFERENCES tb_users(id);

ALTER TABLE tb_registrations
ADD CONSTRAINT fk_registrations_beneficiary
FOREIGN KEY (beneficiary_id)
REFERENCES tb_beneficiaries(email);

ALTER TABLE tb_registrations
ADD CONSTRAINT fk_registrations_event
FOREIGN KEY (event_id)
REFERENCES tb_events(id);

ALTER TABLE tb_registrations
ADD CONSTRAINT fk_registrations_created_by
FOREIGN KEY (created_by)
REFERENCES tb_users(id);

ALTER TABLE tb_registrations
ADD CONSTRAINT fk_registrations_updated_by
FOREIGN KEY (updated_by)
REFERENCES tb_users(id);

-- =====================================================
-- INDEXES
-- =====================================================

CREATE INDEX idx_users_status
ON tb_users(status);

CREATE INDEX idx_users_profile
ON tb_users(profile);

CREATE INDEX idx_beneficiaries_status
ON tb_beneficiaries(status);

CREATE INDEX idx_beneficiaries_region
ON tb_beneficiaries(region_id);

CREATE INDEX idx_events_status
ON tb_events(status);

CREATE INDEX idx_events_datetime
ON tb_events(event_datetime);

CREATE INDEX idx_registrations_event
ON tb_registrations(event_id);

CREATE INDEX idx_registrations_beneficiary
ON tb_registrations(beneficiary_id);

-- =====================================================
-- SEED DATA
-- =====================================================

INSERT INTO tb_regions (name)
VALUES
('CENTRO-OESTE'),
('NORDESTE'),
('NORTE'),
('SUDESTE'),
('SUL');
