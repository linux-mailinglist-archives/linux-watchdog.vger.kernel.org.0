Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA70C7B188
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 20:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388093AbfG3SQj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jul 2019 14:16:39 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42338 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387479AbfG3SQi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jul 2019 14:16:38 -0400
Received: by mail-pg1-f196.google.com with SMTP id t132so30468383pgb.9
        for <linux-watchdog@vger.kernel.org>; Tue, 30 Jul 2019 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5fo9xoU+yYD5Z8uf9SUR2uKYmF1uk/rKV9Lb3Z9ueEo=;
        b=dA64UpA8tj7mLl9viR5GgcvrXC4eb0BxunWdCwwdzT4DlyEI8uQSpupsoCEHzNj+dr
         dPuE+Wh+6zGMN7haRIdBFGXQib01S9+ge8IdTNOyfFRCKueetaGUY/Q2tME3YBHKhIGv
         5sZTtfUIhT4IQ0D9MEWfOmjNzPki1oPQkI7go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5fo9xoU+yYD5Z8uf9SUR2uKYmF1uk/rKV9Lb3Z9ueEo=;
        b=NayzU5FV1X7q21FK8nSoYu6sT70qZw/1Tkn/Byo0O7RaKYZ0Bkw+lk5yVGS/QDxeXw
         tsJbzGM68iIKWfd4ZiHAy38OVGKhOuQMVuDh/mIntquOlx4eZd+lKm8usFwIq4JhNBIF
         ZUM9MCUzGCoQBkiMD67v+eTRzs/v66znhaZnnuH6DxZuxnk1qYLQ3RHnptn4ew1O7lOn
         xwh9xWY072gJo+EWMhf8OpMxuU5OjwR6tNkx2qOuXw+Z96fCbp1GoDZeXSg08YTtJ/CQ
         TNAkFr1RqpcOodwCnLeA3NCwcbyB4VXdb+aR8yGakGBUAxll+cEzt3Qd+3xpnfH/1H2H
         bWeg==
X-Gm-Message-State: APjAAAXRLcRNcW/ZqUQB2yqXD7MBORZbWwL6oJAK8uleM3NZg3t3AfU3
        hmIf/HuRdb9kn1T9zzcwlDBZRg==
X-Google-Smtp-Source: APXvYqyA01BRNSS1dBxA1i6qIG566ZzOeSODJlGMB9m1FeGp5+SdGR/Aw1MHRRYYPG8weXCtIbHfxQ==
X-Received: by 2002:a62:5487:: with SMTP id i129mr44440965pfb.69.1564510598243;
        Tue, 30 Jul 2019 11:16:38 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g1sm106744083pgg.27.2019.07.30.11.16.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 11:16:37 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v6 48/57] watchdog: Remove dev_err() usage after platform_get_irq()
Date:   Tue, 30 Jul 2019 11:15:48 -0700
Message-Id: <20190730181557.90391-49-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190730181557.90391-1-swboyd@chromium.org>
References: <20190730181557.90391-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

We don't need dev_err() messages when platform_get_irq() fails now that
platform_get_irq() prints an error message itself when something goes
wrong. Let's remove these prints with a simple semantic patch.

// <smpl>
@@
expression ret;
struct platform_device *E;
@@

ret =
(
platform_get_irq(E, ...)
|
platform_get_irq_byname(E, ...)
);

if ( \( ret < 0 \| ret <= 0 \) )
{
(
-if (ret != -EPROBE_DEFER)
-{ ...
-dev_err(...);
-... }
|
...
-dev_err(...);
)
...
}
// </smpl>

While we're here, remove braces on if statements that only have one
statement (manually).

Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please apply directly to subsystem trees

 drivers/watchdog/sprd_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
index edba4e278685..0bb17b046140 100644
--- a/drivers/watchdog/sprd_wdt.c
+++ b/drivers/watchdog/sprd_wdt.c
@@ -284,10 +284,8 @@ static int sprd_wdt_probe(struct platform_device *pdev)
 	}
 
 	wdt->irq = platform_get_irq(pdev, 0);
-	if (wdt->irq < 0) {
-		dev_err(dev, "failed to get IRQ resource\n");
+	if (wdt->irq < 0)
 		return wdt->irq;
-	}
 
 	ret = devm_request_irq(dev, wdt->irq, sprd_wdt_isr, IRQF_NO_SUSPEND,
 			       "sprd-wdt", (void *)wdt);
-- 
Sent by a computer through tubes

