Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 065558A802
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2019 22:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfHLUJV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 12 Aug 2019 16:09:21 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38511 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbfHLUJV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 12 Aug 2019 16:09:21 -0400
Received: by mail-pf1-f195.google.com with SMTP id o70so4902913pfg.5;
        Mon, 12 Aug 2019 13:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TN+vbXoGtZXDyZZbwyRpwdE8T0Jxms0oeW+6+Yw5/RA=;
        b=X8o0fPWh9Bs/+AcOwAcBVoLh9JW4mMYIzkFTXSNwjaOoBCnq04hiL9ZO+9C7w6gH87
         2bw00CDZGtx0+flu13GCj+Z5bpQ12MP4+YaTXGFVvR5IOSYcMlBDkOalCJTVCrtNa6hs
         XQ7Fjain/orZ/SxqhMS3cM8EySD/gmRT1jZ4DDZ09EGT7Q+en3PHbEne5C0L3+jUGiMg
         Sr9FgdrRLKKYZINxudYneHfvlgerJIcRFYX8/rQb0Gtoo4WUoO6F/hVXvHvua7q2Oaik
         gY/Rik4eCH5TPWm5FEg9+tVM3oCWF+WWTaWJxD8g4tofmSnziryJsISP87n9e5XVmFoo
         UHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TN+vbXoGtZXDyZZbwyRpwdE8T0Jxms0oeW+6+Yw5/RA=;
        b=rqGSP8YoA1GF5hiY+raALOzbF3FcyUniyedTkEbegbYrz90WWV4nfamlx8auaoLxUB
         pRl1uV/NSJcEFj5hz+apXWwsJsYgQmjrTQ+TvuC6raeqAK99fQBk5RIYqVLGoa/mmOaB
         vT4WoKmM3huLZIS61A8VoeCnJeWl5u8u3fikY6MPHeCx/HkBgY+RK9XlTBwypCtzNHxE
         /Dh743vcQOAFrtcwdmzRBUJcL4hCiznX1jXaBc2dYZdgC9EYqfFXkEY/d3b6tzifwCC0
         QTH/K4s6g0QyTzvoF3bkYQ4JpgeqfaUXOGSOPvOk77E1fIJDSvl7NXZuwqZ0MAqGwIVV
         8C0g==
X-Gm-Message-State: APjAAAUf8QC7phusOKmL4LFyV/2NOQjX5ETlmPsLcdtILe0yyQwhk7ok
        h8cQ8m2dQVulqJ5+7BadS24R2Bvg
X-Google-Smtp-Source: APXvYqzie7nch6IxxKkPdk2BZVQy+kChRyM+MLUh80vvOR4C7FaL03jEAWGlDEZmeFjSnU4ZFCdKyw==
X-Received: by 2002:a62:63c7:: with SMTP id x190mr35856663pfb.181.1565640560251;
        Mon, 12 Aug 2019 13:09:20 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id n26sm110286451pfa.83.2019.08.12.13.09.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 13:09:19 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-watchdog@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Healy <cphealy@gmail.com>,
        Rick Ramstetter <rick@anteaterllc.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/22] watchdog: ziirave_wdt: Add missing newline
Date:   Mon, 12 Aug 2019 13:08:45 -0700
Message-Id: <20190812200906.31344-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812200906.31344-1-andrew.smirnov@gmail.com>
References: <20190812200906.31344-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add missing newline.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
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

