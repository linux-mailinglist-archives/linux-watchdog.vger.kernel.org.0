Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D91589F7E3
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Aug 2019 03:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfH1BgV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 27 Aug 2019 21:36:21 -0400
Received: from inva020.nxp.com ([92.121.34.13]:33050 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726391AbfH1BgP (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 27 Aug 2019 21:36:15 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4F8FF1A0651;
        Wed, 28 Aug 2019 03:36:13 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 501751A00B1;
        Wed, 28 Aug 2019 03:36:04 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B54A5402C0;
        Wed, 28 Aug 2019 09:35:52 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux@armlinux.org.uk,
        otavio@ossystems.com.br, leonard.crestez@nxp.com,
        u.kleine-koenig@pengutronix.de, schnitzeltony@gmail.com,
        jan.tuerk@emtrion.com, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V5 3/4] ARM: imx_v6_v7_defconfig: Enable CONFIG_IMX7ULP_WDT by default
Date:   Wed, 28 Aug 2019 09:35:02 -0400
Message-Id: <1566999303-18795-3-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566999303-18795-1-git-send-email-Anson.Huang@nxp.com>
References: <1566999303-18795-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Select CONFIG_IMX7ULP_WDT by default to support i.MX7ULP watchdog.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
no changes.
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 9bfffbe..be2a694 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -236,6 +236,7 @@ CONFIG_DA9062_WATCHDOG=y
 CONFIG_DA9063_WATCHDOG=m
 CONFIG_RN5T618_WATCHDOG=y
 CONFIG_IMX2_WDT=y
+CONFIG_IMX7ULP_WDT=y
 CONFIG_MFD_DA9052_I2C=y
 CONFIG_MFD_DA9062=y
 CONFIG_MFD_DA9063=y
-- 
2.7.4

