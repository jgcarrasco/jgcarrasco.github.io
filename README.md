# jgcarrasco.github.io

Minimal Hugo site for `https://jgcarrasco.github.io`.

## Local preview

```bash
hugo server -D
```

Then open `http://localhost:1313`.

## Production build

```bash
hugo --gc --minify
```

GitHub Pages deploys the site through `.github/workflows/deploy.yml`.

## Blog images

Set `image` in a post's front matter to show it in blog summaries and SEO previews. Add `showSummaryImage: false` to hide it from summaries while keeping it for metadata.
