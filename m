Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82BD146D071
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Dec 2021 10:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbhLHJ7k (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 8 Dec 2021 04:59:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbhLHJ7k (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 8 Dec 2021 04:59:40 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241FFC061746
        for <linux-watchdog@vger.kernel.org>; Wed,  8 Dec 2021 01:56:09 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id t24-20020a252d18000000b005c225ae9e16so3596452ybt.15
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Dec 2021 01:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=VEUso1iUERxMrhDAGJGVXME2Ba4vBEfYFLFN/9mCKOc=;
        b=bs2suS3oNU/TKeJh0arlrk0SgYqcFtn1C+mdVQnTI8h509F58G7tqpdxbLwaSZ9Tbt
         sEH2s1rzzgjruiRRuiCJUJ08FOq8261V2ew9SKWwlxOfA0UPBIQTCh5ewDkMzlTMxUN8
         fweOd+jiB/4uqL/v/3RgxuZ1UiL5B3H68bbFFhDc0HoMBAvW+eKMy3mJbYoNGnK3orOP
         wPMdlT3lA7JvjbBMYUZfS5vApOVJO7bDUa4Ts5ZCS/8m49kVmXtbwc8R4iOxPJtdhZuI
         jC8b++71n6LmHVrxRpo7KDXNgOqs4DLZ78CenE0vPOnpellV21wZVbgcjB/t+YFon3FK
         QHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=VEUso1iUERxMrhDAGJGVXME2Ba4vBEfYFLFN/9mCKOc=;
        b=GV/exM1b+4zy2uOJHGXd894VynUlY7bwR4keDHAHHLLScJ3OwRf4iKw7IHo2bHDpe5
         uGJAQ6pEIeg4UcEhv+6ggNvCGtf3xRox8GgH3mmQrNCMUARr8kpJvHoD0aLB0Re8nGBk
         UGZ8rRoOp0RhnzleCwrcVkir4RcAFWAYOt7dFCPQiYhRS7CcZeV0GxxEJIZPfWvox9h3
         0SIfIoo7Baun+W01DxMZsX1oBpA8SQv9eoV6nYHdxFjjmIutgFP7NYmfDeI3cGTq/eBp
         jPdKV/wbBwFyQe554u8wcos8443COzhabjgxG8SstsuSU9JqIURIaUChjb7d6rHPhyCF
         aIsQ==
X-Gm-Message-State: AOAM531pUvpQnpry1yp7JPP5/23MVtn3Ui9rSf2WSbvPRweRn7IwGuw8
        bGYheHxWS53Lrcfw0oUtuVnsTUfJHWF6
X-Google-Smtp-Source: ABdhPJyn5dZSZVoFoykeFQu48j08P80ghWTxCrEKFgd83B9L5HQ4wLohelQrfF7Jl0G85kr0JXoTKG+lgAX6
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:10:63d3:57e9:34c:bf63])
 (user=tzungbi job=sendgmr) by 2002:a25:3154:: with SMTP id
 x81mr57516600ybx.16.1638957368406; Wed, 08 Dec 2021 01:56:08 -0800 (PST)
Date:   Wed,  8 Dec 2021 17:55:55 +0800
Message-Id: <20211208095555.4099551-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [PATCH] watchdog: mtk_wdt: use platform_get_irq_optional
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, matthias.bgg@gmail.com
Cc:     linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, wangqing@vivo.com,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The watchdog pre-timeout (bark) interrupt is optional.  Use
platform_get_irq_optional() to avoid seeing such following
error message:
>>> mtk-wdt 10007000.watchdog: IRQ index 0 not found

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
The patch bases on linux-next next-20211208.

 drivers/watchdog/mtk_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 543cf38bd04e..4577a76dd464 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -339,7 +339,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(mtk_wdt->wdt_base))
 		return PTR_ERR(mtk_wdt->wdt_base);
 
-	irq = platform_get_irq(pdev, 0);
+	irq = platform_get_irq_optional(pdev, 0);
 	if (irq > 0) {
 		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
 				       &mtk_wdt->wdt_dev);
-- 
2.34.1.173.g76aa8bc2d0-goog

