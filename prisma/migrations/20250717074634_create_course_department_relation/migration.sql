-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "fk_course_offered_by" FOREIGN KEY ("offered_by") REFERENCES "department"("dept_code") ON DELETE RESTRICT ON UPDATE CASCADE;
