Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1B73B11EB
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jun 2021 04:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbhFWCr3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Jun 2021 22:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbhFWCr3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Jun 2021 22:47:29 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5DDC061574;
        Tue, 22 Jun 2021 19:45:12 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id w71so1151262pfd.4;
        Tue, 22 Jun 2021 19:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uPFqIATPhWWwBTYdqzNzQjdIULoWnpFZ7XCB+e8mlfk=;
        b=oJ88LhcP9HqT1fGzZFb67TsqQRaDN38sPdX0NmNJFzbd9NIlE++SsQMnmyB8ojSCbO
         VlNUFttnGpkXRHP5w5JSfajVOpcU2bf5grt47BDK+sur4bF9zlgV30HpXG1lJoFqWSeZ
         T9cs60SJ3yTNhwoATG3xzt1VprROWKtTGPZDb1j2syfzREO5RDzXyqIlCCiRLM/Am8la
         bFxFXo2wwfwGp19GsHUWeziWWKwWK6ue5B+GyDOXbpOyD0caM6cuMHaqnlLUymn3TIno
         IQyXYSJ+bx/TFx1Q7gPXarRi5GFGs8NTpt22UQ3CwE88bA8oVmFDxkW/1xGcBFx/TenQ
         oFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uPFqIATPhWWwBTYdqzNzQjdIULoWnpFZ7XCB+e8mlfk=;
        b=ebHVDt7Zev8GVhx5k4npiNXixr+mb62KYkVHzbDn+1RO4u7TI4YpQa95dPkZ67fDhq
         zhDT/NOHhsm8RLqe/c+FYi7kr1rjAlIUBa7dV6BDCEOUMKfO00MY1MmMIJIh9i4a9ojj
         BdWKpWHjsNeWs3Wg+Zu11F4KCJAC73JZXnD1WzrWf99gx7CVYjXkbk6ubBXWbYVF0jJA
         dnNLWEkPVU5nb4F+YEJBkasvtWNacv0I7kDOBIG/K9VGW9eZBHdnJVJEHEXLNr4aaGjW
         Lo7hIK77Jn6c3Q0oS6XMze6rDrwlWaOREpkYP8ZSbMhpLzunLdxtjzzzF52yOV2JuE9L
         pObA==
X-Gm-Message-State: AOAM530FngzPv7XfdP3IpGbTMhbdf8ZeB0XGxErHWE6+SGREwtqt24u+
        5Yw4XlzlunQ7uSAs/nHTdKxhlCQqRXaEaV8o
X-Google-Smtp-Source: ABdhPJz+I1L0ABLlcsBsdA8QhWfERDGtZruZ9FPqljRPK4ZF+kys/jHnsu4bYcMWJfFkyX75iKtu+Q==
X-Received: by 2002:a63:5f11:: with SMTP id t17mr1639630pgb.91.1624416312431;
        Tue, 22 Jun 2021 19:45:12 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id z17sm556307pfq.218.2021.06.22.19.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 19:45:12 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH 3/5] watchdog: meson_gxbb_wdt: add nowayout module param
Date:   Wed, 23 Jun 2021 10:44:27 +0800
Message-Id: <20210623024429.1346349-4-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623024429.1346349-1-art@khadas.com>
References: <20210623024429.1346349-1-art@khadas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Added nowayout module param same as in other moduels

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index ecd1fc6f48ba..0bf5dccf70b1 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -34,6 +34,11 @@ module_param(timeout, uint, 0);
 MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
 		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
 
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
 struct meson_gxbb_wdt {
 	void __iomem *reg_base;
 	struct watchdog_device wdt_dev;
@@ -190,6 +195,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 		data->reg_base + GXBB_WDT_CTRL_REG);
 
 	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
+	watchdog_set_nowayout(&data->wdt_dev, nowayout);
 
 	return devm_watchdog_register_device(dev, &data->wdt_dev);
 }
-- 
2.25.1

