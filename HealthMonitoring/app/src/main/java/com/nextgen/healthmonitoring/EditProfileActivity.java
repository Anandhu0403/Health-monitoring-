package com.nextgen.healthmonitoring;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Base64;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
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

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import de.hdodenhof.circleimageview.CircleImageView;

public class EditProfileActivity extends AppCompatActivity {

    EditText nameET;
    EditText emailET;
    EditText addressET;
    EditText numberET;
    EditText bloodgroupET;
    EditText heightET;
    EditText weightET;
    EditText ageET;
    TextView changePasswordTV;
    TextView submitTV;
    CircleImageView profileIV;

    ImageView backIV;

    private Intent intent;
    String intentResponse;
    private GlobalPreference globalPreference;
    private String ip,uid;
    private int PICK_IMAGE_REQUEST = 1;
    private Bitmap bitmap;
    private String image = "";

    boolean IMAGE_CHANGE = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_profile);

        globalPreference = new GlobalPreference(this);
        ip = globalPreference.getIP();
        uid = globalPreference.getID();

        intent = getIntent();
        intentResponse = intent.getStringExtra("userdata");

        nameET = findViewById(R.id.pNameEditText);
        emailET = findViewById(R.id.pEmailEditText);
        addressET = findViewById(R.id.pAddressEditText);
        numberET = findViewById(R.id.pNumberEditText);
        bloodgroupET = findViewById(R.id.pbloodgroupEditText);
        heightET = findViewById(R.id.pHeightEditText);
        weightET = findViewById(R.id.pWeightEditText);
        ageET = findViewById(R.id.pAgeEditText);
        changePasswordTV = findViewById(R.id.changePasswordTextView);
        submitTV = findViewById(R.id.pSubmitButtonTextView);
        profileIV = findViewById(R.id.eUserImageView);
        backIV = findViewById(R.id.BackImageButton);

        setData(intentResponse);

        profileIV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                showFileChooser();
            }
        });

        submitTV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                updateData();
            }
        });

        changePasswordTV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EditProfileActivity.this,ProfileActivity.class);
                startActivity(intent);
            }
        });

        backIV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(EditProfileActivity.this,HomeActivity.class);
                startActivity(intent);
                finish();
            }
        });
    }

    private void showFileChooser() {
        Intent intent = new Intent();
        intent.setType("image/*");
        intent.setAction(Intent.ACTION_GET_CONTENT);
        startActivityForResult(Intent.createChooser(intent, "Select Picture"), PICK_IMAGE_REQUEST);
    }

    public String getStringImage(Bitmap bmp) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        bmp.compress(Bitmap.CompressFormat.JPEG, 100, baos);
        byte[] imageBytes = baos.toByteArray();
        String encodedImage = Base64.encodeToString(imageBytes, Base64.DEFAULT);
        return encodedImage;
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (requestCode == PICK_IMAGE_REQUEST && resultCode == RESULT_OK && data != null && data.getData() != null) {
            Uri filePath = data.getData();
            try {
                //Getting the Bitmap from Gallery
                bitmap = MediaStore.Images.Media.getBitmap(getApplication().getContentResolver(), filePath);
                //Setting the Bitmap to ImageView
                profileIV.setImageBitmap(bitmap);
                IMAGE_CHANGE = true;

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void setData(String response) {

        try{
            JSONObject obj = new JSONObject(response);
            JSONArray array = obj.getJSONArray("data");
            JSONObject data = array.getJSONObject(0);

            String uName = data.getString("name");
            String uEmail = data.getString("email");
            String uAddress = data.getString("address");
            String uNumber = data.getString("number");
            String uBloodgroup = data.getString("blood_group");
            String uHeight = data.getString("height");
            String uWeight = data.getString("weight");
            String uAge = data.getString("age");
            String image = data.getString("userimage");


            nameET.setText(uName);
            emailET.setText(uEmail);
            addressET.setText(uAddress);
            numberET.setText(uNumber);
            bloodgroupET.setText(uBloodgroup);
            heightET.setText(uHeight);
            weightET.setText(uWeight);
            ageET.setText(uAge);

            if (!image.equals("")) {
                Glide.with(getApplicationContext())
                        .load("http://" + ip + "/health_monitoring/user_tbl/uploads/" + image)
                        .into(profileIV);
            }

        }catch (JSONException e){
            e.printStackTrace();
        }
    }

    private void updateData() {
        String URL = "http://"+ ip +"/health_monitoring/api/editProfile.php";

        if(IMAGE_CHANGE) {
            image = getStringImage(bitmap);
        }


        StringRequest stringRequest = new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {

                Toast.makeText(EditProfileActivity.this,""+response,Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(EditProfileActivity.this,ProfileActivity.class);
                startActivity(intent);
                finish();
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(EditProfileActivity.this,""+error,Toast.LENGTH_SHORT).show();
            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> params = new HashMap<>();

                params.put("name",nameET.getText().toString());
                params.put("email",emailET.getText().toString());
                params.put("address",addressET.getText().toString());
                params.put("number",numberET.getText().toString());
                params.put("bloodGroup",bloodgroupET.getText().toString());
                params.put("height",heightET.getText().toString());
                params.put("weight",weightET.getText().toString());
                params.put("age",ageET.getText().toString());
                params.put("uid",uid);
                if(IMAGE_CHANGE)
                    params.put("image",image);
                return params;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        requestQueue.add(stringRequest);
    }
}