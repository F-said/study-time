package Model;

import org.jsoup.*;
import org.jsoup.nodes.*;
import org.jsoup.select.*;
import java.io.*;

public class WCCRateProfessorScrape {
    private float difficulty;
    private String profFName, profLName;

    WCCRateProfessorScrape(String profFName, String profLName) {
        this.profFName = profFName;
        this.profLName = profLName;

        try {
            parseRateWebPage(this.profFName, this.profLName);
        } catch (IOException io) {
            System.err.println(io.toString());
        }
    }

    public float getDifficulty() {
        return difficulty;
    }

    private void parseRateWebPage(String fname, String lname) throws IOException {
        try {
            Document doc = Jsoup.connect("http://www.ratemyprofessors.com/search.jsp?queryoption=HEADER&queryBy=" +
                    "teacherName&schoolName=" + "Westchester+Community+College" + "&schoolID=&query=" + profFName + "+" + profLName).timeout(6000).get();

            Elements profList = doc.getElementsByClass("listing PROFESSOR");
            Elements proflink = profList.select("a[href]");
            String link = proflink.first().attr("abs:href");

            Document link_doc = Jsoup.connect(link).timeout(6000).get();

            Elements difficulty = link_doc.getElementsByClass("breakdown-section difficulty");
            Element levelofdiff = difficulty.first();

            this.difficulty = Float.parseFloat((levelofdiff.text()).substring((levelofdiff.text()).length() - 3));
        } catch(NullPointerException n) {
            this.difficulty = -1;
            return;
        }
    }
}





