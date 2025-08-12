#!/bin/bash

# Convert markdown files to HTML for GitHub Pages

# Check if pandoc is available
if ! command -v pandoc &> /dev/null; then
    echo "Installing pandoc with homebrew..."
    brew install pandoc
fi

# Create HTML template
cat > template.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title$ - InvestorPrez Documentation</title>
    <meta name="description" content="InvestorPrez documentation">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            background: #fff;
            max-width: 1000px;
            margin: 0 auto;
            padding: 2rem;
        }
        
        .nav-bar {
            background: #667eea;
            color: white;
            padding: 1rem;
            margin: -2rem -2rem 2rem -2rem;
            border-radius: 0;
        }
        
        .nav-bar a {
            color: white;
            text-decoration: none;
            margin-right: 1rem;
        }
        
        .nav-bar a:hover {
            text-decoration: underline;
        }
        
        h1, h2, h3, h4, h5, h6 {
            color: #2d3748;
            margin: 1.5rem 0 1rem 0;
        }
        
        h1 {
            border-bottom: 2px solid #e2e8f0;
            padding-bottom: 0.5rem;
        }
        
        p {
            margin: 1rem 0;
        }
        
        a {
            color: #667eea;
            text-decoration: none;
        }
        
        a:hover {
            text-decoration: underline;
        }
        
        pre {
            background: #f7fafc;
            border: 1px solid #e2e8f0;
            border-radius: 6px;
            padding: 1rem;
            overflow-x: auto;
            margin: 1rem 0;
        }
        
        code {
            background: #f7fafc;
            padding: 0.2rem 0.4rem;
            border-radius: 3px;
            font-size: 0.9em;
        }
        
        pre code {
            background: none;
            padding: 0;
        }
        
        blockquote {
            border-left: 4px solid #667eea;
            padding-left: 1rem;
            margin: 1rem 0;
            font-style: italic;
            color: #666;
        }
        
        table {
            border-collapse: collapse;
            width: 100%;
            margin: 1rem 0;
        }
        
        th, td {
            border: 1px solid #e2e8f0;
            padding: 0.5rem;
            text-align: left;
        }
        
        th {
            background: #f7fafc;
            font-weight: 600;
        }
        
        ul, ol {
            margin: 1rem 0 1rem 2rem;
        }
        
        .footer {
            margin-top: 3rem;
            padding-top: 1rem;
            border-top: 1px solid #e2e8f0;
            text-align: center;
            color: #666;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="nav-bar">
        <a href="../../../">🏠 Home</a>
        <a href="../../">📚 Documentation</a>
        <a href="https://app.investorprez.com">🚀 InvestorPrez App</a>
    </div>
    
    $body$
    
    <div class="footer">
        <p>InvestorPrez Documentation | <a href="https://investorprez.github.io/investorprez-docs/">Documentation Home</a></p>
    </div>
</body>
</html>
EOF

# Function to convert markdown to HTML
convert_md_to_html() {
    local md_file="$1"
    local html_file="${md_file%.md}.html"
    local title=$(basename "$md_file" .md | sed 's/_/ /g')
    
    echo "Converting: $md_file -> $html_file"
    
    pandoc "$md_file" \
        --from markdown \
        --to html \
        --standalone \
        --template template.html \
        --metadata title="$title" \
        --output "$html_file"
}

# Convert all markdown files in docs directory
find docs -name "*.md" -type f | while read -r file; do
    convert_md_to_html "$file"
done

# Convert root markdown files (except index.md which has a custom HTML)
for file in *.md; do
    if [[ -f "$file" ]] && [[ "$file" != "index.md" ]]; then
        convert_md_to_html "$file"
    fi
done

# Create directory index pages
create_index() {
    local dir="$1"
    local index_file="$dir/index.html"
    
    echo "Creating index for: $dir"
    
    cat > "$index_file" << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$(basename "$dir") - InvestorPrez Documentation</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', sans-serif; margin: 2rem; }
        h1 { color: #2d3748; border-bottom: 2px solid #e2e8f0; padding-bottom: 0.5rem; }
        ul { list-style: none; padding: 0; }
        li { margin: 0.5rem 0; }
        a { color: #667eea; text-decoration: none; display: block; padding: 0.5rem; border-radius: 6px; }
        a:hover { background: #f7fafc; text-decoration: underline; }
        .nav { margin-bottom: 2rem; }
        .nav a { display: inline; margin-right: 1rem; }
    </style>
</head>
<body>
    <div class="nav">
        <a href="../">⬅️ Back</a>
        <a href="../../../">🏠 Home</a>
    </div>
    
    <h1>📁 $(basename "$dir" | sed 's/-/ /g' | sed 's/.*/\u&/')</h1>
    
    <ul>
EOF

    # Add HTML files to index
    find "$dir" -maxdepth 1 -name "*.html" -not -name "index.html" | sort | while read -r file; do
        local filename=$(basename "$file" .html)
        local title=$(echo "$filename" | sed 's/_/ /g')
        echo "        <li><a href=\"$(basename "$file")\">📄 $title</a></li>" >> "$index_file"
    done
    
    # Add subdirectories to index
    find "$dir" -maxdepth 1 -type d -not -path "$dir" | sort | while read -r subdir; do
        echo "        <li><a href=\"$(basename "$subdir")/\">📁 $(basename "$subdir" | sed 's/-/ /g')</a></li>" >> "$index_file"
    done
    
    cat >> "$index_file" << EOF
    </ul>
</body>
</html>
EOF
}

# Create index pages for all directories
find docs -type d | while read -r dir; do
    create_index "$dir"
done

# Clean up template
rm template.html

echo "✅ Conversion complete! All markdown files converted to HTML with navigation."
echo "🌐 Site ready for GitHub Pages deployment"