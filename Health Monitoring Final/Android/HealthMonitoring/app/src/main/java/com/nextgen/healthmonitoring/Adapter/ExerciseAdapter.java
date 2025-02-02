package com.nextgen.healthmonitoring.Adapter;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.nextgen.healthmonitoring.ExerciseDetailsActivity;
import com.nextgen.healthmonitoring.GlobalPreference;
import com.nextgen.healthmonitoring.HomeActivity;
import com.nextgen.healthmonitoring.ModelClass.ExerciseModelClass;
import com.nextgen.healthmonitoring.ProfileActivity;
import com.nextgen.healthmonitoring.R;

import java.util.ArrayList;

public class ExerciseAdapter extends RecyclerView.Adapter<ExerciseAdapter.MyViewHolder>{

    ArrayList<ExerciseModelClass> list;
    Context context;
    String ip;

    public ExerciseAdapter(ArrayList<ExerciseModelClass> list, Context context) {
        this.list = list;
        this.context = context;

        GlobalPreference globalPreference = new GlobalPreference(context);
        ip = globalPreference.getIP();
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.raw_exercises,parent,false);
        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {

        ExerciseModelClass exerciseList = list.get(position);
        holder.exerciseNameTV.setText(exerciseList.getExerciseName());
        holder.instructionsTV.setText(exerciseList.getInstructions());
        holder.bodyPartTV.setText(exerciseList.getBodyPart());
        holder.equipmentTV.setText(exerciseList.getEquipment());
        holder.targetTV.setText(exerciseList.getTarget());




      /*  holder.exerciseCV.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                Intent intent = new Intent(context, ExerciseDetailsActivity.class);
                intent.putExtra("exerciseId",exerciseList.getId());
                context.startActivity(intent);
            }
        });*/

    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {

        TextView exerciseNameTV;
        TextView instructionsTV;
        TextView bodyPartTV;
        TextView equipmentTV;
        TextView targetTV;
        TextView seemoreTV;
        CardView exerciseCV;

        public MyViewHolder(@NonNull View itemview) {
            super(itemview);

            exerciseNameTV = itemview.findViewById(R.id.exerciseNameTextView);
            instructionsTV = itemview.findViewById(R.id.instructionsTextView);
            bodyPartTV = itemview.findViewById(R.id.bodyPartTextView);
            equipmentTV = itemview.findViewById(R.id.equipmentTextView);
            targetTV = itemview.findViewById(R.id.targetTextView);
            seemoreTV = itemview.findViewById(R.id.seemoreTV);
            exerciseCV = itemview.findViewById(R.id.exerciseCV);



        }
    }
}
