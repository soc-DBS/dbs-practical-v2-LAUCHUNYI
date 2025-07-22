/*
  Warnings:

  - You are about to drop the column `moduleModCode` on the `pre_requisite` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "course" DROP CONSTRAINT "fk_course_offered_by";

-- DropForeignKey
ALTER TABLE "module" DROP CONSTRAINT "mod_mod_coord_fk";

-- DropForeignKey
ALTER TABLE "pre_requisite" DROP CONSTRAINT "pre_requisite_mod_code_fkey";

-- DropForeignKey
ALTER TABLE "pre_requisite" DROP CONSTRAINT "pre_requisite_requisite_fkey";

-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_adm_no_fkey";

-- DropForeignKey
ALTER TABLE "stud_mod_performance" DROP CONSTRAINT "stud_mod_performance_mod_registered_fkey";

-- DropForeignKey
ALTER TABLE "student" DROP CONSTRAINT "student_crse_code_fkey";

-- DropForeignKey
ALTER TABLE "student" DROP CONSTRAINT "student_nationality_fkey";

-- AlterTable
ALTER TABLE "pre_requisite" DROP COLUMN "moduleModCode";

-- AlterTable
ALTER TABLE "stud_mod_performance" ALTER COLUMN "mark" DROP NOT NULL,
ALTER COLUMN "grade" DROP NOT NULL;

-- AlterTable
ALTER TABLE "student" ALTER COLUMN "mobile_phone" DROP NOT NULL,
ALTER COLUMN "home_phone" DROP NOT NULL,
ALTER COLUMN "dob" SET DATA TYPE DATE;

-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "course_offered_by_fk" FOREIGN KEY ("offered_by") REFERENCES "department"("dept_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "module" ADD CONSTRAINT "mod_mod_coord_fk" FOREIGN KEY ("mod_coord") REFERENCES "staff"("staff_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pre_requisite" ADD CONSTRAINT "pre_requisite_mod_code_fk" FOREIGN KEY ("mod_code") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pre_requisite" ADD CONSTRAINT "pre_requisite_requisite_fk" FOREIGN KEY ("requisite") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_adm_no_fkey" FOREIGN KEY ("adm_no") REFERENCES "student"("adm_no") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stud_mod_performance" ADD CONSTRAINT "stud_mod_performance_mod_registered_fkey" FOREIGN KEY ("mod_registered") REFERENCES "module"("mod_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_crse_code_fk" FOREIGN KEY ("crse_code") REFERENCES "course"("crse_code") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_nationality_fk" FOREIGN KEY ("nationality") REFERENCES "country"("country_name") ON DELETE NO ACTION ON UPDATE NO ACTION;
