package com.nextgen.healthmonitoring;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.LinearLayout;
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

public class ExerciseDetailsActivity extends AppCompatActivity {

    private static String TAG ="ExerciseDetailsActivity";

    TextView exerciseNameTV;
    LinearLayout backLL;

    private String exerciseId;
    private GlobalPreference globalPreference;
    private String ip;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_exercise_details);

        exerciseId = getIntent().getStringExtra("exerciseId");

        globalPreference = new GlobalPreference(this);
        ip = globalPreference.getIP();

        exerciseNameTV = findViewById(R.id.eNameTextView);
        backLL = findViewById(R.id.backLL);

        getExerciseDetails();

        backLL.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(ExerciseDetailsActivity.this,ExercisesActivity.class);
                startActivity(intent);
            }
        });


    }

    private void getExerciseDetails() {

        StringRequest stringRequest = new StringRequest(Request.Method.GET, "http://"+ ip +"/health_monitoring/api/getExerciseDetails.php?eid="+exerciseId, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {

                Log.d(TAG, "onResponse: "+response);

                if(response.equals("failed")){
                    Toast.makeText(ExerciseDetailsActivity.this, ""+response, Toast.LENGTH_SHORT).show();
                }
                else{
                    try {
                        JSONObject jsonObject = new JSONObject(response);
                        JSONArray jsonArray = jsonObject.getJSONArray("data");
                        for(int i = 0; i < jsonArray.length(); i++) {
                            JSONObject object = jsonArray.getJSONObject(i);
                            String id = object.getString("id");
                            String exerciseName = object.getString("name");
                            String instructions = object.getString("instructions");
                            String bodyPart = object.getString("body_part");
                            String equipment = object.getString("equipment");
                            String target = object.getString("target");

                            exerciseNameTV.setText(exerciseName);


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