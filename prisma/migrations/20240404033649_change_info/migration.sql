/*
  Warnings:

  - You are about to drop the column `payerId` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `Order` table. All the data in the column will be lost.
  - You are about to drop the column `dni` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Payer` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `identificationNumber` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Order" DROP CONSTRAINT "Order_payerId_fkey";

-- DropForeignKey
ALTER TABLE "Payer" DROP CONSTRAINT "Payer_identificationNumber_fkey";

-- AlterTable
ALTER TABLE "Order" DROP COLUMN "payerId",
DROP COLUMN "phone";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "dni",
ADD COLUMN     "identificationNumber" TEXT NOT NULL;

-- DropTable
DROP TABLE "Payer";

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_identificationNumber_fkey" FOREIGN KEY ("identificationNumber") REFERENCES "Identification"("number") ON DELETE CASCADE ON UPDATE CASCADE;
