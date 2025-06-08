
CREATE TABLE "applications" (
  "id" int NOT NULL,
  "user_id" int DEFAULT NULL,
  "offer_id" int DEFAULT NULL,
  "status" varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'pending',
  "applied_at" datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
------------------------------------------


CREATE TABLE "favorites" (
  "id" int NOT NULL,
  "user_id" int DEFAULT NULL,
  "offer_id" int DEFAULT NULL,
  "added_at" datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE "logs" (
  "id" int NOT NULL,
  "user_id" int DEFAULT NULL,
  "action" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  "details" text COLLATE utf8mb4_general_ci,
  "timestamp" datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы "messages"
--

CREATE TABLE "messages" (
  "id" int NOT NULL,
  "subject" varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  "full_name" varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  "contact_info" varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  "message" text COLLATE utf8mb4_general_ci NOT NULL,
  "created_at" datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE "notifications" (
  "id" int NOT NULL,
  "user_id" int DEFAULT NULL,
  "message" text COLLATE utf8mb4_general_ci,
  "is_read" tinyint(1) DEFAULT '0',
  "created_at" datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы "offers"
--

CREATE TABLE "offers" (
  "id" int NOT NULL,
  "title" varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  "description" text COLLATE utf8mb4_general_ci NOT NULL,
  "requirements" text COLLATE utf8mb4_general_ci NOT NULL,
  "speciality" varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  "salary" int DEFAULT NULL,
  "city" varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  "user_id" int DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  "format" varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  "employment" varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Структура таблицы "resumes"
--

CREATE TABLE "resumes" (
  "id" int NOT NULL,
  "user_id" int NOT NULL,
  "full_name" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  "desired_position" varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  "city" varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  "phone" varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  "email" varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  "telegram" varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  "git" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  "speciality" varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  "photo_path" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  "created_at" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  "description" text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Структура таблицы "site_content"
--

CREATE TABLE "site_content" (
  "id" int NOT NULL,
  "page" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  "section" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  "content" text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы "uploads"
--

CREATE TABLE "uploads" (
  "id" int NOT NULL,
  "user_id" int DEFAULT NULL,
  "file_path" varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  "uploaded_at" datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы "users"
--

CREATE TABLE "users" (
  "id" int NOT NULL,
  "UserName" varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  "pass" varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  "role" varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  "email" varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE "views" (
  "id" int NOT NULL,
  "user_id" int DEFAULT NULL,
  "offer_id" int DEFAULT NULL,
  "resume_id" int DEFAULT NULL,
  "viewed_at" datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Индексы таблицы "applications"
--
ALTER TABLE "applications"
  ADD PRIMARY KEY ("id"),
  ADD KEY "user_id" ("user_id"),
  ADD KEY "offer_id" ("offer_id");

--
-- Индексы таблицы "favorites"
--
ALTER TABLE "favorites"
  ADD PRIMARY KEY ("id"),
  ADD KEY "user_id" ("user_id"),
  ADD KEY "offer_id" ("offer_id");

--
-- Индексы таблицы "logs"
--
ALTER TABLE "logs"
  ADD PRIMARY KEY ("id"),
  ADD KEY "user_id" ("user_id");

--
-- Индексы таблицы "messages"
--
ALTER TABLE "messages"
  ADD PRIMARY KEY ("id");

--
-- Индексы таблицы "notifications"
--
ALTER TABLE "notifications"
  ADD PRIMARY KEY ("id"),
  ADD KEY "user_id" ("user_id");

--
-- Индексы таблицы "offers"
--
ALTER TABLE "offers"
  ADD PRIMARY KEY ("id"),
  ADD KEY "fk_user" ("user_id");

--
-- Индексы таблицы "resumes"
--
ALTER TABLE "resumes"
  ADD PRIMARY KEY ("id"),
  ADD KEY "user_id" ("user_id");

--
-- Индексы таблицы "site_content"
--
ALTER TABLE "site_content"
  ADD PRIMARY KEY ("id");

--
-- Индексы таблицы "uploads"
--
ALTER TABLE "uploads"
  ADD PRIMARY KEY ("id"),
  ADD KEY "user_id" ("user_id");

--
-- Индексы таблицы "users"
--
ALTER TABLE "users"
  ADD PRIMARY KEY ("id");

--
-- Индексы таблицы "views"
--
ALTER TABLE "views"
  ADD PRIMARY KEY ("id"),
  ADD KEY "user_id" ("user_id"),
  ADD KEY "offer_id" ("offer_id"),
  ADD KEY "resume_id" ("resume_id");

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы "applications"
--
ALTER TABLE "applications"
  MODIFY "id" int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы "favorites"
--
ALTER TABLE "favorites"
  MODIFY "id" int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы "logs"
--
ALTER TABLE "logs"
  MODIFY "id" int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы "messages"
--
ALTER TABLE "messages"
  MODIFY "id" int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы "notifications"
--
ALTER TABLE "notifications"
  MODIFY "id" int NOT NULL AUTO_INCREMENT;

ALTER TABLE "offers"
  MODIFY "id" int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;


ALTER TABLE "resumes"
  MODIFY "id" int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;


ALTER TABLE "site_content"
  MODIFY "id" int NOT NULL AUTO_INCREMENT;


ALTER TABLE "uploads"
  MODIFY "id" int NOT NULL AUTO_INCREMENT;


ALTER TABLE "users"
  MODIFY "id" int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;


ALTER TABLE "views"
  MODIFY "id" int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;


ALTER TABLE "applications"
  ADD CONSTRAINT "applications_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "users" ("id"),
  ADD CONSTRAINT "applications_ibfk_2" FOREIGN KEY ("offer_id") REFERENCES "offers" ("id");


ALTER TABLE "favorites"
  ADD CONSTRAINT "favorites_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "users" ("id"),
  ADD CONSTRAINT "favorites_ibfk_2" FOREIGN KEY ("offer_id") REFERENCES "offers" ("id");

ALTER TABLE "logs"
  ADD CONSTRAINT "logs_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "users" ("id");


ALTER TABLE "notifications"
  ADD CONSTRAINT "notifications_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "users" ("id");


ALTER TABLE "offers"
  ADD CONSTRAINT "fk_user" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;


ALTER TABLE "resumes"
  ADD CONSTRAINT "resumes_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE;


ALTER TABLE "uploads"
  ADD CONSTRAINT "uploads_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "views"
  ADD CONSTRAINT "views_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "users" ("id"),
  ADD CONSTRAINT "views_ibfk_2" FOREIGN KEY ("offer_id") REFERENCES "offers" ("id"),
  ADD CONSTRAINT "views_ibfk_3" FOREIGN KEY ("resume_id") REFERENCES "resumes" ("id");
COMMIT;