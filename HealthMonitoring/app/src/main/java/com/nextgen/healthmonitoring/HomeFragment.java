package com.nextgen.healthmonitoring;

import android.content.Intent;
import android.os.Bundle;

import androidx.cardview.widget.CardView;
import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

/**
    HomeFragment
 */
public class HomeFragment extends Fragment {

    // TODO: Rename parameter arguments, choose names that match
    View view;

    CardView heartRateCV;
    CardView spo2CV;
    CardView temperatureCV;
    CardView healthDataCV;
    CardView diseasePredictionCV;


    public HomeFragment() {
        // Required empty public constructor
    }


    // TODO: Rename and change types and number of parameters
    public static HomeFragment newInstance(String param1, String param2) {
        HomeFragment fragment = new HomeFragment();
        Bundle args = new Bundle();

        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        view = inflater.inflate(R.layout.fragment_home, container, false);

        heartRateCV = view.findViewById(R.id.card_heartRate);
        spo2CV = view.findViewById(R.id.card_spo2);
        temperatureCV = view.findViewById(R.id.card_temperature);
        healthDataCV = view.findViewById(R.id.card_healthData);
        diseasePredictionCV = view.findViewById(R.id.card_disease);

        heartRateCV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getContext(),HeartRateActivity.class);
                startActivity(intent);
            }
        });

        spo2CV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getContext(),Spo2Activity.class);
                startActivity(intent);
            }
        });

        heartRateCV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getContext(),HeartRateActivity.class);
                startActivity(intent);
            }
        });
        temperatureCV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getContext(),TemperatureActivity.class);
                startActivity(intent);
            }
        });


        healthDataCV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getContext(),HealthDataActivity.class);
                startActivity(intent);
            }
        });

        diseasePredictionCV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getContext(),DiseasePredictionActivity.class);
                startActivity(intent);
            }
        });



        return view;
    }
}