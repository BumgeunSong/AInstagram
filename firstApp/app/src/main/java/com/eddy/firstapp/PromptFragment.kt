package com.eddy.firstapp

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import androidx.navigation.findNavController
import androidx.navigation.fragment.findNavController

// TODO: Rename parameter arguments, choose names that match
// the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
private const val ARG_PARAM1 = "param1"
private const val ARG_PARAM2 = "param2"

/**
 * A simple [Fragment] subclass.
 * Use the [PromptFragment.newInstance] factory method to
 * create an instance of this fragment.
 */
class PromptFragment : Fragment() {
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
        val promptRecyclerButton = view.findViewById<Button>(R.id.promptRecyclerButton)

        imageButton.setOnClickListener {
            it.findNavController().navigate(R.id.action_promptFragment_to_imageFragment)
        }

        promptRecyclerButton.setOnClickListener {
            it.findNavController().navigate(R.id.action_promptFragment_to_promptRecyclerFragment)
        }

        return view
    }
}