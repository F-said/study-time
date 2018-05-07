package Model;

import java.util.*;

public class Course {
    private String courseName, professorFName, professorLName, college;
    private Date courseBegin, courseEnd;
    private int creditHours, recommendedHours, examNum;
    private float recommendedHoursEmphasis;
    private Date[] examDates;
    boolean courseCompleted;

    // Default
    public Course() {
    }

    public Course(String courseName, String professorFName, String professorLName, Date courseBegin, Date courseEnd,
                  int examNum, String college) {
        this.courseName = courseName;
        this.professorFName = professorFName;
        this.professorLName = professorLName;
        this.examNum = examNum;
        this.college = college;
        this.courseBegin = courseBegin;
        this.courseEnd = courseEnd;
        this.courseCompleted = false;

        WCCCourseCatalogScraper parse = new WCCCourseCatalogScraper(courseName);

        creditHours = parse.getCreditHours();
        recommendedHours = creditHours * 2;

        recommendedHours = calcRecHours(recommendedHours);
    }

    public int calcRecHours(int recommendedHours) {
        WCCRateProfessorScraper rate = new WCCRateProfessorScraper(professorFName, professorLName);
        recommendedHoursEmphasis = rate.getDifficulty();
        if(recommendedHoursEmphasis > 2 & recommendedHoursEmphasis < 3)
            return recommendedHours -= 1;
        if(recommendedHoursEmphasis < 2)
            return recommendedHours -= 2;
        else if(recommendedHoursEmphasis > 3 & recommendedHoursEmphasis < 4)
            return recommendedHours += 1;
        else if (recommendedHoursEmphasis > 5)
            return recommendedHours += 2;
        else
            return recommendedHours;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getProfessorFName() {
        return professorFName;
    }

    public void setProfessorFName(String professorFName) {
        this.professorFName = professorFName;
    }

    public String getProfessorLName() {
        return professorLName;
    }

    public void setProfessorLName(String professorLName) {
        this.professorLName = professorLName;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public Date getCourseBegin() {
        return courseBegin;
    }

    public void setCourseBegin(Date courseBegin) {
        this.courseBegin = courseBegin;
    }

    public Date getCourseEnd() {
        return courseEnd;
    }

    public void setCourseEnd(Date courseEnd) {
        this.courseEnd = courseEnd;
    }

    public int getRecommendedHours() {
        return recommendedHours;
    }

    public void setRecommendedHours(int recommendedHours) {
        this.recommendedHours = recommendedHours;
    }

    public int getExamNum() {
        return examNum;
    }

    public void setExamNum(int examNum) {
        this.examNum = examNum;
    }

    public Date[] getExamDates() {
        return examDates;
    }

    public void setExamDates(Date[] examDates) {
        this.examDates = examDates;
    }

    public boolean isCourseCompleted() {
        return courseCompleted;
    }

    public void setCourseCompleted(boolean courseCompleted) {
        this.courseCompleted = courseCompleted;
    }

    public int getCreditHours() {
        return creditHours;
    }

    public void setCreditHours(int creditHours) {
        this.creditHours = creditHours;
    }

    public void setRecommendedHoursEmphasis(float recommendedHoursEmphasis) {
        this.recommendedHoursEmphasis = recommendedHoursEmphasis;
    }
}
