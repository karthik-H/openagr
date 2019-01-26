package Esp8266.Wifi;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class CBR {
	static float ph,moi,tem,avg;
	public static String getCrop(float ph,float moi,float tem,float avg) throws IOException {
		// TODO Auto-generated method stub
		String line;
		Integer line_number = 0;
		/*Scanner sc = new Scanner(System.in);
		
		//read inputs
		System.out.println("enter the ph val");
		ph = sc.nextFloat();
		System.out.println("enter the moisture");
		moi = sc.nextFloat();
		System.out.println("enter the temp");
		tem = sc.nextFloat();
		System.out.println("enter the avg_rain");
		avg = sc.nextFloat();
		sc.close();
		//read file*/
		
		String file = CBR.class.getResource("crop_data").getPath();
		BufferedReader buf = new BufferedReader(new FileReader(file));
		int max_count = 0;
		String retrive = "";
		while((line = buf.readLine()) != null) {
			line_number++;
			int count = 0;
			String[] words = line.split(",");
			if(Float.parseFloat(words[3]) <= moi && moi <= Float.parseFloat(words[4])) {
				//System.out.println(words[3]+" "+l);
				count++;
			}
			if(Float.parseFloat(words[1]) <= ph && ph <= Float.parseFloat(words[2])) {
					count++;
			}
			if(Float.parseFloat(words[5]) <= tem && tem <= Float.parseFloat(words[6])) {
						count++;
			}
			if(Float.parseFloat(words[7]) <= avg && avg <= Float.parseFloat(words[8])) {
						count++;
						}
			if(count == 4) {
				System.out.println("found suitable crop : "+" "+ words[9]+" and predicted the user action using the row: c"+line_number);
				return words[9].toString();
			}
			else {
				if(max_count > count) {
					
				}
				else if(max_count == count) {
					retrive = retrive + line_number.toString() + ",";
				}
				else{
					max_count = count;
					retrive = "";
					retrive = retrive + line_number.toString() + ",";
					}
				
			}
			
		}
		buf.close();
		
		//System.out.println("next line"+buf.readLine());
		if(retrive.length() == 2) {
			buf = new BufferedReader(new FileReader(file));
			line_number = Character.getNumericValue(retrive.charAt(0));
			int i = line_number;
		
			for(;line_number > 1;line_number--) {
				buf.readLine();
			}
			String output =buf.readLine();
			String[] words = output.split(",");
			System.out.println(output);
			System.out.println("found class User Action : "+" "+ words[9]+" and predicted the user action using the row: c"+i);
			buf.close();
			return words[9].toString();
			
		}
		else {
			buf = new BufferedReader(new FileReader(file));
			
			Map<String,String> map_loc = new HashMap<String,String>(); 
			Map<String,String>  map_thread = new HashMap<String,String>(); 
			Map<String,String>  map_auth = new HashMap<String,String>();
			Map<String,String>	map_rain = new HashMap<String,String>();
			int pos=0,line_num = 1,expected_line_num;
			String str[] = retrive.split(",");
			while((line=buf.readLine()) != null && pos < ((retrive.length()/2) - 1)) {
				expected_line_num = Integer.parseInt(str[pos]);
				if(expected_line_num == line_num) {
					String result[] = line.split(",");
					if(Float.parseFloat(result[3]) <= moi && moi <= Float.parseFloat(result[4])) {
						map_loc.put(result[0], result[9]);
						if(Float.parseFloat(result[1]) <= ph && ph <= Float.parseFloat(result[2])) {
							map_thread.put(result[0], result[9]);
							System.out.println("found class User Action : "+result[0] +" and predicted the user action using the row: "+result[9]);
							return result[9].toString();
						}
						else if(Float.parseFloat(result[5]) <= tem && tem <= Float.parseFloat(result[6])) {
							map_auth.put(result[0], result[9]);
							System.out.println("found class User Action : "+result[0] +" and predicted the user action using the row: "+result[9]);
							return result[9].toString();
							
						}
						else if(Float.parseFloat(result[7]) <= avg && avg <= Float.parseFloat(result[8])) {
							map_rain.put(result[0], result[9]);
							System.out.println("found class User Action : "+result[0] +" and predicted the user action using the row: "+result[9]);
							return result[9].toString();
							
						}
					}
						if(Float.parseFloat(result[1]) <= ph && ph <= Float.parseFloat(result[2])) {
							map_thread.put(result[0], result[9]);
							if(Float.parseFloat(result[5]) <= tem && tem <= Float.parseFloat(result[6])) {
								map_auth.put(result[0], result[9]);
								System.out.println("found class User Action : "+result[0] +" and predicted the user action using the row: "+result[9]);
								return result[9].toString();
							}
							else if(Float.parseFloat(result[7]) <= avg && avg <= Float.parseFloat(result[8])) {
								map_rain.put(result[0], result[9]);
								System.out.println("found class User Action : "+result[0] +" and predicted the user action using the row: "+result[9]);
								return result[9].toString();
							}
						}
							if(Float.parseFloat(result[5]) <= tem && tem <= Float.parseFloat(result[6])) {
								map_auth.put(result[0], result[9]);
								if(Float.parseFloat(result[7]) <= avg && avg <= Float.parseFloat(result[8])) {
									map_rain.put(result[0], result[9]);
									System.out.println("found class User Action : "+result[0] +" and predicted the user action using the row: "+result[9]);
									return result[9].toString();
								}
								
							}
							if(Float.parseFloat(result[7]) <= avg && avg <= Float.parseFloat(result[8])) {
								map_rain.put(result[0], result[9]);
								System.out.println("found class User Action : "+result[0] +" and predicted the user action using the row: "+result[9]);
								return result[9].toString();
							}
					
					
					
					pos++;
				}
				line_num++;
				
			}//while loop
			/*System.out.println(map_loc.isEmpty()+"mois");
			System.out.println(map_thread.isEmpty()+"ph");
			System.out.println(map_auth.isEmpty()+"tem");
			
			if(isUnique(map_loc) && !(map_loc.isEmpty())) {
				Map.Entry<String,String> entry = map_loc.entrySet().iterator().next();
				System.out.println("found class User Action : "+entry.getValue() +" and predicted the user action using the row: "+entry.getKey());
				
			}
			else if(isUnique(map_thread) && !(map_thread.isEmpty())) {
				Map.Entry<String,String> entry = map_thread.entrySet().iterator().next();
				System.out.println("found class User Action : "+" "+ entry.getValue()+" and predicted the user action using the row: "+entry.getKey());
				
			}
			else if(isUnique(map_auth) && !(map_auth.isEmpty())){
				Map.Entry<String,String> entry = map_auth.entrySet().iterator().next();
				System.out.println("found class User Action : "+" "+ entry.getValue()+" and predicted the user action using the row: "+entry.getKey());
				
			}
			else if(isUnique(map_rain) && !(map_rain.isEmpty())){
				Map.Entry<String,String> entry = map_rain.entrySet().iterator().next();
				System.out.println("found class User Action : "+" "+ entry.getValue()+" and predicted the user action using the row: "+entry.getKey());
				
			}
			else { System.out.println("need more data");
			return "nodata";
			}*/
			return "nodata";
			}	
		
}//eof main
	
	
	public static boolean isUnique(Map<String,String> aMap) {
	    Object value = null;

	    for (Object entry : aMap.values()) {
	      if (value == null) {
	        value = entry;
	      } else if (!value.equals(entry)) {
	        return false;
	      }
	    }

	    return true;
	}
	public static void main(String s[]) throws IOException {
		float ph = (float) 5.8;
		float m = (float) 66.2;
		float t = (float) 28;
		float a = (float) 99;
		System.out.println(getCrop(ph,m,t,a));
	}
}

