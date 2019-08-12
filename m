Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A865A8A80A
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbfHLUJa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:30 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34123 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727704AbfHLUJ3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:29 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so43814246pgc.1;
        Mon, 12 Aug 2019 13:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ijw8qW4YQwPJ65cSa1rqyHCWE36jFTySRyvLwWFgnQw=;
        b=tfJUFeWwhrmS4h1pq6sO+GDBArYE2TxoBPuPasju9ZIokfBWp+RqY7yiJpEonO763q
         BuwB3RdLjAkdnctdf7S+fVh8IIuGDTszipW+SA2J5TZRbwObD8KWt5uq00fXmC9ITrCE
         LWh5VGEQHgqOG+kNU8MFkQABga9OuxTk6ZSmvKm19rFz8nbzCa1j+x/hS6O0+S+hml3j
         9xuo5kcLORk9U7/09L32nOwiIFKc/hkp0aRrTdjDpDaF4MRJwC78qRegrYpHHcUAXIw8
         rK27jkx1uYtD5GAMe0l2ARB851cSlc+lkwAvl8HycMgXS2g3eoC/Zo1ekVCqV5WGFvwP
         LxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ijw8qW4YQwPJ65cSa1rqyHCWE36jFTySRyvLwWFgnQw=;
        b=K00gghbCQG8GSckpZqb1+kncCZ323ykK0iGFYOkVipfZWbAEfc1yA5CDp45inzo/f3
         kqpVI8pVdeI5ql0AQJDVp0vr0AuR14qhC+kw+U+W21HxXf0TM5EvCJI+m+67y4qpbnm7
         bE/XqMgcV+C8Ofqcg7Vbd/ilNY6KjT0Xzz2QRkIosg103dhtZQ2o1vOHcA1EKxPjtG74
         IsQmh2cvuV+3SY0JufPKinBGsTzAAsl4riRGtHsqMYum0SJcm3AnvM39dhUA0svPEWK2
         PxxBvt5dN3vhmk9L3c0Lf2vYtgnbJzPhHbT0SsWpwrF5h/TkDdP+RbQSbUNVSnayim/J
         pBgQ==
X-Gm-Message-State: APjAAAUibfBVaBdinp62CBm5VHF3dY8soPnbpBs+IqD7l/DhInruw2aD
        fN8Mdynk3DSB6dQKEcb2SQZR74JJ
X-Google-Smtp-Source: APXvYqzpdprAf4PgfPstdReQJX4BUhcgUUiPmhjuiohTicqwFGMjLLlYEvn3FKN5Q5Xkz3s5c23+hA==
X-Received: by 2002:aa7:91ca:: with SMTP id z10mr14091512pfa.30.1565640568726;
        Mon, 12 Aug 2019 13:09:28 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:28 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/22] watchdog: ziirave_wdt: Skip zeros when calculating checksum
Date:   Mon, 12 Aug 2019 13:08:52 -0700
Message-Id: <20190812200906.31344-9-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Zeros don't contribute anything to checksum value, so we can skip
unused portion of the packet when calculating its checksum.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 9d9c669b8b47..19da0910c2d1 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -271,7 +271,7 @@ static int __ziirave_firm_write_pkt(struct watchdog_device *wdd,
 	memcpy(packet + 3, data, len);
 
 	/* Packet checksum */
-	for (i = 0; i < ZIIRAVE_FIRM_PKT_TOTAL_SIZE - 1; i++)
+	for (i = 0; i < len + 3; i++)
 		checksum += packet[i];
 	packet[ZIIRAVE_FIRM_PKT_TOTAL_SIZE - 1] = checksum;
 
-- 
2.21.0

