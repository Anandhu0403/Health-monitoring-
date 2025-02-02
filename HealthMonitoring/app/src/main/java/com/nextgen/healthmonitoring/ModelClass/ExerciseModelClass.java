package com.nextgen.healthmonitoring.ModelClass;

public class ExerciseModelClass {

    String id;
    String exerciseName;
    String instructions;
    String bodyPart;
    String equipment;
    String target;

    public ExerciseModelClass(String id,String exerciseName,String instructions,String bodyPart,String equipment,String target) {
        this.id = id;
        this.exerciseName = exerciseName;
        this.instructions = instructions;
        this.bodyPart = bodyPart;
        this.equipment = equipment;
        this.target = target;
    }

    public String getId(){
        return id;
    }

    public String getExerciseName(){
        return exerciseName;
    }

    public String getInstructions(){
        return instructions;
    }
    public String getBodyPart(){
        return bodyPart;
    }

    public String getEquipment(){
        return equipment;
    }

    public String getTarget(){
        return target;
    }

}
