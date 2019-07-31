Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCCF7CAC1
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 19:43:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbfGaRnC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 13:43:02 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40935 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727571AbfGaRnC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 13:43:02 -0400
Received: by mail-pf1-f196.google.com with SMTP id p184so32270651pfp.7;
        Wed, 31 Jul 2019 10:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WuzVLvZdKStMf7KPRVxvRBDEhESLbhQ1mKTbOhc19xs=;
        b=YNdq+5f2foG8iGzCcwYGOkQgzLJhYFy5/EH17Jm0D3Iao1h2DsOdQwURe8wuLmFNQq
         K1NcSMdX+KCl18pE+7f28lS6DP9qZgk/sg4Y3WgaZs11Y4KhvMsMJO7DSDLl9nwM2oFF
         ibSuy1DMhziAPcWzhJxsXGsA/yEKq4y1xG0qFocNtg8aEfzaDDtV58+lkJy9Zu2DTj8e
         bRXNzh0bDEpLNcuwdBPIcZTkxvM8W0vQbZBHzWapFLzgVhy6GugK3MZCBPfvhQGwRTJk
         BQZVMzWvN3K/CHVcil+ay3VWV2W5NIhwKRT/YHkLYDSOcrHFoGWIFAVmhGNf7M/GnaA+
         TD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WuzVLvZdKStMf7KPRVxvRBDEhESLbhQ1mKTbOhc19xs=;
        b=iLFT/T+nnZmTlpx61LuKMmrHoOUef7HrOHNTLMIpiaQTeWa9+2FSvDe9UP4v/QzSYG
         e+f2gdW+ez0DDfYWggPT341XsigxvyjmFGcNSC+wjnjdl41fORDR4vciy9xIt8l/yFfK
         2Bm06jgEJsMayM/7huItmuNLQ8Jb1vuw6TrR77s3pNsXssGgxoQAMpiAdf0C7/rCNVkl
         P+ObBLxEAAvUOiaFEjAYM1C72eMrmXJj/GTUOI5gLOCxdGb0b4uUszjtZzjCDVmwSXDN
         +3TH+wPfRdUICil54rUhF6KN2hSgwCvDfuUAanyC1xj4QF499xVHFY8JN8XC1gEAQUar
         KLoA==
X-Gm-Message-State: APjAAAWUsKBe8diRucWlHYr0mOearwju9iYGXgreQlV1QKMR/8M0wY2t
        ho1uQz215BUUQvXzaykZtmp2bp4r
X-Google-Smtp-Source: APXvYqwu46sKbaOdeNSZNvtt1hphkMcI3J7DmnmMCr1gghK9AjGOsJPSNewALN1xeFEYw5Lo3sO1qg==
X-Received: by 2002:a17:90a:dac3:: with SMTP id g3mr4091069pjx.45.1564594980634;
        Wed, 31 Jul 2019 10:43:00 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:4ad:5a0b:2aff:6e0f:8973:5a26])
        by smtp.gmail.com with ESMTPSA id k8sm65941259pgm.14.2019.07.31.10.42.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 10:42:59 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] watchdog: ziirave_wdt: Add missing newline
Date:   Wed, 31 Jul 2019 10:42:48 -0700
Message-Id: <20190731174252.18041-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731174252.18041-1-andrew.smirnov@gmail.com>
References: <20190731174252.18041-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add missing newline.

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
index dec660c509b3..6ec028fb2635 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -671,7 +671,7 @@ static int ziirave_wdt_probe(struct i2c_client *client,
 		if (ret)
 			return ret;
 
-		dev_info(&client->dev, "Timeout set to %ds.",
+		dev_info(&client->dev, "Timeout set to %ds\n",
 			 w_priv->wdd.timeout);
 	}
 
-- 
2.21.0

