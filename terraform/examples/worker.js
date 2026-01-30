// Example CloudFlare Worker Script
// This is a simple example that responds to HTTP requests

addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})

async function handleRequest(request) {
  // Get the request URL
  const url = new URL(request.url)
  
  // Example: Simple routing
  if (url.pathname === '/') {
    return new Response('Hello from CloudFlare Workers!', {
      status: 200,
      headers: {
        'Content-Type': 'text/plain',
      },
    })
  }
  
  if (url.pathname === '/api/health') {
    return new Response(JSON.stringify({ 
      status: 'healthy',
      timestamp: new Date().toISOString()
    }), {
      status: 200,
      headers: {
        'Content-Type': 'application/json',
      },
    })
  }
  
  // Example: Accessing KV storage
  // if (typeof MY_KV_NAMESPACE !== 'undefined') {
  //   const value = await MY_KV_NAMESPACE.get('key')
  //   return new Response(value)
  // }
  
  // Example: Environment variables
  // const apiUrl = API_URL || 'https://api.example.com'
  
  // 404 for unknown routes
  return new Response('Not Found', {
    status: 404,
    headers: {
      'Content-Type': 'text/plain',
    },
  })
}
