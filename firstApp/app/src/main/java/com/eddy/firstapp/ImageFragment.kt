package com.eddy.firstapp

import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.Toast
import androidx.fragment.app.Fragment
import androidx.navigation.findNavController
import androidx.navigation.fragment.findNavController
import com.eddy.firstapp.databinding.FragmentImageBinding

class ImageFragment : Fragment() {

    private var _binding: FragmentImageBinding? = null
    // This property is only valid between onCreateView and
// onDestroyView.
    private val binding get() = _binding!!
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentImageBinding.inflate(inflater, container, false)
        val view = binding.root

        binding.promptListButton.setOnClickListener {
            Log.i("ImageFragment", "promptListButton")
            it.findNavController().navigate(R.id.action_imageFragment_to_promptFragment)
        }

        binding.promptRecyclerButton.setOnClickListener {
            Log.i("ImageFragment", "promptRecyclerButton")
            it.findNavController().navigate(R.id.action_imageFragment_to_promptRecyclerFragment)
        }

        return view
    }
}