Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1AFE2649FF
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Sep 2020 18:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbgIJQkV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 10 Sep 2020 12:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbgIJQie (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 10 Sep 2020 12:38:34 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817E7C0617A0;
        Thu, 10 Sep 2020 09:31:14 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id o6so5887073ota.2;
        Thu, 10 Sep 2020 09:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b5HSsnTUYAyklmliYSmi70GefBQKCXs49AU2eEjqYEk=;
        b=Pm5FGPbIPrFsFV++auvl1XmZ/1T7mALPkXouY23OS5lb6v/q3uNwPjHR/vwovx2gGJ
         t5LQ/b74W67zhU7G9mvdb7VSmpIkRJwsoqCsrQgBJJiBVp0vp5fpJQW4TZ8DUkKGa+nX
         kEw+hiSMAp7eqbhRjtqJchKfT5ycbWba2s+4NHDHJwAs1LKqeolZs83Zb7aw11dcJoJz
         rKqOXscJglpz4kMAYYr6etUgYCXmyYkCwk8Y9gf/OfAP8WALwt6PO/0vN9sShe32618+
         SBaO5UwotcRKCAmkGchfjQKRm/3j7JtK/XT5Vqo1OZe23sl8XLiIJ9sQKZ1sOjyjE2Cj
         K7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=b5HSsnTUYAyklmliYSmi70GefBQKCXs49AU2eEjqYEk=;
        b=kpPLg6k3TouL0C/LyxpvIzVZ4o2cHJXmrMfFVJpdANnfZNMii0aKFSnFR5SzeoUd7I
         9EhnrYLoHFWPask1cRq6rVLTwXmD6tV3EnL2M8iVSgkX8F/FtN9/adkqIaOcXs3XimwY
         m+Zd14DbUIDIJORCch5M0nxQ5SA9fNUV3AC1HdQSJgx9FroNOJhzFLK8MUNJ+Tob97MT
         q20Msmza6a14d5Z3rwSb3dgAwFA8AbxT5aLKK+jD96Tr1t+mA21gg4/XHh1NCy4OWz0y
         hlRFU41Md+ZAY1YjXqBd1gUIFT4PZqbhsM97NWABB+jqsfxC72kjcWSWTxMHK29TqtS8
         98hQ==
X-Gm-Message-State: AOAM533smY2cgumRsaoTNkpNd3j89GZMDPEK2lzJCYJWFD2j37+rVusj
        /8UcyjgMFR2lA5Dk82lhI7s=
X-Google-Smtp-Source: ABdhPJwpcg3Xan2mB4codFobwQfVlIHya+z9HGtrXtv/0/tQG8/vGtnMEMSqBHYWKCQTPGrU0MQLyQ==
X-Received: by 2002:a9d:5509:: with SMTP id l9mr4835134oth.154.1599755473965;
        Thu, 10 Sep 2020 09:31:13 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w136sm979394oif.14.2020.09.10.09.31.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 09:31:13 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 2/2] watchdog: sp5100_tco: Enable watchdog on Family 17h devices if disabled
Date:   Thu, 10 Sep 2020 09:31:09 -0700
Message-Id: <20200910163109.235136-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910163109.235136-1-linux@roeck-us.net>
References: <20200910163109.235136-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Family 17h (Ryzen) devices, the WatchdogTmrEn bit of PmDecodeEn not only
enables watchdog memory decoding at 0xfeb00000, it also enables the
watchdog hardware itself. Use this information to enable the watchdog if
it is not already enabled.

Cc: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/sp5100_tco.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index 85e9664318c9..a730ecbf78cd 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -17,6 +17,12 @@
  *	    AMD Publication 51192 "AMD Bolton FCH Register Reference Guide"
  *	    AMD Publication 52740 "BIOS and Kernel Developer’s Guide (BKDG)
  *				for AMD Family 16h Models 30h-3Fh Processors"
+ *	    AMD Publication 55570-B1-PUB "Processor Programming Reference (PPR)
+ *				for AMD Family 17h Model 18h, Revision B1
+ *				Processors (PUB)
+ *	    AMD Publication 55772-A1-PUB "Processor Programming Reference (PPR)
+ *				for AMD Family 17h Model 20h, Revision A1
+ *				Processors (PUB)
  */
 
 /*
@@ -241,6 +247,18 @@ static int sp5100_tco_setupdevice(struct device *dev,
 		break;
 	case efch:
 		dev_name = SB800_DEVNAME;
+		/*
+		 * On Family 17h devices, the EFCH_PM_DECODEEN_WDT_TMREN bit of
+		 * EFCH_PM_DECODEEN not only enables the EFCH_PM_WDT_ADDR memory
+		 * region, it also enables the watchdog itself.
+		 */
+		if (boot_cpu_data.x86 == 0x17) {
+			val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
+			if (!(val & EFCH_PM_DECODEEN_WDT_TMREN)) {
+				sp5100_tco_update_pm_reg8(EFCH_PM_DECODEEN, 0xff,
+							  EFCH_PM_DECODEEN_WDT_TMREN);
+			}
+		}
 		val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
 		if (val & EFCH_PM_DECODEEN_WDT_TMREN)
 			mmio_addr = EFCH_PM_WDT_ADDR;
-- 
2.17.1

