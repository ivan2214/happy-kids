/*
  Warnings:

  - The `dni` column on the `User` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `streetNumber` column on the `User` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "User" DROP COLUMN "dni",
ADD COLUMN     "dni" INTEGER,
DROP COLUMN "streetNumber",
ADD COLUMN     "streetNumber" INTEGER;
