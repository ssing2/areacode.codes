import re

with open('sitemap.xml', encoding='utf-8') as f:
    xml = f.read()

# 匹配所有 <loc>https://areacode.codes/xxx.html</loc>
urls = re.findall(r'<loc>https://areacode.codes/([0-9a-zA-Z]+).html</loc>', xml)

# 只保留区号页面（全数字或404areacode）
codes = []
for u in urls:
    if u.isdigit() or u == '404areacode':
        codes.append(u)

# 生成 a 标签
for code in codes:
    if code == '404areacode':
        print(f'<a href=\"404areacode.html\" class=\"area-code-item\">404</a>')
    else:
        print(f'<a href=\"{code}.html\" class=\"area-code-item\">{code}</a>')