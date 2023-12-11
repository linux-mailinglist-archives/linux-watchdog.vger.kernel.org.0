Return-Path: <linux-watchdog+bounces-236-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7017A80D129
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 17:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0DBA1F216C9
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 16:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1E64CB2B;
	Mon, 11 Dec 2023 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m0uVrSZB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639D6B4
	for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 08:24:14 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-336121f93e3so1252149f8f.0
        for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 08:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311853; x=1702916653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/cXq9Za6JktKkUZswxvGGItoZdewy469raLmIqDNRsg=;
        b=m0uVrSZBEwYdPA0GgqKcEO2/xW6naSQXY98yAo4amNXBpCctSGyqRvF+AEUi9yNOS7
         ONjjlm5zJjAC4yRxu2lLDESSNMqCjqisDYA1YlrJhC59E40jaoe1jTNmpL4SP0xnlYiM
         A08CDpj25KWU6tKTZb3pxUzvUWQFs4bsxDQIdRFb5cy6GXS8N50uC5B8lOwaxwrbc/jI
         bZInJ1gEaavEKE2pvYNM7qFdIkjiWmmG8MY9HNRtvoBH8T51HIJqPWsV6z8BjCxRDjGR
         zAHn+vTSB+wkakMn35o2S98ol4Ym9/QOWgXL/RHY0SswL8RAtqDm/9yfqajqXqEmHSav
         BaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311853; x=1702916653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cXq9Za6JktKkUZswxvGGItoZdewy469raLmIqDNRsg=;
        b=TBZ5YonSvRPn+I9iDIM5Q5vZ1bfDKV9ljcO1Z367W3iKjtWZQ+zAULXnzY+bev4EUF
         4s5J2GVr1HKENhws7ujH2vmKoFmhwpdNKjJerj2M8l2s677alHHd2RU3cbhUeCZjdNQR
         4smTwexk/R1lUQWySFNud7XmcVmN+4F2XGgD8926URS6hzWa/OJ+mJal7+CXMH+N37nL
         AU/7xa0DSI7qah9r12f6GrnicfpP1v1tZdpgNNwsL2yBhgxsGjqlZt+oWIt2Uz59UDIU
         qrPJXV29NlrkdOTEiN9b+4B+NuBt4nYOe1JQRybJcfbQ3CfAV8wDt6xyNQXOtQXqYblx
         tTsw==
X-Gm-Message-State: AOJu0YzBYsjntZFJgNEOB3qVgIMZq9IeUNOHBno/56TtTvvi45OsFcWV
	DAcVkix2swCeo8D3lu913xlysA==
X-Google-Smtp-Source: AGHT+IHQA45M4mily08i4J1ZnFRpkUa/Y7hitVW64pSlMl5W1Hr/yd6YFlbtw01ie2DCY1JVJsNOxA==
X-Received: by 2002:adf:fe01:0:b0:333:4169:2ada with SMTP id n1-20020adffe01000000b0033341692adamr2386977wrr.44.1702311852793;
        Mon, 11 Dec 2023 08:24:12 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:12 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v7 00/16] Add minimal Tensor/GS101 SoC support and Oriole/Pixel6 board
Date: Mon, 11 Dec 2023 16:23:15 +0000
Message-ID: <20231211162331.435900-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi folks,

This series adds initial SoC support for the GS101 SoC and also initial board
support for Pixel 6 phone (Oriole).

Thankyou to everyone who has reviewed and tested the previous series. Your
time and effort doing so is much appreciated! If any relevant subsystem
maintainers can send a acked-by that would be much appreciated. In particular

@RobH: Please can you re-review google.yaml as a ect node was added since you
gave your previous reviewed-by

@Guenter/Wim: If you're happy, can you send an acked-by for Watchdog changes?

V7 incorporates the review feedback received so far, and is rebased onto
linux-next as per Krzysztof request to incorporate all his dt-binding changes
for exynos. I'm really hoping V7 will be the last series, and we can get this
series merged this week so it will make it into v6.8 Linux release.

v7 fixes up various cosmetic nits in device tree and drivers regarding
alphabetical ordering. See below for more verbose details. There is one
additional patch to fixup some incorrect numbering and spelling typo
in the google,gs101.h. Also the patches which have already been applied
have been dropped from the series.

As this series spans multiple subsytems the expectation is that Krzysztof
will apply the whole series through the Samsung SoC tree. If the relevant
subsystem maintainers can give a acked-by or reviewed-by on the relevant
patches that would be most appreciated!

The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro
(raven) phones. Currently DT is added for the gs101 SoC and Oriole.
As you can see from the patches the SoC is based on a Samsung Exynos SoC,
and therefore lots of the low level Exynos drivers and bindings can be
re-used.

The support added in this series consists of:
* cpus
* pinctrl
* CCF implementation of cmu_top, cmu_misc & cmu_apm
* watchdog
* USI uart
* gpio

This is enough to boot through to a busybox initramfs and shell using an
upstream kernel though :) More platform support will be added over the
following weeks and months.

For further information on how to build and flash the upstream kernel on your
Pixel 6, with a prebuilt busybox initramfs please refer to the script and
README.md here:

https://git.codelinaro.org/linaro/googlelt/pixelscripts

Note: Booting without a dtbo works with some versions of the bootloader
but crashes on others. Later versions aren't necessarily better. You can
get the bootloader version with `fastboot getvar version-bootloader`
Known good bootloader versions are: -
- slider-1.3-11000330
- slider-1.2-9152140
Known to crash without dtbo
- slider-1.3-10780582

kind regards,

Peter.

lore v6: https://lore.kernel.org/all/25533a7f-326f-48d1-a8a6-e5798bdca4b4@linaro.org/T/
lore v5: https://lore.kernel.org/all/20231201160925.3136868-1-peter.griffin@linaro.org/T/
lore v4: https://lore.kernel.org/linux-arm-kernel/20231120212037.911774-1-peter.griffin@linaro.org/T/
pw   v3: https://patchwork.kernel.org/project/linux-samsung-soc/cover/20231011184823.443959-1-peter.griffin@linaro.org/
lore v2: https://lore.kernel.org/all/20231010224928.2296997-1-peter.griffin@linaro.org/
lore v1: https://lore.kernel.org/linux-arm-kernel/20231005155618.700312-1-peter.griffin@linaro.org/

Changes since v6:
 - Collect up Reviewed-by tags
 - s3c2410_wdt: alphabetical ordering of compatible (Krzysztof)
 - pinctrl-samsung: alphabetical ordering of compatible (Krzysztof)
 - gs101.dtsi: alphabetical node ordering, vendor properties end of node (Krzysztof)
 - Header guard doesn't match location (Krzysztof)
 - Fix incorrect numbering and spelling typo in google,gs101 and clk-gs101 (Andre)

Changes since v5:
 - Collect up Reviewed-by and Tested-by tags
 - clk-gs101: reorder cmu_top parents in register offset order (Peter)
 - clk-gs101: Review cmu_top and cmu_misc parents, fix a few typos
 - clk-gs101: Add more name mangling to shorten DT and Linux clock name strings (Sam)
 - pinctrl: samsung: Drop support for digital/analog selectable filters (Peter)
 - Fixup cmu_top yaml example and some nitpicks (Sam)
 - Fixup some spelling nitpicks in google.yaml (Sam)
 - samsung,pinctrl-wakeup-interrupt: drop second not required google,gs101-wakeup-eint compatible (Krzysztof)
 - exynos-usi.yaml: add google,gs101-usi to previous enum (Krzysztof)
 - s3c2410_wdt: move comment, double whitespace, add BIT macro (Sam)

Changes since v4:
 - clk-gs101: order cmu_top by register address, fix incorrect mux widths,
   add missing mux/div/gates (Andre)
 - google,gs101.h: add missing space in comment (Andre)
 - ckl-gs101:google,gs101.h add all remaining gates for cmu_misc and cmu_apm
 - update pmu dt labels (Krzysztof)
 - Remove uart16 rts/tx gpio definitions (Krzysztof)
 - Fixup various dts cosmetic nits (using consts, alignments,
   names) (Sam/Krzysztof)
 - Add more specific compatibles for arm cpu's and pmu (Sam)
 - Use address-cells 1 and ranges property for SoC addresses (Sam)
 - Encapsulate uart node in USI node (Sam)
 - Remove earlycon from bootargs
 - s3c2410_wdt: Reword QUIRK_HAS_DBGACK_BIT docs and add comment (Guenter)
 - s3c2410_wdt: Reorder DBGACK_MASK functionality first, gs101
   SoC second (Sam/Krzysztof)
 
Changes since v3:
 - Add reviewed-by and tested-by tags
 - google,gs101-clock.yaml: move Required to before Allof,
   enum for cmu*top/misc (Krzysztof)
 - samsung-wdt.yaml: stick to 80chars (Sam)
 - google.yaml - remove new line
 - samsung,pinctrl-wakeup-interrupt: sort alphabetically (RobH)
 - gs101-oriole.dts: update gpio-keys pinctrl-0 phandle for keys (Stephen)
 - samsung,exynos-sysreg.yaml - Alphabetical order (RobH)
 - pinctrl-exynos: update/move comments, slight cosmetic changes (Sam)
 - samsung_tty.c: update to generic drv_data name/macro (Arnd)
 - samsung_uart.yaml: make samsung,uart-fifosize required for gs101-uart (Arnd)
 - pinctrl-exynos: Remove eint irqs from alive pin controller node (Peter/Rob)
 - Fixup kernel test robot unused const variable warnings
 - clk-gs101: Update to mout_cmu_eh_bus to CLK_CON_MUX_MUX_CLKCMU_EH_BUS
   (Chanwoo)
 - clk-gs101: Update g3aa gout/dout/mout names to g3aa_g3aa for
   consistency (Chanwoo)
 - Remove .eint_gpio_init() cb on alive, alive_far, gsacore & gsactrl
   banks (Sam)
 - s3c2410_wdt: Drop windowed watchdog mode for now (Peter)
 - s3c2410_wdt: Separate gs101 SoC support from dbgack feature (Sam)
 - Move dts to arch/arm64/boot/dts/exynos/google directory (Krzysztof)

Changes since v2:
 - Fixup pinctrl@174d0000: interrupts: [..] is too long DTC warning (Tudor)
 - Add missing windowed watchdog code (Guenter)
 - Fixup UART YAML bindings error (Krzysztof)
 - gs101.dtsi add missing serial_0 alias (me)
 - samsung_tty.c: fixup gs101_serial_drv_data so fifosize is obtained from DT
 
Changes since v1:
 - Remove irq/gs101.h and replace macros with irq numbers globally
 - exynos-pmu - keep alphabetical order
 - add cmu_apm to clock bindings documentation
 - sysreg bindings - remove superfluous `google,gs101-sysreg`
 - watchdog bindings - Alphanumerical order, update gs201 comment
 - samsung,pinctrl.yaml - add new "if:then:else:" to narrow for google SoC
 - samsung,pinctrl-wakeup-interrupt.yaml - Alphanumerical order
 - samsung,pinctrl- add google,gs101-wakeup-eint compatible
 - clk-pll: fixup typos
 - clk-gs101: fix kernel test robot warnings (add 2 new clocks,dividers,gate)
 - clk-gs101: fix alphabetical order
 - clk-gs101: cmu_apm: fixup typo and missing empty entry
 - clk-gs101: cmu_misc: remove clocks that were being registerred twice
 - pinctrl: filter sel: rename/reorder variables, add comment for FLTCON
   bitfield
 - pinctrl: filter sel: avoid setting reserved bits by loop over FLTCON1 pins
   as well
 - pinctrl: gs101: rename bank_type_6/7 structs to be more specific,
   split from filter
 - watchdog: s3c2410_wdt: remove dev_info prints
 - gs101.dtsi/oriole.dts: order by unit node, remove underscores from node
   name, blank lines add SoC node, split dts and dtsi into separate patches,
   remove 'DVT' suffix
 - gs101-oriole.dtso: Remove overlay until board_id is documented properly
 - Add GS101_PIN_* macros to gs101-pinctrl.h instead of using Exynos ones
 - gpio-keys: update linux,code to use input-event-code macros
 - add dedicated gs101-uart compatible

Peter Griffin (15):
  dt-bindings: watchdog: Document Google gs101 watchdog bindings
  dt-bindings: arm: google: Add bindings for Google ARM platforms
  dt-bindings: serial: samsung: Add google-gs101-uart compatible
  dt-bindings: serial: samsung: Make samsung,uart-fifosize a required
    property
  dt-bindings: clock: google,gs101: fix incorrect numbering and DGB
    suffix
  clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
  clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support
  pinctrl: samsung: Add gs101 SoC pinctrl configuration
  watchdog: s3c2410_wdt: Add support for WTCON register DBGACK_MASK bit
  watchdog: s3c2410_wdt: Update QUIRK macros to use BIT macro
  watchdog: s3c2410_wdt: Add support for Google gs101 SoC
  tty: serial: samsung: Add gs101 compatible and common
    fifoszdt_serial_drv_data
  arm64: dts: exynos: google: Add initial Google gs101 SoC support
  arm64: dts: exynos: google: Add initial Oriole/pixel 6 board support
  MAINTAINERS: add entry for Google Tensor SoC

Tudor Ambarus (1):
  dt-bindings: soc: samsung: usi: add google,gs101-usi compatible

 .../devicetree/bindings/arm/google.yaml       |   53 +
 .../bindings/serial/samsung_uart.yaml         |   11 +
 .../bindings/soc/samsung/exynos-usi.yaml      |    1 +
 .../bindings/watchdog/samsung-wdt.yaml        |    8 +-
 MAINTAINERS                                   |   10 +
 arch/arm64/boot/dts/exynos/Makefile           |    2 +
 arch/arm64/boot/dts/exynos/google/Makefile    |    4 +
 .../boot/dts/exynos/google/gs101-oriole.dts   |  105 +
 .../boot/dts/exynos/google/gs101-pinctrl.dtsi | 1249 ++++++++
 .../boot/dts/exynos/google/gs101-pinctrl.h    |   33 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi  |  473 ++++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-gs101.c               | 2512 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |    6 +
 drivers/clk/samsung/clk-pll.h                 |    3 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    |  140 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |    1 +
 drivers/tty/serial/samsung_tty.c              |   16 +
 drivers/watchdog/s3c2410_wdt.c                |   87 +-
 include/dt-bindings/clock/google,gs101.h      |  118 +-
 21 files changed, 4761 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/google/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101.dtsi
 create mode 100644 drivers/clk/samsung/clk-gs101.c

-- 
2.43.0.472.g3155946c3a-goog


