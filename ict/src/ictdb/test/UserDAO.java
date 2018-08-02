package ictdb.test;

import java.util.ArrayList;
import java.util.HashMap;

public interface UserDAO {

	public ArrayList<HashMap<String, String>> selectUserList(HashMap<String, String> user);
	public int insertUserList(HashMap<String, String> user);
	public int updateUserList(HashMap<String, String> user);
	public int deleteUserList(HashMap<String, String> user);
}
