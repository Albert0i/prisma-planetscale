-- AlterTable
ALTER TABLE `comments` ADD COLUMN `update_ident` INTEGER NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE `posts` ADD COLUMN `update_ident` INTEGER NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE `users` ADD COLUMN `update_ident` INTEGER NOT NULL DEFAULT 0;
