package Esp8266.Wifi;

import java.util.Random;

public class Snippet {
	public static void main(String[] s) {
	/*ManageLocation managelocation = new ManageLocation();
		String msgid = "12.12 11.11 30.3 12.2";
		float location[] = new float[4];
		//ManageLocation managelocation = new ManageLocation();
		String[] temp = msgid.split(" ");
		for(int i = 0; i < temp.length;i++) {
			location[i] = Float.parseFloat(temp[i]);
		}
		for(int i = 0; i < location.length;i++) {
			System.out.println(location[i]);
		}
		managelocation.sessionFactoryConfig();
		managelocation.addLocation(location);*/
		Random rand = new Random();
		float val = 10 + rand.nextFloat()* (50 - 10);
		System.out.println(val);
		System.out.println(Math.random() + "math");
	}
}