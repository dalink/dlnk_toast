import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["progress"]
  static values = { duration: { type: Number, default: 4000 } }

  connect() {
    this.remaining = this.durationValue
    this.startTimer()
    this.startProgress()
  }

  disconnect() {
    this.clearTimer()
  }

  close() {
    this.clearTimer()
    this.element.classList.remove("dlnk-toast--enter")
    this.element.classList.add("dlnk-toast--exit")
    this.element.addEventListener("animationend", () => this.element.remove(), { once: true })
  }

  pause() {
    this.clearTimer()
    if (this.hasProgressTarget) {
      const computed = getComputedStyle(this.progressTarget)
      this.pausedWidth = computed.width
      this.progressTarget.style.transition = "none"
      this.progressTarget.style.width = this.pausedWidth
    }
  }

  resume() {
    if (this.hasProgressTarget) {
      const currentPercent = (parseFloat(this.pausedWidth) / this.progressTarget.parentElement.offsetWidth) * 100
      this.remaining = (currentPercent / 100) * this.durationValue
      requestAnimationFrame(() => {
        this.progressTarget.style.transition = `width ${this.remaining}ms linear`
        this.progressTarget.style.width = "0%"
      })
    }
    this.startTimerWithRemaining()
  }

  // private

  startTimer() {
    this.timer = setTimeout(() => this.close(), this.durationValue)
  }

  startTimerWithRemaining() {
    this.timer = setTimeout(() => this.close(), this.remaining)
  }

  clearTimer() {
    if (this.timer) {
      clearTimeout(this.timer)
      this.timer = null
    }
  }

  startProgress() {
    if (!this.hasProgressTarget) return
    this.progressTarget.style.width = "100%"
    requestAnimationFrame(() => {
      this.progressTarget.style.transition = `width ${this.durationValue}ms linear`
      this.progressTarget.style.width = "0%"
    })
  }
}
