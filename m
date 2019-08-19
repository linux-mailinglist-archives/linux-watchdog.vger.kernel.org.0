Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 311BE91C51
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 07:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfHSFR5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 01:17:57 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38956 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfHSFR5 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 01:17:57 -0400
Received: by mail-pf1-f196.google.com with SMTP id f17so459135pfn.6;
        Sun, 18 Aug 2019 22:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DyOkWXbip/sFDtzCMcgt9fKortz6cn0pIstBPgx8f+A=;
        b=Wa4gXkppzwM0+r04OH6+s7lLvWAhrUF/5j+fyU8uox4gov+ZJgzHhjmS2Crg475wh6
         68fYVRmc09jA4Dt4DUHcmv7z3UY5O0jDLHnoffxGIO6RMhray7o9zzx1tC4XSJmKckfV
         Hjj53K0p3SiK5nJUfmDDzsy7egJ4dIKXoRs+7XyUHgv4bXyygwYHd+uclWOlihp7j/3B
         wnxMbOPM/xDiv41AqwKcsgUcvD4hq+BbLf1dpSixl9G9UNA+A0kXpREoWFiFqgqA7KJ8
         GNCYMEn88qAvZMIXVBKT4CK/y8vH+tgaLYq77mLsLH4VULjISsY0i6qEQaHEJ3KA3Q5G
         MiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=DyOkWXbip/sFDtzCMcgt9fKortz6cn0pIstBPgx8f+A=;
        b=mVFYnj1jttMDjPnd1b3TwIuusbLdrsV3qFSpK+qRk41j+O2okdy5dBjZs9spqhm3qO
         sE8uWBc5xMjjCGJLYgT1R7FVG9jDOVbZ82FcWl9CHkTNzOknrRqfLXk1j22kJTiUVk5A
         bYrs4Giv+IvLoXpmkZAUn7gdrCA68UTk86TveZ9mEbB1e+MDmZwyC0+KauqtRTPGRYEv
         sxbCjw6+wwFnNRvEkfzG8eHo7QiErJSGkYwqGE5nzswQn3nCy/AfP2y9iV5bGU8cAL3W
         MYLMWMg8ViSdLAaytJcfp9nRvIJuibmmN61RVaYvlC3qHctpQE1OV6eowc7tLOgMT9Ho
         IxYA==
X-Gm-Message-State: APjAAAVxWMjYDpoAh2kbZfpfEpldxyczR7YXoaWyPiftP0uht+hIankU
        9q5XoHiYjR027S2mPU0B5Dw=
X-Google-Smtp-Source: APXvYqxmKIFDHCNwPUL7Pa2AYZQ57N6+X/NXdnMruTHlp+98Fjja2C1q0M4BwqahIM1AvA03PmrVSw==
X-Received: by 2002:a65:528d:: with SMTP id y13mr18906968pgp.120.1566191876456;
        Sun, 18 Aug 2019 22:17:56 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
        by smtp.gmail.com with ESMTPSA id o3sm19010087pje.1.2019.08.18.22.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2019 22:17:55 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Ryan Chen <ryan_chen@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2 2/2] watchdog: aspeed: Add support for AST2600
Date:   Mon, 19 Aug 2019 14:47:38 +0930
Message-Id: <20190819051738.17370-3-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190819051738.17370-1-joel@jms.id.au>
References: <20190819051738.17370-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Ryan Chen <ryan_chen@aspeedtech.com>

The ast2600 can be supported by the same code as the ast2500.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 Reuse ast2500 config structure
---
 drivers/watchdog/aspeed_wdt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index cc71861e033a..5b64bc2e8788 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -34,6 +34,7 @@ static const struct aspeed_wdt_config ast2500_config = {
 static const struct of_device_id aspeed_wdt_of_table[] = {
 	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
 	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
+	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2500_config },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
@@ -259,7 +260,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
-	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
+	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
+		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
 		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
 
 		reg &= config->ext_pulse_width_mask;
-- 
2.23.0.rc1

