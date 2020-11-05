Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0E32A7D4D
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Nov 2020 12:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgKELje (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Nov 2020 06:39:34 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39112 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729916AbgKELjH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Nov 2020 06:39:07 -0500
Received: by mail-lj1-f195.google.com with SMTP id m16so1222902ljo.6;
        Thu, 05 Nov 2020 03:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jck8w/E9bpQVLqgSLUvOFfHIe/qaww3VwYRc6ypuzVs=;
        b=rVy6mb96pi//rU8b5aRGlskQj5O9Btjtj9bWFH8YK1HgdKHMzpbypQkoCAnGltrSuv
         Y6izofwDelzMSfF8zrxydU/TP13UIel2KJah26PBzH3SNMhykX+UFsyGmPVmpI5Pg6rc
         dKB6PZH2400PxgY7lrQrbNfWZC1IYSLqB1ggWSyS5ASSCgicnSu1l8N96h0gEZ16VTU+
         aN+nG402K0Ihst92ZQOjLdId0bDFmlIW8Jo+S2KfPbKZTdo+1ZXXf6iMmfoK9PqSfD7O
         BxdG3ybRxwtWseDerGOsDOgAbiMgQLM0yT68Jh/ci9XBFafWaSxjClI/LD/rmKK1aTzW
         fXNg==
X-Gm-Message-State: AOAM533Of7e/OMWK/PTWqCSQdtR513vv6A+Md0oE5Mp5TTXMjPaDQ3kN
        3MjLy/bReU7tjPLgKTpvEEU=
X-Google-Smtp-Source: ABdhPJzTkXFOD3A2pwoRy5RZFHg5E8cJ3tij6JBJxB48XvEI60+KnoAUA0gjdpI2mPOgd+89mNiS3w==
X-Received: by 2002:a2e:3915:: with SMTP id g21mr769847lja.18.1604576345135;
        Thu, 05 Nov 2020 03:39:05 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id r6sm130382ljg.6.2020.11.05.03.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 03:39:04 -0800 (PST)
Date:   Thu, 5 Nov 2020 13:38:58 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org
Subject: [PATCH v5 4/4] MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers
Message-ID: <8126292cb00ddcad2c4e2e2572fceaa305179691.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1604574431.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add maintainer entries for ROHM BD9576MUF and ROHM BD9573MUF drivers.
MFD, regulator and watchdog drivers were introduced for these PMICs.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b516bb34a8d5..0bd788a94376 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15088,16 +15088,20 @@ F:	drivers/gpio/gpio-bd71828.c
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
2.21.3


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
