/*
  Warnings:

  - You are about to drop the column `authorId` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `subtitle` on the `posts` table. All the data in the column will be lost.
  - Added the required column `published` to the `posts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `posts` table without a default value. This is not possible if the table is not empty.
  - Made the column `name` on table `users` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX `posts_authorId_idx` ON `posts`;

-- AlterTable
ALTER TABLE `posts` DROP COLUMN `authorId`,
    DROP COLUMN `subtitle`,
    ADD COLUMN `published` BOOLEAN NOT NULL,
    ADD COLUMN `userId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `users` MODIFY `name` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE INDEX `posts_userId_idx` ON `posts`(`userId`);
