package Esp8266.Wifi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CbrAlgorithm
 */
public class CbrAlgorithm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CbrAlgorithm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ManageSensorData sensordata = new ManageSensorData();
		sensordata.sessionFactoryConfig();
		//CBR cbr = new CBR();
		ArrayList<String> prediction = new ArrayList<String>();
		List<Location> data = sensordata.getData();
		Iterator<Location> value = data.iterator();
		while(value.hasNext()) {
			Location l = value.next();
			String result = CBR.getCrop(l.getSoil_ph(), l.getMoisture(), l.getTemperature(),l.getAvg_rainfall());
			prediction.add(result);
			result ="";
		}
		request.setAttribute("sensordata", data);
		request.setAttribute("prediction", prediction);
		request.getRequestDispatcher("algorithm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
