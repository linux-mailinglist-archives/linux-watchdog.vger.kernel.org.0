Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64F6318778
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Feb 2021 10:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbhBKJx4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 11 Feb 2021 04:53:56 -0500
Received: from mail-lj1-f181.google.com ([209.85.208.181]:42019 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbhBKJvA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 11 Feb 2021 04:51:00 -0500
Received: by mail-lj1-f181.google.com with SMTP id v6so1971444ljh.9;
        Thu, 11 Feb 2021 01:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vbzohcwBtlUZH6ZLAK19lQqwlGPGKPmPpTbcsdgTlH8=;
        b=PN+dW2reBrw9bfhyFvLk9lxq3aBU5cUyEWcq8HYCgO2QcuSujJ5jmlASjzl6kp8KeW
         AcINxgDXOarJb1fjobb48BJu7oKtjPdDVcM6sBIgYCGWc869qZV45PAH8djsBJJviDqg
         0GmnPFWDXzvlvdX1O1cBh+1H6rpp08hGHTfH5NpOWw5CtfM7nQiKGlWExnTvw8fU+Zo2
         Y0PHqO99u9Vp/GLNizOm4wZ8spzljnqer3EflphD2aq9PosnBYTBE3hMzgmTZhKInNf3
         XuCg20lOkhA/q9YprJ/+8JRP5iHHlrf14dsxS3Poi9Z41/Js3MAI1A1fxDiLy3OloUWP
         /F0g==
X-Gm-Message-State: AOAM530QmjdBFzplil2+yr/jZa5CrI6dvRJTAmdgAYds4u6kCLR+m1AP
        OEemSlnxZhxVLNvNRVoq6dI=
X-Google-Smtp-Source: ABdhPJxMlQbYT67gpdSvR7zs/H7JjHJFSus6/lp1sBEFdg8/xOFu6QPBso2sW9P85wR7XMmteaS2lg==
X-Received: by 2002:a2e:9b8e:: with SMTP id z14mr4408634lji.182.1613037017263;
        Thu, 11 Feb 2021 01:50:17 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id d3sm600472lfg.122.2021.02.11.01.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 01:50:16 -0800 (PST)
Date:   Thu, 11 Feb 2021 11:50:07 +0200
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
Subject: [PATCH v8 6/6] mfd: bd9576: Add safety limit/monitoring registers
Message-ID: <f9d76bed70a440036b56be8a0928925d12db8463.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

ROHM BD9576 contains safety features like over/under voltage detection,
over curren detection and over temperature detection. Add the
configuration register information.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Changes since v7:
	New patch

 include/linux/mfd/rohm-bd957x.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/mfd/rohm-bd957x.h b/include/linux/mfd/rohm-bd957x.h
index 3f351a1ae4ab..2bd35260ee8e 100644
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
