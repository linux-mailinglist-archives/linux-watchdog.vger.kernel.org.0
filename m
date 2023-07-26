Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 153257634C5
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Jul 2023 13:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233273AbjGZLXZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 26 Jul 2023 07:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233222AbjGZLXW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 26 Jul 2023 07:23:22 -0400
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377A3131;
        Wed, 26 Jul 2023 04:22:34 -0700 (PDT)
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 26 Jul 2023
 19:22:09 +0800
From:   Huqiang Qin <huqiang.qin@amlogic.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <neil.armstrong@linaro.org>,
        <khilman@baylibre.com>, <jbrunet@baylibre.com>,
        <martin.blumenstingl@googlemail.com>
CC:     <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 3/4] watchdog: Add support for Amlogic-T7 SoCs
Date:   Wed, 26 Jul 2023 19:21:45 +0800
Message-ID: <20230726112146.1127145-4-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
References: <20230726112146.1127145-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.11.83]
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Compared with the previous Amlogic-GXBB, the watchdog of Amlogic-T7
has a different reset enable bit.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index a6c0d743b607..dc48b0a332c3 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -147,8 +147,13 @@ static const struct wdt_params gxbb_params = {
 	.rst_shift = 21,
 };
 
+static const struct wdt_params t7_params = {
+	.rst_shift = 22,
+};
+
 static const struct of_device_id meson_gxbb_wdt_dt_ids[] = {
 	 { .compatible = "amlogic,meson-gxbb-wdt", .data = &gxbb_params, },
+	 { .compatible = "amlogic,t7-wdt", .data = &t7_params, },
 	 { /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_gxbb_wdt_dt_ids);
-- 
2.37.1

