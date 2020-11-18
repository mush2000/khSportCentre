package com.spring.biz.util;

//import java.io.InputStreamReader;
//import java.net.HttpURLConnection;
//import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

//import java.io.BufferedReader;
import java.io.IOException;

//class tempVO {
//	String dk;
//	String dn;
//	String ih;
//	String l;
//	String s;
//	String tc;
//
//	@Override
//	public String toString() {
//		return "tempVO [dk=" + dk + ", dn=" + dn + ", ih=" + ih + ", l=" + l + ", s=" + s + ", tc=" + tc + "]";
//	}
//
//}

public class IsHoliday {

	public static String isHoliday(String year, String month) throws IOException, ParserConfigurationException, SAXException {
//		System.out.println(year + "," + month);
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=B48QWk%2FV1Ecp3h6kE7nPoXt%2FlWrJg1SeVCYGFs1UgJj2w4IZLrmqalvlN2FVWbrjarO4%2F5K%2FXyfDyEm%2BLRbh9w%3D%3D"); /*Service Key */
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + URLEncoder.encode("B48QWk%2FV1Ecp3h6kE7nPoXt%2FlWrJg1SeVCYGFs1UgJj2w4IZLrmqalvlN2FVWbrjarO4%2F5K%2FXyfDyEm%2BLRbh9w%3D%3D","UTF-8")); /* 공공데이터포털에서 받은 인증키 */
//		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder.append("&" + URLEncoder.encode("solYear", "UTF-8") + "=" + URLEncoder.encode(year, "UTF-8")); /* 연 */
		urlBuilder.append("&" + URLEncoder.encode("solMonth","UTF-8") + "=" + URLEncoder.encode(month, "UTF-8")); /*월*/
//		urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*JSON 디폴트값은 xml*/

		DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
		Document xml = documentBuilder.parse(urlBuilder.toString());

		Element root = xml.getDocumentElement();
		NodeList nodeList = root.getElementsByTagName("item");
		
		String holiday = "";

		for (int i = 0; i < nodeList.getLength(); i++) {
			Node nodeItem = nodeList.item(i);

			try {
//				String dk = getTagValue("dateKind", (Element) nodeItem);
//				String dn = getTagValue("dateName", (Element) nodeItem);
//				String ih = getTagValue("isHoliday", (Element) nodeItem);
				String locdate = getTagValue("locdate", (Element) nodeItem);
//				String s = getTagValue("seq", (Element) nodeItem);
//				String tc = getTagValue("totalCount", (Element) nodeItem);
				int ld = Integer.parseInt(locdate) % 100;
				
				holiday += holiday.equals("") ? ld : "," + ld; 

			} catch (Exception e) {
			}
			
		}
//		System.out.println(holiday);
		return holiday;

//      URL url = new URL(urlBuilder.toString());
//      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//      conn.setRequestMethod("GET");
//      conn.setRequestProperty("Content-type", "application/json");
//      System.out.println("Response code: " + conn.getResponseCode());
//      BufferedReader rd;
//      if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
//          rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//      } else {
//          rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//      }
//      StringBuilder sb = new StringBuilder();
//      String line;
//      while ((line = rd.readLine()) != null) {
//          sb.append(line);
//      }
//      rd.close();
//      conn.disconnect();
//      
//      System.out.println(sb.toString());
	}

	static String getTagValue(String sTag, Element element) {
		try {
			String result = element.getElementsByTagName(sTag).item(0).getTextContent();
			return result;
		} catch (NullPointerException e) {
			return "";
		} catch (Exception e) {
			return "";
		}
	}
	
	public static String getNowDate(String dateFormat) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		String todate = sdf.format(cal.getTime());
		return todate;
	}
}
