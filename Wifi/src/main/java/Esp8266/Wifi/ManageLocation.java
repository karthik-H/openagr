package Esp8266.Wifi;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class ManageLocation {
public SessionFactory sessionfactory;


public ManageLocation(){
	
}
public void sessionFactoryConfig() {
	try{
		sessionfactory=new Configuration().configure().buildSessionFactory();
		
	}catch(Exception e){System.out.println("factory" + e);
}
}
public int addLocation(float locationval[]) {
	Session session=sessionfactory.openSession();
	Transaction tx=null;
	int id=0;
	try{
		tx=session.beginTransaction();
		Location location = new Location(locationval[0],locationval[1],locationval[2],locationval[3]
				,locationval[4],locationval[5],locationval[6]);
		id=(Integer) session.save(location);
		tx.commit();
	}catch(Exception e) {        if (tx!=null) tx.rollback();
     e.printStackTrace();
		System.out.println("transaction");
	}
finally{
	session.close();
}
	return id;
}

public void updateLocation(int id,float locationval[]) {
	Session session=sessionfactory.openSession();
	Transaction tx=null;
	try{
		tx=session.beginTransaction();
		Location location =(Location) session.get(Location.class, id);
		location.setLatitude(locationval[0]);
		location.setLongitude(locationval[1]);
		location.setAccurecy(locationval[2]);
		location.setSoil_ph(locationval[3]);
		location.setMoisture(locationval[4]);
		location.setTemperature(locationval[5]);
		location.setAvg_rainfall(locationval[6]);
		
		session.save(location);
		tx.commit();
	}catch(Exception e){}
	session.close();
	}
public void updatePh(int id,float ph) {
	Session session=sessionfactory.openSession();
	Transaction tx=null;
	try{
		tx=session.beginTransaction();
		Location location =(Location) session.get(Location.class, id);
		location.setLatitude(location.getLatitude());
		location.setLongitude(location.getLongitude());
		location.setAccurecy(location.getAccurecy());
		location.setSoil_ph(ph);
		location.setMoisture(location.getMoisture());
		location.setTemperature(location.getTemperature());
		location.setAvg_rainfall(location.getAvg_rainfall());
		session.save(location);
		tx.commit();
	}catch(Exception e){}
	session.close();
	}

public void updateMoisture(int id,float moisture) {
	Session session=sessionfactory.openSession();
	Transaction tx=null;
	try{
		tx=session.beginTransaction();
		Location location =(Location) session.get(Location.class, id);
		location.setLatitude(location.getLatitude());
		location.setLongitude(location.getLongitude());
		location.setAccurecy(location.getAccurecy());
		location.setSoil_ph(location.getSoil_ph());
		location.setMoisture(moisture);
		location.setTemperature(location.getTemperature());
		location.setAvg_rainfall(location.getAvg_rainfall());
		
		session.save(location);
		tx.commit();
	}catch(Exception e){}
	session.close();
	}

public void updateTemperature(int id,float temperature) {
	Session session=sessionfactory.openSession();
	Transaction tx=null;
	try{
		tx=session.beginTransaction();
		Location location =(Location) session.get(Location.class, id);
		location.setLatitude(location.getLatitude());
		location.setLongitude(location.getLongitude());
		location.setAccurecy(location.getAccurecy());
		location.setSoil_ph(location.getSoil_ph());
		location.setMoisture(location.getMoisture());
		location.setTemperature(temperature);
		location.setAvg_rainfall(location.getAvg_rainfall());
		session.save(location);
		tx.commit();
	}catch(Exception e){}
	session.close();
	}

public void updateAvg_Rainfall(int id,float avg_rainfall) {
	Session session=sessionfactory.openSession();
	Transaction tx=null;
	try{
		tx=session.beginTransaction();
		Location location =(Location) session.get(Location.class, id);
		location.setLatitude(location.getLatitude());
		location.setLongitude(location.getLongitude());
		location.setAccurecy(location.getAccurecy());
		location.setSoil_ph(location.getSoil_ph());
		location.setMoisture(location.getMoisture());
		location.setTemperature(location.getTemperature());
		location.setAvg_rainfall(avg_rainfall);
		session.save(location);
		tx.commit();
	}catch(Exception e){}
	session.close();
	}
}
