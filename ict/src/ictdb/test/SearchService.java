package ictdb.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import ictdb.test.impl.UserDAOImpl;

public class SearchService {

	UserDAO udao = new UserDAOImpl();
	HashMap<String, String> user = new HashMap<String, String>();
	Iterator<String> it;
	Set<String> col = new HashSet<String>();
	private static SearchService cl;
	private List<HashMap<String, String>> userList;
 
	
	public static SearchService getSearch() {
		if (cl == null) { // 싱글톤패턴
			cl = new SearchService();
		}
		return cl;
	}
	
	public Set<String> getColName(){
		while (it.hasNext()) {
			String setCol = it.next();
			col.add(setCol);
		}
		return col;
	}
	
	public List<HashMap<String, String>> getsearchService(String searchStr, String[] chStr) {
		if (userList == null || searchStr == null || chStr == null) {
			user=null;
			userList = udao.selectUserList(user);

			it= userList.get(0).keySet().iterator();
			getColName();
			System.out.println(col.size()+"col");
			return userList;
		}
		List<HashMap<String, String>> searchList = new ArrayList<HashMap<String, String>>();
		for (HashMap<String, String> hm : userList) {
			for (String ch : chStr) {
				if (hm.get(ch).indexOf(searchStr) != -1) {
					if (searchList.indexOf(hm) == -1) {
						searchList.add(hm);
					}
				}
			}
		}
		return searchList;
	}
}
