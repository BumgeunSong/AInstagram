package com.eddy.firstapp

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.eddy.firstapp.databinding.ActivityMainBinding
import android.widget.Adapter as Adapter

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

        val promptList = listOf<String>(
            "하늘을 나는 작은 새",
            "꽃에서 여러 페인트가 팡팡 터진다",
            "플로럴 향 핸드크림 제품 목업"
        )

        val promptAdapter = PromptAdapter(promptList)
        binding.promptListView.adapter = promptAdapter

        binding.promptListView.setOnItemClickListener { parent, view, position, id ->
            Toast.makeText(this, promptList[position], Toast.LENGTH_SHORT).show()
        }

    }
}