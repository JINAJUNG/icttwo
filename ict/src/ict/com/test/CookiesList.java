package ict.com.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CookiesList {

	private static CookiesList cl;
	private List<HashMap<String,String>> cookiesL;
	public static CookiesList getCookies() {
		if(cl==null) { //�̱�������
			cl=new CookiesList();
		}
		return cl;
	}
	
	public List<HashMap<String,String>> getCookiesList(){
		if(cookiesL==null) {
			cookiesL= new ArrayList<HashMap<String,String>>();
			
			for(int i=0;i<20;i++) {
				HashMap<String,String> hm = new HashMap<String,String>();
				hm.put("cName", "cheeseCracker"+(i+1));
				hm.put("cPay", (int)(Math.random()*2000)+1000+"��");
				hm.put("cFactory", "���� ����"+(i+1)+"����");
				cookiesL.add(hm);
			}
		}
		return cookiesL;
	}
	
	public List<HashMap<String,String>> getCookiesList(String searchStr, String[] chStr){
		if(cookiesL==null || searchStr==null || chStr==null) {
			return getCookiesList();
		}
		
		List<HashMap<String,String>> searchList =  new ArrayList<HashMap<String,String>>();
		for(HashMap<String,String> hm : cookiesL) {
			for(String ch : chStr) {
				if(hm.get(ch).indexOf(searchStr)!=-1) {
					if(searchList.indexOf(hm)==-1) {
						searchList.add(hm);
					}
				}
			}
		}
		return searchList;
	}
}
