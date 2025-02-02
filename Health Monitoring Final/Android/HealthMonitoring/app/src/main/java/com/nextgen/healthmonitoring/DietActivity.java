package com.nextgen.healthmonitoring;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class DietActivity extends AppCompatActivity {

    private String ip;
    private GlobalPreference globalPreference;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_diet);


        globalPreference = new GlobalPreference(this);
        ip = globalPreference.getIP();

        String url = "http://"+ip+"/health_monitoring/api/dietPlans.php";

        WebView view = (WebView) findViewById(R.id.dietWebView);
        view.getSettings().setJavaScriptEnabled(true);
        view.loadUrl(url);
        view.setWebViewClient(new WebViewClient());
    }
}