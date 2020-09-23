Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D599527547B
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Sep 2020 11:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgIWJ0G (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Sep 2020 05:26:06 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37186 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIWJ0G (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Sep 2020 05:26:06 -0400
Received: by mail-lf1-f67.google.com with SMTP id z19so21313712lfr.4;
        Wed, 23 Sep 2020 02:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6pHAOlrytH0z268HKYZDl6MkqXmmiB3ChIA/oCJbIvA=;
        b=W04t2AYgpPJXX/rlzh39bwXNxc5Bu83XGkLdh02i8YbveBTbudD3pJHpyNvRZdJc8f
         OUWUgbGadF/AmJsztXY7b+wa86+S+db5G5oEDN2hIPzHco6nqnJrVzOLgERrIzYh+6oX
         q4ttBykBV3vMQjTMArD9+C1mPWXvenqKHjQxTKiRC6tIjqgpniYLOX3YOw2ya0/VpA47
         sfFj+FW+5FiCSMZRNnHZrqf2gKD5ZYpo4U6VSAJJpwp3Szogufhf9iLQsGrr3vvGTHUj
         EaHotRotdHeCQFUAigf9pOZR80BI6FXDJyq4Tj5flQKP9YOrxPoT2t0fpiDWHgcI+tLO
         6jyg==
X-Gm-Message-State: AOAM5311JobbFpn06JlwHIVLJVKKRqvhDIgkXXO8Qp0f6L4Z10Kt45jz
        nBJqa0RsNQreI+8onO8TUgc=
X-Google-Smtp-Source: ABdhPJwLca6aGl4b2YfKHlq/xD+0MprqpO4Ybg4j6S24/T2sb4D+fjmDHnaE+2kz42OckSHCh8/WEw==
X-Received: by 2002:a19:7e8d:: with SMTP id z135mr3323752lfc.158.1600853163748;
        Wed, 23 Sep 2020 02:26:03 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 73sm4518236lfi.229.2020.09.23.02.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 02:26:03 -0700 (PDT)
Date:   Wed, 23 Sep 2020 12:25:50 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v2 4/4] MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers
Message-ID: <e5684cde5ee50506527b4cd4548d4710ff92cb78.1600852339.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1600852339.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1600852339.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add maintainer entries for ROHM BD9576MUF and ROHM BD9573MUF drivers.
MFD, regulator and watchdog drivers were introduced for these PMICs.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
No changes from v1.

 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b5cfab015bd6..630a23fc84f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14956,16 +14956,20 @@ F:	drivers/gpio/gpio-bd71828.c
 F:	drivers/mfd/rohm-bd70528.c
 F:	drivers/mfd/rohm-bd71828.c
 F:	drivers/mfd/rohm-bd718x7.c
+F:	drivers/mfd/rohm-bd9576.c
 F:	drivers/power/supply/bd70528-charger.c
 F:	drivers/regulator/bd70528-regulator.c
 F:	drivers/regulator/bd71828-regulator.c
 F:	drivers/regulator/bd718x7-regulator.c
+F:	drivers/regulator/bd9576-regulator.c
 F:	drivers/regulator/rohm-regulator.c
 F:	drivers/rtc/rtc-bd70528.c
 F:	drivers/watchdog/bd70528_wdt.c
+F:	drivers/watchdog/bd9576_wdt.c
 F:	include/linux/mfd/rohm-bd70528.h
 F:	include/linux/mfd/rohm-bd71828.h
 F:	include/linux/mfd/rohm-bd718x7.h
+F:	include/linux/mfd/rohm-bd957x.h
 F:	include/linux/mfd/rohm-generic.h
 F:	include/linux/mfd/rohm-shared.h
 
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
