Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47FEF342EDC
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Mar 2021 19:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhCTSUP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Mar 2021 14:20:15 -0400
Received: from mout.gmx.net ([212.227.15.19]:52515 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230050AbhCTST7 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Mar 2021 14:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1616264379;
        bh=TU6WBAPzVDO7B00swZvzPrRfFyWpLBe23Iol3zeiJoA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=g3OXfFxr6Xow5CZNl88mopUYU5Diqe0zCqCjZlXb5mnmUvvSJ5ln3YsxrXUaakdoP
         lZs4De0U4Bwacb4vxvuxtDx1ZultLJ0TNkh9frnTHXwPSUf8goUcFwPQHIDim4XruQ
         5uqA7CY5AihreseWZFJ6peBqC18vNZcR9jQ5hNhs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6llE-1lJnm91ygA-008Fum; Sat, 20
 Mar 2021 19:19:39 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     openbmc@lists.ozlabs.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org
Subject: [PATCH 06/14] dt-bindings: watchdog: npcm: Add nuvoton,wpcm450-wdt
Date:   Sat, 20 Mar 2021 19:16:02 +0100
Message-Id: <20210320181610.680870-7-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MRosn5bF+g2SROwPwzbUHCsmCbOlyjOQUv2THarZOxmQaAQQD2k
 ncOXTCTNLO+wo+uPNy3hLdjHN55PtLYzCJmQ5ocSo/HSaqr4GtNrkEpr3kTSJnbrANeygaB
 tNeGmhoYB0mWXfQacs1TyMqSuHlO2J09Z0c/QPBvgC3CKoAmbUmyJ4e9CDCouRQ/Z7U0y/f
 394jjgpg25611JSlFjsTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E91Xlxs4Jbk=:6CjXgrMerJph80qMnjXQQI
 Q7zLVho92ScyYf4apBUipa4iEEnZl+paOl3U54UTG+cEHBR9CzrFJKUwTHc3tx9ZHcMA+AZHt
 3jgoZiVhRuvAPMtBligZdne3FoFme9lwwt1psL1PC9RS1iz1okZQPNKjIoY8Y56o8dHvyLU7A
 dUXD6hUgfzl9dEiF1VCxtgatyE3dYrneRgHxd17yg6rCRh7J81P+Vl7jDcgHpNHTNAay+JqL2
 uOH/vsh9WbUPQuueguhOsh2D9CnIRtljaoMjS0ZZLznaF6MGtPE0fZzMGHdSZSr46pST0V4P5
 q8juzrYYVa5JAAqnYpdeYzRurCfBHksa6Q6fsaTU/g70Gxeue7WAgwpykAIP0YIr1+6+fOGB5
 p3aidSRlOCsr67ckYK5oKnzQ2dl7C3zSO/mI7p5eeTD+vjVhKd0+ggm5s/yTr7KIUk0rgz9jb
 K3IXDNTGaTw9GYc5VsnV1mOjpZxKR5cLf+NF21s+VEPtjwxooGQwydhSN8FE7ijUtWMMCtefD
 CVjaC75v9x+v3zdLD9b4N4aWREV0mTYEvXQ+rrRti8VS1Fyqv0NPaMMHwKbJps8WZseVmwPHR
 PwuFiEVGxcs+yrKbCGCEFfHgI63146kIz3blIN6ZlTQ+J0t3FHEG4dJhKL0JLaWG6bIYOPHHs
 tikGQYevsJWZiXOeIs7knsKzPl+NYIshzYcSKkgqNRBr9kkiISEW3gZwba+Ve5VHy9KiaSDTe
 UsHkWx8nEvCBUSrDBlf+I80YvCb7kmH2i2XRdURnnrNvRE8LJl6G+9+CRvJSxIqvS+DO4ejAD
 1znD8lvE+ziydkZvojNTfm8fh/iASFyAGBcsnFyxKIQEMe2WSKufKEygL7TZpDCbzED4/G2Hx
 W0+o0MOWwN26l0wJxBWw==
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add a compatible string for the WPCM450 SoC, which has the same watchdog
timer.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt          | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.t=
xt b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
index 6d593003c933b..9059f54dc023d 100644
=2D-- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt
@@ -5,7 +5,8 @@ The watchdog supports a pre-timeout interrupt that fires 1=
0ms before the
 expiry.

 Required properties:
=2D- compatible      : "nuvoton,npcm750-wdt" for NPCM750 (Poleg).
+- compatible      : "nuvoton,npcm750-wdt" for NPCM750 (Poleg), or
+                    "nuvoton,wpcm450-wdt" for WPCM450 (Hermon).
 - reg             : Offset and length of the register set for the device.
 - interrupts      : Contain the timer interrupt with flags for
                     falling edge.
=2D-
2.30.2

