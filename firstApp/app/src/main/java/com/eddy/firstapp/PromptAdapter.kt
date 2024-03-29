package com.eddy.firstapp

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.ImageView
import android.widget.TextView
import com.eddy.firstapp.databinding.ActivityDetailBinding
import com.eddy.firstapp.databinding.ActivityMainBinding
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class PromptAdapter(val List: List<Prompt>): BaseAdapter() {

    private lateinit var binding: ActivityMainBinding

    override fun getCount(): Int {
        return List.size
    }

    override fun getItem(position: Int): Any {
        return List[position]
    }

    override fun getItemId(position: Int): Long {
        return position.toLong()
    }

    override fun getView(position: Int, convertView: View?, parent: ViewGroup?): View {

        if (convertView == null) {
            val promptItemView = LayoutInflater.from(parent?.context).inflate(R.layout.item_prompt, parent, false)
            promptItemView!!.findViewById<TextView>(R.id.promptItem).text = List[position].text
            return promptItemView
        }

        return convertView
    }

}