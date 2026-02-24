# DlnkToast

Simple, elegant toast notifications for Rails 7+ applications using Hotwire and vanilla CSS.

Flash-based — just use `redirect_to ..., notice:` or `flash[:alert]` and toasts appear automatically.

## Features

- Flash-based notifications (`notice` and `alert`)
- Stimulus controller (pause on hover, click to dismiss)
- Vanilla CSS with CSS variables for easy theming
- Responsive (full-width on mobile)
- Accessible (ARIA roles and labels)
- I18n support (English, French built-in)
- Importmap-friendly

## Installation

Add to your Gemfile:

```ruby
gem "dlnk_toast"
```

Then run:

```bash
bundle install
bin/rails generate dlnk_toast:install
```

The generator will:

1. Create `config/initializers/dlnk_toast.rb`
2. Pin the Stimulus controller in `config/importmap.rb`
3. Create a bridge controller at `app/javascript/controllers/dlnk_toast_controller.js`
4. Add `stylesheet_link_tag "dlnk_toast/application"` to your layouts
5. Inject `<%= render "dlnk_toast/toast" %>` before `</body>` in your layouts

### Manual setup

If you prefer to set things up yourself:

**Importmap** — `config/importmap.rb`:

```ruby
pin "dlnk_toast/toast_controller", to: "dlnk_toast/toast_controller.js"
```

**Stimulus bridge** — `app/javascript/controllers/dlnk_toast_controller.js`:

```js
export { default } from "dlnk_toast/toast_controller"
```

This bridge file is needed because Stimulus auto-loading only discovers controllers
inside `app/javascript/controllers/`. The bridge re-exports the gem's controller
under the identifier `dlnk-toast`.

**Stylesheet** — in each layout's `<head>`:

```erb
<%= stylesheet_link_tag "dlnk_toast/application", "data-turbo-track": "reload" %>
```

**Partial** — before `</body>` in each layout:

```erb
<%= render "dlnk_toast/toast" %>
```

## Usage

Use Rails flash messages as usual:

```ruby
redirect_to @video, notice: "Video published"
```

```ruby
redirect_to root_path, alert: "Access denied"
```

## Customization

### CSS Variables

Override in your application stylesheet:

```css
:root {
  --dlnk-toast-bg: #1a1a1a;
  --dlnk-toast-border: #1f1f1f;
  --dlnk-toast-text: #ffffff;
  --dlnk-toast-text-dim: #6B6B6B;
  --dlnk-toast-accent: #D4A017;
  --dlnk-toast-error: #ef4444;
  --dlnk-toast-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1),
                        0 10px 10px -5px rgba(0, 0, 0, 0.04);
}
```

### Duration

Edit `config/initializers/dlnk_toast.rb`:

```ruby
DlnkToast.configure do |config|
  config.duration = 5000 # milliseconds (default: 4000)
end
```

### Helper

A `render_toast` helper is available if you need to render toasts outside layouts:

```erb
<%= render_toast %>
```

## Translations

Built-in translations for `en` and `fr`. Override in your locale files:

```yaml
fr:
  dlnk_toast:
    close: "Fermer"
```

## Requirements

- Ruby >= 3.0
- Rails >= 7.0
- Propshaft or Sprockets
- Importmap-rails (for Stimulus controller)

## License

MIT
