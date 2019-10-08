;;; operator-mode.el --- simple electric operator  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Andreas Röhler

;; Author: Andreas Röhler <andreas.roehler@online.de>
;; Keywords: convenience

;; Version: 0.0.1
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary: This is a still naive prototype


;;

;;; Code:

(defvar operator-mode-debug t
  "Debugging mode")

(defvar operator-known-operators nil

  "Known chars used as operators.")

(setq operator-known-operators (list ?Ṻ ?¡ ?˙ ?Ċ ?ṻ ?̈ ?∺ ?Ḋ ?Ḗ ?♯ ?⟵ ?Ė ?Ṓ ?⅋ ?↔ ?Ḟ ?ḗ ?⋆ ?↚ ?Ġ ?ṓ ?⇔ ?Ḣ ?Ḕ ?­ ?≰ ?İ ?Ṑ ?⋦  ?Ṁ ?ḕ ?∅ ?≣ ?Ṅ ?ṑ ?≢ ?Ȯ ?Ǣ ?⟨ ?⇏ ?Ṗ ?ǣ ?̄ ?¯ ?Ṙ ?ℕ ?⟩ ?≱ ?Ṡ ?ℙ ?¿ ?⋧ ?Ṫ ?ℝ ?∁ ?⋀ ?Ẇ ?ℤ ?̋ ?□ ?Ẋ ?≎ ?⋂ ?⋒ ?Ẏ ?☹ ?Ł ?Χ ?Ż ?Ϫ ?Ø ?⋓ ?ȧ ?Λ ?¶ ?Ϯ ?ḃ ?✉ ?§ ?Η ?ċ ?☺ ?̂ ?Ϥ ?ḋ ?Ϛ ?̨ ?Θ ?ė ?⋐ ?̌ ?ƛ ?ḟ ?⋑ ?× ?⨅ ?ġ ?⊪ ?∣ ?θ ?ḣ ?Ấ ?‼ ?˝ ?ṁ ?Ế ?⁉ ?↰ ?ṅ ?Ố ?“ ?⨆ ?ȯ ?ấ ?« ?𝓐 ?ṗ ?ế ?» ?𝓑 ?ṙ ?ố ?𝓒 ?ṡ ?Ầ ?Ë ?𝓓 ?ṫ ?Ề ?Ḧ ?𝓔 ?ẇ ?Ồ ?Ï ?𝓕 ?ẋ ?ầ ?𝓖 ?ẏ ?ề ?Ü ?𝓗 ?ż ?ồ ?Ẅ ?𝓘 ?⟷ ?ᵝ ?Ẍ ?𝓙 ?↮ ?Ậ ?Ÿ ?𝓚 ?⇎ ?Ệ ?„ ?𝓛 ?≴ ?Ộ ?𝓜 ?Ṻ ?ậ ?ë ?𝓝 ?ṻ ?ệ ?ḧ ?𝓞 ?Ḗ ?ộ ?ï ?𝓟 ?Ṓ ?ꭜ ?𝓠 ?ḗ ?ᶥ ?ẗ ?𝓡 ?ṓ ?Ẫ ?ü ?𝓢 ?Ǣ ?Ễ ?ẅ ?𝓣 ?Ḕ ?Ỗ ?ẍ ?𝓤 ?Ṑ ?ẫ ?ÿ ?𝓥 ?ḕ ?ễ ?Á ?𝓦 ?ṑ ?ỗ ?Ć ?𝓧 ?ǣ ?℡ ?É ?𝓨 ?Ā ?≈ ?Ǵ ?𝓩 ?Ē ?⋂ ?Í ?𝓪 ?Ḡ ?⋃ ?Ḱ ?𝓫 ?Ī ?⋁ ?Ĺ ?𝓬 ?Ō ?⋈ ?Ḿ ?𝓭 ?Ū ?≏ ?Ń ?𝓮 ?Ȳ ?Ḉ ?Ó ?𝓯 ?ā ?ḉ ?Ṕ ?𝓰 ?ē ?Ḝ ?Ŕ ?𝓱 ?ḡ ?ḝ ?Ś ?𝓲 ?ī ?≗ ?Ú ?𝓳 ?ō ?∐ ?Ẃ ?𝓴 ?ū ?Ṩ ?Ý ?𝓵 ?ȳ ?ṩ ?Ź ?𝓶 ?≵ ?Ḹ ?á ?𝓷 ?Β ?Ṝ ?ć ?𝓸 ?Ͱ ?ḹ ?é ?𝓹 ?Ϩ ?ṝ ?ǵ ?𝓺 ?Ő ?† ?í ?𝓻 ?Ű ?ℸ ?ḱ ?𝓼 ?ő ?° ?ĺ ?𝓽 ?ű ?≖ ?ḿ ?𝓾 ?Ι ?∃ ?ń ?𝓿 ?⋈ ?♀ ?ó ?𝔀 ?Ϧ ?∀ ?ṕ ?𝔁 ?Ϣ ?½ ?ŕ ?𝔂 ?ő ?⅓ ?ś ?𝔃 ?‖ ?¼ ?ú ?𝑨 ?Ζ ?⅕ ?ẃ ?𝑩 ?Ấ ?⅙ ?ý ?𝑪 ?Ế ?⅛ ?ź ?𝑫 ?Ố ?⅔ ?≘ ?𝑬 ?ấ ?⅖ ?⟅ ?𝑭 ?ế ?¾ ?⟆ ?𝑮 ?ố ?⅗ ?≛ ?𝑯 ?ᴭ ?⅜ ?⊹ ?𝑰 ?ᴽ ?⅘ ?∹ ?𝑱 ?Ầ ?⅚ ?→ ?𝑲 ?Ề ?⅝ ?⊸ ?𝑳 ?Ồ ?⅞ ?⊣ ?𝑴 ?ầ ?ϫ ?≂ ?𝑵 ?ề ?⋗ ?∔ ?𝑶 ?ồ ?≳ ?∸ ?𝑷 ?Ẫ ?Ǭ ?≐ ?𝑸 ?Ễ ?ǭ ?Ȧ ?𝑹 ?Ỗ ?K ?Ḃ ?𝑺 ?ẫ ?λ ?Ċ ?𝑻 ?ễ ?⟨ ?Ḋ ?𝑼 ?ỗ ?⌊ ?Ė ?𝑽 ?Â ?⋉ ?Ḟ ?𝑾 ?Ĉ ?↦ ?Ġ ?𝑿 ?Ê ?⊧ ?Ḣ ?𝒀 ?Ĝ ?⊯ ?İ ?𝒁 ?Ĥ ?⊮ ?Ṁ ?𝒂 ?Î ?≢ ?Ṅ ?𝒃 ?Ĵ ?≄ ?Ȯ ?𝒄 ?Ô ?№ ?Ṗ ?𝒅 ?Ŝ ?⊭ ?Ṙ ?𝒆 ?Û ?⊬ ?Ṡ ?𝒇 ?Ŵ ?⊖ ?Ṫ ?𝒈 ?Ŷ ?⊘ ?Ẇ ?𝒉 ?Ẑ ?⊗ ?Ẋ ?𝒊 ?â ?‰ ?Ẏ ?𝒋 ?ĉ ?₧ ?Ż ?𝒌 ?ê ?£ ?ȧ ?𝒍 ?ĝ ?≼ ?ḃ ?𝒎 ?ĥ ?∝ ?ċ ?𝒏 ?î ?⟩ ?ḋ ?𝒐 ?ĵ ?⌋ ?ė ?𝒑 ?ô ?⋊ ?ḟ ?𝒒 ?ŝ ?□ ?ġ ?𝒓 ?û ?⋢ ?ḣ ?𝒔 ?ŵ ?⋣ ?ṁ ?𝒕 ?ŷ ?ϛ ?ṅ ?𝒖 ?ẑ ?⊂ ?ȯ ?𝒗 ?À ?≽ ?ṗ ?𝒘 ?È ?⊃ ?ṙ ?𝒙 ?Ì ?µ ?ṡ ?𝒚 ?Ǹ ?₮ ?ṫ ?𝒛 ?Ò ?Ắ ?ẇ ?𝒜 ?Ù ?ắ ?ẋ ?𝒞 ?Ẁ ?Ằ ?ẏ ?𝒟 ?Ỳ ?ằ ?ż ?𝒢 ?à ?Ặ ?∷ ?𝒥 ?è ?ặ ?≔ ?𝒦 ?ì ?Ẵ ?∻ ?𝒩 ?ǹ ?ẵ ?← ?𝒪 ?ò ?Ṧ ?⟪ ?𝒫 ?ù ?ṧ ?≤ ?𝒬 ?ẁ ?ϗ ?≮ ?𝒮 ?ỳ ?ϕ ?≲ ?𝒯 ?≙ ?ϱ ?≕ ?𝒰 ?β ?⊻ ?≡ ?𝒱 ?ℶ ?Ṏ ?⇒ ?𝒲 ?⅀ ?ṏ ?Ā ?𝒳 ?Ḉ ?Ṍ ?Ē ?𝒴 ?ḉ ?Ṹ ?Ḡ ?𝒵 ?Ḝ ?ṍ ?Ī ?𝒶 ?ḝ ?ṹ ?Ō ?𝒷 ?· ?Ȭ ?Ū ?𝒸 ?₵ ?ȭ ?Ȳ ?𝒹 ?¢ ?◇ ?ā ?𝒻 ?◌ ?Ϝ ?ē ?𝒽 ?∘ ?Ε ?ḡ ?𝒾 ?∘ ?Ο ?ī ?𝒿 ?≅ ?⇑ ?≠ ?𝓀 ?Ç ?Υ ?ū ?𝓁 ?Ḑ ?ᵅ ?ȳ ?𝓂 ?Ȩ ?ᵟ ?≥ ?𝓃 ?Ģ ?ˠ ?⟫ ?𝓅 ?Ḩ ?ᵊ ?≯ ?𝓆 ?Ķ ?ᶿ ?≳ ?𝓇 ?Ļ ?ᶶ ?≟ ?𝓈 ?Ņ ?؋ ?⁇ ?𝓉 ?Ŗ ?₳ ?Å ?𝓊 ?Ş ?∽ ?Æ ?𝓋 ?Ţ ?∵ ?Ð ?𝓌 ?ç ?≬ ?Α ?𝓍 ?ḑ ?◯ ?Β ?𝓎 ?ȩ ?★ ?Χ ?𝓏 ?ģ ?⊞ ?Δ ?𝔄 ?ḩ ?☡ ?Ε ?𝔅 ?ķ ?℃ ?Φ ?𝔇 ?ļ ?≔ ?Γ ?𝔈 ?ņ ?‡ ?Ι ?𝔉 ?ŗ ?⋄ ?Κ ?𝔊 ?ş ?ϝ ?Λ ?𝔍 ?ţ ?∔ ?Μ ?𝔎 ?⇵ ?₯ ?Ν ?𝔏 ?Ṩ ?ε ?Ω ?𝔐 ?ṩ ?≕ ?Ψ ?𝔑 ?Ḹ ?≷ ?Ρ ?𝔒 ?Ṝ ?₲ ?Σ ?𝔓 ?ḹ ?₴ ?Τ ?𝔔 ?ṝ ?↝ ?Υ ?𝔖 ?‡ ?⋖ ?Ξ ?𝔗 ?≝ ?≶ ?Ζ ?𝔘 ?≙ ?≲ ?α ?𝔙 ?₫ ?✧ ?β ?𝔚 ?Ạ ?✠ ?χ ?𝔛 ?Ḅ ?≉ ?δ ?𝔜 ?Ḍ ?♮ ?ε ?𝔞 ?Ẹ ?↗ ?φ ?𝔟 ?Ḥ ?  ?γ ?𝔠 ?Ị ?∄ ?ι ?𝔡 ?Ḳ ?𐆎 ?κ ?𝔢 ?Ḷ ?⋠ ?λ ?𝔣 ?Ṃ ?⊄ ?μ ?𝔤 ?Ṇ ?⋡ ?ν ?𝔥 ?Ọ ?⊅ ?ω ?𝔦 ?Ṛ ?↖ ?ψ ?𝔧 ?Ṣ ?ο ?ρ ?𝔨 ?Ṭ ?∂ ?σ ?𝔩 ?Ụ ?¶ ?τ ?𝔪 ?Ṿ ?≾ ?υ ?𝔫 ?Ẉ ?↘ ?ξ ?𝔬 ?Ỵ ?§ ?ζ ?𝔭 ?Ẓ ?≿ ?Ő ?𝔮 ?ạ ?↙ ?Ű ?𝔯 ?ḅ ?₩ ?ő ?𝔰 ?ḍ ?↑ ?ű ?𝔱 ?ẹ ?υ ?ℑ ?𝔲 ?ḥ ?ϐ ?⋘ ?𝔳 ?ị ?⚠ ?Μ ?𝔴 ?ḳ ?ʱ ?Ν ?𝔵 ?ḷ ?ᵋ ?⍟ ?𝔶 ?ṃ ?ᵓ ?Å ?⨀ ?𝐴 ?ọ ?≊ ?Œ ?𝐵 ?ṛ ?≌ ?⋁ ?𝐶 ?ṣ ?⊼ ?⨂ ?𝐷 ?ṭ ?⋀ ?Π ?𝐸 ?ụ ?⊟ ?ℜ ?𝐹 ?ṿ ?⊠ ?Þ ?𝐺 ?ẉ ?® ?⨄ ?𝐻 ?ỵ ?Ⓢ ?⨃ ?𝐼 ?ẓ ?♣ ?⋃ ?𝐽 ?€ ?₢ ?ő ?𝐾 ?♭ ?⋎ ?Ξ ?𝐿 ?« ?¤ ?⟦ ?𝑀 ?» ?⌀ ?⟧ ?𝑁 ?≧ ?÷ ?⁽ ?𝑂 ?← ?≑ ?⁾ ?𝑃 ?„ ?∅ ?⁺ ?𝑄 ?≩ ?≥ ?⁻ ?𝑅 ?“ ?⋧ ?⁰ ?𝑆 ?ℏ ?⊺ ?¹ ?𝑇 ?ͱ ?≤ ?² ?𝑈 ?ϩ ?⌞ ?³ ?𝑉 ?ι ?⋦ ?⁴ ?𝑊 ?Ǭ ?⌟ ?⁵ ?𝑋 ?ǭ ?⊸ ?⁶ ?𝑌 ?ϧ ?∥ ?⁷ ?𝑍 ?Ą ?⋨ ?⁸ ?𝑎 ?Ę ?∖ ?⁹ ?𝑏 ?Į ?∣ ?⁼ ?𝑐 ?Ǫ ?₷ ?ᴮ ?𝑑 ?Ų ?⊏ ?Ĉ ?𝑒 ?ą ?⊐ ?ᴰ ?𝑓 ?ę ?⊆ ?ᴷ ?𝑔 ?į ?⋩ ?ᴸ ?𝑖 ?ǫ ?⊇ ?ᴹ ?𝑗 ?ų ?฿ ?ᴺ ?𝑘 ?⇆ ?✝ ?ᴾ ?𝑙 ?₾ ?₤ ?ᴿ ?𝑚 ?⟅ ?₱ ?Ŝ ?𝑛 ?≦ ?∼ ?ᵀ ?𝑜 ?₤ ?▵ ?ⱽ ?𝑝 ?≨ ?⌜ ?Ŷ ?𝑞 ?¬ ?‿ ?Ẑ ?𝑟 ?⟷ ?⌝ ?ᵇ ?𝑠 ?↮ ?ϰ ?ᵈ ?𝑡 ?⇎ ?′ ?ᶠ ?𝑢 ?♂ ?ς ?ᵏ ?𝑣 ?₥ ?ϑ ?ᵐ ?𝑤 ?≱ ?⇓ ?ⁿ ?𝑥 ?≯ ?⇐ ?ᵖ ?𝑦 ?≰ ?ᶷ ?ᵗ ?𝑧 ?∤ ?‵ ?ˣ ?Φ ?≁ ?⋍ ?₍ ?Ψ ?⊙ ?☣ ?₎ ?Ρ ?∮ ?¦ ?₊ ?↱ ?⊥ ?· ?₋ ?Ϻ ?₱ ?✓ ?₀ ?Ϸ ?≺ ?© ?₁ ?Τ ?∏ ?⊡ ?₂ ?Ϳ ?  ?↓ ?₃ ?ª ?⇄ ?℻ ?₄ ?⃖ ?⟆ ?≳ ?₅ ?⃡ ?﷼ ?⋛ ?₆ ?º ?ϣ ?≩ ?₇ ?⃗ ?⊏ ?♥ ?₈ ?͍ ?⊐ ?∆ ?₉ ?∀ ?✹ ?ƛ ?₌ ?∧ ?⋆ ?← ?ₐ ?∗ ?⊆ ?⋚ ?ₑ ?⊥ ?⊄ ?〚 ?ₕ ?• ?≻ ?≨ ?ᵢ ?‣ ?⊇ ?≱ ?ⱼ ?◦ ?⊅ ?≰ ?ₖ ?∩ ?√ ?∦ ?ₗ ?χ ?⇅ ?∤ ?ₘ ?◎ ?Ắ ?⊈ ?ₙ ?◯ ?ắ ?⊉ ?ₒ ?● ?Ằ ?🛑 ?ₚ ?○ ?ằ ?¶ ?ᵣ ?⌊ ?Ẵ ?⋔ ?ₛ ?⌋ ?ẵ ?〛 ?ₜ ?⌞ ?↨ ?♠ ?ᵤ ?⌟ ?Ă ?⊆ ?ₓ ?⌈ ?Ĕ ?⊊ ?̰ ?⌉ ?Ğ ?⊇ ?À ?⌜ ?Ĭ ?⊋ ?È ?∪ ?Ŏ ?℡ ?Ì ?⌝ ?Ŭ ?₦ ?Ǹ ?¸ ?ă ?∴ ?Ò ?⇊ ?ĕ ?≜ ?Ù ?↧ ?ğ ?∝ ?Ẁ ?⟱ ?ĭ ?⇚ ?Ỳ ?† ?ŏ ?⇒ ?à ?↡ ?ŭ ?ᴯ ?è ?ϯ ?Ṧ ?ᶱ ?ì ?◈ ?ṧ ?ᶢ ?ǹ ?◆ ?Ǎ ?ᵄ ?ò ?÷ ?Č ?ᶣ ?ù ?◇ ?Ď ?ᵎ ?ẁ ?↙ ?Ě ?ᵚ ?ỳ ?⇙ ?Ǧ ?ʴ ?å ?↘ ?Ȟ ?ᶺ ?æ ?⇘ ?Ǐ ?⊛ ?⊞ ?ℓ ?Ǩ ?∁ ?⊟ ?η ?Ľ ?⋏ ?⊡ ?∄ ?Ň ?⋝ ?𝟘 ?ϥ ?Ǒ ?⋛ ?𝟙 ?‹ ?Ř ?≲ ?𝟚 ?› ?Š ?⋚ ?𝟛 ?≱ ?Ť ?↦ ?𝟜 ?⋙ ?Ǔ ?ℐ ?𝟝 ?⊓ ?Ž ?⇍ ?𝟞 ?‚ ?ǎ ?↚ ?𝟟 ?‘ ?č ?⊈ ?𝟠 ?⇔ ?ď ?⊉ ?𝟡 ?∞ ?ě ?≾ ?𝔹 ?∉ ?ǧ ?🛇 ?ℂ ?∫ ?ȟ ?® ?ℕ ?₭ ?ǐ ?→ ?ℙ ?˛ ?ǰ ?∐ ?ℚ ?⟵ ?ǩ ?⌣ ?ℝ ?⇇ ?ľ ?⊑ ?⊠ ?↢ ?ň ?⊒ ?ℤ ?↚ ?ǒ ?⊊ ?Ç ?↤ ?ř ?≿ ?Ḑ ?⇚ ?š ?⊋ ?Ȩ ?⇍ ?ť ?⁅ ?Ģ ?“ ?ǔ ?№ ?Ḩ ?≰ ?ž ?℞ ?Ķ ?◁ ?ζ ?⁆ ?Ļ ?↞ ?⊮ ?⇈ ?Ņ ?↔ ?⊯ ?⇛ ?Ŗ ?⇔ ?⊪ ?⇕ ?Ş ?↭ ?Ṏ ?ᶦ ?Ţ ?⊔ ?ṏ ?ᶫ ?ç ?℧ ?Ṍ ?ᶰ ?ḑ ?∣ ?Ṹ ?ᶸ ?ȩ ?¬ ?ṍ ?ᵠ ?ģ ?≠ ?ṹ ?ᵆ ?ḩ ?∌ ?Ȭ ?∍ ?ķ ?̸ ?ȭ ?☻ ?ņ ?⊖ ?Ã ?▪ ?ŗ ?Ω ?Ẽ ?⊚ ?ş ?≚ ?Ĩ ?⊝ ?ţ ?▰ ?Ñ ?⋞ ?↓ ?▱ ?Õ ?⋟ ?⇓ ?⅌ ?Ũ ?≼ ?ð ?φ ?Ṽ ?♢ ?↯ ?ψ ?Ỹ ?⋜ ?— ?∎ ?ã ?⇏ ?– ?⟶ ?ẽ ?↛ ?∃ ?⇉ ?ĩ ?ª ?≥ ?⇶ ?ñ ?㉐ ?≫ ?↣ ?õ ?⋨ ?∈ ?↛ ?ũ ?☢ ?Ą ?⊸ ?ṽ ?φ ?Ę ?↦ ?ỹ ?≽ ?Į ?⇛ ?Ǿ ?⋩ ?Ǫ ?⇏ ?ǿ ?≈ ?Ų ?” ?ī ?⯑ ?ą ?▷ ?Α ?↕ ?ę ?ρ ?Δ ?ᴲ ?į ?↠ ?Γ ?ᴻ ?ǫ ?ϻ ?Κ ?ᵙ ?ų ?﹨ ?ᵔ ?← ?ϸ ?Λ ?✦ ?⇐ ?∼ ?Ω ?🚧 ?≤ ?▣ ?Ϡ ?º ?≪ ?▢ ?Ϭ ?≓ ?‘ ?✶ ?Σ ?℗ ?≞ ?✴ ?Θ ?⁒ ?∓ ?⊂ ?⊩ ?▿ ?μ ?∑ ?ᵜ ?◃ ?≠ ?⊃ ?ᵡ ?⇐ ?∋ ?τ ?ᵑ ?ᶝ ?ν ?⁀ ?ᶴ ?ᵞ ?⊛ ?⊤ ?ᶞ ?ʱ ?⊕ ?⇈ ?ᶾ ?ꟹ ?⊝ ?↥ ?ᶲ ?ᶬ ?⊙ ?⟰ ?℠ ?ᶳ ?⊘ ?↕ ?™ ?ᶹ ?⊜ ?⇕ ?ĵ ?ᶽ ?œ ?↖ ?ℵ ?△ ?⊚ ?⇖ ?α ?▴ ?∨ ?↗ ?∐ ?⋇ ?⊗ ?⇗ ?≍ ?≒ ?π ?↟ ?⋯ ?↩ ?± ?˘ ?₡ ?↢ ?→ ?∨ ?⊣ ?↼ ?⇒ ?ˇ ?⋱ ?← ?’ ?₩ ?δ ?↫ ?ß ?¥ ?≐ ?∡ ?≜ ?⊬ ?≡ ?⋪ ?þ ?⊭ ?⅟ ?∥ ?→ ?⊩ ?⌢ ?∖ ?⊎ ?⊫ ?γ ?⃝ ?↑ ?∦ ?ℷ ?℮ ?⊍ ?≄ ?≩ ?▹ ?⇑ ?≇ ?⋧ ?↿ ?Ă ?˜ ?ı ?⇔ ?Ĕ ?≊ ?∞ ?⇒ ?Ğ ?≉ ?κ ?ᶛ ?Ĭ ?≋ ?ϟ ?↶ ?Ŏ ?Ḯ ?λ ?⇊ ?Ŭ ?Ǘ ?⌈ ?↪ ?ă ?ḯ ?《 ?⇇ ?ĕ ?ǘ ?… ?↔ ?ğ ?Ǟ ?≨ ?⋋ ?ĭ ?Ȫ ?⋦ ?→ ?∪ ?Ǖ ?₼ ?↬ ?ŏ ?ǟ ?µ ?× ?ŭ ?ȫ ?− ?∦ ?Ǎ ?ǖ ?∇ ?⋫ ?Č ?Ǜ ?₦ ?↣ ?Ď ?ǜ ?≇ ?⇀ ?Ě ?Ǚ ?≱ ?∢ ?Ǧ ?ǚ ?≰ ?◦ ?Ȟ ?Ä ?≮ ?⊴ ?Ǐ ?Ë ?∉ ?↾ ?Ǩ ?Ḧ ?⊀ ?ꟸ ?Ľ ?Ï ?⊁ ?ᵕ ?Ň ?ω ?ᶤ ?Ǒ ?Ü ?⊕ ?ᵌ ?Ř ?Ẅ ?℥ ?ʵ ?Š ?Ẍ ?£ ?▽ ?Ť ?Ÿ ?′ ?↺ ?Ǔ ?⌉ ?↷ ?Ž ?ë ?》 ?⇃ ?ǎ ?ḧ ?₽ ?↽ ?č ?ï ?₨ ?⇆ ?ď ?ϡ ?⇎ ?ě ?ẗ ?♯ ?↮ ?ǧ ?ϭ ?⋬ ?ȟ ?ẅ ?σ ?⇄ ?ǐ ?ẍ ?≃ ?⋌ ?ǰ ?ÿ ?⌣ ?⇝ ?ǩ ?Ṥ ?⊓ ?‽ ?ľ ?ṥ ?⊔ ?♪ ?ň ?Ǽ ?⊑ ?⊵ ?ǒ ?ǽ ?⊒ ?⊲ ?ř ?Á ?⊈ ?↻ ?š ?Ć ?⊉ ?⇂ ?ť ?É ?∛ ?⋭ ?ǔ ?Ǵ ?∜ ?⇁ ?ž ?Í ?₸ ?⇉ ?℘ ?Ḱ ?θ ?↞ ?≀ ?Ĺ ?× ?⊳ ?ξ ?Ḿ ?⊎ ?ᶟ ?⦃ ?Ń ?ĭ ?▾ ?⊢ ?Ó ?⊨ ?◂ ?⊨ ?Ṕ ?ϖ ?⇋ ?∤ ?Ŕ ?⊢ ?⇌ ?∥ ?Ś ?⋮ ?₡ ?⦄ ?Ú ?ǐ ?※ ?≃ ?Ẃ ?ǰ ?↠ ?≅ ?Ý ?∧ ?⇔ ?Ã ?Ź ?ĩ ?ᶮ ?Ẽ ?á ?Ḯ ?ꭟ ?Ĩ ?ć ?Ǘ ?▸ ?Ñ ?é ?ḯ ?↔ ?Õ ?ǵ ?ǘ ?‱ ?Ũ ?í ?Ǟ ?↭ ?Ṽ ?ḱ ?Ȫ ?⁄ ?Ỹ ?ĺ ?Ǖ ?ʶ ?ã ?ḿ ?ǟ ?ʵ ?ẽ ?ń ?ȫ ?- ?ᶨ ?ĩ ?ó ?ǖ ?ꭞ ?õ ?ṕ ?Ǜ ?ᶪ ?ũ ?ŕ ?ǜ ?ᶵ ?ṽ ?ś ?Ǚ ?ᶧ ?ỹ ?ú ?ǚ ?ᶡ ?≈ ?ẃ ?Ṥ ?ᶩ ?¨ ?ý ?ṥ ?ᶯ ?Ǿ ?ź ?Ǽ ?ˤ ?ǿ ?Ǡ ?ǽ ?ᶼ ?´ ?Ȱ ?Ǡ ?ꭝ ?⓪ ?ǡ ?Ȱ ?ᶭ ?⟶ ?ȱ ?ǡ ?‴ ?⁗ ?́ ?\( ?\[ ?{ ?⁅ ?⁽ ?₍ ?〈 ?⎴ ?⟅ ?⟦ ?⟨ ?⟪ ?⦃ ?〈 ?《 ?「 ?『 ?【 ?〔 ?〖 ?〚 ?︵ ?︷ ?︹ ?︻ ?︽ ?︿ ?﹁ ?﹃ ?﹙ ?﹛ ?﹝ ?（ ?［ ?｛ ?｢ ?\) ?\] ?} ?⁆ ?⁾ ?₎ ?〉 ?⎵ ?⟆ ?⟧ ?⟩ ?⟫ ?⦄ ?〉 ?》 ?」 ?』 ?】 ?〕 ?〗 ?〛 ?︶ ?︸ ?︺ ?︼ ?︾ ?﹀ ?﹂ ?﹄ ?﹚ ?﹜ ?﹞ ?） ?］ ?｝ ?｣ ?∙ ?̇ ?∶ ?  ?◀ ?◁ ?▶ ?▷ ?▲ ?△ ?▼ ?▽ ?◬ ?◭ ?◮ ?‵ ?‶ ?‷ ?̀ ?♭ ?̱ ?⌜ ?⌝ ?⌞ ?⌟ ?⌈ ?⌉ ?⌊ ?⌋ ?̧ ?↓ ?⇓ ?⟱ ?⇊ ?⇵ ?↧ ?⇩ ?↡ ?⇃ ?⇂ ?⇣ ?⇟ ?↵ ?↲ ?↳ ?➥ ?↯ ?̣ ?∩ ?ı ?← ?⇐ ?⇚ ?⇇ ?⇆ ?↤ ?⇦ ?↞ ?↼ ?↽ ?⇠ ?⇺ ?↜ ?⇽ ?⟵ ?⟸ ?↚ ?⇍ ?⇷ ?↹ ?↢ ?↩ ?↫ ?⇋ ?⇜ ?⇤ ?⟻ ?⟽ ?⤆ ?↶ ?↺ ?⟲ ?ł ?∘ ?ø ?→ ?⇒ ?⇛ ?⇉ ?⇄ ?↦ ?⇨ ?↠ ?⇀ ?⇁ ?⇢ ?⇻ ?↝ ?⇾ ?⟶ ?⟹ ?↛ ?⇏ ?⇸ ?⇶ ?↴ ?↣ ?↪ ?↬ ?⇌ ?⇝ ?⇥ ?⟼ ?⟾ ?⤇ ?↷ ?↻ ?⟳ ?⇰ ?⇴ ?⟴ ?⟿ ?➵ ?➸ ?➙ ?➔ ?➛ ?➜ ?➝ ?➞ ?➟ ?➠ ?➡ ?➢ ?➣ ?➤ ?➧ ?➨ ?➩ ?➪ ?➫ ?➬ ?➭ ?➮ ?➯ ?➱ ?➲ ?➳ ?➺ ?➻ ?➼ ?➽ ?➾ ?⊸ ?◂ ?◃ ?◄ ?◅ ?▸ ?▹ ?► ?▻ ?▴ ?▵ ?▾ ?▿ ?◢ ?◿ ?◣ ?◺ ?◤ ?◸ ?◥ ?◹ ?↑ ?⇑ ?⟰ ?⇈ ?⇅ ?↥ ?⇧ ?↟ ?↿ ?↾ ?⇡ ?⇞ ?↰ ?↱ ?➦ ?⇪ ?⇫ ?⇬ ?⇭ ?⇮ ?⇯ ?̆ ?∼ ?̃ ?✂ ?✄ ?≗ ?ō ?‽ ?⁈ ?◀ ?▶ ?▲ ?▼ ?◁ ?▷ ?△ ?▽ ?̇ ?̈ ?⃛ ?⃜ ?ᴬ ?Â ?ᴱ ?Ê ?ᴳ ?Ĝ ?ᴴ ?Ĥ ?ᴵ ?Î ?ᴶ ?Ĵ ?ᴼ ?Ô ?ᵁ ?Û ?ᵂ ?Ŵ ?̂ ?̑ ?͆ ?ᵃ ?â ?ᶜ ?ĉ ?ᵉ ?ê ?ᵍ ?ĝ ?ʰ ?ĥ ?ⁱ ?ⁱ ?î ?ʲ ?ĵ ?⃖ ?⃐ ?⃔ ?ˡ ?ˡ ?ᵒ ?ô ?⃗ ?⃑ ?⃕ ?ʳ ?ʳ ?ˢ ?ŝ ?ᵘ ?û ?̌ ?̆ ?ᵛ ?ᵛ ?ʷ ?ŵ ?ʸ ?ŷ ?ᶻ ?ẑ ?̃ ?͌ ?̣ ?̤ ?̭ ?̯ ?̪ ?̬ ?̮ ?̺ ?ᵥ ?ᵥ ?• ?◦ ?‣ ?⁌ ?⁍ ?● ?○ ?◎ ?◌ ?◯ ?◍ ?◐ ?◑ ?◒ ?◓ ?◔ ?◕ ?◖ ?◗ ?◠ ?◡ ?◴ ?◵ ?◶ ?◷ ?⚆ ?⚇ ?⚈ ?⚉ ?⌞ ?⌟ ?⌊ ?⌋ ?ļ ?⌜ ?⌝ ?⌈ ?⌉ ?◆ ?◇ ?◈ ?↙ ?⇙ ?↘ ?⇘ ?⇲ ?➴ ?➷ ?➘ ?= ?∼ ?∽ ?≈ ?≋ ?∻ ?∾ ?∿ ?≀ ?≃ ?⋍ ?≂ ?≅ ?≌ ?≊ ?≡ ?≣ ?≐ ?≑ ?≒ ?≓ ?≔ ?≕ ?≖ ?≗ ?≘ ?≙ ?≚ ?≛ ?≜ ?≝ ?≞ ?≟ ?≍ ?≎ ?≏ ?≬ ?⋕ ?↔ ?⇔ ?⇼ ?↭ ?⇿ ?⟷ ?⟺ ?↮ ?⇎ ?⇹ ?↜ ?⇜ ?▰ ?▱ ?▬ ?▭ ?▮ ?▯ ?↝ ?⇝ ?⟿ ?■ ?□ ?◼ ?◻ ?◾ ?◽ ?▣ ?▢ ?▤ ?▥ ?▦ ?▧ ?▨ ?▩ ?◧ ?◨ ?◩ ?◪ ?◫ ?◰ ?◱ ?◲ ?◳ ?⋆ ?✦ ?✧ ?✶ ?✴ ?✹ ?★ ?☆ ?✪ ?✫ ?✯ ?✰ ?✵ ?✷ ?✸ ?◂ ?▸ ?▴ ?▾ ?◄ ?► ?◢ ?◣ ?◤ ?◥ ?◃ ?▹ ?▵ ?▿ ?◅ ?▻ ?◿ ?◺ ?◸ ?◹ ?↕ ?⇕ ?↨ ?⇳ ?↖ ?⇖ ?⇱ ?↸ ?↗ ?⇗ ?➶ ?➹ ?➚ ?≁ ?ñ ?⑴ ?① ?⒈ ?❶ ?➀ ?➊ ?⑵ ?② ?⒉ ?❷ ?➁ ?➋ ?⑶ ?③ ?⒊ ?❸ ?➂ ?➌ ?⑷ ?④ ?⒋ ?❹ ?➃ ?➍ ?⑸ ?⑤ ?⒌ ?❺ ?➄ ?➎ ?⑹ ?⑥ ?⒍ ?❻ ?➅ ?➏ ?⑺ ?⑦ ?⒎ ?❼ ?➆ ?➐ ?⑻ ?⑧ ?⒏ ?❽ ?➇ ?➑ ?⑼ ?⑨ ?⒐ ?❾ ?➈ ?➒ ?⒜ ?Ⓐ ?ⓐ ?⒝ ?Ⓑ ?ⓑ ?⒞ ?Ⓒ ?ⓒ ?⒟ ?Ⓓ ?ⓓ ?⒠ ?Ⓔ ?ⓔ ?⒡ ?Ⓕ ?ⓕ ?⒢ ?Ⓖ ?ⓖ ?⒣ ?Ⓗ ?ⓗ ?⒤ ?Ⓘ ?ⓘ ?⒥ ?Ⓙ ?ⓙ ?⒦ ?Ⓚ ?ⓚ ?⒧ ?Ⓛ ?ⓛ ?⒨ ?Ⓜ ?ⓜ ?⒩ ?Ⓝ ?ⓝ ?⒪ ?Ⓞ ?ⓞ ?⒫ ?Ⓟ ?ⓟ ?⒬ ?Ⓠ ?ⓠ ?⒭ ?Ⓡ ?ⓡ ?⒮ ?Ⓢ ?ⓢ ?⒯ ?Ⓣ ?ⓣ ?⒰ ?Ⓤ ?ⓤ ?⒱ ?Ⓥ ?ⓥ ?⒲ ?Ⓦ ?ⓦ ?⒳ ?Ⓧ ?ⓧ ?⒴ ?Ⓨ ?ⓨ ?⒵ ?Ⓩ ?ⓩ ?─ ?│ ?┌ ?┐ ?└ ?┘ ?├ ?┤ ?┬ ?┼ ?┴ ?╴ ?╵ ?╶ ?╷ ?╭ ?╮ ?╯ ?╰ ?╱ ?╲ ?╳ ?╌ ?╎ ?┄ ?┆ ?┈ ?┊ ?╍ ?╏ ?┅ ?┇ ?┉ ?┋ ?═ ?║ ?╔ ?╗ ?╚ ?╝ ?╠ ?╣ ?╦ ?╬ ?╩ ?╒ ?╕ ?╘ ?╛ ?╞ ?╡ ?╤ ?╪ ?╧ ?╓ ?╖ ?╙ ?╜ ?╟ ?╢ ?╥ ?╫ ?╨ ?━ ?┃ ?┏ ?┓ ?┗ ?┛ ?┣ ?┫ ?┳ ?╋ ?┻ ?╸ ?╹ ?╺ ?╻ ?┍ ?┯ ?┑ ?┕ ?┷ ?┙ ?┝ ?┿ ?┥ ?┎ ?┰ ?┒ ?┖ ?┸ ?┚ ?┠ ?╂ ?┨ ?┞ ?╀ ?┦ ?┟ ?╁ ?┧ ?┢ ?╈ ?┪ ?┡ ?╇ ?┩ ?┮ ?┭ ?┶ ?┵ ?┾ ?┽ ?┲ ?┱ ?┺ ?┹ ?╊ ?╉ ?╆ ?╅ ?╄ ?╃ ?╿ ?╽ ?╼ ?╾ ?⋯ ?⋮ ?⋰ ?⋱ ?̅ ?̿ ?̲ ?̳ ?⌶ ?⌷ ?⌸ ?⌹ ?⌺ ?⌻ ?⌼ ?⌽ ?⌾ ?⌿ ?⍀ ?⍁ ?⍂ ?⍃ ?⍄ ?⍅ ?⍆ ?⍇ ?⍈ ?⍉ ?⍊ ?⍋ ?⍌ ?⍍ ?⍎ ?⍏ ?⍐ ?⍑ ?⍒ ?⍓ ?⍔ ?⍕ ?⍖ ?⍗ ?⍘ ?⍙ ?⍚ ?⍛ ?⍜ ?⍝ ?⍞ ?⍟ ?⍠ ?⍡ ?⍢ ?⍣ ?⍤ ?⍥ ?⍦ ?⍧ ?⍨ ?⍩ ?⍪ ?⍫ ?⍬ ?⍭ ?⍮ ?⍯ ?⍰ ?⍱ ?⍲ ?⍳ ?⍴ ?⍵ ?⍶ ?⍷ ?⍸ ?⍹ ?⍺ ?⎕ ?⚀ ?⚁ ?⚂ ?⚃ ?⚄ ?⚅ ?≠ ?≁ ?≉ ?≄ ?≇ ?≆ ?≢ ?≭ ?> ?≫ ?⋙ ?≥ ?≧ ?≳ ?≷ ?≻ ?≽ ?≿ ?⊃ ?⊇ ?⋑ ?⊐ ?⊒ ?⊱ ?⊳ ?⊵ ?⋗ ?⋛ ?⋝ ?⋟ ?< ?≪ ?⋘ ?≤ ?≦ ?≲ ?≶ ?≺ ?≼ ?≾ ?⊂ ?⊆ ?⋐ ?⊏ ?⊑ ?⊰ ?⊲ ?⊴ ?⋖ ?⋚ ?⋜ ?⋞ ?▬ ?▮ ?▭ ?▯ ?■ ?◼ ?◾ ?□ ?◻ ?◽ ?✦ ?✧ ?⑽ ?⑩ ?⒑ ?❿ ?➉ ?➓ ?⑾ ?⑪ ?⒒ ?⑿ ?⑫ ?⒓ ?⒀ ?⑬ ?⒔ ?⒁ ?⑭ ?⒕ ?⒂ ?⑮ ?⒖ ?⒃ ?⑯ ?⒗ ?⒄ ?⑰ ?⒘ ?⒅ ?⑱ ?⒙ ?⒆ ?⑲ ?⒚ ?⒇ ?⑳ ?⒛ ?¼ ?½ ?¾ ?⅓ ?⅔ ?⅕ ?⅖ ?⅗ ?⅘ ?⅙ ?⅚ ?⅛ ?⅜ ?⅝ ?⅞ ?⅟ ?≯ ?≱ ?≩ ?≵ ?⋧ ?≹ ?⊁ ?⋩ ?⊅ ?⊉ ?⊋ ?⋣ ?⋥ ?⋫ ?⋭ ?⋡ ?⋈ ?⋉ ?⋊ ?⋋ ?⋌ ?⨝ ?⟕ ?⟖ ?⟗ ?≮ ?≰ ?≨ ?≴ ?⋦ ?≸ ?⊀ ?⋨ ?⊄ ?⊈ ?⊊ ?⋢ ?⋤ ?⋪ ?⋬ ?⋠ ?♩ ?♪ ?♫ ?♬ ?∟ ?∡ ?∢ ?⊾ ?⊿ ?∠ ?∪ ?⋃ ?∨ ?⋁ ?⋎ ?⨈ ?⊔ ?⨆ ?⋓ ?∐ ?⨿ ?⊽ ?⊻ ?⊍ ?⨃ ?⊎ ?⨄ ?⊌ ?∑ ?⅀ ?∈ ?∉ ?∊ ?∋ ?∌ ?∍ ?⋲ ?⋳ ?⋴ ?⋵ ?⋶ ?⋷ ?⋸ ?⋹ ?⋺ ?⋻ ?⋼ ?⋽ ?⋾ ?⋿ ?⊢ ?⊣ ?⊤ ?⊥ ?⊦ ?⊧ ?⊨ ?⊩ ?⊪ ?⊫ ?⊬ ?⊭ ?⊮ ?⊯ ?⁎ ?⁑ ?⁂ ?✢ ?✣ ?✤ ?✥ ?✱ ?✲ ?✳ ?✺ ?✻ ?✼ ?✽ ?❃ ?❉ ?❊ ?❋ ?∫ ?∬ ?∭ ?∮ ?∯ ?∰ ?∱ ?∲ ?∳ ?∩ ?⋂ ?∧ ?⋀ ?⋏ ?⨇ ?⊓ ?⨅ ?⋒ ?∏ ?⊼ ?⨉ ?∘ ?| ?~ ?^ ?@ ?+ ?* ?: ?. ?, ?! ?$ ?% ?& ?/ ?= ?< ?> ?\; ?- ?, ??))
;; cl-map might not be available

;; (defvar-local operator-known-operators-strg (cl-map 'string 'identity operator-known-operators)
;;   "Used to skip over operators at point.")

(defun operator-setup-strg (opes)
  (let (erg)
    (dolist (ele opes)
      (setq erg (concat (format "%s" (char-to-string ele)) erg)))
    erg))

(defvar-local operator-known-operators-strg (operator-setup-strg operator-known-operators)
  "Used to skip over operators at point.")

;; (setq operator-known-operators-strg (operator-setup-strg operator-known-operators))

(defun following--operator-up ()
  (save-excursion
    (and (< 0 (abs (skip-chars-backward operator-known-operators-strg)))
	 (member (char-before) operator-known-operators)
	 (char-before))))

(defun op-in-string-or-comment-p (&optional pps)
  "Returns beginning position if inside a string or comment,
t at start,nil otherwise.

Optional arg PPS output of (parse-partial-sexp (point-min) (point))"
  (interactive)
  (let* ((erg (or (and pps (nth 8 pps))
		  (nth 8 (parse-partial-sexp (point-min) (point)))
		  (ignore-errors (eq 7 (car-safe (syntax-after (point)))))
		  ;; (ignore-errors (eq 7 (car-safe (syntax-after (1- (point))))))
		  (and comment-start
		       (or (looking-at comment-start)
			   (looking-at comment-start-skip)
			   (looking-back comment-start (line-beginning-position))
			   (looking-back comment-start-skip (line-beginning-position)))))))
    (when (interactive-p) (message "%s" erg))
    erg))

(defun py-in-dict-p (pps)
  "Return t if inside a dictionary."
  (save-excursion
    (and (nth 1 pps)
	 (goto-char (nth 1 pps))
	 (char-equal ?{ (char-after)))))

(defun operator--continue-p ()
  "Uses-cases:
"
  (when (member (char-before (- (point) 1)) operator-known-operators)
    'operator-continue))

(defun operator--in-list-continue-p (list_start_c following_start_c)
  "Use-cases:
Haskell: (>=>) :: Monad"
  (and list_start_c following_start_c (char-equal list_start_c ?\()
       (member following_start_c operator-known-operators)))

(defun operator--closing-colon (char)
  (and (char-equal char ?:)
       ;; (char-equal (char-before (- (point) 1)) ?\))
       (not (char-equal (char-before (- (point) 1)) 32))))

(defun operator--python-notfirst (char start pps list-start-char &optional notfirst notsecond nojoin)
  (let* ((in-list-p (nth 1 pps))
	 (index-p (when in-list-p (save-excursion (goto-char (nth 1 pps)) (and (eq (char-after) ?\[) (not (eq (char-before) 32)))))))
    (cond (notfirst
	   'notfirst)
	  ;; echo(**kargs)
	  ((and (char-equal ?* char) in-list-p)
	   '*-in-list-p)
	  ;; print('%(language)s has %(number)03d quote types.' %
	  ;;     {'language': "Python", "number": 2})
	  ;; don't space ‘%’
	  ((and (nth 1 pps) (nth 3 pps)
		'string-in-list))
	  ;; with open('/path/to/some/file') as file_1,
	  ((member char (list ?\; ?, 40 41))
	   'list-op)
	  ((member char (list ?.))
	   'dot)
	  ;; def f(x, y):
	  ;; if len(sys.argv) == 1:
	  ((operator--closing-colon char)
	   'operator--closing-colon)
	  (index-p
	   'index-p)
	  ((looking-back "[[:alpha:]ÄÖÜäöüß.]")
	   'in-word)
	  ;; ((py-in-dict-p pps)
	  ;;  'py-in-dict-p)
	  ((or (looking-back "lambda +\\_<[^ ]+\\_>:" (line-beginning-position))
	       ;; for i in c :
	       (looking-back "\\_<for\\_>+ +\\_<[^ ]+\\_> +in +\\_<[^ ]+:" (line-beginning-position))
	       (looking-back "\\_<as\\_>+ +\\_<[^ ]+:" (line-beginning-position))
	       (looking-back "return +[^ ]+" (line-beginning-position)))
	   'after-symbol))))

(defun operator--python-notsecond (char start pps list-start-char &optional notfirst notsecond nojoin)
  (let* ((in-list-p (nth 1 pps))
	 (index-p (when in-list-p (save-excursion (goto-char (nth 1 pps)) (and (eq (char-after) ?\[) (not (eq (char-before) 32)))))))
    (cond (notsecond
	   'notsecond)
	  ((eq char list-start-char)
	   'list-start-char)
	  ;; echo(**kargs)
	  ((and (char-equal ?* char) in-list-p)
	   '*-in-list-p)
	  ((and (char-equal ?- char) in-list-p)
	   '--in-list-p)
	  ;; print('%(language)s has %(number)03d quote types.' %
	  ;;     {'language': "Python", "number": 2})
	  ;; don't space ‘%’
	  ((and (nth 1 pps) (nth 3 pps))
	   'string-in-list)
	  ;; (char-equal char ?~)
	  ;; with open('/path/to/some/file') as file_1,
	  ((member char (list ?\; ?\( ?\) ?~ ?\[ ?\]))
	   'list-op)
	  ((member char (list ?.))
	   'dot)
	  ((member char (list ?:))
	   'colon)
	  ((looking-back "[[:alpha:]ÄÖÜäöüß.]")
	   'in-word)
	  ((or (looking-back "[ \t]*\\_<\\(async def\\|class\\|def\\)\\_>[ \n\t]+\\([[:alnum:]_]+ *(.*)-\\)" (line-beginning-position))
	       (and
		;; return self.first_name, self.last_name
		(not (char-equal char ?,))
		(looking-back "return +[^ ]+.*" (line-beginning-position))))
	   'after-symbol))))

(defun operator--do-python-mode (char start pps list-start-char &optional notfirst notsecond nojoin)
  "Python"
  (setq operator-known-operators (remove ?. operator-known-operators))
  (let* ((notfirst (operator--python-notfirst char start pps list-start-char notfirst notsecond nojoin))
	 (notsecond (operator--python-notsecond char start pps list-start-char notfirst notsecond nojoin))
	 (nojoin (or nojoin (eq char list-start-char))))
    (operator--final char start notfirst notsecond nojoin)))

(defun operator--haskell-notfirst (char pps list-start-char notfirst)
  (cond (notfirst
	 'notfirst)
	((and (eq 'haskell-interactive-mode major-mode)
	      (save-excursion (backward-char 1)
			      (looking-back haskell-interactive-prompt (line-beginning-position))))
	 'haskell-interactive-prompt)
	(list-start-char
	 ;; data Contact =  Contact { name :: "asdf" }
	 ;; (unless (eq list-start-char ?{)
	 (cond ((char-equal ?, char)
		'list-separator)
	       ((and (char-equal ?\[ list-start-char)
		     (char-equal ?. char))
		'construct-for-export)
	       ((and (char-equal ?\[ list-start-char)
		     (char-equal ?, char))
		'operator--in-list-continue)
	       ((char-equal ?* char)
		'char-equal-\*-in-list-p)
	       ((member char (list ?\( ?\) ?\]))
		'listing)
	       ((nth 3 pps)
		'and-nth-1-pps-nth-3-pps)
	       ((and (nth 1 pps) (not (member char (list ?: ?, ?\[ ?\] ?\)))))
		'in-list-p)))
	;; ((member char (list ?\; ?,)))
	((or (member (char-before (1- (point))) operator-known-operators)
	     (and (eq (char-before (1- (point)))?\s) (member (char-before (- (point) 2)) operator-known-operators)))
	 'join-known-operators)
	((looking-back "^-" (line-beginning-position))
	 'comment-start)
	((looking-back "lambda +\\_<[^ ]+\\_>:" (line-beginning-position)))
	((looking-back "return +[^ ]+" (line-beginning-position)))
	((looking-back "import +[^ ]+" (line-beginning-position)))
	((looking-back "forall +[^ ]+.*" (line-beginning-position)))))

(defun operator--haskell-notsecond (char pps list-start-char notsecond)
  (cond (notsecond)
	((or (char-equal ?\[ char) (char-equal ?\( char))
	 'list-opener)
	((and (eq 'haskell-interactive-mode major-mode)
	      (save-excursion (backward-char)
			      (looking-back (concat haskell-interactive-prompt " *:[a-z]+ *") (line-beginning-position))))
	 'haskell-interactive-prompt)
	(list-start-char
	 ;; data Contact =  Contact { name :: "asdf" }
	 (cond ((char-equal ?, char)
		'list-separator)
	       ((and (char-equal ?\[ list-start-char)
		     (char-equal ?, char))
		'construct-for-export)
	       ((and (nth 1 pps) (not (member char (list ?: ?,))))
		'in-list-p)))
	((nth 3 pps)
	 'in-string)
	((member char (list ?\( 41 93))
	 'listing)
	;; index-p
	((and
	  ;; "even <$> (2,2)"
	  (not (char-equal char ?,))
	  (looking-back "^return +[^ ]+.*" (line-beginning-position))))
	((looking-back "^-" (line-beginning-position))
	 'comment-start)
	((looking-back "import +[^ ]+." (line-beginning-position)))))

(defun operator--do-haskell-mode (char orig pps list-start-char &optional notfirst notsecond)
  "Haskell"
  (let* ((notfirst (operator--haskell-notfirst char pps list-start-char notfirst))
	 (notsecond (operator--haskell-notsecond char pps list-start-char notsecond))
	 (nojoin
	  (cond ((member char (list ?, ?\[ ?\] ?\))))
		((save-excursion (backward-char) (looking-back ") +" (line-beginning-position) ))))))
    (operator--final char orig notfirst notsecond nojoin)))

(defun operator--org-notfirst (char pps &optional list-start-char notfirst)
  (cond (notfirst 'notfirst)
	((char-equal ?, char)
	 'list-separator)
	((looking-back "[[:alpha:]ÄÖÜäöüß.]")
	 'in-word)
	((member char (list ?\[ ?. ?:))
	 'intro)
	((and (eq ?\[ list-start-char)
	      (char-equal ?, char))
	 'operator--in-list-continue)
	((char-equal ?* char)
	 'char-equal-\*-in-list-p)
	((member char (list ?\( ?\) ?\]))
	 'listing)
	((nth 3 pps)
	 'and-nth-1-pps-nth-3-pps)
	((and (nth 1 pps) (not (member char (list ?: ?, ?\[ ?\] ?\)))))
	 'in-list-p)
	;; ((member char (list ?\; ?,)))
	((or (member (char-before (1- (point))) operator-known-operators)
	     (and (eq (char-before (1- (point)))?\s) (member (char-before (- (point) 2)) operator-known-operators)))
	 'join-known-operators)
	((looking-back "^<s?" (line-beginning-position))
	 'src-block)))

(defun operator--org-notsecond (char pps &optional list-start-char notsecond)
  (cond (notsecond
	 'notsecond)
	((or (char-equal ?\[ char) (char-equal ?\( char))
	 'list-opener)
	((looking-back "[[:alpha:]ÖÄÜäöüß.]")
	 'in-word)
	(list-start-char
	 ;; data Contact =  Contact { name :: "asdf" }
	 (cond ((char-equal ?, char)
		'list-separator)
	       ((and (eq ?\[ list-start-char)
		     (char-equal ?, char))
		'construct-for-export)
	       ((and (nth 1 pps) (not (member char (list ?: ?,))))
		'in-list-p)))
	((nth 3 pps)
	 'in-string)
	((member char (list ?\( 41 93))
	 'listing)
	;; index-p
	((and
	  ;; "even <$> (2,2)"
	  (not (char-equal char ?,))
	  (looking-back "^return +[^ ]+.*" (line-beginning-position))))
	((looking-back "^<s?" (line-beginning-position))
	 'src-block)))

(defun operator--do-org-mode (char orig pps list-start-char &optional notfirst notsecond)
  "Haskell"
  (let* ((notfirst (operator--org-notfirst char pps list-start-char notfirst))
	 (notsecond (operator--org-notsecond char pps list-start-char notsecond))
	 (nojoin
	  (cond ((member char (list ?, ?\[ ?\] ?\))))
		((save-excursion (backward-char) (looking-back ") +" (line-beginning-position) ))))))
    (operator--final char orig notfirst notsecond nojoin)))


(defun operator--text-notfirst (char start pps list-start-char notfirst)
  (cond (notfirst
	 'notfirst)
	((member char (list ?\; ?\( ?, ?. ?: ?\? ?! ?@))
	 'punct-class)
	((or (member (char-before (1- (point))) operator-known-operators)
	     (and (eq (char-before (1- (point)))?\s) (member (char-before (- (point) 2)) operator-known-operators)))
	 'join-known-operators)
	((member char (list ?*))
	 'org-special)
	((looking-back "[[:alpha:]äöüß.]")
	 'in-word)))

(defun operator--text-notsecond (char start pps list-start-char notsecond)
  (cond (notsecond)
	((looking-back "[[:alpha:]][-/öäüßÄÖÜ]")
	 'in-word)
	((member char (list ?@))
	 'et)
	;; ((member char (list ?.))
	;;  'dot)
	((member char (list ?\[ ?{ ?\( ?\" ?'))
	 'open-paren)
	((nth 3 pps)
	 'in-string)
	))

(defun operator--do-text-mode (char orig pps list-start-char &optional notfirst notsecond)
  "Haskell"
  (let* ((notfirst
	  (operator--text-notfirst char orig pps list-start-char notfirst))
	 (notsecond
	  (operator--text-notsecond char orig pps list-start-char  notsecond))
	 (nojoin
	  (cond ((member char (list ?, ?\[ ?\] ?\))))
		((save-excursion (backward-char) (looking-back ") +" (line-beginning-position)))))))
    (operator--final char orig notfirst notsecond nojoin)))

(defun operator--join-operators-maybe (char)
  ;; (skip-chars-backward operator-known-operators-strg)
  (and (or (eq (char-before (- (point) 1)) 32)
	   ;; print("Fehler: Richig war " ++
	   (eq (char-before) char)
	   )
       (or (member (char-before (- (point) 2)) operator-known-operators)
	   (member (char-before (- (point) 1)) operator-known-operators))
       (not (ignore-errors (eq (char-syntax (char-before (- (point) 2))) 41)))
       (save-excursion (backward-char)
		       (and (eq (char-before) 32)(delete-char -1))
		       t)))

(defun operator--final (char orig &optional notfirst notsecond nojoin)
  ;; (when (member char operator-known-operators)

  (cond (notfirst
	 (operator--join-operators-maybe char))
	((not notfirst)
	 (or (unless nojoin (operator--join-operators-maybe char))
	     (save-excursion (goto-char (1- orig))
			     (unless (eq (char-before) ?\s)
			       (just-one-space))))))
  (unless notsecond
    (if (eq (char-after) ?\s)
	(forward-char 1)
      (just-one-space))))

(defun operator--do-intern (char orig)
  (let* ((pps (parse-partial-sexp (point-min) (point)))
	 (list-start-char
	  (and (nth 1 pps) (save-excursion
			     (goto-char (nth 1 pps)) (char-after))))
	 (notfirst
	  (cond ((and (member char (list ?@ ?> ?.)) (looking-back (concat "<[[:alnum:]_@.]+" (char-to-string char)) (line-beginning-position)))
		 'email-adress)
		;; fails in haskell -
		;; data Contact =  Contact { name :: String
                ;;                         ,"
		;; (and (nth 1 pps) (char-equal char ?,))
		((op-in-string-or-comment-p pps)
		 'in-string-or-comment-p)))
	 (notsecond
	  (cond
	   ((and (member char (list ?@ ?> ?.)) (looking-back (concat "<[[:alnum:]_@.]+" (char-to-string char)) (line-beginning-position)))
	    'email-adress)
	   ((op-in-string-or-comment-p pps)
	    'in-string-or-comment-p))))
    (pcase major-mode
      (`python-mode
       (operator--do-python-mode char orig pps list-start-char notfirst notsecond))
      (`py-python-shell-mode
       (operator--do-python-mode char orig pps list-start-char notfirst notsecond))
      (`py-ipython-shell-mode
       (operator--do-python-mode char orig pps list-start-char notfirst notsecond))
      ;; (`emacs-lisp-mode
      ;;  (operator--do-emacs-lisp-mode char orig pps list-start-char notfirst notsecond))
      (`org-mode
       (operator--do-org-mode char orig pps list-start-char notfirst notsecond))
      (`haskell-mode
       (operator--do-haskell-mode char orig pps list-start-char notfirst notsecond))
      (`haskell-interactive-mode
       (operator--do-haskell-mode char orig pps list-start-char notfirst notsecond))
      (`inferior-haskell-mode
       (operator--do-haskell-mode char orig pps list-start-char notfirst notsecond))
      (`text-mode
       (operator--do-text-mode char orig pps list-start-char notfirst notsecond))
      (`org-mode
       (operator--do-text-mode char orig pps list-start-char notfirst notsecond))
      ((pred derived-mode-p)
       (operator--do-text-mode char orig pps list-start-char notfirst notsecond))
      (_ (operator--final char orig notfirst notsecond)))))

(defun operator-do ()
  "Act according to operator before point, if any."
  (interactive "*")
  (when (member (char-before) operator-known-operators)
    (operator--do-intern (char-before) (copy-marker (point)))))

(define-minor-mode operator-mode
  "Toggle automatic insertion of spaces around operators if appropriate.

With a prefix argument ARG, enable Electric Spacing mode if ARG is
positive, and disable it otherwise. If called from Lisp, enable
the mode if ARG is omitted or nil.

This is a local minor mode.  When enabled, typing an operator automatically
inserts surrounding spaces, e.g., `=' might become ` = ',`+=' becomes ` += '.

With prefix-key ‘C-q’ inserts character literally."
  :global nil
  :group 'electricity
  :lighter " _~_ "

  ;; body
  (if operator-mode
      (progn ;; (operator-setup)
	     (add-hook 'post-self-insert-hook
                       ;; #'operator-post-self-insert-function nil t)
		       #'operator-do nil t))
    (remove-hook 'post-self-insert-hook
		 ;; #'operator-post-self-insert-function t)))
		 #'operator-do t)))

(provide 'operator-mode)
;;; operator-mode.el ends here
