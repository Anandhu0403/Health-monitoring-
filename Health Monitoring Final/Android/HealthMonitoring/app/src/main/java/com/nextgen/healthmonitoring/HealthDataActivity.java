package com.nextgen.healthmonitoring;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.bumptech.glide.Glide;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class HealthDataActivity extends AppCompatActivity {

    private static String TAG ="HealthDataActivity";
    TextView heartRateTV;
    TextView spo2TV;
    TextView temperatureTV;
    Button getResultsBT;

    private GlobalPreference globalPreference;
    private String ip,uid;
    String heartRate,temperature,spo2;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_health_data);

        globalPreference = new GlobalPreference(this);
        ip = globalPreference.getIP();
        uid = globalPreference.getID();

        heartRateTV  = findViewById(R.id.heartRateTextView);
        spo2TV = findViewById(R.id.spoTextView);
        temperatureTV = findViewById(R.id.temperatureTextView);
        getResultsBT = findViewById(R.id.getResultsButton);

        getHealthData();

        getResultsBT.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent intent = new Intent(HealthDataActivity.this,HealthConditionActivity.class);
                intent.putExtra("heartRate",heartRate);
                intent.putExtra("spo2",spo2);
                intent.putExtra("temperature",temperature);
                startActivity(intent);

            }
        });
    }
    private void getHealthData() {

        StringRequest stringRequest = new StringRequest(Request.Method.GET, "http://"+ ip +"/health_monitoring/api/getHealthData.php?uid="+uid, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {

                Log.d(TAG, "onResponse: "+response);

                if(response.equals("failed")){
                    Toast.makeText(HealthDataActivity.this, ""+response, Toast.LENGTH_SHORT).show();
                }
                else{
                    try {
                        JSONObject jsonObject = new JSONObject(response);
                        JSONArray jsonArray = jsonObject.getJSONArray("data");
                        for(int i = 0; i < jsonArray.length(); i++) {
                            JSONObject object = jsonArray.getJSONObject(i);
                            String id = object.getString("id");
                            heartRate = object.getString("heartrate");
                            temperature = object.getString("temperature");
                            spo2 = object.getString("spo2");

                            heartRateTV.setText(heartRate);
                            temperatureTV.setText(temperature);
                            spo2TV.setText(spo2);


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