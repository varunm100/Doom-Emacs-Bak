;;; doom-custom-theme.el
(require 'doom-themes)

;;
(defgroup doom-custom-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-custom-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-custom-theme
  :type 'boolean)

(defcustom doom-custom-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-custom-theme
  :type 'boolean)

(defcustom doom-custom-comment-bg doom-custom-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-custom-theme
  :type 'boolean)

(defcustom doom-custom-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-custom-theme
  :type '(or integer boolean))

;;
(def-doom-theme doom-custom
  "Doom custom theme"

  ;; name        default   256       16
  ((bg         '("#1D1F21" nil       nil            ))
   (bg-alt     '("#323539" nil       nil            ))
   (base0      '("#131414" "#121212" "black"        ))
   (base1      '("#272927" "#262626" "brightblack"  ))
   (base2      '("#3A3D3B" "#3A3A3A" "brightblack"  ))
   (base3      '("#4D524F" "#4E4E4E" "brightblack"  ))
   (base4      '("#616662" "#626262" "brightblack"  ))
   (base5      '("#747A76" "#767676" "brightblack"  ))
   (base6      '("#888E8A" "#8A8A8A" "brightblack"  ))
   (base7      '("#9CA19E" "#9E9E9E" "brightblack"  ))
   (base8      '("#B1B5B2" "#B2B2B2" "white"        ))
   (fg-alt     '("#D1D3D1" "#D0D0D0" "brightwhite"  ))
   (fg         '("#C5C8C6" "#C6C6C6" "white"        ))

   (grey       base4)
   (red        '("#304851" "#444444" "red"          ))
   (orange     '("#3F545D" "#4E4E4E" "brightred"    ))
   (green      '("#2F4750" "#444444" "green"        ))
   (teal       '("#3B5964" "#4E4E4E" "brightgreen"  ))
   (yellow     '("#4E6068" "#5F5F5F" "yellow"       ))
   (blue       '("#9B6047" "#875F5F" "brightblue"   ))
   (dark-blue  '("#7C4D39" "#875F5F" "blue"         ))
   (magenta    '("#4B616B" "#5F5F5F" "magenta"      ))
   (violet     '("#5E7986" "#5F8787" "brightmagenta"))
   (cyan       '("#708B96" "#5F8787" "brightcyan"   ))
   (dark-cyan  '("#597079" "#5F5F87" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-lighten bg 0.05))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if doom-custom-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-custom-brighter-comments dark-cyan base5) 0.25))
   (constants      red)
   (functions      yellow)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        teal)
   (variables      cyan)
   (numbers        magenta)
   (region         dark-blue)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-custom-brighter-modeline)
   (-modeline-pad
    (when doom-custom-padded-modeline
      (if (integerp doom-custom-padded-modeline) doom-custom-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        base3
        `(,(doom-darken (car bg) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        base3
        `(,(doom-darken (car bg) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car bg) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ((line-number &override) :foreground fg-alt)
   ((line-number-current-line &override) :foreground fg)
   ((line-number &override) :background (doom-darken bg 0.025))

   (font-lock-comment-face
    :foreground comments
    :background (if doom-custom-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))
   (mode-line-buffer-id
    :foreground highlight)

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   (telephone-line-accent-active
    :inherit 'mode-line
    :background (doom-lighten bg 0.2))
   (telephone-line-accent-inactive
    :inherit 'mode-line
    :background (doom-lighten bg 0.05))
   (telephone-line-evil-emacs
    :inherit 'mode-line
    :background dark-blue)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-code-face :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (org-block :background base2)
   (org-block-begin-line :background base2 :foreground comments)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ;; ()
  )

;;; doom-custom-theme.el ends here