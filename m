Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5240B333710
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Mar 2021 09:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhCJIMN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 10 Mar 2021 03:12:13 -0500
Received: from mail-lf1-f50.google.com ([209.85.167.50]:34869 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbhCJILx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 10 Mar 2021 03:11:53 -0500
Received: by mail-lf1-f50.google.com with SMTP id e7so32032897lft.2;
        Wed, 10 Mar 2021 00:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0GfaAyKuadw49BpZoujsKhwubVf8H8i1XbCPCkiuC+0=;
        b=rMyUmHCTVY4v2+h8U5WE3UBuyJ1AiqaPFOJmRWazVQuoVLyXt7pSKtwzeMExxDP7ea
         d3iVt/KJrn0WdN4mqndbXzG1v3AFmF0DsdS27TijJ5tCSl/duZzeHr7hbPKZAN1DcgYh
         ORbaHETfb8mzYqXcTFkn1GsZA1GZzEEfVCbgnw77AqKONKIVZeZmf0j+QH2saOcEoGoQ
         KX1akqmnd7rsPrh6YXQuipAWvheQrUeOe3xnUZuuES0UIYuB9PwRS2LwQO3CxaMEGQrL
         XVq1+320EyiwmMJhdKG4rWLiwEj1uqVqYJr4l/vqjEl4y+/n/C0TR5PM+mJbBWcwtIui
         Z/mw==
X-Gm-Message-State: AOAM530kwm4bgH+u7nOU+ufl+7ZRxRYYiD5c1kKAJHLlIoMR/LiROXCq
        d7dmFd0+Ql5yu/nOIpoREtQ=
X-Google-Smtp-Source: ABdhPJyqKmEz/FMmlm8Q/PI+asZf0U1Ndk+qapkPe4K7kT6WF2ZT1YCkpAafOhIoG/MluKjFd8M2Xw==
X-Received: by 2002:a05:6512:3188:: with SMTP id i8mr1369704lfe.121.1615363911501;
        Wed, 10 Mar 2021 00:11:51 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id w17sm2630270lfr.218.2021.03.10.00.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 00:11:50 -0800 (PST)
Date:   Wed, 10 Mar 2021 10:11:44 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-watchdog@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [PATCH v9 6/6] mfd: bd9576: Add safety limit/monitoring registers
Message-ID: <90364d7b02dfc453dc56a9ed5e187b5533f3fd35.1615219345.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615219345.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615219345.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

ROHM BD9576 contains safety features like over/under voltage detection,
over curren detection and over temperature detection. Add the
configuration register information.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
No changes from v8

 include/linux/mfd/rohm-bd957x.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/mfd/rohm-bd957x.h b/include/linux/mfd/rohm-bd957x.h
index ddb396ff2da5..acc920b64f75 100644
--- a/include/linux/mfd/rohm-bd957x.h
+++ b/include/linux/mfd/rohm-bd957x.h
@@ -116,6 +116,25 @@ enum {
 #define BD957X_REG_VOUT4_TUNE		0x59
 #define BD957X_REG_VOUTL1_TUNE		0x5c
 
+#define BD9576_REG_VOUT1_OVD		0x51
+#define BD9576_REG_VOUT1_UVD		0x52
+#define BD9576_REG_VOUT2_OVD		0x54
+#define BD9576_REG_VOUT2_UVD		0x55
+#define BD9576_REG_VOUT3_OVD		0x57
+#define BD9576_REG_VOUT3_UVD		0x58
+#define BD9576_REG_VOUT4_OVD		0x5a
+#define BD9576_REG_VOUT4_UVD		0x5b
+#define BD9576_REG_VOUTL1_OVD		0x5d
+#define BD9576_REG_VOUTL1_UVD		0x5e
+
+#define BD9576_MASK_XVD			0x7f
+
+#define BD9576_REG_VOUT1S_OCW		0x5f
+#define BD9576_REG_VOUT1S_OCP		0x60
+
+#define BD9576_MASK_VOUT1S_OCW		0x3f
+#define BD9576_MASK_VOUT1S_OCP		0x3f
+
 #define BD957X_MAX_REGISTER		0x61
 
 #endif
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
