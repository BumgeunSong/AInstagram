package com.eddy.firstapp

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import androidx.navigation.findNavController
import com.eddy.firstapp.databinding.FragmentPromptRecyclerBinding

class PromptRecyclerFragment : Fragment() {

    private var _binding: FragmentPromptRecyclerBinding? = null
    private val binding get() = _binding!!

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentPromptRecyclerBinding.inflate(inflater, container, false)
        val view = binding.root

        val promptList = listOf<Prompt>(
            Prompt("minji0_rose", imageURL = null),
            Prompt("Kate_Min", imageURL = null),
            Prompt("Vanilla_choco", imageURL = null),
            Prompt("Hackers_182", imageURL = null),
            Prompt("Summer_rabbit", imageURL = null),
        )

        val promptRecyclerAdapter = PromptRecyclerAdapter(promptList)
        binding.promptRecyclerView.adapter = promptRecyclerAdapter

        binding.imageButton.setOnClickListener {
            it.findNavController().navigate(R.id.action_promptRecyclerFragment_to_imageFragment)
        }

        binding.promptListButton.setOnClickListener {
            it.findNavController().navigate(R.id.action_promptRecyclerFragment_to_promptFragment)
        }

        return view
    }
}