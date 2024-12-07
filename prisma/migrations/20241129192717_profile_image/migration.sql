/*
  Warnings:

  - Made the column `imageId` on table `ProfileImage` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ProfileImage" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userId" INTEGER NOT NULL,
    "imageId" TEXT NOT NULL,
    CONSTRAINT "ProfileImage_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_ProfileImage" ("id", "imageId", "userId") SELECT "id", "imageId", "userId" FROM "ProfileImage";
DROP TABLE "ProfileImage";
ALTER TABLE "new_ProfileImage" RENAME TO "ProfileImage";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;