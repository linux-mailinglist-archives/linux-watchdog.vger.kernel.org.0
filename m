Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06188300594
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jan 2021 15:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbhAVOgJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jan 2021 09:36:09 -0500
Received: from mail-lf1-f51.google.com ([209.85.167.51]:34346 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728767AbhAVOgB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jan 2021 09:36:01 -0500
Received: by mail-lf1-f51.google.com with SMTP id o19so7836591lfo.1;
        Fri, 22 Jan 2021 06:35:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W0bWAxw7Duy+uLOZDJETbEeOscyuN+nYdQEuaqxHD6w=;
        b=RlI7oRzuT2Dz2JW0wfiPq8/GNvJCTi39kvajn0w/zKqRFW23cKevydmRNEqfVB5eD9
         ed/3ahSt7tvVvySCMp1xwJ/4B2GMVj/ch3DdCuCPtGoOhjq13RKAO5zj6Ujeo/6zfYtt
         sMy0gc0au/mdSuwseMa35Uog0SRPVEeMoK4MmnLaO3JW99rJGYXeZnlsNMtu7S6tbdea
         dAlqVj+27e05drqLL6HyqLjQYBj39278wQUZAFGThIqnIUclPiXMW0V6sGP688ZYw5qC
         49cNg6IircdWvqdMdop8GP7Ev9kF9tNqQzjLaknrByDih1CwqJqXFORquixKgy+pqby+
         zYnw==
X-Gm-Message-State: AOAM531ZdU0eW8xxrvonYDgUl8FuawI+NPZYnR19Atxjjd9RHpSQ6xdX
        YxMIX0iKiFRatCKb1M6ei7A=
X-Google-Smtp-Source: ABdhPJyQTWffI7ubf2/sPrTT64dF+zlHAKB01iX/ksdzUe3NgF7bFfLGyecAvQvKnSbOIFA373kVKA==
X-Received: by 2002:ac2:5a41:: with SMTP id r1mr2382219lfn.117.1611326118006;
        Fri, 22 Jan 2021 06:35:18 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id p23sm907026lfe.243.2021.01.22.06.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 06:35:17 -0800 (PST)
Date:   Fri, 22 Jan 2021 16:35:10 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v7 5/6] MAINTAINERS: Add ROHM BD9576MUF and BD9573MUF drivers
Message-ID: <d4a658492fd9168a3e8a922b941f45f8ac23934d.1611324968.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1611324968.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1611324968.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add maintainer entries for ROHM BD9576MUF and ROHM BD9573MUF drivers.
MFD, regulator and watchdog drivers were introduced for these PMICs.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
Changes since v6:
 - no changes
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc1e6a5ee6e6..b59b7877258c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15336,16 +15336,20 @@ F:	drivers/gpio/gpio-bd71828.c
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
2.25.4


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
