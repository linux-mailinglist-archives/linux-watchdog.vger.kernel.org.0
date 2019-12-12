Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7303A11CCF3
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2019 13:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729159AbfLLMUJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Dec 2019 07:20:09 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:53857 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729179AbfLLMUI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Dec 2019 07:20:08 -0500
Received: from droid12-sz.software.amlogic (10.28.8.22) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Thu, 12 Dec 2019
 20:20:37 +0800
From:   Xingyu Chen <xingyu.chen@amlogic.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
CC:     Xingyu Chen <xingyu.chen@amlogic.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        <linux-watchdog@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/4] firmware: meson_sm: add new SMC ID support for accessing secure watchdog
Date:   Thu, 12 Dec 2019 20:19:44 +0800
Message-ID: <1576153187-28378-2-git-send-email-xingyu.chen@amlogic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576153187-28378-1-git-send-email-xingyu.chen@amlogic.com>
References: <1576153187-28378-1-git-send-email-xingyu.chen@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.28.8.22]
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The new SMC ID is used to access secure registers by meson secure
watchdog driver.

Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
---
 drivers/firmware/meson/meson_sm.c       | 1 +
 include/linux/firmware/meson/meson_sm.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 1d5b4d7..8cdd405 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -44,6 +44,7 @@ static const struct meson_sm_chip gxbb_chip = {
 		CMD(SM_EFUSE_WRITE,	0x82000031),
 		CMD(SM_EFUSE_USER_MAX,	0x82000033),
 		CMD(SM_GET_CHIP_ID,	0x82000044),
+		CMD(SM_A1_WATCHDOG_OPS,	0x82000086),
 		{ /* sentinel */ },
 	},
 };
diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 6669e2a..9ef1524 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -12,6 +12,7 @@ enum {
 	SM_EFUSE_WRITE,
 	SM_EFUSE_USER_MAX,
 	SM_GET_CHIP_ID,
+	SM_A1_WATCHDOG_OPS,
 };
 
 struct meson_sm_firmware;
-- 
2.7.4

