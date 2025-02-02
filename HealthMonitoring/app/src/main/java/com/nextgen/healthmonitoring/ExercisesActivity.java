package com.nextgen.healthmonitoring;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

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
import com.nextgen.healthmonitoring.Adapter.ExerciseAdapter;
import com.nextgen.healthmonitoring.ModelClass.ExerciseModelClass;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class ExercisesActivity extends AppCompatActivity {

    private static String TAG ="ExercisesActivity";

    RecyclerView exercisesRV;
    ArrayList<ExerciseModelClass> list;

    private GlobalPreference globalPreference;
    private String ip,uid;

    private ImageView BackIV;
    private TextView appBarTV;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_exercises);

        globalPreference = new GlobalPreference(this);
        ip = globalPreference.getIP();
        uid = globalPreference.getID();

        exercisesRV = findViewById(R.id.exercisesRecyclerView);
        LinearLayoutManager layoutManager = new LinearLayoutManager(this);
        exercisesRV.setLayoutManager(layoutManager);

        BackIV = findViewById(R.id.BackImageButton);
        appBarTV = findViewById(R.id.appBarTitle);
        appBarTV.setText("Exercises");

        getExercises();

        BackIV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(ExercisesActivity.this,HomeActivity.class);
                startActivity(intent);
            }
        });
    }

    private void getExercises() {

        list = new ArrayList<>();

        StringRequest stringRequest = new StringRequest(Request.Method.GET, "http://"+ ip +"/health_monitoring/api/getExercises.php", new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {

                Log.d(TAG, "onResponse: "+response);

                if (response.equals("failed")){
                    Toast.makeText(ExercisesActivity.this, "No Exercises Available", Toast.LENGTH_SHORT).show();
                }
                else{
                    try{
                        JSONObject jsonObject = new JSONObject(response);
                        JSONArray jsonArray = jsonObject.getJSONArray("data");
                        for (int i=0; i< jsonArray.length();i++){
                            JSONObject object = jsonArray.getJSONObject(i);
                            String id = object.getString("id");
                            String exerciseName = object.getString("name");
                            String instructions = object.getString("instructions");
                            String bodyPart = object.getString("body_part");
                            String equipment = object.getString("equipment");
                            String target = object.getString("target");


                            list.add(new ExerciseModelClass(id,exerciseName,instructions,bodyPart,equipment,target));

                        }

                        ExerciseAdapter adapter = new ExerciseAdapter(list,ExercisesActivity.this);
                        exercisesRV.setAdapter(adapter);

                    } catch(JSONException e){
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
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);

    }
}