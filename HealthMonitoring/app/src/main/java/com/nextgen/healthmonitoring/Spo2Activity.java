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

public class Spo2Activity extends AppCompatActivity {

    private static String TAG ="Spo2Activity";

    TextView spo2TV;
    TextView lowSpo2TV;
    TextView highSpo2TV;
    TextView dateTV;
    ImageView backIV;

    private GlobalPreference globalPreference;
    private String ip;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_spo2);

        globalPreference = new GlobalPreference(this);
        ip = globalPreference.getIP();

        spo2TV = findViewById(R.id.sOxygenLevel);
        lowSpo2TV = findViewById(R.id.lowOxygenLevelTextView);
        highSpo2TV = findViewById(R.id.highOxygenLevelTextView);
        dateTV = findViewById(R.id.sDateTextView);
        backIV = findViewById(R.id.sBackImageView);

        getSpo2();

        Date currentDate = new Date();

        SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy", Locale.getDefault());

        String formattedDate = sdf.format(currentDate);

        dateTV.setText(formattedDate);

        backIV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent intent = new Intent(Spo2Activity.this,HomeActivity.class);
                startActivity(intent);
                finish();
            }
        });
    }

    private void getSpo2() {

        StringRequest stringRequest = new StringRequest(Request.Method.GET, "http://"+ ip +"/health_monitoring/api/getSpo2.php", new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {

                Log.d(TAG, "onResponse: "+response);

                if(response.equals("failed")){
                    Toast.makeText(Spo2Activity.this, ""+response, Toast.LENGTH_SHORT).show();
                }
                else{
                    try {
                        JSONObject jsonObject = new JSONObject(response);
                        JSONArray jsonArray = jsonObject.getJSONArray("data");
                        for(int i = 0; i < jsonArray.length(); i++) {
                            JSONObject object = jsonArray.getJSONObject(i);
                            String spo2 = object.getString("spo2");
                            String max_spo2 = object.getString("max_spo2");
                            String min_spo2 = object.getString("min_spo2");

                            spo2TV.setText(spo2);
                            lowSpo2TV.setText(min_spo2);
                            highSpo2TV.setText(max_spo2);



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