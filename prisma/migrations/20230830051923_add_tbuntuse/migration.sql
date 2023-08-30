-- CreateTable
CREATE TABLE `tbuntuse` (
    `huntuse` VARCHAR(191) NOT NULL,
    `uusedc` VARCHAR(191) NOT NULL,
    `uusedp` VARCHAR(191) NOT NULL,
    `update_ident` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`huntuse`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
