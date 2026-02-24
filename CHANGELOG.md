# Changelog

## [0.1.1] - 2026-02-24

### Fixed
- Install generator now creates Stimulus bridge controller (`dlnk_toast_controller.js`)
- Install generator now adds `stylesheet_link_tag` to layouts (required by Propshaft)
- Fixed importmap pin to resolve to `dlnk_toast/toast_controller.js`
- Generator detects and skips layouts that already include dlnk_toast

### Changed
- Generator injects into all standard layouts (application, admin, auth)
- Improved post-install output

## [0.1.0] - 2026-02-24

### Added
- Initial release
- Flash-based toast notifications with notice/alert support
- Stimulus controller for pause/resume on hover
- Vanilla CSS with CSS variables for customization
- Responsive design with mobile support
- Accessibility features (ARIA labels, roles)
- I18n support (English, French)
- Rails generator for easy installation
- Configuration system for toast duration
