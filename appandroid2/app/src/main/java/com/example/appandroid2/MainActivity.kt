package com.example.appandroid2

import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        var btn_limpar = findViewById<Button>(R.id.btn_limpa)
        var btn_copia = findViewById<Button>(R.id.btn_copia)
        var field = findViewById<TextView>(R.id.field)

        btn_limpar.setOnClickListener { field.text = "" }

        btn_copia.setOnClickListener {
            field.text = pasteTextFromClipboard()
        }

    }

    private fun pasteTextFromClipboard(): CharSequence? {
        val clipboardManager = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
        var texto_copiado =  clipboardManager.primaryClip?.getItemAt(0)?.text
        return texto_copiado
    }

}