#!/bin/bash
# 页面性能优化脚本
# 此脚本会自动为所有HTML页面应用性能优化

# 定义优化的HTML头部模板
read -r -d '' OPTIMIZED_HEAD_TEMPLATE << 'EOF'
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    
    <!-- 性能优化：预连接和DNS预取 -->
    <link rel="preconnect" href="https://cdn.jsdelivr.net" crossorigin>
    <link rel="preconnect" href="https://cdnjs.cloudflare.com" crossorigin>
    <link rel="dns-prefetch" href="https://www.googletagmanager.com">
    
    <!-- 初始加载样式优化 -->
    <style>
        body { opacity: 0; }
        .loading-fallback { 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            min-height: 100vh; 
            font-family: -apple-system, BlinkMacSystemFont, sans-serif;
        }
    </style>
    
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-6JC9EKZ6TT"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'G-6JC9EKZ6TT');
    </script>
    
    <!-- Bootstrap CSS - 异步加载优化 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" media="print" onload="this.media='all'">
    <noscript><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"></noscript>
    
    <!-- Font Awesome - 异步加载 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" media="print" onload="this.media='all'">
    <noscript><link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"></noscript>
    
    <!-- 内联基础样式以防外部CSS加载失败 -->
    <style>
        .fast-load-styles {
            --primary-color: #3b82f6;
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
            --dark-color: #1e293b;
            --light-bg: #f1f5f9;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            line-height: 1.6;
            color: var(--dark-color);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 0.5rem 1.5rem;
            border-radius: 0.375rem;
            text-decoration: none;
            color: white;
            display: inline-block;
            transition: all 0.2s;
        }
        
        .btn-primary:hover {
            background-color: #2563eb;
            border-color: #2563eb;
            color: white;
            text-decoration: none;
        }
        
        .text-primary { color: var(--primary-color) !important; }
        .text-muted { color: #6c757d !important; }
        .container { max-width: 1140px; margin: 0 auto; padding: 0 15px; }
        
        /* 关键CSS变量和基础样式 */
        :root {
            --primary-color: #3b82f6;
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
            --dark-color: #1e293b;
            --light-bg: #f1f5f9;
        }
        
        /* 加载优化 */
        * { box-sizing: border-box; }
    </style>
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="areacodes.css">
EOF

# 定义优化的JavaScript尾部模板
read -r -d '' OPTIMIZED_FOOTER_TEMPLATE << 'EOF'
    <!-- Bootstrap JS - 延迟加载以提高页面速度 -->
    <script>
        // 快速加载优化：延迟加载Bootstrap JS
        window.addEventListener('load', function() {
            const script = document.createElement('script');
            script.src = 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js';
            script.async = true;
            document.head.appendChild(script);
        });
        
        // 简单的加载状态指示
        document.addEventListener('DOMContentLoaded', function() {
            document.body.style.opacity = '1';
            document.body.style.transition = 'opacity 0.3s ease';
        });
    </script>
</body>
</html>
EOF

echo "性能优化模板已准备完成！"
echo "此模板包含以下优化："
echo "1. 异步CSS加载"
echo "2. 内联关键样式"
echo "3. DNS预取和预连接"
echo "4. 延迟JavaScript加载"
echo "5. 渐进式页面渲染"
