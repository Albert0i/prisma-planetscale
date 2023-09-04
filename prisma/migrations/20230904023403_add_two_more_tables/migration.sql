-- CreateTable
CREATE TABLE `categrytopost` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `postId` INTEGER NOT NULL,
    `categoryId` INTEGER NOT NULL,

    INDEX `categrytopost_postId_idx`(`postId`),
    INDEX `categrytopost_categoryId_idx`(`categoryId`),
    UNIQUE INDEX `categrytopost_postId_categoryId_key`(`postId`, `categoryId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `categories` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `categories_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
