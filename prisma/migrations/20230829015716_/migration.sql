/*
  Warnings:

  - You are about to drop the column `hutuse` on the `tbuntuse` table. All the data in the column will be lost.
  - Added the required column `huntuse` to the `tbuntuse` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `tbuntuse_hutuse_key` ON `tbuntuse`;

-- AlterTable
ALTER TABLE `tbuntuse` DROP COLUMN `hutuse`,
    ADD COLUMN `huntuse` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`huntuse`);
