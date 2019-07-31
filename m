Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCC77CAC4
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 19:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729369AbfGaRnH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 13:43:07 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36658 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728836AbfGaRnH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 13:43:07 -0400
Received: by mail-pl1-f193.google.com with SMTP id k8so30821632plt.3;
        Wed, 31 Jul 2019 10:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1kLt0NkSrpfjb5sCHuXjSffvs/aOPPaGzJ2Iaa+HT+0=;
        b=VZTc2lW93SQrSVzQNk5dBXVq52RHm/mLu+2BEstuOuS96w4Zs/BSY7jHBEH6+4aSXo
         kYoQoDGFKqWLqzEqub5aQkV/5t21TX9pyqyhz2HoHAzjvk8XOe6RzZL7wxifQOjv8lMl
         SrOdO86F7p7c2vM60xJQ421EH9er+GiijTOAo4QAnjh+2oO7VORFtO6lMrTwoCP+Z4T/
         M26zoEIFpPtj2Rbg+tONcM0bIKh5F87caXoVCEeuk95qGbysWqm+xBAW6qdEw7YAkKSt
         F5RJsIJmQOKaemUGY6nHMw0/3LqxoGq5zz7VkvteHOD2jMMw1XJBcT227EHVNeQh7Mu8
         YIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1kLt0NkSrpfjb5sCHuXjSffvs/aOPPaGzJ2Iaa+HT+0=;
        b=bBTbhfdZCWkFRyOe+kMB4I7Bab/j2XDYteXODC37PZtmbgyDKTnq6MAh4/CV7Y0xht
         yISnPkBXYbiGJfTgkglBJcMeWUJ9ZsbKSuAQ0F0XN5PGoRVl6k9ft/DqjDG5bU5DI9/U
         e7hCgMAP6aN+goHut5qj++cuv5xWCLJ17PHEOx3WMmreM4bHx4nNFgEtnBI5EekJ9IVO
         hTi+HhGmqYcww67jGOJMsRNpJbwp1PidOBPU3mbFLYZzBHiQWV5WD0VUm7hFNnBhrLxl
         0VzcZcNzbwO+nYLnJeCHBM3WXXLcLHA9Rvvob7g01FUAbxugayb6Dmg6oApS1zs+3NBt
         YL8A==
X-Gm-Message-State: APjAAAVygo+Q9C2M5WaFH4h387jOuB31KHadJ2temjnnYCpgC5UjvDlh
        UpChmysFwWrTUvDo3hImq9sAmJID
X-Google-Smtp-Source: APXvYqyqr6rE02ERXrhyXVMx8kPIqVNteisuUAch0gdlXI+1lp4hg5SJgDi39bQK0phDZmxijafcGA==
X-Received: by 2002:a17:902:9f93:: with SMTP id g19mr120328966plq.223.1564594985912;
        Wed, 31 Jul 2019 10:43:05 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:4ad:5a0b:2aff:6e0f:8973:5a26])
        by smtp.gmail.com with ESMTPSA id k8sm65941259pgm.14.2019.07.31.10.43.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 10:43:05 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] watchdog: ziirave_wdt: Don't bail out on unexpected timeout value
Date:   Wed, 31 Jul 2019 10:42:51 -0700
Message-Id: <20190731174252.18041-5-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731174252.18041-1-andrew.smirnov@gmail.com>
References: <20190731174252.18041-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Reprogramming bootloader on watchdog MCU will result in reported
default timeout value of "0". That in turn will be unnecesarily
rejected by the driver as invalid device (-ENODEV). Simplify probe to
just read stored timeout value, clamp it to an acceptable range and
program the value unconditionally to fix the above.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Rick Ramstetter <rick@anteaterllc.com>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/ziirave_wdt.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wdt.c
index 89ce6982ba53..33c8d2eadada 100644
--- a/drivers/watchdog/ziirave_wdt.c
+++ b/drivers/watchdog/ziirave_wdt.c
@@ -667,22 +667,18 @@ static int ziirave_wdt_probe(struct i2c_client *client,
 			return val;
 		}
 
-		if (val < ZIIRAVE_TIMEOUT_MIN)
-			return -ENODEV;
-
-		w_priv->wdd.timeout = val;
-	} else {
-		ret = ziirave_wdt_set_timeout(&w_priv->wdd,
-					      w_priv->wdd.timeout);
-		if (ret) {
-			dev_err(&client->dev, "Failed to set timeout\n");
-			return ret;
-		}
+		w_priv->wdd.timeout = clamp(val, ZIIRAVE_TIMEOUT_MIN,
+					    ZIIRAVE_TIMEOUT_MAX);
+	}
 
-		dev_info(&client->dev, "Timeout set to %ds\n",
-			 w_priv->wdd.timeout);
+	ret = ziirave_wdt_set_timeout(&w_priv->wdd, w_priv->wdd.timeout);
+	if (ret) {
+		dev_err(&client->dev, "Failed to set timeout\n");
+		return ret;
 	}
 
+	dev_info(&client->dev, "Timeout set to %ds\n", w_priv->wdd.timeout);
+
 	watchdog_set_nowayout(&w_priv->wdd, nowayout);
 
 	i2c_set_clientdata(client, w_priv);
-- 
2.21.0

