package com.nextgen.healthmonitoring;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class TemperatureActivity extends AppCompatActivity {

    private static String TAG ="TemperatureActivity";

    TextView temperatureTV;
    TextView lowTemperatureTV;
    TextView highTemperatureTV;
    TextView dateTV;
    ImageView backIV;

    private GlobalPreference globalPreference;
    private String ip,uid;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_temperature);

        globalPreference = new GlobalPreference(this);
        ip = globalPreference.getIP();
        uid = globalPreference.getID();

        temperatureTV = findViewById(R.id.tTemperatureTextView);
        lowTemperatureTV = findViewById(R.id.lowTempTextView);
        highTemperatureTV = findViewById(R.id.highTempTextView);
        dateTV = findViewById(R.id.tDateTextView);
        backIV = findViewById(R.id.tBackImageView);

        getTemperature();

        Date currentDate = new Date();

        SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy", Locale.getDefault());

        String formattedDate = sdf.format(currentDate);

        dateTV.setText(formattedDate);

        backIV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent intent = new Intent(TemperatureActivity.this,HomeActivity.class);
                startActivity(intent);
                finish();
            }
        });
    }

    private void getTemperature() {

        StringRequest stringRequest = new StringRequest(Request.Method.GET, "http://"+ ip +"/health_monitoring/api/getTemperature.php", new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {

                Log.d(TAG, "onResponse: "+response);

                if(response.equals("failed")){
                    Toast.makeText(TemperatureActivity.this, ""+response, Toast.LENGTH_SHORT).show();
                }
                else{
                    try {
                        JSONObject jsonObject = new JSONObject(response);
                        JSONArray jsonArray = jsonObject.getJSONArray("data");
                        for(int i = 0; i < jsonArray.length(); i++) {
                            JSONObject object = jsonArray.getJSONObject(i);
                            String temperature = object.getString("temperature");
                            String maxTemp = object.getString("max_temperature");
                            String minTemp = object.getString("min_temperature");

                            temperatureTV.setText(temperature);
                            lowTemperatureTV.setText(minTemp+" \u00B0F");
                            highTemperatureTV.setText(maxTemp+" \u00B0F");


                        }

                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Log.d(TAG, "onErrorResponse: "+error);
            }
        });

        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        requestQueue.add(stringRequest);

    }
}