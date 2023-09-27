<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>{{ .Title }}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    *,
    ::before,
    ::after {
      box-sizing: border-box;
      /* 1 */
      border-width: 0;
      /* 2 */
      border-style: solid;
      /* 2 */
      border-color: #e5e7eb;
      /* 2 */
    }

    ::before,
    ::after {
      --tw-content: '';
    }

    html {
      line-height: 1.5;
      /* 1 */
      -webkit-text-size-adjust: 100%;
      /* 2 */
      -moz-tab-size: 4;
      /* 3 */
      -o-tab-size: 4;
        tab-size: 4;
      /* 3 */
      font-family: IBM Plex Sans, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
      /* 4 */
      font-feature-settings: normal;
      /* 5 */
      font-variation-settings: normal;
      /* 6 */
    }

    body {
      margin: 0;
      /* 1 */
      line-height: inherit;
      /* 2 */
    }

    hr {
      height: 0;
      /* 1 */
      color: inherit;
      /* 2 */
      border-top-width: 1px;
      /* 3 */
    }

    /*
    Add the correct text decoration in Chrome, Edge, and Safari.
    */

    abbr:where([title]) {
      -webkit-text-decoration: underline dotted;
              text-decoration: underline dotted;
    }

    /*
    Remove the default font size and weight for headings.
    */

    h1,
    h2,
    h3,
    h4,
    h5,
    h6 {
      font-size: inherit;
      font-weight: inherit;
    }

    /*
    Reset links to optimize for opt-in styling instead of opt-out.
    */

    a {
      color: inherit;
      text-decoration: inherit;
    }

    /*
    Add the correct font weight in Edge and Safari.
    */

    b,
    strong {
      font-weight: bolder;
    }

    /*
    1. Use the user's configured `mono` font family by default.
    2. Correct the odd `em` font sizing in all browsers.
    */

    code,
    kbd,
    samp,
    pre {
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
      /* 1 */
      font-size: 1em;
      /* 2 */
    }

    /*
    Add the correct font size in all browsers.
    */

    small {
      font-size: 80%;
    }

    /*
    Prevent `sub` and `sup` elements from affecting the line height in all browsers.
    */

    sub,
    sup {
      font-size: 75%;
      line-height: 0;
      position: relative;
      vertical-align: baseline;
    }

    sub {
      bottom: -0.25em;
    }

    sup {
      top: -0.5em;
    }

    /*
    1. Remove text indentation from table contents in Chrome and Safari. (https://bugs.chromium.org/p/chromium/issues/detail?id=999088, https://bugs.webkit.org/show_bug.cgi?id=201297)
    2. Correct table border color inheritance in all Chrome and Safari. (https://bugs.chromium.org/p/chromium/issues/detail?id=935729, https://bugs.webkit.org/show_bug.cgi?id=195016)
    3. Remove gaps between table borders by default.
    */

    table {
      text-indent: 0;
      /* 1 */
      border-color: inherit;
      /* 2 */
      border-collapse: collapse;
      /* 3 */
    }

    /*
    1. Change the font styles in all browsers.
    2. Remove the margin in Firefox and Safari.
    3. Remove default padding in all browsers.
    */

    button,
    input,
    optgroup,
    select,
    textarea {
      font-family: inherit;
      /* 1 */
      font-feature-settings: inherit;
      /* 1 */
      font-variation-settings: inherit;
      /* 1 */
      font-size: 100%;
      /* 1 */
      font-weight: inherit;
      /* 1 */
      line-height: inherit;
      /* 1 */
      color: inherit;
      /* 1 */
      margin: 0;
      /* 2 */
      padding: 0;
      /* 3 */
    }

    /*
    Remove the inheritance of text transform in Edge and Firefox.
    */

    button,
    select {
      text-transform: none;
    }

    /*
    1. Correct the inability to style clickable types in iOS and Safari.
    2. Remove default button styles.
    */

    button,
    [type='button'],
    [type='reset'],
    [type='submit'] {
      -webkit-appearance: button;
      /* 1 */
      background-color: transparent;
      /* 2 */
      background-image: none;
      /* 2 */
    }

    /*
    Use the modern Firefox focus style for all focusable elements.
    */

    :-moz-focusring {
      outline: auto;
    }

    /*
    Remove the additional `:invalid` styles in Firefox. (https://github.com/mozilla/gecko-dev/blob/2f9eacd9d3d995c937b4251a5557d95d494c9be1/layout/style/res/forms.css#L728-L737)
    */

    :-moz-ui-invalid {
      box-shadow: none;
    }

    /*
    Add the correct vertical alignment in Chrome and Firefox.
    */

    progress {
      vertical-align: baseline;
    }

    /*
    Correct the cursor style of increment and decrement buttons in Safari.
    */

    ::-webkit-inner-spin-button,
    ::-webkit-outer-spin-button {
      height: auto;
    }

    /*
    1. Correct the odd appearance in Chrome and Safari.
    2. Correct the outline style in Safari.
    */

    [type='search'] {
      -webkit-appearance: textfield;
      /* 1 */
      outline-offset: -2px;
      /* 2 */
    }

    /*
    Remove the inner padding in Chrome and Safari on macOS.
    */

    ::-webkit-search-decoration {
      -webkit-appearance: none;
    }

    /*
    1. Correct the inability to style clickable types in iOS and Safari.
    2. Change font properties to `inherit` in Safari.
    */

    ::-webkit-file-upload-button {
      -webkit-appearance: button;
      /* 1 */
      font: inherit;
      /* 2 */
    }

    /*
    Add the correct display in Chrome and Safari.
    */

    summary {
      display: list-item;
    }

    /*
    Removes the default spacing and border for appropriate elements.
    */

    blockquote,
    dl,
    dd,
    h1,
    h2,
    h3,
    h4,
    h5,
    h6,
    hr,
    figure,
    p,
    pre {
      margin: 0;
    }

    fieldset {
      margin: 0;
      padding: 0;
    }

    legend {
      padding: 0;
    }

    ol,
    ul,
    menu {
      list-style: none;
      margin: 0;
      padding: 0;
    }

    /*
    Reset default styling for dialogs.
    */

    dialog {
      padding: 0;
    }

    /*
    Prevent resizing textareas horizontally by default.
    */

    textarea {
      resize: vertical;
    }

    /*
    1. Reset the default placeholder opacity in Firefox. (https://github.com/tailwindlabs/tailwindcss/issues/3300)
    2. Set the default placeholder color to the user's configured gray 400 color.
    */

    input::-moz-placeholder, textarea::-moz-placeholder {
      opacity: 1;
      /* 1 */
      color: #9ca3af;
      /* 2 */
    }

    input::placeholder,
    textarea::placeholder {
      opacity: 1;
      /* 1 */
      color: #9ca3af;
      /* 2 */
    }

    /*
    Set the default cursor for buttons.
    */

    button,
    [role="button"] {
      cursor: pointer;
    }

    /*
    Make sure disabled buttons don't get the pointer cursor.
    */

    :disabled {
      cursor: default;
    }

    /*
    1. Make replaced elements `display: block` by default. (https://github.com/mozdevs/cssremedy/issues/14)
    2. Add `vertical-align: middle` to align replaced elements more sensibly by default. (https://github.com/jensimmons/cssremedy/issues/14#issuecomment-634934210)
      This can trigger a poorly considered lint error in some tools but is included by design.
    */

    img,
    svg,
    video,
    canvas,
    audio,
    iframe,
    embed,
    object {
      display: block;
      /* 1 */
      vertical-align: middle;
      /* 2 */
    }

    /*
    Constrain images and videos to the parent width and preserve their intrinsic aspect ratio. (https://github.com/mozdevs/cssremedy/issues/14)
    */

    img,
    video {
      max-width: 100%;
      height: auto;
    }

    /* Make elements with the HTML hidden attribute stay hidden by default */

    [hidden] {
      display: none;
    }

    *, ::before, ::after {
      --tw-border-spacing-x: 0;
      --tw-border-spacing-y: 0;
      --tw-translate-x: 0;
      --tw-translate-y: 0;
      --tw-rotate: 0;
      --tw-skew-x: 0;
      --tw-skew-y: 0;
      --tw-scale-x: 1;
      --tw-scale-y: 1;
      --tw-pan-x:  ;
      --tw-pan-y:  ;
      --tw-pinch-zoom:  ;
      --tw-scroll-snap-strictness: proximity;
      --tw-gradient-from-position:  ;
      --tw-gradient-via-position:  ;
      --tw-gradient-to-position:  ;
      --tw-ordinal:  ;
      --tw-slashed-zero:  ;
      --tw-numeric-figure:  ;
      --tw-numeric-spacing:  ;
      --tw-numeric-fraction:  ;
      --tw-ring-inset:  ;
      --tw-ring-offset-width: 0px;
      --tw-ring-offset-color: #fff;
      --tw-ring-color: rgb(59 130 246 / 0.5);
      --tw-ring-offset-shadow: 0 0 #0000;
      --tw-ring-shadow: 0 0 #0000;
      --tw-shadow: 0 0 #0000;
      --tw-shadow-colored: 0 0 #0000;
      --tw-blur:  ;
      --tw-brightness:  ;
      --tw-contrast:  ;
      --tw-grayscale:  ;
      --tw-hue-rotate:  ;
      --tw-invert:  ;
      --tw-saturate:  ;
      --tw-sepia:  ;
      --tw-drop-shadow:  ;
      --tw-backdrop-blur:  ;
      --tw-backdrop-brightness:  ;
      --tw-backdrop-contrast:  ;
      --tw-backdrop-grayscale:  ;
      --tw-backdrop-hue-rotate:  ;
      --tw-backdrop-invert:  ;
      --tw-backdrop-opacity:  ;
      --tw-backdrop-saturate:  ;
      --tw-backdrop-sepia:  ;
    }

    ::backdrop {
      --tw-border-spacing-x: 0;
      --tw-border-spacing-y: 0;
      --tw-translate-x: 0;
      --tw-translate-y: 0;
      --tw-rotate: 0;
      --tw-skew-x: 0;
      --tw-skew-y: 0;
      --tw-scale-x: 1;
      --tw-scale-y: 1;
      --tw-pan-x:  ;
      --tw-pan-y:  ;
      --tw-pinch-zoom:  ;
      --tw-scroll-snap-strictness: proximity;
      --tw-gradient-from-position:  ;
      --tw-gradient-via-position:  ;
      --tw-gradient-to-position:  ;
      --tw-ordinal:  ;
      --tw-slashed-zero:  ;
      --tw-numeric-figure:  ;
      --tw-numeric-spacing:  ;
      --tw-numeric-fraction:  ;
      --tw-ring-inset:  ;
      --tw-ring-offset-width: 0px;
      --tw-ring-offset-color: #fff;
      --tw-ring-color: rgb(59 130 246 / 0.5);
      --tw-ring-offset-shadow: 0 0 #0000;
      --tw-ring-shadow: 0 0 #0000;
      --tw-shadow: 0 0 #0000;
      --tw-shadow-colored: 0 0 #0000;
      --tw-blur:  ;
      --tw-brightness:  ;
      --tw-contrast:  ;
      --tw-grayscale:  ;
      --tw-hue-rotate:  ;
      --tw-invert:  ;
      --tw-saturate:  ;
      --tw-sepia:  ;
      --tw-drop-shadow:  ;
      --tw-backdrop-blur:  ;
      --tw-backdrop-brightness:  ;
      --tw-backdrop-contrast:  ;
      --tw-backdrop-grayscale:  ;
      --tw-backdrop-hue-rotate:  ;
      --tw-backdrop-invert:  ;
      --tw-backdrop-opacity:  ;
      --tw-backdrop-saturate:  ;
      --tw-backdrop-sepia:  ;
    }

    .block {
      display: block;
    }

    .flex {
      display: flex;
    }

    .grid {
      display: grid;
    }

    .min-h-\[20px\] {
      min-height: 20px;
    }

    .min-h-\[24px\] {
      min-height: 24px;
    }

    .items-start {
      align-items: flex-start;
    }

    .gap-2 {
      gap: 0.5rem;
    }

    .gap-x-4 {
      -moz-column-gap: 1rem;
          column-gap: 1rem;
    }

    .gap-y-4 {
      row-gap: 1rem;
    }

    .divide-y > :not([hidden]) ~ :not([hidden]) {
      --tw-divide-y-reverse: 0;
      border-top-width: calc(1px * calc(1 - var(--tw-divide-y-reverse)));
      border-bottom-width: calc(1px * var(--tw-divide-y-reverse));
    }

    .divide-stone-700\/50 > :not([hidden]) ~ :not([hidden]) {
      border-color: rgb(68 64 60 / 0.5);
    }

    .bg-stone-300 {
      --tw-bg-opacity: 1;
      background-color: rgb(214 211 209 / var(--tw-bg-opacity));
    }

    .p-4 {
      padding: 1rem;
    }

    .pb-4 {
      padding-bottom: 1rem;
    }

    .pt-2 {
      padding-top: 0.5rem;
    }

    .text-sm {
      font-size: 0.875rem;
      line-height: 1.25rem;
    }

    .text-xl {
      font-size: 1.25rem;
      line-height: 1.75rem;
    }

    .text-xs {
      font-size: 0.75rem;
      line-height: 1rem;
    }

    .font-bold {
      font-weight: 700;
    }

    .italic {
      font-style: italic;
    }

    .leading-normal {
      line-height: 1.5;
    }

    .text-stone-950 {
      --tw-text-opacity: 1;
      color: rgb(12 10 9 / var(--tw-text-opacity));
    }

    .opacity-50 {
      opacity: 0.5;
    }

    .grayscale {
      --tw-grayscale: grayscale(100%);
      filter: var(--tw-blur) var(--tw-brightness) var(--tw-contrast) var(--tw-grayscale) var(--tw-hue-rotate) var(--tw-invert) var(--tw-saturate) var(--tw-sepia) var(--tw-drop-shadow);
    }

    .dotted {
      background-size: 30px 30px;
      background-position: -16px -16px;
    }

    .dotted-sm {
      background-size: 20px 20px;
      background-position: -4px -4px;
    }

    .dotted-black {
      background-image: radial-gradient(rgba(0, 0, 0, 0.05) 1px, transparent 0);
    }

    .dotted-white {
      background-image: radial-gradient(
          rgba(255, 255, 255, 0.05) 1px,
          transparent 0
        );
    }

    @font-face {
      font-family: "IBM Plex Sans";
      font-style: normal;
      font-weight: 400;
      font-display: swap;
      src: url(/public/assets/fonts/IBMPlexSans-Regular.woff2) format("woff2");
      unicode-range: U+0100-02AF, U+0304, U+0308, U+0329, U+1E00-1E9F, U+1EF2-1EFF,
        U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
    }
    @font-face {
      font-family: "IBM Plex Sans";
      font-style: normal;
      font-weight: 400;
      font-display: swap;
      src: url(/public/assets/fonts/IBMPlexSans-Regular.woff2) format("woff2");
      unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA,
        U+02DC, U+0304, U+0308, U+0329, U+2000-206F, U+2074, U+20AC, U+2122, U+2191,
        U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
    }
    @font-face {
      font-family: "IBM Plex Sans";
      font-style: italic;
      font-weight: 400;
      font-display: swap;
      src: url(/public/assets/fonts/IBMPlexSans-Italic.woff2) format("woff2");
      unicode-range: U+0100-02AF, U+0304, U+0308, U+0329, U+1E00-1E9F, U+1EF2-1EFF,
        U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
    }
    @font-face {
      font-family: "IBM Plex Sans";
      font-style: italic;
      font-weight: 400;
      font-display: swap;
      src: url(/public/assets/fonts/IBMPlexSans-Italic.woff2) format("woff2");
      unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA,
        U+02DC, U+0304, U+0308, U+0329, U+2000-206F, U+2074, U+20AC, U+2122, U+2191,
        U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
    }
    @font-face {
      font-family: "IBM Plex Sans";
      font-style: normal;
      font-weight: 700;
      font-display: swap;
      src: url(/public/assets/fonts/IBMPlexSans-Bold.woff2) format("woff2");
      unicode-range: U+0100-02AF, U+0304, U+0308, U+0329, U+1E00-1E9F, U+1EF2-1EFF,
        U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
    }
    @font-face {
      font-family: "IBM Plex Sans";
      font-style: normal;
      font-weight: 700;
      font-display: swap;
      src: url(/public/assets/fonts/IBMPlexSans-Bold.woff2) format("woff2");
      unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA,
        U+02DC, U+0304, U+0308, U+0329, U+2000-206F, U+2074, U+20AC, U+2122, U+2191,
        U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
    }
    @font-face {
      font-family: "IBM Plex Sans";
      font-style: italic;
      font-weight: 700;
      font-display: swap;
      src: url(/public/assets/fonts/IBMPlexSans-BoldItalic.woff2) format("woff2");
      unicode-range: U+0100-02AF, U+0304, U+0308, U+0329, U+1E00-1E9F, U+1EF2-1EFF,
        U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
    }
    @font-face {
      font-family: "IBM Plex Sans";
      font-style: italic;
      font-weight: 700;
      font-display: swap;
      src: url(/public/assets/fonts/IBMPlexSans-BoldItalic.woff2) format("woff2");
      unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA,
        U+02DC, U+0304, U+0308, U+0329, U+2000-206F, U+2074, U+20AC, U+2122, U+2191,
        U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
    }
    @font-face {
      font-family: 'Material Icons Round';
      font-style: normal;
      font-weight: 400;
      src: url(/public/assets/fonts/MaterialIconsRound-Regular.otf) format("opentype");
    }

    .material-icons-round {
      font-family: 'Material Icons Round';
      font-weight: normal;
      font-style: normal;
      font-size: 24px;
      line-height: 1;
      letter-spacing: normal;
      text-transform: none;
      display: inline-block;
      white-space: nowrap;
      word-wrap: normal;
      direction: ltr;
      font-feature-settings: 'liga';
      -moz-font-feature-settings: 'liga';
      -moz-osx-font-smoothing: grayscale;
    }

    @media (prefers-color-scheme: dark) {
      .dark\:bg-stone-950 {
        --tw-bg-opacity: 1;
        background-color: rgb(12 10 9 / var(--tw-bg-opacity));
      }

      .dark\:text-stone-300 {
        --tw-text-opacity: 1;
        color: rgb(214 211 209 / var(--tw-text-opacity));
      }

      .dark\:dotted-white {
        background-image: radial-gradient(
          rgba(255, 255, 255, 0.05) 1px,
          transparent 0
        );
      }
    }

    @media (min-width: 768px) {
      .md\:grid-cols-2 {
        grid-template-columns: repeat(2, minmax(0, 1fr));
      }

      .md\:gap-4 {
        gap: 1rem;
      }

      .md\:p-8 {
        padding: 2rem;
      }

      .md\:pb-8 {
        padding-bottom: 2rem;
      }

      .md\:pt-4 {
        padding-top: 1rem;
      }

      .md\:text-4xl {
        font-size: 2.25rem;
        line-height: 2.5rem;
      }

      .md\:dotted {
        background-size: 30px 30px;
        background-position: -16px -16px;
      }
    }

    @media (min-width: 1024px) {
      .lg\:grid-cols-3 {
        grid-template-columns: repeat(3, minmax(0, 1fr));
      }
    }

    @media (min-width: 1280px) {
      .xl\:grid-cols-4 {
        grid-template-columns: repeat(4, minmax(0, 1fr));
      }
    }
  </style>
</head>

<body
  class="p-4 text-sm divide-y md:text-normal bg-stone-300 text-stone-950 dark:bg-stone-950 dark:text-stone-300 divide-stone-700/50 md:p-8 dotted-sm md:dotted dotted-black dark:dotted-white">
  <header>
    <div class="pb-4 md:pb-8">
			<h1 class="text-xl font-bold md:text-4xl">Index of {{ .Directory }}</h1>
    </div>
  </header>
  <main class="pt-2 md:pt-4">
    <div class="grid gap-2 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 md:gap-4 gap-y-4">
      {{- range $idx, $element := .Entries -}}
      {{- with $element -}}
      <div>
        <a href="{{ .Path }}" class="flex items-start gap-x-4">
          <span class="material-icons-round">
            {{- if .IsFile -}} description {{- else if .IsDirectory -}} folder {{- end -}}
          </span>
          <span>
            <span class="block min-h-[20px] leading-normal">{{ .Name }}</span>
            {{- if .Size -}} <span class="block text-xs opacity-50">{{ .Size }}</span> {{- end -}}
          </span>
        </a>
      </div>
      {{- end -}}
      {{- end -}}
    </div>
  </main>
</body>
</body>

</html>
