Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BC03DB221
	for <lists+linux-watchdog@lfdr.de>; Fri, 30 Jul 2021 06:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbhG3EOa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 30 Jul 2021 00:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhG3EO3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 30 Jul 2021 00:14:29 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8640FC0613D3;
        Thu, 29 Jul 2021 21:14:25 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id k1so9501247plt.12;
        Thu, 29 Jul 2021 21:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=THlXvdugKjy738Af7uzCz/sE8sNAleTeISkp07PWT4A=;
        b=H35Ors0FFD34qtaXeNIP4c1cwPkkHP4ht1nwzgRtEWswKY8aa7wM0bzDdrblMnMRiE
         Fcuxs+17mCV4wQSM7/e6+MN730M2l6A5Jb0b0SuEHDsezAOw/q21R86m+3D9jXMRLrco
         Y0HtifeTjE6szdCS6sbtte1nvlYq8DLuhUDzhzxzzOMlZwzF23VOCxGx/FxAfVrcdZe0
         YTuS0LMXEgs/i3yBPygZylVqAYYj4xioM36QXq+RXoBBwQM/vHbhNwjQX28zMUtfyplX
         iRGU3qcPingRUYPqlWeh86+yOmTZgC1hcdKt+xURMvWVXmoE+JvLGPJuo40vDaR7vTPC
         twaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=THlXvdugKjy738Af7uzCz/sE8sNAleTeISkp07PWT4A=;
        b=UrnG2xEozui4Md0usRuJsYc8pHmy7oFx7xdAIBoNEOKmpEXUza8lH3ubmdMOq3S3wQ
         EsA/MU4xkXE8eIfJCDUJStJTxcGMe7eubHTqy11+NOPfJK+6uH+7rTuUQRz4NPd63hLD
         MqDC9TLfd72YVf7Z14FCI+bhk6LUN8KNN2X7fbH2x1kEk5LlGlbg+mHZ1rTzuN63LWvq
         x+T31v3CKulUeN/VvcLXol2Vo3H6J82rRR0HlVyqb8x3Mw1QsnlkRzr0QYC+hZ6XXySA
         CRqxo1hqfEVJRIG7VVQi8mpoLjPihS2B1nq4dU9KeamkjRkYYa1ql5Mka7xmdYw/1c3F
         LKBQ==
X-Gm-Message-State: AOAM5327IuzJpEmZjnS7AYjg4k+8jmkmFNXu7pFYNul3Ob3o3ShQ0uv/
        h8YW2Mr+KMixqkYzLwJUfkY=
X-Google-Smtp-Source: ABdhPJxvMMQTQ8ZucVsWnf6w8qPI5/FCghjRAAqBf7VfGnkGVfCSZ1aInLllbvRQCIWqY/rqbG7lDQ==
X-Received: by 2002:a63:1f5c:: with SMTP id q28mr527713pgm.114.1627618465126;
        Thu, 29 Jul 2021 21:14:25 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com. [104.194.74.249])
        by smtp.gmail.com with ESMTPSA id x4sm440943pfb.27.2021.07.29.21.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 21:14:24 -0700 (PDT)
From:   Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To:     narmstrong@baylibre.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
        jbrunet@baylibre.com, christianshewitt@gmail.com,
        martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH v4 3/3] watchdog: meson_gxbb_wdt: remove stop_on_reboot
Date:   Fri, 30 Jul 2021 12:13:55 +0800
Message-Id: <20210730041355.2810397-4-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730041355.2810397-1-art@khadas.com>
References: <20210730041355.2810397-1-art@khadas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Remove watchdog_stop_on_reboot()

Meson platform still have some hardware drivers problems for some
configurations which can freeze device on shutdown/reboot stage and i
think better to have reboot warranty by default.

I feel that it is important to keep the watchdog running during the
reboot sequence, in the event that an abnormal driver freezes the reboot
process.

This is my personal opinion and I hope the driver authors will agree
with my proposal, or just ignore this commit if not.

https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 945f5e65db57..d3c9e2f6e63b 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 
 	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
 
-	watchdog_stop_on_reboot(&data->wdt_dev);
 	return devm_watchdog_register_device(dev, &data->wdt_dev);
 }
 
-- 
2.25.1

