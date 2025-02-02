package com.nextgen.healthmonitoring;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
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

import java.util.HashMap;
import java.util.Map;

import de.hdodenhof.circleimageview.CircleImageView;

public class ProfileActivity extends AppCompatActivity {

    TextView nameTV;
    TextView emailTV;
    TextView numberTV;
    TextView bloodGroupTV;
    TextView heightTV;
    TextView weightTV;
    TextView ageTV;
    ImageView backButtonIV;
    CircleImageView profileIV;
    RelativeLayout editProfileRL;
    RelativeLayout changePasswordRL;
    RelativeLayout logoutRL;

    private  GlobalPreference globalPreference;
    private String ip,uid;
    String userdata;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);

        globalPreference = new GlobalPreference(this);
        ip = globalPreference.getIP();
        uid = globalPreference.getID();

        nameTV = findViewById(R.id.pNameTextView);
        emailTV = findViewById(R.id.pEmailTextView);
        numberTV = findViewById(R.id.pNumberTextView);
        bloodGroupTV = findViewById(R.id.pBloodGroupTextView);
        heightTV = findViewById(R.id.pHeightTextView);
        weightTV = findViewById(R.id.pWeightTextView);
        ageTV = findViewById(R.id.pAgeTextView);
        backButtonIV = findViewById(R.id.profileBackImageView);
        profileIV = findViewById(R.id.pUserImageView);
        editProfileRL = findViewById(R.id.editProfileRL);
        changePasswordRL = findViewById(R.id.changePasswordRL);
        logoutRL = findViewById(R.id.logoutRL);

        getUserDetails();

        changePasswordRL.setVisibility(View.GONE);

        editProfileRL.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

               Intent intent = new Intent(ProfileActivity.this,EditProfileActivity.class);
               intent.putExtra("userdata",userdata);
                startActivity(intent);
            }
        });

        changePasswordRL.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
               // Intent intent = new Intent(ProfileActivity.this,ChangePasswordActivity.class);
               // startActivity(intent);
            }
        });

        logoutRL.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                logout();
            }
        });

        backButtonIV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(ProfileActivity.this,HomeActivity.class);
                startActivity(intent);
                finish();
            }
        });
    }

    private void getUserDetails() {
        StringRequest stringRequest = new StringRequest(Request.Method.POST, "http://"+ ip +"/health_monitoring/api/getUserDetails.php", new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {

                try{

                    userdata = response;

                    JSONObject obj = new JSONObject(response);
                    JSONArray array = obj.getJSONArray("data");
                    JSONObject jsonObject = array.getJSONObject(0);

                    String name = jsonObject.getString("name");
                    String email = jsonObject.getString("email");
                    String number = jsonObject.getString("number");
                    String bloodGroup = jsonObject.getString("blood_group");
                    String height = jsonObject.getString("height");
                    String weight = jsonObject.getString("weight");
                    String age = jsonObject.getString("age");
                    String image = jsonObject.getString("userimage");

                    nameTV.setText(name);
                    emailTV.setText(email);
                    numberTV.setText(number);
                    bloodGroupTV.setText(bloodGroup);
                    heightTV.setText(height+" cm");
                    weightTV.setText(weight+" KG");
                    ageTV.setText(age+" years");

                    if (!image.equals("")) {
                        Glide.with(getApplicationContext())
                                .load("http://" + ip + "/health_at_home/patient_tbl/uploads/" + image)
                                .into(profileIV);
                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(ProfileActivity.this, ""+error, Toast.LENGTH_SHORT).show();
            }
        }){
            @Nullable
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> params = new HashMap<>();
                params.put("uid",uid);
                return params;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(ProfileActivity.this);
        requestQueue.add(stringRequest);
    }

    private void logout() {

        new AlertDialog.Builder(ProfileActivity.this)
                .setMessage("Are you sure you want to Logout?")
                .setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        Intent intent = new Intent(ProfileActivity.this,MainActivity.class);
                        startActivity(intent);
                        finish();
                    }
                })
                .setNegativeButton("No", null)
                .show();
    }
}