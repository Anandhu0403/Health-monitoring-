package com.nextgen.healthmonitoring;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Base64;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import de.hdodenhof.circleimageview.CircleImageView;

public class RegisterActivity extends AppCompatActivity {

    EditText nameET;
    EditText numberET;
    EditText emailET;
    EditText addressET;
    EditText ageET;
    EditText bloodGroupET;
    EditText heightET;
    EditText weightET;
    EditText usernameET;
    EditText passwordET;
    Button registerBT;
    TextView signInTV;

    CircleImageView userImageIV;

    private GlobalPreference globalPreference;
    private String ip;
    RadioGroup genderRG;
    String gender;

    private Bitmap bitmap;
    private String image = "";
    private boolean iset = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        globalPreference = new GlobalPreference(this);
        ip = globalPreference.getIP();

        nameET = findViewById(R.id.nameEditText);
        numberET = findViewById(R.id.numberEditText);
        emailET = findViewById(R.id.emailEditText);
        addressET = findViewById(R.id.addressEditText);
        ageET = findViewById(R.id.ageEditText);
        bloodGroupET = findViewById(R.id.bloodGroupEditText);
        heightET = findViewById(R.id.heightEditText);
        weightET = findViewById(R.id.weightEditText);
        usernameET = findViewById(R.id.usernameEditText);
        passwordET = findViewById(R.id.passwordEditText);
        registerBT = findViewById(R.id.registerButton);
        userImageIV = findViewById(R.id.userImageView);
        signInTV = findViewById(R.id.signInTextView);
        genderRG = findViewById(R.id.genderRadioGroup);

        genderRG.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(RadioGroup group, int checkedId) {

                RadioButton radioButton = findViewById(checkedId);
                gender = radioButton.getText().toString();

            }
        });

        registerBT.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                check();
            }
        });

        userImageIV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent();
                intent.setType("image/*");
                intent.setAction(Intent.ACTION_GET_CONTENT);
                startActivityForResult(Intent.createChooser(intent, "Select Picture"), 100);
            }
        });

        signInTV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent intent = new Intent(RegisterActivity.this,LoginActivity.class);
                startActivity(intent);
            }
        });


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

        if (requestCode == 100 && resultCode == RESULT_OK && data != null && data.getData() != null) {
            Uri filePath = data.getData();
            try {
                //Getting the Bitmap from Gallery
                bitmap = MediaStore.Images.Media.getBitmap(getApplication().getContentResolver(), filePath);
                //Setting the Bitmap to ImageView
                userImageIV.setImageBitmap(bitmap);
                iset = true;

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void check() {

        if (iset == true){
            image = getStringImage(bitmap);
            register();
        }
        else{
            Toast.makeText(this, "Please Select Image", Toast.LENGTH_SHORT).show();
        }
    }

    private void register() {

        StringRequest stringRequest = new StringRequest(Request.Method.POST, "http://"+ ip +"/health_monitoring/api/register.php", new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {

                if (response.equals("success")){

                    Intent intent = new Intent(RegisterActivity.this,LoginActivity.class);
                    startActivity(intent);

                }else {
                    Toast.makeText(RegisterActivity.this, ""+response, Toast.LENGTH_SHORT).show();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                Toast.makeText(RegisterActivity.this, ""+error, Toast.LENGTH_SHORT).show();
            }
        }){
            @Override
            @Nullable
            protected Map<String,String> getParams() throws AuthFailureError {
                Map<String,String> params = new HashMap<>();
                params.put("name",nameET.getText().toString());
                params.put("number",numberET.getText().toString());
                params.put("email",emailET.getText().toString());
                params.put("address",addressET.getText().toString());
                params.put("age",ageET.getText().toString());
                params.put("gender",gender);
                params.put("bloodGroup",bloodGroupET.getText().toString());
                params.put("height",heightET.getText().toString());
                params.put("weight",weightET.getText().toString());
                params.put("username",usernameET.getText().toString());
                params.put("password",passwordET.getText().toString());
                params.put("image",image);
                return params;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(RegisterActivity.this);
        requestQueue.add(stringRequest);
    }
}