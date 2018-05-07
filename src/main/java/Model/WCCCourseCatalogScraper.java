package Model;

import org.jsoup.*;
import org.jsoup.nodes.*;
import org.jsoup.select.*;
import java.io.*;

public class WCCCourseCatalogScraper {
    private int creditHours;
    private String courseMajor, courseLevel;

    public WCCCourseCatalogScraper(String courseName) {
        this.courseLevel = courseName.substring(courseName.length() - 3);
        this.courseMajor = courseName.substring(0, 5);
        try {
            parseWebPage(this.courseMajor, this.courseLevel);
        } catch (IOException io) {
            System.err.println(io.toString());
        }
    }

    public int getCreditHours() {
        return creditHours;
    }

    private void parseWebPage(String prefix, String level) throws IOException {
        final int COURSEPOS = 2;
        int counter = 0;
        Document doc = Jsoup.connect("http://catalog.sunywcc.edu/content.php?filter%" +
                "5B27%5D=" + prefix + "&filter%5B29%5D=" + level + "&filter%5Bcourse_type%5D=-1&filter%5Bkeyword%5D=&filter%5B32%5D=1&" +
                "filter%5Bcpage%5D=1&cur_cat_oid=40&expand=&navoid=6155&search_database=Filter&filter%5Bexact_match%5D=1" +
                "#acalog_template_course_filter").timeout(6000).get();

        Elements generalInfo = doc.getElementsByClass("table_default");
        Element tableCourse = generalInfo.last();
        Elements courseTags = tableCourse.getElementsByTag("tr");
        Element courseTag = null;

        for(Element e: courseTags) {
            if(counter == COURSEPOS)
                courseTag = e;
            counter++;
        }

        Elements course = courseTag.getElementsByClass("width");

        // If course does not exist, return -1
        if(course.size() == 0) {
            creditHours = -1;
            return;
        }

        Elements courselinks = course.select("a[href]");
        String link = courselinks.first().attr("abs:href");

        Document link_doc = Jsoup.connect(link).timeout(6000).get();
        Elements courseInfo = link_doc.getElementsByClass("block_content");
        Elements courseTitle = courseInfo.select("strong");

        creditHours = Integer.parseInt(courseTitle.get(1).text());
    }
}


