package com.nextgen.healthmonitoring;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

public class HealthConditionActivity extends AppCompatActivity {

    TextView healthConditionTV;
    TextView exerciseTV;
    ImageView warningIV;
    Button exercisesBT;
    String heartRate,spo2,temperature;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_health_condition);

        heartRate = getIntent().getStringExtra("heartRate");
        spo2 = getIntent().getStringExtra("spo2");
        temperature = getIntent().getStringExtra("temperature");

        healthConditionTV = findViewById(R.id.healthConditionTextView);
        exerciseTV = findViewById(R.id.exerciseHintTextView);
        warningIV = findViewById(R.id.warningImageView);
        exercisesBT = findViewById(R.id.exercisesButton);

        if (Integer.valueOf(spo2) < 80 || Integer.valueOf(heartRate) > 90 || Integer.valueOf(temperature) >= 100){

            healthConditionTV.setText("Needs Medical Attention");
            healthConditionTV.setTextColor(ContextCompat.getColor(getApplicationContext(),R.color.red));

        }

        if (Integer.valueOf(heartRate) > 90 || Integer.valueOf(temperature) >= 100){

            exercisesBT.setVisibility(View.GONE);
            exerciseTV.setVisibility(View.GONE);
            warningIV.setVisibility(View.VISIBLE);
        }

        exercisesBT.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent intent = new Intent(HealthConditionActivity.this,ExercisesActivity.class);
                startActivity(intent);

            }
        });
    }
}