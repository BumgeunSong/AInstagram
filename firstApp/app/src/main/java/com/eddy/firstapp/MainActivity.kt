package com.eddy.firstapp

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.recyclerview.widget.RecyclerView.OnItemTouchListener
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

        val promptList = listOf<Prompt>(
            Prompt("minji0_rose", imageURL = null),
            Prompt("Kate_Min", imageURL = null),
            Prompt("Vanilla_choco", imageURL = null),
            Prompt("Hackers_182", imageURL = null),
            Prompt("Summer_rabbit", imageURL = null),
        )

        val promptAdapter = PromptAdapter(promptList)
        binding.promptListView.adapter = promptAdapter

        binding.promptListView.setOnItemClickListener { parent, view, position, id ->
            Toast.makeText(this, promptList[position].text, Toast.LENGTH_SHORT).show()
        }

        val promptRecyclerAdapter = PromptRecyclerAdapter(promptList)
        binding.promptRecyclerView.adapter = promptRecyclerAdapter

    }
}