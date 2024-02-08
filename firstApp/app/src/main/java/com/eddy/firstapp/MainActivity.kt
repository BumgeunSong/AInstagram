package com.eddy.firstapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageView
import android.widget.Toast

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val profile1 = findViewById<ImageView>(R.id.profile_1)
        profile1.setOnClickListener {
            Toast.makeText(this, "1번이 클릭되었음!", Toast.LENGTH_LONG).show()
        }
    }
}