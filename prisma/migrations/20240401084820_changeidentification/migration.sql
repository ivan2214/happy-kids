/*
  Warnings:

  - The primary key for the `Identification` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `Identification` table. All the data in the column will be lost.
  - You are about to drop the column `identificationId` on the `Payer` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[number]` on the table `Identification` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Payer" DROP CONSTRAINT "Payer_identificationId_fkey";

-- AlterTable
ALTER TABLE "Identification" DROP CONSTRAINT "Identification_pkey",
DROP COLUMN "id";

-- AlterTable
ALTER TABLE "Payer" DROP COLUMN "identificationId",
ADD COLUMN     "identificationNumber" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Identification_number_key" ON "Identification"("number");

-- AddForeignKey
ALTER TABLE "Payer" ADD CONSTRAINT "Payer_identificationNumber_fkey" FOREIGN KEY ("identificationNumber") REFERENCES "Identification"("number") ON DELETE SET NULL ON UPDATE CASCADE;
