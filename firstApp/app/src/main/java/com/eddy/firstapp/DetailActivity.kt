package com.eddy.firstapp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import com.eddy.firstapp.databinding.ActivityDetailBinding

class DetailActivity : AppCompatActivity() {

    private val binding: ActivityDetailBinding by lazy { ActivityDetailBinding.inflate(layoutInflater) }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(binding.root)

        val imageId = intent.getIntExtra("imageId", 0)
        Log.i("imageId", imageId.toString())
        Log.i("drawable", R.drawable.ai_profile_1.toString())
        binding.imageView.setImageResource(imageId)
    }
}