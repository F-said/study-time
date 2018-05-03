package Model;

public class Course {
    private String courseName, professorFName, professorLName;
    Date courseBegin, courseEnd;
    private int creditHours, recommendedHours, recommendedHoursEmphasis, examNum;
    private Date[] examDates;
    boolean lowQuizDropped, lowExamDropped, courseCompleted;

    public Course(String courseName, String professorFName, String professorLName, Date courseBegin, Date courseEnd,
                  int examNum) {
        this.courseName = courseName;
        this.professorFName = professorFName;
        this.professorLName = professorLName;
        this.examNum = examNum;

        WCCCourseCatalogScrape parse = new WCCCourseCatalogScrape(courseName);

        creditHours = parse.getCreditHours();
        recommendedHours = creditHours * 2;
    }
}
