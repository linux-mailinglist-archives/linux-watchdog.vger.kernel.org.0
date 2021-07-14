Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45CEB3C8274
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Jul 2021 12:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239000AbhGNKOo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 14 Jul 2021 06:14:44 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50684 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238508AbhGNKOo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 14 Jul 2021 06:14:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id C780E1F42DB8
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
To:     linux-kernel@vger.kernel.org
Cc:     chunkuang.hu@kernel.org, hsinyi@chromium.org, kernel@collabora.com,
        drinkcat@chromium.org, eizan@chromium.org,
        linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
        jitao.shi@mediatek.com, Crystal Guo <crystal.guo@mediatek.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v2 1/7] arm64: dts: mediatek: Move reset controller constants into common location
Date:   Wed, 14 Jul 2021 12:11:35 +0200
Message-Id: <20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714101141.2089082-1-enric.balletbo@collabora.com>
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The DT binding includes for reset controllers are located in
include/dt-bindings/reset/. Move the Mediatek reset constants in there.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v2:
- Fix build test ERROR Reported-by: kernel test robot <lkp@intel.com>

 arch/arm64/boot/dts/mediatek/mt8183.dtsi                    | 2 +-
 drivers/watchdog/mtk_wdt.c                                  | 6 +++---
 .../dt-bindings/{reset-controller => reset}/mt2712-resets.h | 0
 .../dt-bindings/{reset-controller => reset}/mt8183-resets.h | 0
 .../dt-bindings/{reset-controller => reset}/mt8192-resets.h | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename include/dt-bindings/{reset-controller => reset}/mt2712-resets.h (100%)
 rename include/dt-bindings/{reset-controller => reset}/mt8183-resets.h (100%)
 rename include/dt-bindings/{reset-controller => reset}/mt8192-resets.h (100%)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 96473d88f391..4ef0b5b23047 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -11,7 +11,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/memory/mt8183-larb-port.h>
 #include <dt-bindings/power/mt8183-power.h>
-#include <dt-bindings/reset-controller/mt8183-resets.h>
+#include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/thermal/thermal.h>
 #include "mt8183-pinfunc.h"
diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 16b6aff324a7..6986bc740465 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -9,9 +9,9 @@
  * Based on sunxi_wdt.c
  */
 
-#include <dt-bindings/reset-controller/mt2712-resets.h>
-#include <dt-bindings/reset-controller/mt8183-resets.h>
-#include <dt-bindings/reset-controller/mt8192-resets.h>
+#include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mt8183-resets.h>
+#include <dt-bindings/reset/mt8192-resets.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
diff --git a/include/dt-bindings/reset-controller/mt2712-resets.h b/include/dt-bindings/reset/mt2712-resets.h
similarity index 100%
rename from include/dt-bindings/reset-controller/mt2712-resets.h
rename to include/dt-bindings/reset/mt2712-resets.h
diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset/mt8183-resets.h
similarity index 100%
rename from include/dt-bindings/reset-controller/mt8183-resets.h
rename to include/dt-bindings/reset/mt8183-resets.h
diff --git a/include/dt-bindings/reset-controller/mt8192-resets.h b/include/dt-bindings/reset/mt8192-resets.h
similarity index 100%
rename from include/dt-bindings/reset-controller/mt8192-resets.h
rename to include/dt-bindings/reset/mt8192-resets.h
-- 
2.30.2

