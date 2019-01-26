package Esp8266.Wifi;

import java.util.Random;

public class Service {
	
	public void addLoc(String msgid) {
		System.out.println("before manage");
	ManageLocation managelocation = new ManageLocation();
	System.out.println("after	 manage");
	System.out.println(msgid);
		float location[] = new float[7];
		String prelocation[] = msgid.split("--");
		for(int j = 0;j < prelocation.length;j++) {
			//ManageLocation managelocation = new ManageLocation();
			String[] temp = prelocation[j].split(" ");
			for(int i = 0; i < temp.length;i++) {
				location[i] = Float.parseFloat(temp[i]);
			}
			for(int i = 0; i < location.length;i++) {
				System.out.println(location[i]);
			}
			managelocation.sessionFactoryConfig();
			managelocation.addLocation(location);
			
		}	
		
	}
	public void updateLoc(String msgid) {
		ManageLocation managelocation = new ManageLocation();
		float location[] = new float[8];
		int id;
		String prelocation[] = msgid.split("--");
		for(int j = 0;j < prelocation.length;j++) {
			String[] temp = prelocation[j].split(" ");
			id = Integer.parseInt(temp[0]);
			for(int i = 0; i < temp.length - 1;i++) {
				location[i] = Float.parseFloat(temp[i + 1]);
			}
			managelocation.sessionFactoryConfig();
			managelocation.updateLocation(id, location);
			
		}
		updateAllRandom();
	}
	public void updatePh(String msgid) {
		ManageLocation managelocation = new ManageLocation();
		int id;
		String preval[] = msgid.split("--");
		for(int j = 0;j < preval.length;j++) {
			String[] temp = preval[j].split(" ");
			id = Integer.parseInt(temp[0]);
			float val = Float.parseFloat(temp[1]);
			managelocation.sessionFactoryConfig();
			managelocation.updatePh(id, val);
		
		}	
		
	}
	
	public void updateMoisture(String msgid) {
		ManageLocation managelocation = new ManageLocation();
		int id;
		String preval[] = msgid.split("--");
		for(int j = 0;j < preval.length;j++) {
			String[] temp = preval[j].split(" ");
			id = Integer.parseInt(temp[0]);
			float val = Float.parseFloat(temp[1]);
			managelocation.sessionFactoryConfig();
			managelocation.updateMoisture(id, val);
			
		
		}	
		
	}
	
	public void updateTemperature(String msgid) {
		ManageLocation managelocation = new ManageLocation();
		int id;
		String preval[] = msgid.split("--");
		for(int j = 0;j < preval.length;j++) {
			String[] temp = preval[j].split(" ");
			id = Integer.parseInt(temp[0]);
			float val = Float.parseFloat(temp[1]);
			managelocation.sessionFactoryConfig();
			managelocation.updateTemperature(id, val);
		}	
		
	}
	
	public void updateAvg_Rainfall(String msgid) {
		ManageLocation managelocation = new ManageLocation();
		
		int id;
		String preval[] = msgid.split("--");
		for(int j = 0;j < preval.length;j++) {
			String[] temp = preval[j].split(" ");
			id = Integer.parseInt(temp[0]);
			float val = Float.parseFloat(temp[1]);
			managelocation.sessionFactoryConfig();
			managelocation.updateAvg_Rainfall(id, val);
		
		}	
		
	}
	public void updateAllRandom() {
		ManageLocation managelocation = new ManageLocation();
		float value[] = new float[8];
		for(int i = 3;i <= 10 ;i++) {
			for(int j = 0;j < 3;j++) {
				value[j]= getRandomValue(13,77);
			}
			value[3] = getRandomValue(5,8);
			value[4] = getRandomValue(500,900);
			value[5] = getRandomValue(293,300);
			value[6] = getRandomValue(30,300);
			managelocation.sessionFactoryConfig();
			managelocation.updateLocation(i, value);
			System.out.println("updated data for "+i);
		}
	}
	public float getRandomValue(int min, int max) {
		Random rand = new Random();
		return min + rand.nextFloat()* (max - min); 
	}
}
