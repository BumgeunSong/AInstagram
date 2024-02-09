package com.eddy.firstapp

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.eddy.firstapp.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        val view = binding.root
        setContentView(view)

        val res: Int = R.drawable.ai_profile_1
        binding.profile1.setOnClickListener {
            val intent = Intent(this, DetailActivity::class.java)
            intent.putExtra("imageId", R.drawable.ai_profile_1)
            startActivity(intent)
        }

        binding.profile2.setOnClickListener {
            val intent = Intent(this, DetailActivity::class.java)
            intent.putExtra("imageId", R.drawable.ai_profile_2)
            startActivity(intent)
        }

        binding.profile3.setOnClickListener {
            val intent = Intent(this, DetailActivity::class.java)
            intent.putExtra("imageId", R.drawable.ai_profile_3)
            startActivity(intent)
        }

        binding.profile4.setOnClickListener {
            val intent = Intent(this, DetailActivity::class.java)
            intent.putExtra("imageId", R.drawable.ai_profile_4)
            startActivity(intent)
        }

        binding.profile5.setOnClickListener {
            val intent = Intent(this, DetailActivity::class.java)
            intent.putExtra("imageId", R.drawable.ai_profile_5)
            startActivity(intent)
        }
    }
}