-- AlterTable
ALTER TABLE "pre_requisite" ADD COLUMN     "moduleModCode" VARCHAR(10);

-- AddForeignKey
ALTER TABLE "module" ADD CONSTRAINT "mod_mod_coord_fk" FOREIGN KEY ("mod_coord") REFERENCES "staff"("staff_no") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pre_requisite" ADD CONSTRAINT "pre_requisite_mod_code_fkey" FOREIGN KEY ("mod_code") REFERENCES "module"("mod_code") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pre_requisite" ADD CONSTRAINT "pre_requisite_requisite_fkey" FOREIGN KEY ("requisite") REFERENCES "module"("mod_code") ON DELETE RESTRICT ON UPDATE CASCADE;
