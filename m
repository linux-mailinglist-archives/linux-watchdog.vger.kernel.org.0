Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6530E8E78
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2019 18:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729733AbfJ2Rkz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 29 Oct 2019 13:40:55 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39389 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729025AbfJ2Rkz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 29 Oct 2019 13:40:55 -0400
Received: by mail-qt1-f195.google.com with SMTP id t8so21434395qtc.6
        for <linux-watchdog@vger.kernel.org>; Tue, 29 Oct 2019 10:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hMLzfyGr3cpjTUw47ePlTvPDaWbwwoe19NIKcbfGLxo=;
        b=bGcBFN47qyJ+FBC8eIPd/QYESNiLshojQRT9zJ61sjbOTBdOU6GCtKKs/FkYzcGjWF
         PAxU7SIOr+BVv3seftD/4BD74MZj+Qc6RF3ztu/gBwsmFODkpVXK2iGRORZjAvSLxgVz
         H0wgd94dawJtkMC443hPl78ZtahPi91fgI8YySD7F9czmsWyJTlRnEIqHUwiHrZK5aHA
         S0lZo9hzH4mdqFhRBoupjRpUBEpt0Dq65ELCSQ80YFIwXkzpV4/i3SCaXk0tOxwwy6+7
         BMOiX8/saDF9Cds2fdCD8RhjfLvF0ibePDe/fjzs/gBSUbiosyyk+t9s0lS8SqdnaDHD
         CbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hMLzfyGr3cpjTUw47ePlTvPDaWbwwoe19NIKcbfGLxo=;
        b=AaXxnBfNpYxFiOu4Gm7BV7wwvy/zgihIf61UV4o/Io0X5j/dXi35+vg/qNrGxU2zYw
         kM4MrLrDmOjhTnsAbrRtK/Esbto2CtJsAxcbE3cryT2C+XAas3PpoTKmXbuh5zmZJnf6
         xDrm8Vxkoz60r3uHQiGeRYcIdW3dvF5PoKqPOWpku01JgQRH19hJ3YCOKJq8NXr3Gm3I
         XFdJHSkxAM+hBsBqqu5tw3JmJkvLQfXtoP7wmRqbgxvkUtGjAPu4aepOpD+LR3Avp5JN
         Xs61sJ+JrGmmx5qa5B/qniwiIQhIDDb966igoyoz3zlthXF3soaomuUJCqUtioICINJ3
         n8Lw==
X-Gm-Message-State: APjAAAVRG+jMTO6smq2ptd2CcmL3PrKu1WOng8MTlbcyktqi7CNXAgNn
        5OIBNBylSJG/FC7OjVjpgptaUL9iCI0=
X-Google-Smtp-Source: APXvYqwZ3eoAK7uReqZ34lVYcT79pbCE0MunkJnoq7GePafDMEYca7o+1tTWreEbTmk04a34xue9Gw==
X-Received: by 2002:aed:2be2:: with SMTP id e89mr142329qtd.161.1572370854359;
        Tue, 29 Oct 2019 10:40:54 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id c21sm7417725qtg.61.2019.10.29.10.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 10:40:53 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     linux@roeck-us.net
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        Anson.Huang@nxp.com, shawnguo@kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 5/5] watchdog: imx7ulp: Use definitions instead of magic values
Date:   Tue, 29 Oct 2019 14:40:37 -0300
Message-Id: <20191029174037.25381-5-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029174037.25381-1-festevam@gmail.com>
References: <20191029174037.25381-1-festevam@gmail.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Use definitions instead of magic values in order to improve readability.

Since the CLK field of the WDOG CS register is composed of two bits
to select the watchdog clock source, use a shift representation
instead of BIT().

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/watchdog/imx7ulp_wdt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index bcef3b6a9782..e3c1382dac52 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -17,6 +17,9 @@
 #define WDOG_CS_CMD32EN		BIT(13)
 #define WDOG_CS_ULK		BIT(11)
 #define WDOG_CS_RCS		BIT(10)
+#define LPO_CLK			0x1
+#define LPO_CLK_SHIFT		8
+#define WDOG_CS_CLK		(LPO_CLK << LPO_CLK_SHIFT)
 #define WDOG_CS_EN		BIT(7)
 #define WDOG_CS_UPDATE		BIT(5)
 
@@ -143,7 +146,7 @@ static void imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
 	/* set an initial timeout value in TOVAL */
 	writel(timeout, base + WDOG_TOVAL);
 	/* enable 32bit command sequence and reconfigure */
-	val = BIT(13) | BIT(8) | BIT(5);
+	val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE;
 	writel(val, base + WDOG_CS);
 }
 
-- 
2.17.1

