package com.eddy.firstapp

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import androidx.navigation.findNavController
import androidx.navigation.fragment.findNavController
import com.eddy.firstapp.databinding.ActivityMainBinding
import com.eddy.firstapp.databinding.FragmentImageBinding
import com.eddy.firstapp.databinding.FragmentPromptBinding

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

    private var _binding: FragmentPromptBinding? = null
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
        _binding = FragmentPromptBinding.inflate(inflater, container, false)
        val view = binding.root

        val promptList = listOf<Prompt>(
            Prompt("minji0_rose", imageURL = null),
            Prompt("Kate_Min", imageURL = null),
            Prompt("Vanilla_choco", imageURL = null),
            Prompt("Hackers_182", imageURL = null),
            Prompt("Summer_rabbit", imageURL = null),
        )

        val promptAdapter = PromptAdapter(promptList)
        binding.promptListView.adapter = promptAdapter

        binding.imageButton.setOnClickListener {
            it.findNavController().navigate(R.id.action_promptFragment_to_imageFragment)
        }

        binding.promptRecyclerButton.setOnClickListener {
            it.findNavController().navigate(R.id.action_promptFragment_to_promptRecyclerFragment)
        }

        return view
    }
}