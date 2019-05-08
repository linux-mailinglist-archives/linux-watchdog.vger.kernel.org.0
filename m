Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEB8E16E6A
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 May 2019 02:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfEHAnJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 May 2019 20:43:09 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35975 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbfEHAnJ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 May 2019 20:43:09 -0400
Received: by mail-pf1-f196.google.com with SMTP id v80so9531939pfa.3;
        Tue, 07 May 2019 17:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ojYi+dPraKZx0o3Y02X9nQD+qD5NgpGE9+yj+drgmpM=;
        b=ouY5V6d13EeaCznWYKiFrV+PuT6jOR4Dh3kzNHNMm1PBOQ7BVYPaMNzG1Eiq1yFZ1X
         rauW70V9LWCc88qz3Sav6PMZB6Sjnzz4xiYnPIJ6sAXKsug/N+og6asxEj+ksSM9GqTX
         hjyapc12YgWVu2ol2R5x9RkzpXRwcU5r6T2V9LvFkQ68isuoFELKg6n/ccTxHjVAyFQe
         K2Fqc1Zcq9sImA+ooGhpYsJRUHuC2GKF2wCh4zOlG9ThBpFvKhSLdghjevPJD+DUKcOL
         fWtmPS3ZsdNHKvYTlajwX3pPCci/XLfUWduK7qG17XMEKf4EfVSB2/aqGFPR8aBhGzOa
         3HDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=ojYi+dPraKZx0o3Y02X9nQD+qD5NgpGE9+yj+drgmpM=;
        b=XusL5mN5G3BQ8HLBdhHk6oJ2TQKl35FRi//ew1XDZ7OkNCamEG/YpUKZ7XRdGTyiI/
         l1z6YAtf0q1B5ev26INDXWM+zL4C02Ia/uXNMgJtM4JDM+I1tlviehVQbHw1d9vQigpB
         usGBRX36k+53E6MFd/pDzS8HPos7bHB+45k4at8jQ8JBj6ejli2/qKP0NBNzGY2VTaxr
         ZgSlAbo+ARG/UISAYv7VbL4q7iwOc2ACXABYnRFy/Nd9cXB4/UbXzGlFCcli/FLVT8QO
         HOX8ezlY539FhOTGidI49DGzDdZPLwpdF0AB4PN/4uYceK3uR2ru+SvInLh6BGlR42za
         oFMw==
X-Gm-Message-State: APjAAAW2s/5uJ15bRE5Ym/WA/2trdUEYDkvbuBzPIfuFtJVwEuSEHSCQ
        e6siVHV2qtAyoNLWcjIAPbE=
X-Google-Smtp-Source: APXvYqybRlhJcf/lCjFKazuw6n2T6ikfBGHhOuruQSWAsvUy8UMxUBLMLVIqr9tPCpfWCD85IdJFZA==
X-Received: by 2002:a62:ae05:: with SMTP id q5mr20467618pff.13.1557276188425;
        Tue, 07 May 2019 17:43:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l83sm15304176pfi.150.2019.05.07.17.43.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 17:43:06 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] watchdog: Enforce that at least one pretimeout governor is enabled
Date:   Tue,  7 May 2019 17:43:03 -0700
Message-Id: <1557276183-8309-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Since commit "watchdog: Use depends instead of select for pretimeout
governors", it was possible to enable pretimeout governors but keep all
of them disabled. Doing this results in the following build failure.

../drivers/watchdog/watchdog_pretimeout.c:
	In function ‘watchdog_register_governor’:
../drivers/watchdog/watchdog_pretimeout.c:139:26: error:
	‘WATCHDOG_PRETIMEOUT_DEFAULT_GOV’ undeclared
   if (!strncmp(gov->name, WATCHDOG_PRETIMEOUT_DEFAULT_GOV,

Since it does not make sense to enable pretimeout support but disable
all pretimeout governors, enforce that at least one of them is always
enabled.

Fixes: f627ac0e12cd ("watchdog: Use depends instead of select for pretimeout governors")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Fixes: sha is from next-20190507.

 drivers/watchdog/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index e19960ace0c0..4a3461afa96f 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -71,6 +71,12 @@ config WATCHDOG_PRETIMEOUT_GOV
 	help
 	  The option allows to select watchdog pretimeout governors.
 
+config WATCHDOG_PRETIMEOUT_GOV_SEL
+	tristate
+	depends on WATCHDOG_PRETIMEOUT_GOV
+	default m
+	select WATCHDOG_PRETIMEOUT_GOV_PANIC if WATCHDOG_PRETIMEOUT_GOV_NOOP=n
+
 if WATCHDOG_PRETIMEOUT_GOV
 
 config WATCHDOG_PRETIMEOUT_GOV_NOOP
-- 
2.7.4

