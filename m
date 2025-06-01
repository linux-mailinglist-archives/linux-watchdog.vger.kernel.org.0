Return-Path: <linux-watchdog+bounces-3597-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E778BAC9E7A
	for <lists+linux-watchdog@lfdr.de>; Sun,  1 Jun 2025 14:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C98A0188F071
	for <lists+linux-watchdog@lfdr.de>; Sun,  1 Jun 2025 12:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F041A8F9E;
	Sun,  1 Jun 2025 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="KCmewacW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58011993BD;
	Sun,  1 Jun 2025 12:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748779686; cv=none; b=Teisl4dxuLJ5U9B4IOQbmwXbUrvXWN/P8z4+3TzIhzDcfNPxMFfk/gBjTF5UWmcOKJp7/z9+NCw6UwBIR6+e6oDDwWsRubkG1emKwsPqgijMmUbUQKAensASMXIBD1rhKpDp1oRV39dRYPjwxQG07wr2593LNgjuF1ooG/vafx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748779686; c=relaxed/simple;
	bh=2GdmBCH71pREFcVk7mC6hOy10fz7iBChE5PhaQXBYoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X/8jbqUvMKbipZgDtJMWK8HlYQ/cehMunaFAKSfaxXEvitvFy8Zidh2Z3XZXzmIXWaPYRMiejfxz0ZL8Jl7FTrgb94vGpjZx2iRtTri492VJb7S7sXzsK6oCG0HyqXvEui80JAJltfqfd1+vO3n7QxIskjhNsbhF6lUKZnkckMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (2048-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=KCmewacW; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 22F1840A00; Sun,  1 Jun 2025 13:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 22F1840A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20250313; t=1748777341;
	bh=2GdmBCH71pREFcVk7mC6hOy10fz7iBChE5PhaQXBYoY=;
	h=Date:From:To:Cc:Subject:From;
	b=KCmewacWKK5jvu9EHGoMEPQ4ROpuRSa3chiiyaV6vBEpw/gn5RLAyyLU/kvqcp7X6
	 cH2t0QbfoJ1YCqi4AQ9jfRizwHEBCA71daJtr496lc/xKxdPI+d9QvKWwhJEQ+FPVe
	 5lUz0Gqc1NQOI6IFewH3eqyRThelTM0n7X5fe2icnVI0eW8hHX2kHbz7OmOjWlcWKH
	 D8zZeB9MEH9YAYSMeFkYR+8kjgxHIQW4yl4pQ1LcG4VSZsl7PTj17C1S9ENkGjinHK
	 +x1a7Pbk3YUNuqZ6RXQ1SV98fCSFIpgGpT3yqsk5Bzjf11p7E2cIvznYr5y1ztGt7T
	 pCTzwROaHVVvQ==
Date: Sun, 1 Jun 2025 13:29:00 +0200
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Diogo Ivo <diogo.ivo@siemens.com>, Florian Klink <flokli@flokli.de>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Henry Martin <bsdhenrymartin@gmail.com>,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Ziyan Fu <fuzy5@lenovo.com>
Subject: [GIT PULL REQUEST] watchdog - v6.16 release cycle.
Message-ID: <20250601112900.GA6378@www.linux-watchdog.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Linus,

Please pull following watchdog changes for the v6.16 release cycle.

This series contains:
* Add Watchdog Timer for the NXP S32 platform
* Add driver for Intel OC WDT
* Add exynos990-wdt
* Various other fixes and improvements

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 4856ebd997159f198e3177e515bda01143727463:

  Merge tag 'drm-fixes-2025-05-24' of https://gitlab.freedesktop.org/drm/kernel (2025-05-23 15:17:55 -0700)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-6.16-rc1

for you to fetch changes up to 158f9f2f71523bab787f4fa7a7a1f390524350ca:

  watchdog: iTCO_wdt: Update the heartbeat value after clamping timeout (2025-06-01 13:16:37 +0200)

----------------------------------------------------------------
linux-watchdog 6.16-rc1 tag

----------------------------------------------------------------
Antonio Borneo (1):
      watchdog: arm_smc_wdt: get wdt status through SMCWD_GET_TIMELEFT

Daniel Lezcano (2):
      dt-bindings: watchdog: Add NXP Software Watchdog Timer
      watchdog: Add the Watchdog Timer for the NXP S32 platform

Diogo Ivo (1):
      watchdog: Add driver for Intel OC WDT

Florian Klink (1):
      watchdog: apple: set max_hw_heartbeat_ms instead of max_timeout

Guenter Roeck (1):
      watchdog: iTCO: Drop driver-internal locking

Gustavo A. R. Silva (1):
      watchdog: cros-ec: Avoid -Wflex-array-member-not-at-end warning

Henry Martin (1):
      watchdog: lenovo_se30_wdt: Fix possible devm_ioremap() NULL pointer dereference in lenovo_se30_wdt_probe()

Igor Belwon (2):
      dt-bindings: watchdog: samsung-wdt: Add exynos990-wdt compatible
      watchdog: s3c2410_wdt: Add exynos990-wdt compatible data

Kathiravan Thirumoorthy (1):
      watchdog: qcom: introduce the device data for IPQ5424 watchdog device

Kever Yang (1):
      dt-bindings: watchdog: Add rk3562 compatible

Krzysztof Kozlowski (3):
      watchdog: Do not enable by default during compile testing
      watchdog: stm32: Fix wakeup source leaks on device unbind
      watchdog: Correct kerneldoc warnings

Lad Prabhakar (1):
      dt-bindings: watchdog: renesas,wdt: Document RZ/V2N (R9A09G056) support

Marcus Folkesson (4):
      watchdog: da9052_wdt: add support for nowayout
      watchdog: da9052_wdt: use timeout value from external inputs
      watchdog: da9052_wdt: do not disable wdt during probe
      watchdog: da9052_wdt: respect TWDMIN

Thomas Richard (1):
      dt-bindings: watchdog: fsl,scu-wdt: Document imx8qm

Ziyan Fu (1):
      watchdog: iTCO_wdt: Update the heartbeat value after clamping timeout

 .../devicetree/bindings/watchdog/fsl,scu-wdt.yaml  |   1 +
 .../bindings/watchdog/nxp,s32g2-swt.yaml           |  54 ++++
 .../devicetree/bindings/watchdog/renesas,wdt.yaml  |   4 +-
 .../devicetree/bindings/watchdog/samsung-wdt.yaml  |  11 +-
 .../devicetree/bindings/watchdog/snps,dw-wdt.yaml  |   1 +
 drivers/watchdog/Kconfig                           |  26 +-
 drivers/watchdog/Makefile                          |   2 +
 drivers/watchdog/apple_wdt.c                       |   7 +-
 drivers/watchdog/arm_smc_wdt.c                     |  17 +-
 drivers/watchdog/cros_ec_wdt.c                     |  30 +-
 drivers/watchdog/da9052_wdt.c                      |  27 +-
 drivers/watchdog/iTCO_wdt.c                        |  25 +-
 drivers/watchdog/intel_oc_wdt.c                    | 233 +++++++++++++++
 drivers/watchdog/lenovo_se30_wdt.c                 |   2 +
 drivers/watchdog/pcwd_usb.c                        |   6 +-
 drivers/watchdog/pretimeout_noop.c                 |   2 +-
 drivers/watchdog/pretimeout_panic.c                |   2 +-
 drivers/watchdog/qcom-wdt.c                        |   7 +
 drivers/watchdog/s32g_wdt.c                        | 315 +++++++++++++++++++++
 drivers/watchdog/s3c2410_wdt.c                     |  39 ++-
 drivers/watchdog/stm32_iwdg.c                      |   2 +-
 drivers/watchdog/wdt_pci.c                         |   2 +-
 22 files changed, 749 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
 create mode 100644 drivers/watchdog/intel_oc_wdt.c
 create mode 100644 drivers/watchdog/s32g_wdt.c
----------------------------------------------------------------

Kind regards,
Wim.


