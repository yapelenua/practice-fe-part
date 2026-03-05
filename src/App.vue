<template>
  <div style="font-family: Arial; padding: 40px">
    <h1>Vue → Node Demo</h1>

    <button @click="fetchHello">
      Call Backend
    </button>

    <p v-if="loading">Loading...</p>
    <p v-if="message">Message: {{ message }}</p>
    <p v-if="error" style="color: red">{{ error }}</p>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import axios from 'axios'

const message = ref('')
const loading = ref(false)
const error = ref(null)

async function fetchHello() {
  loading.value = true
  error.value = null

  try {
    const response = await axios.get('http://localhost:8080/hello')
    const data = response.data
    message.value = data.message
  } catch (err) {
    error.value = 'Failed to fetch data'
  } finally {
    loading.value = false
  }
}
</script>