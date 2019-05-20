Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 254F923A00
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2019 16:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389505AbfETO2w (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 May 2019 10:28:52 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54506 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730687AbfETO2w (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 May 2019 10:28:52 -0400
Received: by mail-wm1-f66.google.com with SMTP id i3so13553930wml.4
        for <linux-watchdog@vger.kernel.org>; Mon, 20 May 2019 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A12cpc+WUhF71aXBZdyNVOx5fCS+Vei2NjBPNK5Pnn0=;
        b=J0KpAxRV6c7LEUvGEfmWqd52V9FoX5XyChfLKAjO9N8Lask56HE52hii+peIuS/TvR
         qei9bPgkPegaYnLdBt7Q72ThAnNKXSbeBV1n9LXvau06nDyMUCJ/j8EtNF/S+HUx7GBz
         PTvBjkeL1IRYjM8OgtccAv6S8uIP1hVbY7A+2NsWYdwi4wVGCAwwwrDrGQZJhBrQxwup
         QEDg8v4UwJCMOBaSyvwqAII9qrGZmbPI3bHFUyRRS0ocV7f7hM4+SXFENg7PjYHKbJOo
         x+Bi8v6wgG6PAqedkhqyOw40xElslb52WKem7eJl4qhv5HhFSXKr+rImqWlxLdCObRog
         Kltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A12cpc+WUhF71aXBZdyNVOx5fCS+Vei2NjBPNK5Pnn0=;
        b=hMgg/PrqlMZk2uEvW4hYh2XRXVhQSWj/MA8mDVb2w93y4RPDfANorBK8pD6BdIWNBr
         d6uHiMYObWRYDauwAHouEUfaw0KoTn+qXR55p6ypnA1gyE6OkT5IKWi2akTfgykgKAgh
         cM4l5LRistnmopTly2ZOpjh5B+5N3XtsZ84FMnL2R+f2HIMf/iHGShINsU6kwMSFLuZI
         NOQkzZ1oXTnaWtpyYQaqsrwFzFvuXTEAkUe3DUCYqgobsgkR0+siHqf0JU5FOyLOyIf4
         wERco7brM8ptdWq0YFrs8t1Hb6iXWsO0tY7Efb2vDBdJvybOWEi82B2OhC7WqSJpVUhI
         E6qQ==
X-Gm-Message-State: APjAAAUmRCT62IO26vHHPV5i+menPT6XPBcW6AQfLHpYTL7b1oIqX9+7
        RjfOVJbj8LqsZ9MfmvfCHXrdMQ==
X-Google-Smtp-Source: APXvYqyRQP9yJCxY65JkyqLPbCzFVGNKEaUa+r0HJCszmKWVUSyVt6zf/KCdViAxXMq2Oc6MPsJrnA==
X-Received: by 2002:a1c:700b:: with SMTP id l11mr5463602wmc.106.1558362530051;
        Mon, 20 May 2019 07:28:50 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z74sm154843wmc.2.2019.05.20.07.28.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 20 May 2019 07:28:49 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] watchdog: meson_wdt: update with SPDX Licence identifier
Date:   Mon, 20 May 2019 16:28:47 +0200
Message-Id: <20190520142847.442-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/watchdog/meson_wdt.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/watchdog/meson_wdt.c b/drivers/watchdog/meson_wdt.c
index 01889cef81e1..3389f4c02603 100644
--- a/drivers/watchdog/meson_wdt.c
+++ b/drivers/watchdog/meson_wdt.c
@@ -1,12 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *      Meson Watchdog Driver
  *
  *      Copyright (c) 2014 Carlo Caione
- *
- *      This program is free software; you can redistribute it and/or
- *      modify it under the terms of the GNU General Public License
- *      as published by the Free Software Foundation; either version
- *      2 of the License, or (at your option) any later version.
  */
 
 #include <linux/clk.h>
-- 
2.21.0

