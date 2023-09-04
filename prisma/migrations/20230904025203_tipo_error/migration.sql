/*
  Warnings:

  - You are about to drop the `categrytopost` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `categrytopost`;

-- CreateTable
CREATE TABLE `categorytopost` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `postId` INTEGER NOT NULL,
    `categoryId` INTEGER NOT NULL,

    INDEX `categorytopost_postId_idx`(`postId`),
    INDEX `categorytopost_categoryId_idx`(`categoryId`),
    UNIQUE INDEX `categorytopost_postId_categoryId_key`(`postId`, `categoryId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
