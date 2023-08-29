-- CreateTable
CREATE TABLE `tbuntuse` (
    `hutuse` VARCHAR(191) NOT NULL,
    `uusedc` VARCHAR(191) NOT NULL,
    `uusedp` VARCHAR(191) NOT NULL,
    `update_ident` DECIMAL(65, 30) NOT NULL,

    UNIQUE INDEX `tbuntuse_hutuse_key`(`hutuse`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
