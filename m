Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F3E3B11EF
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jun 2021 04:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhFWCrm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Jun 2021 22:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbhFWCrl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Jun 2021 22:47:41 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE5AC061756;
        Tue, 22 Jun 2021 19:45:24 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id p13so1187051pfw.0;
        Tue, 22 Jun 2021 19:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LcifxjeTUDszannHMA8tVPaboMaFqX7AuHfWKGJzjKI=;
        b=JfkHKlHpvuQg3diepBAJEjojfs8YXzRc3xvNfso0Hrc8GQkFBeLP3EDXjQPI1VIJKl
         G3al2vMQ032sv0u8H5FTLNHzKYOgQf0ztNuJhK0qQ1eU2zBdjgcEN4NEi8N84b7Y3fex
         vooAIqWJ+7VWOFZMgiQYNuAP0KbFDkDQsKcKOljozIYft+C+N0BhKUIL3J+3beAdT3kt
         /bXgDg6S3/9OmwmRt6KpNzDrsE80RtjEM7j3hE0NJDz0qzEQ+HZasZKVYEZduOe42hWT
         RdZ5oWfGNc41KAieprAHF78H4qqQPQK7Qiv2Y5j2oOVjHSqi/UUgVyoTmRcrdkBPgMxE
         tTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LcifxjeTUDszannHMA8tVPaboMaFqX7AuHfWKGJzjKI=;
        b=JuqUOhJIPXfDZ5YHTC6VfFiQEs93gmEjq3sucIJU4cTkxpF61iYrdUO2Q2kh9jHG4x
         gEPPOCvoyYzCTKrAYJ9INy5+INChgO0/fAP4FAFpLFJRhQfrbTUH4WXej4kLUSaq15b1
         A4g8mBw2WC3abtZoQf+0cPKqrE9X3Kqsd4qNxM0sKbp9r0t4BHgAueUrC2YGzEFaiNGJ
         Hz/w0li2WtDQJY1nmVzFH+HJHzbwxtNTxQg+Y6uXQTNpQDySczBrvScAlPSq+YuEmuHl
         NL0UZbet36bPluBaFqEsx7yAoh2yfs9oH5X5+3OKFXXWTdTWrqL8m9koOPoPYS7wNxNT
         1cnQ==
X-Gm-Message-State: AOAM533BAwLfCpz+Lco2VPUc+GZ1IWjVylZjoOFGzn1VdpwDMusYE9bX
        r4vDmENK9GfYsNj3+HZwtQY=
X-Google-Smtp-Source: ABdhPJzTDkJpnFau8uqxddN6VvWamjN+0zFvBtltEsw/1tOk1RZOua6W2lO++aLSf9yfwQkf8CyYEQ==
X-Received: by 2002:a63:1709:: with SMTP id x9mr1605486pgl.245.1624416324113;
        Tue, 22 Jun 2021 19:45:24 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id z17sm556307pfq.218.2021.06.22.19.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 19:45:23 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH 5/5] watchdog: meson_gxbb_wdt: add register device status notification
Date:   Wed, 23 Jun 2021 10:44:29 +0800
Message-Id: <20210623024429.1346349-6-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623024429.1346349-1-art@khadas.com>
References: <20210623024429.1346349-1-art@khadas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Print watchdog success driver start status notification

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 2dbe254e5122..750b304b460d 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -198,7 +198,14 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	watchdog_set_nowayout(&data->wdt_dev, nowayout);
 	watchdog_stop_on_unregister(&data->wdt_dev);
 
-	return devm_watchdog_register_device(dev, &data->wdt_dev);
+	ret = devm_watchdog_register_device(dev, &data->wdt_dev);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)",
+		 data->wdt_dev.timeout, nowayout);
+
+	return ret;
 }
 
 static struct platform_driver meson_gxbb_wdt_driver = {
-- 
2.25.1

