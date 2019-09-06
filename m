Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40E18AC16D
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Sep 2019 22:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394494AbfIFUbA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 6 Sep 2019 16:31:00 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39594 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391941AbfIFUbA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 6 Sep 2019 16:31:00 -0400
Received: by mail-wr1-f67.google.com with SMTP id t16so7843914wra.6
        for <linux-watchdog@vger.kernel.org>; Fri, 06 Sep 2019 13:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJt9ie/CwFH290nioenPt6TarTQUW3TGmI0Z2Dfa+bo=;
        b=rPdyAOLd/hWoLsxQzZ9HfJ2/dCFPB30qpT714bMbwc/FDbzah86xUPeIJBRsqB686W
         SDSiEx9979Um2y3wOzjNoLPHS9sMCGoeMJFAPqACQRwzY/uHDU0n6Kw6GvNBpB+rf9hL
         Ci1j3c4sDGeXmhlONiyPRyECkV93S9hInzibe/4/dW2uMCbWbxVVrBeg4fEHbdc3JkZz
         L9l3wtKtN1ONVcSyRnjDKrRlsP6tvRijb4ILVNCmTrzrjmlDVVz3p6EKLgpOyzpb4d5x
         3jrKSbf0bg00KFsFKio7XtmkP945tosJHlEFV/pxv3TktTAxXHhUCDSXd5lZ632Crmb7
         cesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hJt9ie/CwFH290nioenPt6TarTQUW3TGmI0Z2Dfa+bo=;
        b=PZlytGzKG1iTBriQCpsMaIvYyn3nh9d8YyotaczGBHa2OOXkIxDeMYQiLQZrii+/BY
         5I/skektVUwnIrzwKiEj8QUdsrML/kIugOBRzrO+p0UeUHMPLXquhr0sqjro6mRBSz+M
         nBcp4GYXRIsAYSeVd9iqrfNLcQR44/Q4Yb0WygsJvxHJwpnmxTVkD+D3MdBsPUMmvsGw
         s4ZzvBi2ocW2u102F0gt+8rBemlTCTMaAQQvB9iQxfRNfR7hX/qx+27ftO4dD6eDmYkx
         bqChszbNvtm4LxDt7JNUcF9ko9nablOULHKoAv1+pBq4j39WXSvCLZ/uaGu87ymAsOy1
         G+gw==
X-Gm-Message-State: APjAAAVy2NOcmucuI811J8oiGSzJIK8mim7N9HkHQH1BjCk/BSDzivSP
        QN1ffE4XrzWSkdoWPhlZmgMPbg==
X-Google-Smtp-Source: APXvYqxuOzF9/TIyDwhZSqjRscrY6obUNrkMCg4AQXNOlpchtwedBfAWLFypyYV788yUVPs7H1NO+w==
X-Received: by 2002:a5d:6302:: with SMTP id i2mr9065964wru.249.1567801858400;
        Fri, 06 Sep 2019 13:30:58 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id t13sm13330734wra.70.2019.09.06.13.30.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Sep 2019 13:30:57 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org
Subject: [PATCH 1/2] watchdog: pm8916_wdt: fix pretimeout registration flow
Date:   Fri,  6 Sep 2019 22:30:53 +0200
Message-Id: <20190906203054.26725-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

When an IRQ is present in the dts, the probe function shall fail if
the interrupt can not be registered.

The probe function shall also be retried if getting the irq is being
deferred.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 drivers/watchdog/pm8916_wdt.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
index 2d3652004e39..cb5304c26ac3 100644
--- a/drivers/watchdog/pm8916_wdt.c
+++ b/drivers/watchdog/pm8916_wdt.c
@@ -163,9 +163,18 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq > 0) {
-		if (devm_request_irq(dev, irq, pm8916_wdt_isr, 0, "pm8916_wdt",
-				     wdt))
-			irq = 0;
+		err = devm_request_irq(dev, irq, pm8916_wdt_isr, 0,
+				       "pm8916_wdt", wdt);
+		if (err)
+			return err;
+
+		wdt->wdev.info = &pm8916_wdt_pt_ident;
+
+	} else {
+		if (irq == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		wdt->wdev.info = &pm8916_wdt_ident;
 	}
 
 	/* Configure watchdog to hard-reset mode */
@@ -177,7 +186,6 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	wdt->wdev.info = (irq > 0) ? &pm8916_wdt_pt_ident : &pm8916_wdt_ident,
 	wdt->wdev.ops = &pm8916_wdt_ops,
 	wdt->wdev.parent = dev;
 	wdt->wdev.min_timeout = PM8916_WDT_MIN_TIMEOUT;
-- 
2.23.0

