package Model;

import org.jsoup.*;
import org.jsoup.helper.*;
import org.jsoup.nodes.*;
import org.jsoup.select.*;

public class CourseCatalogScraper {
    File input = new File("/tmp/input.html");
    Document doc = Jsoup.parse(input, "UTF-8", "http://catalog.sunywcc.edu/content.php?catoid=40&navoid=6154");

    Element content = doc.getElementById("content");
    Elements links = content.getElementsByTag("a");
    for (Element link : links) {
        String linkHref = link.attr("href");
        String linkText = link.text();
    }
}

