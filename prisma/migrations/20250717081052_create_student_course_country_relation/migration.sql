-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_nationality_fkey" FOREIGN KEY ("nationality") REFERENCES "country"("country_name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_crse_code_fkey" FOREIGN KEY ("crse_code") REFERENCES "course"("crse_code") ON DELETE RESTRICT ON UPDATE CASCADE;
