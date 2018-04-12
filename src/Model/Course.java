package Model;

public class Course {
    private String courseName, professorFName, professorLName;
    Date courseBegin, courseEnd;
    private short creditHours, recommendedHours, recommendedHoursEmphasis, examNum;
    private Date[] examDates;
    boolean lowQuizDropped, lowExamDropped;

    public Course(String courseName, String professorFName, String professorLName, String courseBegin, String courseEnd,
                  short examNum) {

    }
}
