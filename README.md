# DlnkToast

Simple, elegant toast notifications for Rails 7+ applications using Hotwire and vanilla CSS.

## Features

- ✨ Flash-based notifications (notice/alert)
- 🎯 Stimulus controller for UX (pause on hover, dismiss)
- 🎨 Vanilla CSS with CSS variables for easy customization
- 📱 Responsive design
- ♿ Built-in accessibility (ARIA labels, roles)
- 🌍 Internationalization (i18n) support
- 🚀 Zero JavaScript bundle impact (uses importmap)

## Installation

Add to your Gemfile:

```ruby
gem "dlnk_toast"
```

Then run the installer:

```bash
bundle install
bin/rails generate dlnk_toast:install
```

The installer will:
- Create `config/initializers/dlnk_toast.rb`
- Add the Stimulus controller to your importmap (if present)
- Inject the toast partial into your layouts

## Usage

Use Rails flash messages as usual:

```ruby
def create
  @user = User.new(user_params)
  if @user.save
    redirect_to @user, notice: "User created successfully"
  else
    render :new, alert: "Failed to create user"
  end
end
```

Your flash messages will automatically appear as toasts!

## Customization

### CSS Variables

Override these in your `app/assets/stylesheets/application.css`:

```css
:root {
  --dlnk-toast-bg: #1a1a1a;
  --dlnk-toast-border: #1f1f1f;
  --dlnk-toast-text: #ffffff;
  --dlnk-toast-text-dim: #6B6B6B;
  --dlnk-toast-accent: #D4A017;          /* Success color */
  --dlnk-toast-error: #ef4444;           /* Alert color */
  --dlnk-toast-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
}
```

### Duration

Edit `config/initializers/dlnk_toast.rb`:

```ruby
DlnkToast.configure do |config|
  config.duration = 5000  # milliseconds
end
```

### Manual Rendering

If you need to render toasts outside of layouts:

```erb
<%= render_toast %>
```

## Translations

Translations are provided for English and French. Add custom ones to your locale files:

```yaml
# config/locales/en.yml
en:
  dlnk_toast:
    close: "Close"
```

## Browser Support

Works in all modern browsers that support CSS Grid, Flexbox, and CSS custom properties.

## License

MIT License. See LICENSE file for details.

## Contributing

Bug reports and pull requests are welcome on GitHub.
