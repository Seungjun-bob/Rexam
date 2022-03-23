url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"

text <- read_html(url)
text

# 문제1
h1 <- html_nodes(text, "h1") # 태그 선택자
html_text(h1)

# 문제2
links <- html_nodes(text, "a")
html_attr(links, 'href')

# 문제3
img <- html_nodes(text, 'img')
html_attr(img, 'src')


# 문제4
h2 <- html_nodes(text, "h2:nth-of-type(1)")
h2_title <- html_text(h2)
h2_title

# 문제5
colors <- html_nodes(text, "ul > li:nth-child(3)")
html_text(colors)

# 문제5
h2 <- html_nodes(text, "h2:nth-of-type(2)")
html_text(h2)


# 문제6
foods <- html_nodes(text, "ol > li")
html_text(foods)


# 문제7
table <- html_nodes(text, 'table * ')
html_text(table)


# 문제8
name <- html_nodes(text, '.name')
html_text(name)

# 문제9
target <- html_nodes(text, '#target')
html_text(target)

