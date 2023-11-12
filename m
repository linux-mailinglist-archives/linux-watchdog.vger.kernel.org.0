Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99CFB7E91CA
	for <lists+linux-watchdog@lfdr.de>; Sun, 12 Nov 2023 18:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjKLRdr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 12 Nov 2023 12:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjKLRdq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 12 Nov 2023 12:33:46 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A89E211B
        for <linux-watchdog@vger.kernel.org>; Sun, 12 Nov 2023 09:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=s31663417; t=1699810395; x=1700415195; i=wahrenst@gmx.net;
        bh=mMXqRGkNbsNAPyh+mZIVYkEDyUy+h/05R/ZCmUhYpaQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Koglhbcf1VusTISTtF0qojVN/3dYJqXZPfxSY38lSqs2Fp7olgEXCgR+NQQb18Xo
         4rnvHL8UQZTIgj4/sXo4EcTp4kxdHBqmx9NxFlDEVS8aZavZowHt3gKXpz1615meu
         eT6bHAQyhZPhdbhQdsGJZG/FvFRf4I2EfCRchTYlMyWGFCJ+t/h+tSWnzLkex0Qni
         HzXoQg6Qlv7Tq2I4K91uCZ92v8HcLd/TzVgSEWtHND5A30M1L39JJpTrpYKs+BG2o
         YF/qy8T6mI0y2aTO23lhTkoyGf/BuM8j9Va4uLEHea3FRC4phXR/Ow+LNEh1WPOi9
         bx2zyR0/2LyGbVH81g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAONd-1rDX8q0Dvf-00BvId; Sun, 12
 Nov 2023 18:33:15 +0100
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Florian Fainelli <florian.fainelli@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Phil Elwell <phil@raspberrypi.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] watchdog: bcm2835_wdt: Fix WDIOC_SETTIMEOUT handling
Date:   Sun, 12 Nov 2023 18:32:51 +0100
Message-Id: <20231112173251.4827-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sbZESrDRWb2XWLh/kHHG5W4mvv8TYRGXn2cNVbxM5dwP4BxT6dj
 tFwTpRdfDyTHa2vDZlfET9pRajUwTsPITt+evC+oB+Jc8L6XbUVLrmpgEgZBjt8uGbFG8+5
 ymOPazxYLcp1tIA8CaAH9LxVHvDLKSAvp+2RTF1z44R6/LZaxNxN9c2dt5gU2cU65dkJ5dy
 bh/hOtn7OV61EmRtCuc1g==
UI-OutboundReport: notjunk:1;M01:P0:zbiHTpjLsj4=;gDvwUOJ3VILVIkBpicPu+JUgjPX
 QdfTFpQ23YcVCGvEPtAANcSrSNTKLOpwJDUjI98ki+uw2lJNZYGUXjvh8vNdMWxhJq8DbtmZH
 nFPvo97hp069jwYhCvg4qXoJ0s+olBBpqhTps0e+ZP869XDfmpEGLMJBm7lpD1rdVghdO+KAt
 XXpcRId8izZ02XPPi2BICUjzWRAI+Sz1bKxl9rGhl36lwJJPp1AbORuKhmDFnbN56NkaWnFQq
 M/PzQTdfYlE19WkybM1ePr9gx9iCI+3pGFZ/d5UlFY4YhqOHV4h9rFVlMBhm0HQZtEcEEG6Gn
 jBjIqieQ4pDiJynZT/4Zo6K6xkIXXSeqqi2Up/Gg/V8IaE+3BRYAvxlIubu6W8JPtsM1VGT7M
 p4sM3y2RhqdxWIvFRYVPWF3HQlFkBPYSdiZdK8wNs7HqP8WwUlCt8yTRnGHjFfVhtxYodUo/A
 7SWv2D2qykIVFOs14tjWq+j3LC9eWojBzlnGHff8rd1UTUapaTW1tdl5mO2NlhBkfUnmaaHFv
 amq//ZMg4kFAbqbfP727ypFXjNZzCBP8Tve/bXP4OiWEkLU8rBJ5AbRZuEUpLnPjiJGCwB2lW
 Zn/01DznVIBwn7FARvahqPaYbIsuniBkif42ZpLuUF2Q8YAI9dJ4z8lLrFB+PAeal6lQCkqf4
 J6uSlQL6dHObE0ubxNps/8/n8UNPAntw8sUt1NqiBrGxdT+TbFF+/NoXhapabWIT4gUvyZJwG
 6A/hPe3W9BxGTKuDFlevpYkxuzkwNN4jkWEgpT/i1EOw8LV0GqJxz8LTKFFbrcw37q7u2Z7xh
 YFre4uQMRKl0uGAtA5u/hAWNnm59f0KenyYn8EN1+sHjqQxBOcQTnZv1hqVC9yBBoRwC2diUT
 Frz10jbC6A57yieQPehwT1VnIxE3aXxDKspyBlpGSoUgMNbatyv9DwcU9HECy6+7NW1JvrEUY
 AxQ/5g==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Users report about the unexpected behavior for setting timeouts above
15 sec on Raspberry Pi. According to watchdog-api.rst the ioctl
WDIOC_SETTIMEOUT shouldn't fail because of hardware limitations.
But looking at the code shows that max_timeout based on the
register value PM_WDOG_TIME_SET, which is the maximum.

Since 664a39236e71 ("watchdog: Introduce hardware maximum heartbeat
in watchdog core") the watchdog core is able to handle this problem.

This fix has been tested with watchdog-test from selftests.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217374
Fixes: 664a39236e71 ("watchdog: Introduce hardware maximum heartbeat in wa=
tchdog core")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/watchdog/bcm2835_wdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt=
.c
index 7a855289ff5e..bb001c5d7f17 100644
=2D-- a/drivers/watchdog/bcm2835_wdt.c
+++ b/drivers/watchdog/bcm2835_wdt.c
@@ -42,6 +42,7 @@

 #define SECS_TO_WDOG_TICKS(x) ((x) << 16)
 #define WDOG_TICKS_TO_SECS(x) ((x) >> 16)
+#define WDOG_TICKS_TO_MSECS(x) ((x) * 1000 >> 16)

 struct bcm2835_wdt {
 	void __iomem		*base;
@@ -140,7 +141,7 @@ static struct watchdog_device bcm2835_wdt_wdd =3D {
 	.info =3D		&bcm2835_wdt_info,
 	.ops =3D		&bcm2835_wdt_ops,
 	.min_timeout =3D	1,
-	.max_timeout =3D	WDOG_TICKS_TO_SECS(PM_WDOG_TIME_SET),
+	.max_hw_heartbeat_ms =3D	WDOG_TICKS_TO_MSECS(PM_WDOG_TIME_SET),
 	.timeout =3D	WDOG_TICKS_TO_SECS(PM_WDOG_TIME_SET),
 };

=2D-
2.34.1

