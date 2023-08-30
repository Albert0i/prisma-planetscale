/*
  Warnings:

  - You are about to drop the `tbuntuse` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE `posts` ADD COLUMN `likes` INTEGER NOT NULL DEFAULT 0,
    ADD COLUMN `views` INTEGER NOT NULL DEFAULT 0;

-- DropTable
DROP TABLE `tbuntuse`;

-- CreateTable
CREATE TABLE `comments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `comment` TEXT NOT NULL,
    `postId` INTEGER NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,

    INDEX `comments_postId_idx`(`postId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
