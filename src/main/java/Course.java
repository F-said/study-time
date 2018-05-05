import java.util.*;

public class Course {
    private String courseName, professorFName, professorLName, campus;
    Date courseBegin, courseEnd;
    private int creditHours, recommendedHours, examNum;
    private float recommendedHoursEmphasis;
    private Date[] examDates;
    boolean courseCompleted;

    public Course(String courseName, String professorFName, String professorLName, Date courseBegin, Date courseEnd,
                  int examNum, String campus) {
        this.courseName = courseName;
        this.professorFName = professorFName;
        this.professorLName = professorLName;
        this.examNum = examNum;
        this.campus = campus;

        WCCCourseCatalogScraper parse = new WCCCourseCatalogScraper(courseName);
        WCCRateProfessorScraper rate = new WCCRateProfessorScraper(professorFName, professorLName);

        creditHours = parse.getCreditHours();
        recommendedHours = creditHours * 2;

        recommendedHoursEmphasis = rate.getDifficulty();
        if(recommendedHoursEmphasis > 2 & recommendedHoursEmphasis < 3)
            recommendedHours -= 1;
        if(recommendedHoursEmphasis < 2)
            recommendedHours -= 2;
        else if(recommendedHoursEmphasis > 3 & recommendedHoursEmphasis < 4)
            recommendedHours += 1;
        else if (recommendedHoursEmphasis > 5)
            recommendedHours += 2;
    }
}
