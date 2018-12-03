package kr.co.opensise.util;

import java.io.IOException;

import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.GeocoderResult;
import com.google.code.geocoder.model.GeocoderStatus;
import com.google.code.geocoder.model.LatLng;

public class GeoCodingUtil {
	
	public static LatLng geoCoding(String location) {
		
		if(location == null) {
			return null;
		}
		
		Geocoder geocoder = new Geocoder();
		
		GeocoderRequest geocoderRequest = new GeocoderRequestBuilder().setAddress(location).setLanguage("ko").getGeocoderRequest();
		GeocodeResponse geocodeResponse;
		
		try {
			geocodeResponse = geocoder.geocode(geocoderRequest);
			
			if(geocodeResponse.getStatus() == GeocoderStatus.OK & !geocodeResponse.getResults().isEmpty()) {
				
				GeocoderResult geocoderResult = geocodeResponse.getResults().iterator().next();
				LatLng latlng = geocoderResult.getGeometry().getLocation();
				
				return latlng;
				
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
