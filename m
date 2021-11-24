Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D24445B692
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Nov 2021 09:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240862AbhKXIgR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Nov 2021 03:36:17 -0500
Received: from cpanel.siel.si ([46.19.9.99]:47016 "EHLO cpanel.siel.si"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230101AbhKXIgQ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Nov 2021 03:36:16 -0500
X-Greylist: delayed 1563 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Nov 2021 03:36:15 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=BprRzp7NTlqfFQGFNx7txt6EhUkXQQBm9V5lXLBQLcg=; b=VXZVT6OnJARkja8z0/Rqz7y0pi
        jsW93o7xf/xddQlC9jSDaFxL8nxFirQBf9JDwaJBFeR0ze8jxMFKHeVkMWmDk07tErtrzZpVtNI2X
        Vaqu8mA4MLWTKOoviAAyXlmZ26R17BzOu9lgqKsJvG3bfImT/b1+b3vbBWyGUJoJlSDXiI7kqyLNp
        twlg0XL4I6gyUep8T1qZF1391lRBsH9P5WXOwmn5ohwf7CbO1z0byezCS3GUBC1IvM69n+CRhft5j
        fgQkHULagz4ivezXiQ+xTSB4PZGtKcSCsK7fDwePOMjz4v+EPzH5j3n8RGAmkcAg4nuekpFgFoCGN
        XwbYpxog==;
Received: from [89.212.21.243] (port=40936 helo=localhost.localdomain)
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <andrej.picej@norik.com>)
        id 1mpni2-006FoM-G3; Wed, 24 Nov 2021 09:33:01 +0100
From:   Andrej Picej <andrej.picej@norik.com>
To:     support.opensource@diasemi.com, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org
Cc:     andrej.picej@norik.com, y.bas@phytec.de,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mfd: da9062: make register CONFIG_I writable
Date:   Wed, 24 Nov 2021 09:32:57 +0100
Message-Id: <20211124083258.2606511-1-andrej.picej@norik.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Stefan Christ <s.christ@phytec.de>

Make the config register CONFIG_I writable to change the watchdog mode.

Signed-off-by: Stefan Christ <s.christ@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 drivers/mfd/da9062-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index 01f8e10dfa55..7041ba53efb4 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -556,6 +556,7 @@ static const struct regmap_range da9062_aa_writeable_ranges[] = {
 	regmap_reg_range(DA9062AA_VBUCK3_B, DA9062AA_VBUCK3_B),
 	regmap_reg_range(DA9062AA_VLDO1_B, DA9062AA_VLDO4_B),
 	regmap_reg_range(DA9062AA_BBAT_CONT, DA9062AA_BBAT_CONT),
+	regmap_reg_range(DA9062AA_CONFIG_I, DA9062AA_CONFIG_I),
 	regmap_reg_range(DA9062AA_GP_ID_0, DA9062AA_GP_ID_19),
 };
 
-- 
2.25.1

