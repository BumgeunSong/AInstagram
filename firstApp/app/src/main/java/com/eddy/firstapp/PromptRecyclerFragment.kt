package com.eddy.firstapp

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import androidx.navigation.findNavController

class PromptRecyclerFragment : Fragment() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val view = inflater.inflate(R.layout.fragment_image, container, false)

        val imageButton = view.findViewById<Button>(R.id.imageButton)
        val promptListButton = view.findViewById<Button>(R.id.promptListButton)

        imageButton.setOnClickListener {
            it.findNavController().navigate(R.id.action_promptRecyclerFragment_to_imageFragment)
        }

        promptListButton.setOnClickListener {
            it.findNavController().navigate(R.id.action_promptRecyclerFragment_to_promptFragment)
        }

        return view
    }
}