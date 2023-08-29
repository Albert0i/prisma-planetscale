/*
  Warnings:

  - You are about to alter the column `update_ident` on the `tbuntuse` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Int`.

*/
-- AlterTable
ALTER TABLE `tbuntuse` MODIFY `update_ident` INTEGER NOT NULL DEFAULT 0;
