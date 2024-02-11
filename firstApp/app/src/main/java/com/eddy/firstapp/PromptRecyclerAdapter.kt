package com.eddy.firstapp

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class PromptRecyclerAdapter(val items: List<Prompt>) : RecyclerView.Adapter<PromptRecyclerAdapter.ViewHolder>() {
    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): PromptRecyclerAdapter.ViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_prompt_recycler, parent, false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: PromptRecyclerAdapter.ViewHolder, position: Int) {
        holder.bindItems(items[position])
    }

    override fun getItemCount(): Int {
        return items.size
    }

    inner class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        fun bindItems(item: Prompt) {
            val textView = itemView.findViewById<TextView>(R.id.recyclerItemText)
            textView.text = item.text
        }
    }
}