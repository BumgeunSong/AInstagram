package com.eddy.firstapp

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import androidx.fragment.app.Fragment
import androidx.navigation.findNavController
import androidx.navigation.fragment.findNavController

class ImageFragment : Fragment() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.fragment_image, container, false)

        val promptListButton = view.findViewById<Button>(R.id.promptListButton)
        val promptRecyclerButton = view.findViewById<Button>(R.id.promptRecyclerButton)

        promptListButton.setOnClickListener {
            it.findNavController().navigate(R.id.action_imageFragment_to_promptFragment)
        }

        promptRecyclerButton.setOnClickListener {
            it.findNavController().navigate(R.id.action_imageFragment_to_promptRecyclerFragment)
        }

        return view
    }
}