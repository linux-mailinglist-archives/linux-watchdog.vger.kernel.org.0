Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13AD69055B
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 Aug 2019 18:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbfHPQEG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 16 Aug 2019 12:04:06 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34558 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727391AbfHPQEG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 16 Aug 2019 12:04:06 -0400
Received: by mail-pl1-f193.google.com with SMTP id d3so765588plr.1;
        Fri, 16 Aug 2019 09:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BrRMkjc2qGWCZLIX9694c7JW7Gvf0FMcBkwT0dY+kis=;
        b=hcp099JLXcAtr20hVTLWgVQYFXbhVo4XXLQW1gdi3X8wRO/iMDfVRxkZdA5NU7sAQh
         voXm3CvwWdBYwGJz329n7nQ8rE8+eLKw/vWJpi8Vovk6mb3R8BEURRIiFAo9gYUrP5OU
         bPQkYgp6sSWijbk+aWW8MqL9P2yCokXbfiOzbpgVJ/T3OaYnbYTg3JrwH0ELewheo8Op
         ArXIuD2xkn+/ugivUTwZGh4XmqUo89Feh6zy5EIJ6BvpS3OQ80lWi/FFPmDleMc4gu0g
         jBkFdbXQFne1ffs23n8Yt6XafDq894mNsogG9+FL7rU0hfCNzuDO2ClfSF8v/MYWG5/e
         AV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=BrRMkjc2qGWCZLIX9694c7JW7Gvf0FMcBkwT0dY+kis=;
        b=j7yR5AqyJjqtrU5mCyQkQZ980SxNNEUrdfttTZN+q6WmwOQ2pJ7Dv8/SEf9neZuKFX
         V/vtUpt4KOysdswwcjKdfEMhuEDp+T42ctSeGiGLMRE7vTeQ8dfT/g952qECWRPMjTbZ
         G+uj+x2QH8bZ3H4HAxRlbcFSqTutnH9ZX8TmjZZ/KuBLiUgjACP6oF61k3BhsItJllpZ
         JVqBHkfXdUjCUW1G7t1pltt7HyP494U1IYhFlmf1ks1V5XfHcmM87hybdzl/I72i4Xlv
         3bHYoRnEgCBh6oUhGWLlC1aGLwXrFMbeUuBu75fWqbARIbiHuYBhVpoIURXks0J28g41
         LQ9w==
X-Gm-Message-State: APjAAAWFk0cYIeQHJr0vudOJXblbP0beDOVQVZQLTJo5ZG8zkvcsB/h6
        ng1rFQTzIY2aYOiHjIcnS38=
X-Google-Smtp-Source: APXvYqxiGn8dbBBUwz6+A3QeDJEhGVLcHKlXkwSQ70P6UKBPE5EgJgZ0TGRQnwNFfsCB+8cciHU9ng==
X-Received: by 2002:a17:902:a01:: with SMTP id 1mr10269948plo.278.1565971445900;
        Fri, 16 Aug 2019 09:04:05 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id m20sm7578607pff.79.2019.08.16.09.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 09:04:05 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Ryan Chen <ryan_chen@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: [PATCH 2/2] watchdog: aspeed: Add support for AST2600
Date:   Sat, 17 Aug 2019 01:33:47 +0930
Message-Id: <20190816160347.23393-3-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190816160347.23393-1-joel@jms.id.au>
References: <20190816160347.23393-1-joel@jms.id.au>
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
 drivers/watchdog/aspeed_wdt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
index cc71861e033a..94f73796ba9d 100644
--- a/drivers/watchdog/aspeed_wdt.c
+++ b/drivers/watchdog/aspeed_wdt.c
@@ -31,9 +31,14 @@ static const struct aspeed_wdt_config ast2500_config = {
 	.ext_pulse_width_mask = 0xfffff,
 };
 
+static const struct aspeed_wdt_config ast2600_config = {
+	.ext_pulse_width_mask = 0xfffff,
+};
+
 static const struct of_device_id aspeed_wdt_of_table[] = {
 	{ .compatible = "aspeed,ast2400-wdt", .data = &ast2400_config },
 	{ .compatible = "aspeed,ast2500-wdt", .data = &ast2500_config },
+	{ .compatible = "aspeed,ast2600-wdt", .data = &ast2600_config },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
@@ -259,7 +264,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
 	}
 
-	if (of_device_is_compatible(np, "aspeed,ast2500-wdt")) {
+	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
+		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
 		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
 
 		reg &= config->ext_pulse_width_mask;
-- 
2.23.0.rc1

